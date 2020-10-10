; fg control macros
; fg_in(wrapper of image), talk(left/right), fg_out(left/right)
; fg_move, fg_action

; fg left = layer0
; fg right = layer1
; bg = base
; message windows = message0 + layer2
; system = message1


; --------------------------------------------------------
; fg manipulation
; --------------------------------------------------------
@call storage="zoom.ks"
@rclick storage="rclick.ks" target="*start" enable=true call=true jump=trye

@macro name=fg_in
@if exp="mp.left!=''"
	@image page=fore layer=0 pos=left visible=true storage=%left opacity=100
	@eval exp="kag.fore.layers[0].flipLR()"
	@eval exp="tf.left=kag.fore.layers[0].left + 50"
	@eval exp="tf.top=kag.fore.layers[0].top"
	@move layer=0 path="&tf.left+',' +&tf.top+',255'" time=300	
	@wm
@elsif exp="mp.right != ''"
	@image page=fore layer=1 pos=right visible=true storage=%right opacity=100
	@eval exp="tf.left=kag.fore.layers[1].left - 50"
	@eval exp="tf.top=kag.fore.layers[1].top"
	@move layer=1 path="&tf.left+',' +&tf.top+',255'" time=300
	@wm
@endif
@endmacro

@macro name=fg_action
; TODO: 改造ごった煮LayerMotionPlugin，重写kag层
@endmacro

@macro name=bg
@image storage=%storage layer=base
@endmacro


; --------------------------------------------------------
; message window related
; --------------------------------------------------------
@macro name=talk
@if exp="mp.left"
	@talk_sub * layer=0
	@talk_sub * layer=1
@elsif exp="mp.right"
	@talk_sub * layer=0
	@talk_sub * layer=1
@endif
@endmacro

@macro name=talk_sub
@eval exp="if(kag.fore.layers[mp.layer].Anim_loadParams) tf.storage=kag.fore.layers[mp.layer].Anim_loadParams.storage; else tf.storage=''"
@if exp="tf.storage!=''"
	@if exp="(mp.layer == 0 && mp.left)||(mp.layer == 1 && mp.right)"
		@image page=fore layer=%layer visible=true storage=&tf.storage
	@else		
		@image page=fore layer=%layer visible=true storage=&tf.storage mcolor=0x000000 mopacity=100
	@endif
	@if exp="mp.layer==0"
		@eval exp="kag.fore.layers[0].flipLR()"
	@endif
@endif
@endmacro

@macro name=message_in
@position layer=message0 opacity=0 top=512 left=180 marginl=25 margint=25 marginr=25 marginb=25
@fgzoom storage=woodframe01_white layer=2 sl=580 st=512 sw=0 sh=160 dl=180 dt=512 dw=800 dh=170 time=200 accel=-5
@wfgzoom canskip=false
@image layer=2 page=fore storage=woodframe01 visible=true
@endmacro

@return