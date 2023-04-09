*rclick
@if exp="tf.dialogOn == true"	
	@dialog_off
@endif	
@rclick call=true target=*exit enabled=true
@return

*exit
@if exp="tf.dialogOn == true"
	@dialog_on
@endif
@rclick call=true target=*rclick enabled=true
@return