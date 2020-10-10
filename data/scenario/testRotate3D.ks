; (pseudo)3d rotation test
; TODO: write a macro for this motion
*start|
@call storage=zoom.ks
@fgzoom storage=ticket layer=0 sl=400 st=50 sw=235 sh=100 dl=517 dt=50 dw=0 dh=100 time=300
@wfgzoom
@fgzoom storage=ticket layer=0 dl=400 dt=50 dw=235 dh=100 sl=517 st=50 sw=0 sh=100 time=300 fliplr=true
@wfgzoom
@fgzoom storage=ticket layer=0 sl=400 st=50 sw=235 sh=100 dl=517 dt=50 dw=0 dh=100 time=300 fliplr=true
@wfgzoom
@fgzoom storage=ticket layer=0 dl=400 dt=50 dw=235 dh=100 sl=517 st=50 sw=0 sh=100 time=300
@wfgzoom
@jump target=*start
