@if exp="typeof(global.exframe_object) == 'undefined'"
@iscript

// 拡張フレーム

class KAGFrameExtensionPlugin extends KAGPlugin
{

	// dictionary: 栞保存対象
	var dopt; // デフォルトオプション
	var ldic; // メッセージレイヤ単位での保存情報 (index=layernum)
	var window; // ウィンドウへの参照（つまり、global.kag）

	var cachelayer; // キャッシュ用レイヤ
	var cacheinfo; // キャッシュ情報

	var copyFuncFlag;
	/*const*/var cffCopy = 0x01;
	/*const*/var cffOperate = 0x04;

	// コンストラクタ
	function KAGFrameExtensionPlugin(window)
	{
		// ClockPlugin コンストラクタ
		super.KAGPlugin(); // スーパークラスのコンストラクタを呼ぶ

		initDefaultOptions();

		this.window = window;
		window.add(cachelayer = new global.Layer(window, window.primaryLayer));

		copyFuncFlag = cffCopy;

		cacheinfo = %[
			"width" => 0,
			"height" => 0,
			"layernum" => -1,
			"enabled" => true, // キャッシュ機能を無効にしたい場合はこれをfalseにする。
		];
	}

	// デストラクタ
	function finalize()
	{
		invalidate dopt;
		invalidate ldic;
		super.finalize(...);
	}

	function initDefaultOptions()
	{
		// デフォルト設定
		dopt = %[
			// UI
			"gradenable" => false,
			"gradcolor1" => 0xffffff,
			"gradcolor2" => 0x000000,
			"gradopacity" => 0xbf,
			"cornerwidth" => 16,
			"cornerheight" => 16,
			"frametransparent" => true,
			"frameopacity" => 0xff,

			// 内部用
			"Name" => "",
			"MetaFile" => "",
			"PatternFile" => "",
			"FrameFile" => "",
			"FrameEdgeWidth" => 1,
			"FrameEedgWheight" => 1,
		];

		ldic = new Array();
	}


	// オプション設定
	function setOptions(mp)
	{
		// 必須項目
		var name  = mp.name;
		var layernum = mp.layer;
		var layer = window.fore.messages[layernum];

		if (layer === void) return false;
		if (name  === void) return false;

		// MessageLayer.clearLayer()を上書きする
		overrideLayerFunc(layernum);

		// デフォルト設定
		if (ldic[layernum] === void)
		{
			ldic[layernum] = new Dictionary();
			// デフォルト値を反映
			(Dictionary.assign incontextof ldic[layernum])(dopt);
		}

		var xf = ldic[layernum];
		// 危険なので削除
		delete xf.name;
		delete xf.layer;
		delete xf.update;

		var FrameSetName = "exframe/" + name;

		xf.MetaFile    = FrameSetName + "/default.tjs";
		xf.FrameFile   = FrameSetName + "/frame";
		xf.PatternFile = FrameSetName + "/pattern";

		// メタ情報ロード
		// ファイルが無いとエラーだよー
		var exdef = Scripts.evalStorage(xf.MetaFile);
		// 上書き
		addElem(exdef, xf);
		// ユーザ指定で上書き
		addElem(mp, xf);

		// 枠をロード
		var wf0 = new global.Layer(this.window, layer);
		var wfEnabled = true;
		try
		{
			wf0.loadImages(xf.FrameFile);
			with (wf0)
			{
				.setSizeToImageSize();
				xf.cornerwidth  = .width  \ 3;
				xf.cornerheight = .height \ 3;
			}
		}
		catch
		{
			wfEnabled = false;
			xf.FrameFile = "";
		}

		if (wfEnabled)
		{
			//エッジ部分のサイズ決定
			with (xf)
			{
				if (
					.cornerwidth  <= 0 ||
					.cornerwidth  > (wf0.width \ 2) ||
					.cornerheight <= 0 ||
					.cornerheight > (wf0.height \ 2))
				{
					.cornerwidth  = wf0.width  \ 3;
					.cornerheight = wf0.height \ 3;
				}

				.FrameEdgeWidth  = wf0.width  - .cornerwidth  * 2;
				.FrameEdgeHeight = wf0.height - .cornerheight * 2;
			}
		}

		// 下地パターンをロード
		var ch0 = new global.Layer(this.window, layer);
		try
		{
			ch0.loadImages(xf.PatternFile);
		}
		catch
		{
			xf.PatternFile = "";
		}

		invalidate wf0;
		invalidate ch0;

		// キャッシュしない、させない
		cacheinfo.layernum = -1;

		if (mp.update) drawFrame(layernum);

	}


