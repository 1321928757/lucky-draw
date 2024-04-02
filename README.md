# ✨营销抽奖系统 - By 刘仕杰✨

项目出处:小傅哥，[**小傅哥的博客**](https://bugstack.cn)
小傅哥真的是踏实分享技术的博主，有想要提升自己能力的都可以加入小傅哥的星球，强烈推荐~

项目介绍：营销抽奖系统是各个互联网公司用于拉新、促活、留存、转化的重要手段，此项目针对高并发场景，搭建为各平台促销提效的营销抽奖平台，管理员可通过后台管理活动与奖品，用户可以通过抽奖的方式获取奖品，在寻常抽奖的基础上扩展了黑名单用户兜底，用户权重分析，次数解锁奖品，兜底奖品随机积分等功能。整体采用DDD架构设计。

核心技术：SpringBoot、MyBatis、MySQL、Redis、Redisson、Guava、RabbitMQ。

项目尚未完结，只完成了一个简单的抽奖功能。

前端很简单，故就没有上传了，使用了 https://100px.net/ 这个大转盘插件，vue/react/原生js都可以实现的

---

>**作者**：LuckySJ-刘仕杰 - 在线演示地址 [**www.luckylottery.site**](www.luckylottery.site)

## 💫运行配置

- 运行环境：JDK 1.8+
- Springboot：2.7.12
- mysql：8.2
- redis：5.0



## ⭐后端开发进度
最新开发进度-liushijie-20240314-events分支(正在开发 抽奖次数获取入库)

- ✅抽奖策略和奖品库表设计
- ✅抽取概率区间算法实现
- ✅概率预装配，权重概率预装配
- ✅抽奖前，责任链规则校验(黑名单处理，权重处理，抽取处理)
- ✅抽奖后，配合数据库构建决策树，完成次数锁判断，库存扣减判断，兜底处理等分支流程
- ✅实现活动与用户的库表设计，设计分库分表的库表设计
- ✅实现分库分表的路由(利用小傅哥开源的分库分组开源组件，shardingsphere使用起来比较麻烦不灵活)
- ✅实现抽奖次数获取入库，liushijie-20240331-sku-stock分支开发完成
- 实现活动抽奖主要流程
- 实现活动发布流程
- 实现用户登录，用户通过扫码从微信公众号获取验证码来进行身份验证
- 实现获奖数据入库
- 实现发货功能(完成获奖人信息填写，进行奖品发货，这里有时间的话会尝试对接大语言模型平台)

## 🪐前端开发进度

前端提供了vue2 vue3两个版本，/docs/web/vue和/docs/web/vue3

vue2版本

```
npm install
npm run dev
```

vue3版本

```
yarn install
yarn run dev
```

- ✅对接后端抽奖接口实现转盘抽奖功能
- 🔥实现扫码登录界面
- 实现主界面，通过主界面公示当前所有的活动
- 用户可通过点击活动，参与活动，进入活动界面
- 在活动界面展示活动信息(抽奖，活动说明，概率声明等)
- 实现后台-活动发布
- 实现后台-数据统计

**效果图预览**

![](https://img-blog.csdnimg.cn/direct/9816127cb88f4e5aafd996c8ee32efbf.png)




## 🐾业务流程

### 奖品概率装配流程

这里用到的抽奖算法大概是为每个奖品分配其范围，然后装配对应范围数量的元素到Map中，value即为奖品id，我们通过生成总范围内的一个随机数，再通过该随机数作为key从map中取，就实现了奖品的抽取，这种方式空间换时间，优点是速度快，缺点是数据不能太苛刻，假如总范围为1000000，那么装配到map中就很容易OOM爆内存，不过在正常的情况下还是没问题的

![](https://github.com/1321928757/static-resources/blob/main/yuque_diagram%20(5).jpg?raw=true)

### 抽奖业务流程图

![](https://github.com/1321928757/static-resources/blob/main/yuque_diagram%20(2).jpg?raw=true)

### 后续整体的流程(具体代码目前只完成了策略抽奖部分，路漫漫啊)

我们可以把抽奖的行为理解为一个**下单**过程，用户参与抽奖，也等价于商品下单。

![](https://github.com/1321928757/static-resources/blob/main/yuque_diagram%20(6).jpg?raw=true)

### 增加用户的抽奖次数流程图

用户的触达行为是后续需要扩展的部分，我们可以通过利用mq消息来实现我们该营销抽奖系统与外部一些平台的对接，比如你的博客有个签到功能，当用户触发这个签到行为时，会发送mq消息给我们系统，我们系统就可以针对对应的活动SKU给用户添加抽取次数。

![](https://github.com/1321928757/static-resources/blob/main/yuque_diagram%20(7).jpg?raw=true)



## 🦜库表设计



### **抽奖策略库表设计**

抽奖策略部分涉及到的库表如下：

**奖品表(award)：** 记录奖品的基本信息

**抽奖策略表(raffle_strategy)：** 抽奖策略表，每个活动对应一个抽奖策略

**抽奖策略奖品表(raffle_strategy_award)：** 策略与奖品的关联表，也就是抽奖策略下有哪些奖品

**抽奖策略规则表(raffle_strategy_rule)：** 记录本次抽奖策略的抽奖规则，比如权重规则，黑名单规则，我们会根据这个表构建责任链进行规则校验

> 我们可以根据以下三个表的信息配合组合模式构建决策树，大概流程：1.选择根节点 2.根据连线路径信息确认子结点 3.拼接出决策树
>
> 规则决策树与平常的责任链规则校验都可以完成规则校验，只是决策树更加适合有分支走向的情况，比如我们首先校验次数，如果校验没通过，就会走我们兜底抽取，如果通过了，就会继续走我们的库存校验，这里就存在了分支走向，我们这样设计更方便后续规则的扩展，只需要在库中配置好对应的决策树信息，代码编码对应的结点，就完成了决策树规则校验的扩展

**决策树表(rule_tree)：** 决策树的树根信息，

**决策树结点表(rule_tree_node)：** 决策树的节点，这些节点可以组合出任意需要的规则树。

**决策树连线表(rule_tree_node_line)：** 决策树节点连线，用于标识出怎么从一个节点到下一个节点。







### **活动订单库表设计**

我们订单部分库表设计主要分为两大部分，三个活动配置库表和两个与用户相关的库表。

> 以下三张表都属于系统配置相关的，数据量相对较小，我们与抽奖策略等配置相关的库表一齐放到主库中，不参与分库分表

**抽奖活动表（raffle_activity）**：这个库表主要是记录活动的一些详细信息

**参与次数表（raffle_activity_count）**：每个活动SKU都会对应一个参与次数表，也就是用户通过这条sku下单能够得到多少抽奖次数

**活动SKU表（raffle_activity_sku）**：SKU表主要是为了方便后续对接多种次数来源，假如我们可以通过签到和积分兑换这两种渠道获取抽奖次数，那么我们对于一个活动就有两条sku信息，分别代表签到和积分兑换这两种情况的相关信息，比如库存，最大参与次数等等，这样我们就可以针对不同的情况配置不同的限制，也方便后续扩展。

> 以下两张表类似于用户的流水，每次参加活动抽奖都会产生很多记录，所以采用分库分表来分摊访问和存储压力

**活动次数账户表（raffle_activity_account）**：用户对于每个活动都会有对于的次数账户，用来记录用户在本次活动中能够抽取的次数

**活动下单记录表（raffle_activity_order_000~004）**：用户每次抽奖都相当于一次下单，我们需要记录用户的抽奖记录

![](https://github.com/1321928757/static-resources/blob/main/table.png?raw=true)


### 具体代码分析

## 🕊作者动态

最近需要准备竞赛，先鸽一段时间，会抽空把整体项目一些相关的信息补充上来，包括抽奖业务的整体流程(还没和活动用户结合)，以及项目整体的架构分层