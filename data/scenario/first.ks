; test message frame with animation
*start|
@call storage="WindowResizable.ks"
@call storage="zoom.ks"
@call storage=macro.ks
@rclick storage="rclick.ks" target="*start" enable=true call=true jump=trye
@wait time=200

@image storage=BG_客厅 layer=base visible=true 
@position layer=message0 opacity=0 top=512 left=180 marginl=25 margint=25 marginr=25 marginb=25
@fgzoom storage=woodframe01_white layer=2 sl=580 st=512 sw=0 sh=160 dl=180 dt=512 dw=800 dh=170 time=400 accel=-5
@wfgzoom canskip=false

@backlay
@trans layer=2 time=100 method=crossfade
@image layer=2 page=back storage=woodframe01 visible=true
@wt

[cm]
こんにちは。[l][r]
ごきげんよろしゅう。[l][r]
改ページしますよ。[p]
[cm]
改ページしました。
