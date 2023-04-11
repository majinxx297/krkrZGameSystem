; 开发用主选单

*start|
@startanchor 
@history output=false enabled=false
@rclick enabled=false
@laycount layers=0 messages=0
@laycount layers=3 messages=2

; 主选单界面
@image layer="base" storage="../bgimage/white.png" 
@position layer="message0" page="fore" color="0x000000" top=13 left=267 width=700 height=650 opacity=100 marginl="32" margint="15" marginr="32" frame="" visible="true" 

; 显示脚本列表
@current layer="message0" 
@nowait
[link storage="scratch.ks" target="*start"]Scratch(scratch.ks)[endlink][r]
[link storage="testScene.ks" target="*start"]ADV基本对话界面(testScene.ks)[endlink][r]
[link storage="scenarioSelect.ks" target="*start"]剧本选择画面(scenarioSelect.ks)[endlink][r]
- Empty - [r]
- Empty - [r]
- Empty - [r]
- Empty - [r]
- Empty - [r]
- Empty - [r]
- Empty - [r]
- Empty - [r]
- Empty - [r]
- Empty - [r]
- Empty - [r]
- Empty - [r]
- Empty - [r]
- Empty - [r]
- Empty - [r]
- Empty - [r]

@endnowait

@s