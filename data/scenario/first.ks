[wait time=200]
*start|スタート
[call storage="WindowResizable.ks"]
[call storage="AltEnterFullScreen.ks"]

[loadplugin module=extrans.dll]
[loadplugin module=extNagano.dll]
[loadplugin module=csvParser.dll]
[call storage="macro.ks"]
[call storage=GraphicFramePlugin.ks]
[call storage="zoom.ks"]
[rclick storage="cl_win.ks" target="*start" enable=true call=true jump=trye]
[call storage=sysChara.ks]

; Load koumei plugin
; Cancle the side effect of MessageLayerADV.tjs that makes message0 invisible
[iscript]
Scripts.execStorage("MessageLayerADV.tjs");
[endscript]
[position layer=message0 page=fore visible=true top=0 left=0 marginl=0 margint=0]
[position layer=message0 page=back visible=true top=0 left=0 marginl=0 margint=0]

*menu|
[deffont face="楷体"]
[resetfont]
[cm]
;[emb exp="global.top.小粉_口0"][l][r]
[link storage=testBasic.ks target=*start]基本功能测试[endlink][r]
[link storage=testLight.ks target=*start]闪瞎狗眼测试[endlink][r]
[link storage=testUI.ks target=*start]系统UI测试[endlink][r]
[link storage=testChara.ks target=*start]角色测试[endlink][r]
[link storage=fdSystem.ks target=*start]角色系统[endlink][r]
[link storage=testCG.ks target=*start]CG测试[endlink][r]
