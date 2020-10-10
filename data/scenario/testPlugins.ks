[wait time=200]
*start|スタート
[call storage="WindowResizable.ks"]
[call storage="AltEnterFullScreen.ks"]

[loadplugin module=extrans.dll]
[loadplugin module=extNagano.dll]
[loadplugin module=csvParser.dll]
[rclick storage="rclick.ks" target="*start" enable=true call=true jump=trye]

; Load koumei plugin
; Cancle the side effect of MessageLayerADV.tjs that makes message0 invisible
[iscript]
Scripts.execStorage("MessageLayerADV.tjs");
[endscript]
[position layer=message0 page=fore visible=true top=0 left=0 marginl=0 margint=0]
[position layer=message0 page=back visible=true top=0 left=0 marginl=0 margint=0]

[cm]
こんにちは。[l][r]
ごきげんよろしゅう。[l][r]
改ページしますよ。[p]
[cm]
改ページしました。[p]


