## xigua-hw2

![image-20220127220452845](https://picbedd.oss-cn-beijing.aliyuncs.com/image-20220127220452845.png)

## 我的想法

模仿之前学校的实验室小程序项目，用 SwiftUI 写一个简化版本的

包含三个页面：首页，门禁码，个人页

原小程序版本：

<img src="https://picbedd.oss-cn-beijing.aliyuncs.com/image-20220127222018365.png" alt="image-20220127222018365" style="zoom:50%;" />

<img src="https://picbedd.oss-cn-beijing.aliyuncs.com/image-20220127222051494.png" alt="image-20220127222051494" style="zoom:50%;" />

<img src="https://picbedd.oss-cn-beijing.aliyuncs.com/image-20220127222036556.png" alt="image-20220127222036556" style="zoom:50%;" />

### 效果截图

首页：

![image-20220127222150352](https://picbedd.oss-cn-beijing.aliyuncs.com/image-20220127222150352.png)

门禁码：

![image-20220127222211293](https://picbedd.oss-cn-beijing.aliyuncs.com/image-20220127222211293.png)

![image-20220127222235756](https://picbedd.oss-cn-beijing.aliyuncs.com/image-20220127222235756.png)

<img src="https://picbedd.oss-cn-beijing.aliyuncs.com/image-20220127230236029.png" alt="image-20220127230236029" style="zoom:50%;" />

## 后记

这次作业试了太多错了，第一次上课用的 SwiftUI，第二次用的 UIKit。所以第二次一开始也用 UIKit 写了一些小东西，比 SwiftUI 难上手一些😭。

先看了一下群里徐老师发的资料，自定义不规则 TaBbar，给看懵了，好像是 Object-C。。

悄悄说一句，Swift 的资料真的很难找，官方文档更不好读，被迫到 stack overflow 学了几天英语.......

<img src="https://picbedd.oss-cn-beijing.aliyuncs.com/image-20220127222853020.png" style="zoom: 50%;" />

后面开始写 UIKit 了，找了些视频入入门，一下更晕了。有的用的 StoryBorad，有的用的代码，再加上 XCode 还没用熟，我一整个蚌埠住了。

接着尝试用拖拽的方式写了几个页面

<img src="https://picbedd.oss-cn-beijing.aliyuncs.com/image-20220127223307552.png" alt="image-20220127223307552" style="zoom: 50%;" />

<img src="https://picbedd.oss-cn-beijing.aliyuncs.com/image-20220127223339838.png" alt="image-20220127223339838" style="zoom:50%;" />

刚开始还是写的比较顺利的，可是这种方式越到后面，越不实用了。比如我想自定义 Tabbar 的时候，拖拽的方式是没办法自定义的，还需要将页面链接到一个 Controller，再在里面重写。然而对于 iOS 新手来说已经分不清了...这种方式在多人开发时，应该会更乱吧=。=

后面又尝试了和课上一样，全部在 PlayGround 里面写，用 iPad 就可以了，可是这样也有比较大的问题。首先是 iPad 的预览，那个比例看起来不像 iPhone 也不像 iPad。其次所有代码都写在一个文件里面看起来太凌乱了。最致命的是 iPad 上还不支持 Git。算了，还是用回电脑继续写吧。

最后这次我回去看了第一节课的内容，SwiftUI 又快又优雅，为什么不用它呢~_~好在这次尝试终于做了像样的小Demo，不然我真的要emo了。快速看了一下 SwiftUI 的文档，过了一下一个叫做 `designcode` 的博主的视频，这下写起来顺利多了。到这时我才开始分清 Swift, SwiftUI, UIKit= =。有了之前的踩坑试错经验，XCode用得熟多了。SWiftUI 在效率和体验上，都比 UIKit 舒服得多。

写废了的东西都丢到 discard 文件夹里面了。

对于 Tabbar ，我想到了以前见过的前端侧栏导航的例子，把它放大一下，横过来作为这个程序的 Tabbar，边查边写，比 iOS 本身自带的 Tabbar 看起来更灵动。启动的时候，先隐藏自带的 Tabbar，使用自定义的 Tabbar 作为程序的入口就OK了。

![image-20220127230146923](https://picbedd.oss-cn-beijing.aliyuncs.com/image-20220127230146923.png)

![image-20220127230134720](https://picbedd.oss-cn-beijing.aliyuncs.com/image-20220127230134720.png)

![image-20220127230157021](https://picbedd.oss-cn-beijing.aliyuncs.com/image-20220127230157021.png)



页面并不复杂，按照小程序怎么做的，还原一下就好了。两个程序都是我自己写的，顺带对比一下微信小程序和 SwiftUI，各有优劣，都是非常优秀的产品～～

- SwiftUI 的动画，又精美又流畅；小程序上的动画总是卡卡的，并且在不用设备上效果还不太一样。
- iOS 模拟器模拟了一整个iPhone，和手机使用起来没什么差异。小程序在开发者工具中是好的，但是在手机上调试，可能会出现完全不一样的结果..这个小程序当时上线的时候，几分钟就收到了一堆bug，iOS 用户有个页面完全运行不了。后来断点逐行排查后，发现是时间戳的问题，安卓和 iOS 的时间戳格式不一样，而出错的那个页面整个逻辑我都是根据时间戳写的...运行的平台生态割裂导致做小程序有时候真的很让人头大。

- SwiftUI 也可以使用半可视化的方式构建代码，拖拽组件到代码区域，然后在右侧调整参数。小程序需要完全手动写代码。这倒是因人而异，我更喜欢使用全代码的方式，XCode 相当于多了一个选择。
- 小程序更容易上手，微信小程序的原生语法和 Vue 相似度80%，可以让前端几乎无缝迁移过来，uniapp、taro等框架甚至直接用了Vue、 React的语法。Swift 则是苹果公司自己开发的语言，使用起来我感觉和 Golang 有一丢丢相似，上手难度也不大。
- 小程序有各类第三方UI库，但我觉得 SwiftUI 自己本身的图标，组件，动画就很好看了。全用自家的东西也不会导致使用起来有割裂感。

ps：之前还很犹豫，自己做小程序做的比较多，要到找实习的时候了，前端和后端到底怎么选。这次作业并不难，难的是从0基础到探索客户端的过程，感谢西瓜视频，带我入门了 iOS，现在我决定 all in 前端 / iOS客户端啦～后面除了计算机基础，去学更多的 iOS 的内容～～！