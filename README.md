# ✨营销抽奖系统 - By 刘仕杰✨

项目出处:小傅哥，[**小傅哥的博客**](https://bugstack.cn)
小傅哥真的是踏实分享技术的博主，有想要提升自己能力的都可以加入小傅哥的星球，强烈推荐~

代码后续不会上传全部，仅仅展示项目的初步结构与效果，想要继续深入学习的同学需要加入小傅哥的星球[**小傅哥的知识星球**](https://wx.zsxq.com/dweb2/index/group/48411118851818)~

项目介绍：营销抽奖系统是各个互联网公司用于拉新、促活、留存、转化的重要手段，此项目针对高并发场景，搭建为各平台促销提效的营销抽奖平台。

核心技术：SpringBoot、MyBatis、MySQL、Redis、Redisson、Guava、RabbitMQ。

---

>在线演示地址 [**www.luckylottery.site**](www.luckylottery.site)

## 💫运行配置

- 运行环境：JDK 1.8+
- Springboot：2.7.12
- mysql：8.2
- redis：5.0

## ⭐后端开发进度

- ✅抽奖策略和奖品库表设计
- ✅抽取概率区间算法实现
- ✅概率预装配，权重概率预装配
- ✅抽奖前，责任链规则校验(黑名单处理，权重处理，抽取处理)
- ✅抽奖后，配合数据库构建决策树，完成次数锁判断，库存扣减判断，兜底处理等分支流程
- ✅实现活动与用户的库表设计，设计分库分表的库表设计
- ✅实现分库分表的路由(利用小傅哥开源的的分库分组组件)
- ✅实现抽奖次数获取入库
- 实现活动抽奖主要流程

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



## 🫧项目架构

项目整体根据DDD四层架构搭建

### 架构分层

![](https://img-blog.csdnimg.cn/direct/e367e120dc7543d385f518fd5ff67267.png)

DDD四层架构主要是app应用层，domain领域层，trigger触发器层，infrastructure基础建设层，本项目的架构在这基础上新增了api接口标准层，type通用类型层

**✨spring-ddd-archetype-app**：**应用层**

主要负责管理整个系统的配置，项目启动。对于一些第三方Bean的声明，AOP切面都可在这层完成

**✨spring-ddd-archetype-api**：**接口标准层**

该层的目的是为了让 HTTP 接口、RPC 接口，都能在一个标准下开发，为trigger层提供标准接口，这一层是为了编码规范，也可以不要这一层在trigger层直接编写对应实现类

✨**spring-ddd-archetype-trigger**：**触发器层**

触发器层主要是定义对触发动作的监听，比如Http请求接口，RPC服务，MQ消息监听，定时任务等触发动作。

✨**spring-ddd-archetype-domain**：**领域层**

DDD架构最核心的部分，根据不同业务划分不同的领域包，为infrastructure层提供仓储接口，实现依赖倒置

✨**spring-ddd-archetype-infrastructure**：**基础建设层**

基础建设层主要负责与底层数据库的交互，消息的生产等，如mysql和缓存。实现了领域层提供的仓储接口，为领域层提供仓储服务，依赖倒置

✨**spring-ddd-archetype-types**：**通用类型层**

基础类型层是为了让提供一些像工具类的通用类，提高代码复用

