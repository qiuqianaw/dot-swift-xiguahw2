## Dot Game-西瓜视频客户端

第一次接触 Swift UI 的东西，写起来挺爽的，根据示例代码依葫芦画瓢完成了功能，虽然写得很乱就是了...

### 需求

![origin_img_v2_46df9c93-de6a-4315-9591-65bb18b0790g](https://picbedd.oss-cn-beijing.aliyuncs.com/origin_img_v2_46df9c93-de6a-4315-9591-65bb18b0790g.png)

### 简陋流程图

![未命名](https://picbedd.oss-cn-beijing.aliyuncs.com/%E6%9C%AA%E5%91%BD%E5%90%8D.png)

### 效果展示

![141642261660_.pic_hd](https://picbedd.oss-cn-beijing.aliyuncs.com/141642261660_.pic_hd.jpg)



![131642261659_.pic_hd](https://picbedd.oss-cn-beijing.aliyuncs.com/131642261659_.pic_hd.jpg)

![121642261658_.pic_hd](https://picbedd.oss-cn-beijing.aliyuncs.com/121642261658_.pic_hd.jpg)

![151642261699_.pic](https://picbedd.oss-cn-beijing.aliyuncs.com/151642261699_.pic.jpg)

![161642261813_.pic](https://picbedd.oss-cn-beijing.aliyuncs.com/161642261813_.pic.jpg)

### 踩坑

游戏中设置了不同关卡的难度：Light 二维数组的规模，和最小需要点击几次才能通关。

随着难度提升，二维数组的规模扩大，页面的view需要重新刷新，但是在把

```swift
@State var lights = [
        [Light(), Light(), Light()],
        [Light(), Light(), Light()],
        [Light(), Light(), Light()]
    ]
```

变成

```swift
lights = [
                [Light(), Light(), Light(), Light(), Light()],
                [Light(), Light(), Light(), Light(), Light()],
                [Light(), Light(), Light(), Light(), Light()],
                [Light(), Light(), Light(), Light(), Light()],
                [Light(), Light(), Light(), Light(), Light()]
            ]
```

甚至更大的时候，报错了。

错误内容类似

```
ForEach<Range<Int>, Int, ModifiedContent<_ConditionalContent<_ConditionalContent<_ConditionalContent<_ConditionalContent
<ZStack<TupleView<(_ShapeView<Squiggle, ForegroundStyle>, 
_StrokedShape<Squiggle>)>>, ZStack<TupleView<(ModifiedContent<_StrokedShape<StripedRect>, 
_ClipEffect<Squiggle>>, _StrokedShape<Squiggle>)>>>, _StrokedShape<Squiggle>>, 
_ConditionalContent<_ConditionalContent<ZStack<TupleView<(_ShapeView<Capsule, ForegroundStyle>, _StrokedShape<Capsule>)>>, 
ZStack<TupleView<(ModifiedContent<_StrokedShape<StripedRect>, _ClipEffect<Capsule>>, 
_StrokedShape<Capsule>)>>>, _StrokedShape<Capsule>>>, _ConditionalContent<_ConditionalContent<ZStack<TupleView<(_ShapeView<Diamond, 
ForegroundStyle>, _StrokedShape<Diamond>)>>, ZStack<TupleView<(ModifiedContent<_StrokedShape<StripedRect>, _ClipEffect<Diamond>>, 
_StrokedShape<Diamond>)>>>, _StrokedShape<Diamond>>>,
 _FrameLayout>> count (2) != its initial count (1). `ForEach(_:content:)`
 should only be used for *constant* data. Instead conform data to `Identifiable` 
or use `ForEach(_:id:content:)` and provide an explicit `id`!
```

根据写Vue的经验，我猜测是因为扩大规模需要view body刷新，而![image-20220115235748997](https://picbedd.oss-cn-beijing.aliyuncs.com/image-20220115235748997.png)这个index超出了范围，所以报错了。

不得不说，swift的资料文档真的好少。。。

最后终于在 [Swift UI ForEach应仅用于*常量*数据 - 我爱学习网 (5axxw.com)](https://www.5axxw.com/questions/content/58ghkl) 中找到了。。

![image-20220115235921903](https://picbedd.oss-cn-beijing.aliyuncs.com/image-20220115235921903.png)

在通过切换到采用`id:`参数的初始值设定项...

虽然没明白是什么意思，但至少找到了解决的办法。。。。