	// オプション削除
	function deleteOptions(mp)
	{
		// 必須項目
		var layernum = mp.layer;

		if (layernum === void) return false;
		if (ldic[layernum] === void) return false;

		ldic[layernum] = void;
	}

	// 描画
	function drawFrame(layernum)
	{
		var layer = window.fore.messages[layernum];
		var xf = ldic[layernum];

		if (layer === void) return false;
		if (xf === void) return false;

		// キャッシュ復元
		var cacheOK = 
			cacheinfo.enabled && 
			cacheinfo.layernum == layernum && 
			cacheinfo.width == layer.imageWidth && 
			cacheinfo.height == layer.imageHeight;

		if (cacheOK)
		{
			layer.copyRect(0, 0, cachelayer, 0, 0, cachelayer.imageWidth, cachelayer.imageHeight);
			return;
		}

		// 枠をロード
		var wf0 = new global.Layer(this.window, layer);
		var wfs = new Array();
		wfs.count = 9;
		if (xf.FrameFile != "")
		{
			wf0.loadImages(xf.FrameFile);
			with (wf0) {
				.setSizeToImageSize();
				xf.cornerwidth  = .width  \ 3;
				xf.cornerheight = .height \ 3;
			}
		}

		// 下地パターンをロード
		var ch0 = new global.Layer(this.window, layer);
		if (xf.PatternFile != "")
		{
			ch0.loadImages(xf.PatternFile);
			ch0.setSizeToImageSize();
		}

		with (layer)
		{
			// 下地パターン敷き詰め
			if (xf.PatternFile != "")
			{
				setCopyFuncFlag(true);
				for (var y = 0; y <= .imageHeight \ ch0.height; y++) {
					for (var x = 0; x <= .imageWidth \ ch0.width; x++) {
						copyFunc(layer, x * ch0.width, y * ch0.height, ch0, 0, 0, ch0.width, ch0.height, omAuto);
					}
				}
			}

			// グラデーション
			if (xf.gradenable) {
				var g1R = (xf.gradcolor1 \ 0x10000) & 0xFF;
				var g1G = (xf.gradcolor1 \ 0x00100) & 0xFF;
				var g1B = (xf.gradcolor1 \ 0x00001) & 0xFF;
				var g2R = (xf.gradcolor2 \ 0x10000) & 0xFF;
				var g2G = (xf.gradcolor2 \ 0x00100) & 0xFF;
				var g2B = (xf.gradcolor2 \ 0x00001) & 0xFF;

				for (var y = 0; y < .imageHeight; y++) {
					var gR = y * (g2R - g1R) \ .imageHeight + g1R;
					var gG = y * (g2G - g1G) \ .imageHeight + g1G;
					var gB = y * (g2B - g1B) \ .imageHeight + g1B;
					var col = (gR * 0x10000) + (gG * 0x100) + gB;
					.colorRect(0, y, .imageWidth, 1, col, xf.gradopacity);
				}
			}

			// 枠
			if (xf.FrameFile != "")
			{
				setCopyFuncFlag(xf.frametransparent);

				// 上辺・下辺
				var nChips;
				nChips = (.imageWidth - 2 * xf.cornerwidth - 1) \ xf.FrameEdgeWidth + 1;

				for (var x = 0; x < nChips; x++) {
					var overDraw = (x == nChips - 1) ? ((nChips * xf.FrameEdgeWidth) - (.imageWidth - 2 * xf.cornerwidth)) : 0;
					copyFunc(layer, 
						xf.cornerwidth + x * xf.FrameEdgeWidth, 0, wf0, 
						xf.cornerwidth, 0, xf.FrameEdgeWidth - overDraw, xf.cornerheight, 
						omAuto, xf.frameopacity);
					copyFunc(layer, 
						xf.cornerwidth + x * xf.FrameEdgeWidth, .imageHeight - xf.cornerheight, wf0, 
						xf.cornerwidth, xf.cornerheight + xf.FrameEdgeHeight, xf.FrameEdgeWidth - overDraw, xf.cornerheight, 
						omAuto, xf.frameopacity);
				}

				// 左辺・右辺
				nChips = (.imageHeight - 2 * xf.cornerheight - 1) \ xf.FrameEdgeHeight + 1;
				for (var y = 0; y < nChips; y++) {
					var overDraw = (y == nChips - 1) ? ((nChips * xf.FrameEdgeHeight) - (.imageHeight - 2 * xf.cornerheight)) : 0;
					copyFunc(layer, 
						0, xf.cornerheight + y * xf.FrameEdgeHeight, wf0, 
						0, xf.cornerheight, xf.cornerwidth, xf.FrameEdgeHeight - overDraw, 
						omAuto, xf.FrameOpacity);
					copyFunc(layer, 
						.imageWidth - xf.cornerwidth, xf.cornerheight + y * xf.FrameEdgeHeight, wf0, 
						xf.cornerwidth + xf.FrameEdgeWidth, xf.cornerheight, xf.cornerwidth, xf.FrameEdgeHeight - overDraw, 
						omAuto, xf.FrameOpacity);
				}

				// 四隅
				copyFunc(layer, 
					0, 0, wf0, 
					0, 0, xf.cornerwidth, xf.cornerheight, 
					omAuto, xf.frameopacity);
				copyFunc(layer, 
					.imageWidth - xf.cornerwidth, 0, wf0, 
					xf.cornerwidth + xf.FrameEdgeWidth, 0, xf.cornerwidth, xf.cornerheight, 
					omAuto, xf.frameopacity);
				copyFunc(layer, 
					0, .imageHeight - xf.cornerheight, wf0, 
					0, xf.cornerheight + xf.FrameEdgeHeight, xf.cornerwidth, xf.cornerheight, 
					omAuto, xf.frameopacity);
				copyFunc(layer, 
					.imageWidth - xf.cornerwidth, .imageHeight - xf.cornerheight, wf0, 
					xf.cornerwidth + xf.FrameEdgeWidth, xf.cornerheight + xf.FrameEdgeHeight, xf.cornerwidth, xf.cornerheight, 
					omAuto, xf.frameopacity);

			} /* end 枠 */

		} /* end with */

		invalidate ch0;
		invalidate wf0;

		// キャッシュする
		if (cacheinfo.enabled)
		{
			cacheinfo.width  = layer.imageWidth;
			cacheinfo.height = layer.imageHeight;
			cacheinfo.layernum = layernum;
			cachelayer.setImageSize(layer.imageWidth, layer.imageHeight);
			cachelayer.copyRect(0, 0, layer, 0, 0, layer.imageWidth, layer.imageHeight);
		}

		return true;
	}

