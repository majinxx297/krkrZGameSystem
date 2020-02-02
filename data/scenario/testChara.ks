;
*start|
[call storage="Macro_APimage.ks"]
[cm]
[image storage=BG03 layer=base]
开始角色测试[l][r]
[emb exp="global.top.小粉_口0"][l][r]
[image storage=小粉 layer=1 visible=true top=120 left=50]
[ap_image storage=小粉_口0 layer=1 dx=119 dy=93]

; Test animation
[ap_image storage=小粉_眼0 layer=1 dx=96 dy=59]
[ap_animstart layer=1]
显示小粉♥[l][r]

; Get image size
[iscript]
var h = kag.fore.layers[1].imageHeight;
var w = kag.fore.layers[1].imageWidth;
var name= new Dictionary();
name["小粉"]="安德列";
//System.inform(h + "," + w, "image size"); 
[endscript]

; print variables
[emb exp=name.小粉]的size: [emb exp="h"] [emb exp="w"][l][r]
; change face
*|
[backlay]
[ap_delimage layer=1 page=back]
[ap_image storage=小粉_眼1 layer=1 page=back dx=96 dy=56]
[pimage storage=小粉_口2 layer=1 dx=120 dy=90 page=back]
;[ap_animstart layer=1]
[trans time=150 method=crossfade]
[wt]
小粉瞪大了眼睛[l][r]

; Change pos
;[backlay]
;[layopt layer=1 left=150 page=back]
;[trans time=250 method=crossfade]
;[wt]
[rmove layer=1 dx=150 time=300 opacity=255 accel=3]
[wm]
小粉前进了一步[l][r]

*|
; from chara
[image storage=小粉 layer=2 visible=true top=120 left=150 opacity=0 index=1500 mcolor=0x000000 mopacity=125]
[ap_image storage=小粉_口0 layer=2 dx=119 dy=93]
[ap_image storage=小粉_眼0 layer=2 dx=96 dy=59]
[rmove layer=2 dx=-150 dy=0 opacity=255]
[ap_animstart layer=2]
小粉增员啦[l][r]

; Go red
[backlay]
[ap_image storage=小粉_红晕 mode=psmul layer=1 page=back dx=92 dy=48]
[trans time=800 method=universal rule=下から上へ vague=1]
[wt]
小粉脸红了[l][r]

; clean up
[freeimages]
[jump storage=first.ks target=*menu]