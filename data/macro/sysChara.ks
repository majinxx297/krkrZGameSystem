; macros for chara system
*start|
[iscript]
Scripts.execStorage("charaParser.tjs");
getCsvData("小粉");
[endscript]
[call storage="Macro_APimage.ks"]
[call storage="macro.ks"]

; TODO: dynamic chx & chy (except the later, since characters move
; TODO: Add to dictionary the location of this character
[macro name=fg小粉]
[eval exp="mp.chx = 70"]
[eval exp="mp.chy = 120"]
[if exp="mp.enter"]
	[image storage=小粉 layer=%layer visible=true top=%chy left=%chx]	
	[eval exp="mp.fe = '小粉_眼'+mp.eye"]
	[eval exp="mp.fm = '小粉_口'+mp.mou"]	
	[ap_image storage=&mp.fe layer=%layer dx=&"global.left[mp.fe]" dy=&"global.top[mp.fe]"]
	[ap_image storage=&mp.fm layer=%layer dx=&"global.left[mp.fm]" dy=&"global.top[mp.fm]"]		
	[ap_animstart layer=%layer]
	[if exp="mp.blush"]
		[eval exp="mp.fb = '小粉_红晕'"]
		[backlay]
		[ap_image storage=&mp.fb mode=psmul layer=%layer page=back dx=&"global.left[mp.fb]" dy=&"global.top[mp.fb]"]
		[trans time=800 method=universal rule=下から上へ vague=1]
		[wt]
	[endif]
[elsif exp="mp.exit"]
[elsif exp="mp.mov"]
[else]
	; modify fg
[endif]
[endmacro]

[macro name=fg鸟面男]
[endmacro]
[return]
