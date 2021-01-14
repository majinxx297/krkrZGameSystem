*rclick
@if exp="tf.dialogOn == true"
	@eval exp="tf.num = kag.numCharacterLayers-1"
	@rclick jump=true target=*exit enabled=true
	@move layer=message0 time=500 path=($-15,,0)
	@move layer=&tf.num opacity=0 time=300 path=($-40,,0)
	@wm
	@s
@endif


*exit
@if exp="tf.dialogOn == true"
	@eval exp="tf.num = kag.numCharacterLayers-1"
	@move layer=message0 time=500 path=($+15,,255)
	@move layer=&tf.num time=300 opacity=255 path=($+40,,255)
	@wm
	@endif
	@rclick call=true target=*rclick enabled=true
@endif
@return