*rclick

@if exp="tf.dialogOn == true"	
	@dialog_off
@endif	
@rclick call=true target=*exit enabled=true
@return

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