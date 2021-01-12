; Effect & action collection
*start|
@cm
@call storage=zoom.ks
[link target="*example1"]车票转转转[endlink][r]
[link target="*example2"]翻篇[endlink][r]
[link target="*example3"]cut-in[endlink][r]
[link target="*example4"]哆嗦[endlink][r]
[link target="*example5"]窗帘转场[endlink][r]
@s


*example1
@fgzoom storage=ticket layer=0 sl=400 st=50 sw=235 sh=100 dl=517 dt=50 dw=0 dh=100 time=300
@wfgzoom
@fgzoom storage=ticket layer=0 dl=400 dt=50 dw=235 dh=100 sl=517 st=50 sw=0 sh=100 time=300 fliplr=true
@wfgzoom
@fgzoom storage=ticket layer=0 sl=400 st=50 sw=235 sh=100 dl=517 dt=50 dw=0 dh=100 time=300 fliplr=true
@wfgzoom
@fgzoom storage=ticket layer=0 dl=400 dt=50 dw=235 dh=100 sl=517 st=50 sw=0 sh=100 time=300
@wfgzoom
@jump target=*start

*example2
@image storage=book_base left=205 top=114 layer=0 page=fore visible=true
@fgzoom storage=book_page layer=1 sl=636 st=117 sw=409 sh=480 dl=636 dt=117 dw=0 dh=480 time=300 accel=-1
@wfgzoom
@fgzoom storage=book_page layer=1 sl=636 st=117 sw=0 sh=480 dl=241 dt=117 dw=409 dh=480 time=300 fliplr=true accel=1
@wfgzoom
@move layer=1 path=(,,0) time=200
@jump target=*start

*example3
[layopt layer=message0 opacity = 0]
[image storage=银杏_normal layer=0 page=fore visible=true left=0 top=140 opacity=0]
[move time=200 path="(300,140,255)" accel=-1 layer=0]
[wm]
[move time=2000 path="(400,140,255)" layer=0]
[wm]
[move time=200 path="(700,140,0)" accel=1 layer=0]
[wm]
[layopt layer=message0 opacity = 255]
@layopt layer=0 opacity=255 visible=false
@jump target=*start

*example4
@cm
@image storage=银杏_normal page=fore visible=true pos=right layer=0
@image storage=银杏_sad page=back visible=true pos=right layer=0 mcolor=0x000000 mopacity=180 xblur=5 yblur=5
@move layer=0 path=($+150,,,,) time=800 
@trans layer=0 time=800 method=crossfade
[wt]
[wm]
*page0|测试哆嗦
开始哆嗦100下[l][r]
@move layer=0 path=($+10,,,,)($-10,,,,)  time=100 repeat=100 spline=true
@wm
别哆嗦啦[p]
@freeimage layer=0
@jump target=*start

*example5
; Load background images
[image storage=BG01 left=0 top=0 layer=0 page=fore visible=true]
; Curtain up trans
[backlay]
[image storage=BG03 layer=0 page=back]
[trans layer=0 time=400 method=universal rule=makuage vague=1]
[wt]
@freeimage layer=0
@jump target=*start
