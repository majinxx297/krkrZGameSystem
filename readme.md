# 魔人式krkrzADVsystem

从零开始的吉里吉里ADV系统搭建☆ミ

制作者[@芋魔人X](https://weibo.com/1462684514/)

## TODO
- 选择后的确认界面  
- 侧边栏插件试做（兼插件制作入门  
- 章节选择画面试做
  - SE
    - [「シュッ！」](https://www.youtube.com/watch?v=F-Ke87kam0o)
  - BGM
    - 穏やか , お洒落 , ｻｲﾊﾞｰ , 四拍子 , 民族系
    - 物語 始まり
    - 煉獄庭園   
  - 右键返回
  - 暗黑宫篇和上锁条目(???)的设计 
    - [ ] 暗黑宫篇标题图草稿
    - [ ] 上锁条目用图：用现存迷宫图凑合一下 
  - FIXME: 把cleanup做成macro，onEnter的时候也要call一下（对应键盘  
- 迷宫探索画面试做
- 对话界面试做
  - [ ] 收集对话界面资料
- 地图选择界面
- FIXME: testScene先隐藏对话框再开save界面会出现return多了的情况
- 鼠标点击小动画（click glphy
- 试用其他(开源)字体  
- SL画面(荒星版)
- Config画面
- debug menu加自动生成的截图？
- merge dialog_xxx
  - 合并为@dialog <opt>
- 自动生成debug用列表mainmenu.ks
- Common.tjs和TJSFunctions.tjs合体

### 剧本管理脚本（有了剧本再搞
- libreoffic calc用的sheet->ks脚本用macro

### Postpone
* 修复/重写title画面(移动button)
  - title设计可能会变，等确定设计再说
- 章节顺序调整
  - 不如直接每个文件一小章&每个文件夹一大章，然后用脚本批处理插入
  - 好像没啥必要？  
* photoshop演出支援插件
* exmove2(blur版)导入
* layerType = ltAlpha能治好message frame半透明时的显示问题吗？

## photoshop演出支援插件

其实最需要的是直接将所有图层摆放到位的插件？

```
input: current file + dest name
output: dest.ks + png files(layers)
    @image page=fore layer=0 visible=true storage=...
    @image page=fore layer=1 ...
```

include问题恐怕没法解决
只能写个UI
搞个下拉菜单选trans/.asset/move
再搞个checkbox选择是否对全部图层实行

### ~~自动化~~(臣妾做不到)

其实还有一种笨办法是每层分别记录上一帧状态(position&style)
有变化就是keyframe
两个keyframe之间的时间差就是move/trans的time参数

assumption:同一时间只有move和trans二者之一可以发生
比较方式是生成kag脚本并比较字符串
每个图层应该有单独的timer
style和position共用

↑然鹅这种算法布星
加入t1和t2分别是两个keyframe，那么t1和t2之间每一帧都是跟之前不一样的
按上面的算法会变成一串关键帧


分三个action
分别是kag_move, kag_image, kag_trans
分别call三个不同的js
使用方法是一边手动走timeline一边在关键帧运行这些动作

tjs2.info的exmove有一个问题
扩大缩小/旋转就会重新计算中心点坐标
但是单纯移动的时候坐标清空变成(0,0)

太难了做不了，改成手动式的
先选好图层，然后按→一格一格走，走到关键帧就发动script，生成的kag直接送desktop/timeline.ks里
blending option无法读取，所以只能填号move的部分，trans还是要手写

另外旋转角度也无法自动获取
不过就算这样还是比纯手写方便很多......大概。

分成@image和@move两类
图层名是文件名
layer=N通过index自动找

从photoshop timline导出KAG演出script到剪切板
默认使用了exmove

Workflow

1. 从fg/bg/image拖素材到ps，在ps里调好动作
2. 运行插件，得到一段kag
3. 粘回.ks文件

## 已完成

### exmove插件加暂停
- LinearMover和SplineMover暂停: 加一个isPaused，handler里检测这个=true就不动
- evmove里如法炮制
- ↑这样虽然能停下来，但再开的时候会一口气移动到没暂停时该移到的位置
  - 需要改计算时间的方法....（抱头

### fg macro 语法改良

```
@fg_in name=chara1 normal left
@chara1 smile
台词台词台词[p]
@chara1 sad
```

chara tag retrieve load info

```
mp.tagname
> 查layer1和layer2的name
> 根据结果将layer设成1/2(不要动别的)
```

图层结构

```
message0
layer3    message window
layer2    right
layer1    left    
layer0    背景
```

目前已确定exmove如果没有eximage会有存档问题(部分属性读档的时候无法复原)
(顺便zoom.ks也有这问题)
为了直接写@image，把eximage2直接并入系统

方案1
插件保持
在windows里new一个插件实体

方案2
插件大部分code拷入window
onStore和onRestore拷入layer.store/restore

#### fg basic control

```
; 目前能实现的
@fg_in left storage=chara1
@fg_in right storage=chara2

; 理想
; chara1 chara2是文件名
@fg_in chara1 left
@fg_in chara2 right

; 折中的改进
@fg_in left=chara1
@fg_in right=chara2
```

fg motion

```
@fg_action left method=...
```

---

#### 移动控制

* 脚本简短
* 功能满足需求

```
@move 
```
