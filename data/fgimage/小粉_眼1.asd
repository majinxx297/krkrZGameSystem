*start
@loadcell
@loop

*loop
@copy stretchy=""
@wait time="&intrandom(50,6000)"
@copy stretchy="0.95"
@wait time=50
@copy stretchy="0.9"
@wait time=50
@copy stretchy="0.85"
@wait time=50
@copy stretchy="0.8"
@wait time=50
@copy stretchy="0.5"
@wait time=50
@copy stretchy="0.8"
@wait time=50
@copy stretchy=""
@wait time=50
@jump target=*loop