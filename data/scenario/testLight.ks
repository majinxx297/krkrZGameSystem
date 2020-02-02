; Flashing!!!
*start|
[cm]
[image storage=BG01 layer=base page=fore]
场景1[l][r]

; Test Plugin
;[backlay]
;[trans method=flutter time=300 back=0xff000000 alpha=255 slip=3]
;[trans method=book time=500 dir=0]


; Create light layer
闪光！[l][r]
[image storage=wtrans layer=2 top=0 left=0 page=fore opacity=0 mode=add mcolor=0xffe091 mopacity=255 visible=true]
[rmove layer=2 opacity=255 time=800]
[wm]
[backlay]
[image storage=BG03 layer=base page=back]
[trans method=crossfade time=500]
[wt]
[rmove layer=2 opacity=0 time=1000]
[wm]
变回来了[l][r]
[freeimages]
[freeimage layer=base]
[jump storage=first.ks target=*menu]