; ------------------------
;  Frame Extension Plugin Demo
; ------------------------
@title name="Frame Extension Plugin Demo"

; プラグインをロード
@call storage="frame_extension.ks"

; ------------------------
; 一般設定
; ------------------------
; 段落開始
@macro name=para
　
@endmacro

; 段落終わり
@macro name=endpara
[r]
@endmacro

@macro name="posx"
[position * visible=true color=0x000000 opacity=255]
@endmacro

@macro name=exf
@exframe layer=%layer name=%name
@endmacro


; ------------------------
; 本編ここから
; ------------------------
*start|スタート
@laycount messages=2
[position layer=message1 visible=false]

; 通常のメッセージレイヤ
[current layer=message0]
;[image storage="_24" page=fore layer=base]
[position width=610 height=450 left=15 top=15 marginL=15 marginT=15 color=0x000000 opacity=255 visible=true]

[style align=center]
[link target='*start_body' exp="f.exfname='gr' "]グラデーションのみ[endlink][r]
[link target='*start_body' exp="f.exfname='ff' "]グラデ＆フレーム[endlink][r]
[link target='*start_body' exp="f.exfname='kr' "]グラデ＆フレーム＆敷き詰め画像[endlink][r]
[link target='*start_frms' exp="f.exfname='ff' "]グラデ＆フレーム レイヤいっぱい[endlink][r]
[link exp="kag.shutdown()"]終了する[endlink]
[s]
[style align=default]

; サイズを変更してみるテスト
*start_body

[exframe layer=0 name=&f.exfname]

[cm]

[position width=610 height=240 left=15 top=120]
＜横長サイズ＞[r][r]

[para]
KAG は Kirikiri Adventure Game の略です。
吉里吉里でアドベンチャーゲームやノベルゲームを作るためのスクリプトです。
[p][er]

[para]
KAG それ自体は、吉里吉里が理解できる TJS(2) スクリプト言語で書いてありますが、
KAG が理解するファイルは、シナリオファイルという、
文章中に「タグ」(指令) を書き込んだテキストファイルです。
[p][er]

*milestone1|経過1

[position width=280 height=450 left=180 top=15]
＜縦長サイズ＞[r][r]

[para]
シナリオファイル作りは、テキストエディタ上での作業が主となります。
敷居はすこし高いかも知れません。
[p][er]

[para]
しかし、たとえば、HTML をテキストエディタでじかに書くことのできる人であれば、
すぐになじめると思います。
[p][er]

*milestone2|経過2

[position width=610 height=450 left=15 top=15]
＜通常サイズ＞[r][r]

[para]
標準で用意されたタグのみを使用してもそこそこのことはできますが、
KAG 自体が TJS スクリプトで書いてあるため、これを改造したり、
またはシナリオファイル中に TJS スクリプトを書き込んで直接吉里吉里本体に働きかければ、
より別の動作や別の機能を拡張する事ができます。これは 吉里吉里/KAG の大きな特徴の一つです。
[endpara]
[p][er]

[jump target='*start']


; 多数のメッセージレイヤで遊ぶ
*start_frms
@laycount messages=5

@exf layer=0 name=ff
@exf layer=1 name=kr
@exf layer=2 name=gr
@exf layer=3 name=kr
@exf layer=4 name=ff


*start|スタート

@current layer=messgae0
@posx left=0 top=0 width=640 height=56 marginL=15
@font size=24
エリクサーをぬすんだ

@current layer=messgae1
@posx left=0 top=48 width=256 height=384 marginL=15
@font size=18
そんな事より１よ、ちょいと聞いてくれよ。スレとあんま関係ないけどさ。
このあいだ、近所の吉野家行ったんです。吉野家。
そしたらなんか人がめちゃくちゃいっぱいで座れないんです。
で、よく見たらなんか垂れ幕下がってて、１５０円引き、とか書いてあるんです。
もうね、アホかと。馬鹿かと。


@current layer=messgae2
@posx left=0 top=352 width=512 height=128 marginL=15
@font size=21
お兄ちゃんどこ行くの？[r]
そのアコは魔女なのよ！？[r]
お兄ちゃんそんなヤツの所に行かないで[r]
お兄ちゃんどいて！そいつ殺せない！


@current layer=messgae3
@posx left=160 top=96 width=480 height=256 vertical=true marginT=15
@font size=15
　石炭をば早や積み果てつ。
中等室の卓のほとりはいと靜にて、熾熱燈の光の晴れがましきも徒なり。
今宵は夜毎にこゝに集ひ來る骨牌仲間も「ホテル」に宿りて、舟に殘れるは余一人のみなれば。
五年前の事なりしが、平生の望足りて、洋行の官命を蒙り、
このセイゴンの港まで來し頃は、目に見るもの、耳に聞くもの、一つとして新ならぬはなく、
筆に任せて書き記しつる紀行文日ごとに幾千言をかなしけむ、
當時の新聞に載せられて、世の人にもてはやされしかど、
今日になりておもへば、穉き思想、身の程知らぬ放言、
さらぬも尋常の動植金石、さては風俗などをさへ珍しげにしるしゝを、心ある人はいかにか見けむ。
@resetfont

@current layer=messgae4
@posx left=440 top=300 width=200 height=180 marginL=15
@font size=18
[r]
飛ばないマシンは[r]
ただのマシンだ。

[p][er]

[jump target='*start']

