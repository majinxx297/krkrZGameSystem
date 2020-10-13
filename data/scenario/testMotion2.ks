*start|
@image storage=BG00 layer=base
@image storage=IN00N page=fore visible=true pos=right layer=0
@image storage=IN00S page=back visible=true pos=right layer=0 mcolor=0x000000 mopacity=180 xblur=5 yblur=5
@move layer=0 path=($+150,,,,) time=800 
@trans layer=0 time=800 method=crossfade
[wt]
[wm]

*page0|测试哆嗦
开始哆嗦100下[l][r]
@move layer=0 path=($+10,,,,)($-10,,,,)  time=100 repeat=100 spline=true
@wm
别哆嗦啦[p]