	// 吉里吉里のバージョン等で切り替える。
	function setCopyFuncFlag(xftr)
	{
		this.copyFuncFlag = xftr ? cffOperate : cffCopy;
	}

	// コピー関数
	function copyFunc(layer, dleft, dtop, src, sleft, stop, swidth, sheight, mode=omAuto, opa=255)
	{
		switch (this.copyFuncFlag)
		{
		case cffCopy:
			layer.copyRect(dleft, dtop, src, sleft, stop, swidth, sheight);
			break;
		case cffOperate:
			layer.operateRect(dleft, dtop, src, sleft, stop, swidth, sheight, mode, opa);
			break;
		default:
			break;
		}
	}


	// MessageLayer.clearLayer() を書き換える

	/*
	書き換えるのは、イメージに変更があったときの、
	フレーム画像の有無によって処理を振り分けている部分。

	KAGのバージョンが変わった場合、書き換える内容が変わる場合がある。
	さて、どうしたものか。
	*/

	function overrideLayerFunc(layernum)
	{
		var layer = window.fore.messages[layernum];

// begin MessageLayer.tjs  MessageLayer.clearLayer()
		layer.clearLayer = function() {

			// レイヤをクリア
			window.updateBeforeCh = 1;

			cancelDrag();

			if(imageModified)
			{
//*** ここから追加 ***
				var exfo = global.exframe_object;
				var layn = kag.fore.messages.find(this);
				if (layn < 0) layn = kag.back.messages.find(this);

				// 拡張モード
				if (layn >= 0 && exfo.ldic[layn] !== void)
				{
					face = dfAuto;
					fillRect(0, 0, imageWidth, imageHeight, (frameOpacity << 24) + frameColor);
					exfo.drawFrame(layn);
				}
				// 通常モード：そのままで良い
				else
				{
//*** ここまで追加 ***

				if(frameGraphic == "")
				{
					// フレーム画像が指定されていない場合
					face = dfAuto;
					fillRect(0, 0, imageWidth, imageHeight, (frameOpacity << 24) + frameColor);
				}
				else
				{
					loadImages(frameGraphic, frameKey);
					setSizeToImageSize();
				}

//*** ここから追加 ***
				}
//*** ここまで追加 ***

				face = dfProvince;
				colorRect(0, 0, imageWidth, imageHeight, 0); // 領域もクリア
				face = dfAuto;
			}

			imageModified = false;

			invalidateLinkObjects(); // リンクに関連づけられたオブジェクトを無効化

			focusable = false;
			links.clear();
			numLinks = 0;
			inLink = -1;
			highlightLink(lastLink, false); // ハイライトを消す
			highlightLayer.visible = false;
			lastLink = -1;
			keyLink = -1;
			linkFilled = false;
			lastDrawnCh = ""; // 最後に描画した文字
			isLastLine = false; // 最終行か
			selClickLock = true;
			lastMouseX = cursorX;
			lastMouseY = cursorY;
			initLineLayer();
		} incontextof layer;
// end MessageLayer.tjs  MessageLayer.clearLayer()

	}


