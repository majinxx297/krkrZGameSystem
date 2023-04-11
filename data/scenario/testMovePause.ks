*start|
@laycount layers=0 messages=0
@laycount layers=3 messages=2

@image storage="../others/Title.png" layer="0" left=0 top=0 visible="true" 
@move layer=0 time=800 path=(760,600,)(,0,)(0,600,) repeat=1000

*resume|
@waitclick
@eval exp="f.pausedMove = true"
@waitclick
@eval exp="f.pausedMove = false"
@jump target="*resume"

@jump target="*start" storage="mainmenu.ks" 