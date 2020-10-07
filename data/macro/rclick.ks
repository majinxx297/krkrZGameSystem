*start
@if exp="kag.fore.messages[0].opacity>0"

@move layer=message0 time=300 path=(180,530,0)
@move layer=2 opacity=0 time=300 path=(180,530,0)
@wm

@elsif exp="kag.fore.messages[0].opacity==0"
@move layer=message0 time=300 path=(180,512,255)
@move layer=2 time=300 opacity=255 path=(180,512,255)
@wm
@endif

@return