	// 辞書配列に上書き追加
	// 2.23β以降ならassignで置き換えられる。
	function addElem(src, dest)
	{
		var elmkeys = new Array();
		elmkeys.assign(src);
		for (var i = 0; i < elmkeys.count; i += 2)
		{
			var key = elmkeys[i];
			dest[key] = src[key];
		}
		invalidate elmkeys;
	}


	// デバッグ用
	// 辞書配列状態表示
	function showDic(dic)
	{
		var t = new Array();
		t.assign(dic);
		System.inform("<" + t.join(">\n<") + ">");
	}



	function onStore(f, elm)
	{
		// 栞を保存するとき
		// f系変数を使用
		var dic = f.frame_extension_plugin_savedata = [];
		(Array.assignStruct incontextof dic)(ldic);
	}

	function onRestore(f, clear, elm)
	{
		// 栞を読み出すとき
		var dic = f.frame_extension_plugin_savedata;

		initDefaultOptions();

		if(dic === void)
		{
			// 情報が栞に保存されていない
		}
		else
		{
			// 情報が栞に保存されている
			// 読み出し
			(Array.assignStruct incontextof ldic)(dic);
			// 適用
			for (var i = 0; i < ldic.count; i++)
			{
				var d = ldic[i];
				if (d !== void) setOptions(d);
			}
		}
	}

}


kag.addPlugin(global.exframe_object = new KAGFrameExtensionPlugin(kag));

@endscript
@endif

; マクロの登録

@macro name="exframe"
[eval exp="global.exframe_object.setOptions(mp)"]
@endmacro

@macro name="exframe_erase"
[eval exp="global.exframe_object.deleteOptions(mp)"]
@endmacro

@return
