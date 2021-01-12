*start|
; --------------------------------------------------------
; message window related
; --------------------------------------------------------
@macro name=dialog_in
@eval exp="tf.dialogOn = true"
@position layer=message0 opacity=0 top=540 left=420 visible=true
@image layer=3 left=449 top=549 page=fore storage=frame visible=true opacity=0 scale=50
@move layer=3 path=(,,255,100) time=300 accel=-1
@move layer=message0 path=(,,255) time=300 accel=-1
@wm
@endmacro

@macro name=dialog_out
@eval exp="tf.dialogOn = false"
@move layer=message0 time=500 path=($-15,,0)
@move layer=3 opacity=0 time=300 path=(,$+30,0)
@wm
@endmacro

; --------------------------------------------------------
; SE
; --------------------------------------------------------
@macro name = talk_se
	@playse storage=%name loop=true
@endmacro

; --------------------------------------------------------
; layer operation
; --------------------------------------------------------
@macro name=talk_update
	@eval exp="fgFocusOff(1)" cond="!checkLayerName(1, mp.name)"
	@eval exp="fgFocusOff(2)" cond="!checkLayerName(2, mp.name)"
@endmacro

@macro name=fg

; face
@eval exp="tf.face=''"
@eval exp="tf.face='normal'" cond="mp.normal"
@eval exp="tf.face='smile'" cond="mp.smile"
@eval exp="tf.face='smile2'" cond="mp.smile2"
@eval exp="tf.face='sad'" cond="mp.sad"
@if exp="tf.face == ''"
	@eval exp="tf.storage = getStorage(1) " cond="checkLayerName(1, mp.name)"
	@eval exp="tf.storage = getStorage(2) " cond="checkLayerName(2, mp.name)"
@else 
	@eval exp="tf.storage = mp.name+'_'+&tf.face"
@endif

; position
@if exp="!(mp.l||mp.r)"
	@eval exp="mp.l=true" cond="checkLayerName(1, mp.name)"
	@eval exp="mp.r=true" cond="checkLayerName(2, mp.name)"
@endif
@eval exp="tf.layer=1; tf.fliplr=true; tf.pos='left'" cond="mp.l"
@eval exp="tf.layer=2; tf.fliplr=false; tf.pos='right'" cond="mp.r"

@if exp="mp.fg_in"
	@eval exp="tf.dx=30" cond="mp.l"
	@eval exp="tf.dx=-30" cond="mp.r"
	@image * page=fore layer=&tf.layer visible=true storage=&tf.storage fliplr=&tf.fliplr pos=&tf.pos
	@move layer=&tf.layer path=($+&tf.dx,,255,,) time=300
	;@wm
	@if exp="mp.talk"
		@talk_update name=%name
	@endif
@else
	@image * page=fore layer=&tf.layer visible=true storage=&tf.storage fliplr=&tf.fliplr	
	@talk_update name=%name
	@if exp="mp.talk"
		@move layer=&tf.layer path=($+5,,)($-5,,) time=100
		@wm		
	@endif
@endif
@endmacro

@macro name=fg_in
@call storage=macroFg.ks target=*fg_in 
@fg * opacity=0 fg_in
@endmacro

@macro name=fg_out
@if exp="mp.all"
	@move layer=1 path=($-30,,0,,) time=300
	@move layer=2 path=($+30,,0,,) time=300
	@wm
@else
	@eval exp="tf.layer=1; tf.dx=-30" cond="checkLayerName(1, mp.name)"
	@eval exp="tf.layer=2; tf.dx=30" cond="checkLayerName(2, mp.name)"
	@move layer=&tf.layer path=($+&tf.dx,,0,,) time=300
	@if exp="!mp.nowait"
		@wm
	@endif
@endif
@endmacro

@macro name=bg
@image storage=%storage left=0 top=0 layer=0 visible=true mode=psmul
@endmacro

@return

*fg_in
@macro name=%name
	@fg	* name=&mp.tagname
@endmacro
@return