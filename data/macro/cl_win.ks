*start
[if exp="kag.fore.messages[0].opacity==255"]

; TODO: get layer names arguments from callee
; TODO: show message window & frame when right click
[move layer=message0 d time=300 path=(50,0,0)]
[rmove layer=0 dx=-50 opacity=0 time=300]
[wm]

[elsif exp="kag.fore.messages[0].opacity==0"]
[move layer=message0 time=300 path=(0,0,255)]
[rmove layer=0 dx=50 time=300 opacity=255]
[wm]
[endif]
[return]