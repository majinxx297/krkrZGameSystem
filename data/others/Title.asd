@loadcell

*start
@s

*start1
@loop
@macro name=copyone
@copy dx=0 dy=0 sx=%x sy=0 sw=561 sh=91
@wait time = 35
@endmacro

*loop1
@home
@copyone x=0
@copyone x=561
@copyone x=1122
@copyone x=1683
@copyone x=2244
@copyone x=2805
@copyone x=3366
@copyone x=3927
@copyone x=4488
@copyone x=5049
@copyone x=5610
@copyone x=6171
@copyone x=6732

*resume1
@wait time="&intrandom(2,8)*1000"
@jump target = *loop1