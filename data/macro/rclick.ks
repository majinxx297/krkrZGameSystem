*rclick
@rclick jump=true target=*exit enabled=true
@move layer=message0 time=500 path=($-15,,0)
@move layer=3 opacity=0 time=300 path=($-40,,0)
@wm
@s

*exit
@move layer=message0 time=500 path=($+15,,255)
@move layer=3 time=300 opacity=255 path=($+40,,255)
@wm
@rclick call=true target=*rclick enabled=true
@return