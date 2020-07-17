# LayoutKit

## 现状
### 已有方案及特点
- 手动计算，要写比较多的布局代码，布局效率高，开发效率很差，不容易理解
- Auto Layout
  - 系统API, 要写较多布局代码，布局效率一般，开发效率一般，相对容易理解
  - Masonry, 代码量相对系统较少，布局效率一般，开发效率较系统API高些，相对容易理解
- Yoga，需要一定学习成本，需要写较多布局代码，布局效率高，开发效率一般，相对容易理解

### 项目布局现状
- 手动计算frame占绝大多数
- 少部分自动布局（Masonry）
- Yoga 特定的模块内

目前来说虽然有公认比较好的开源项目（Masonry，YogaKit等）,但是并没有带来很高的开发效率，开发业务在UI布局方面花的时间依然很可观。

## 布局框架设想
- 能够满足日常开发布局需求
- 声名式，易阅读，易理解，代码量少
- 多状态绑定，可根据状态变化(View trait / size class ...)
- 开发效率高
- 可以作为声明式UI（类似flutter，SwiftUI...）框架的基础 
  
## 实现探讨
- DSL
  - 封装Auto Layout
  - 封装Kiwi (开源相对布局算法, 不支持wrap，需要自己开发)
  - 封装Yoga (overlay 堆叠布局支持不大友好)
- 自己开发布局算法
  - 开发迭代时间比较长

## 布局实例（伪代码）
  
<img src="../Layout文档/imgs/1.png" width="20%">

```
LayoutAxisY({
  view1,
  view2,
  view3,
});

```

<img src="../Layout文档/imgs/2.png" width="45%">

```
LayoutAxisX({
  view1,
  view2,
  view3,
});

```

<img src="../Layout文档/imgs/3.png" width="20%">

```
LayoutAxisZ({
  view1,
  view2,
  view3,
});

```

<img src="../Layout文档/imgs/5.png" width="20%">

```
LayoutAxisZ({
  view1,
  view2,
  view3.right(0).bottom(0),
});

```

<img src="../Layout文档/imgs/4.png" width="40%">

```
LayoutAxisX({
  view1,
  LayoutAxisY({
    view2,
    view3,
  }),
});

```

<img src="../Layout文档/imgs/6.png" width="50%">

```
LayoutAxisX({
  LayoutAxisZ(100,100,{
    view1,
    view2.right(-1).bottom(-1)
  }),
  Spacer(10),
  LayoutAxisY({
    view3,
    LayoutAxisX({
      view4,
      Spacer(),
      view5,
      Spacer(),
      view6,
    })
    .widthPercent(100)
  }),
});

```




