# ✨LuckyDraw抽奖平台 - By 刘仕杰✨

项目介绍：抽奖系统是各个互联网公司用于拉新、促活、留存、转化的重要手段，此项目针对高并发场景，搭建为各平台促销提效的营销抽奖平台。可通过MQ消息轻松对接外部系统，外部系统用户行为触发抽奖次数增加。

核心技术：SpringBoot、MyBatis、MySQL、Redis、Redisson、Guava、RabbitMQ、Xxj-job、ElasticSearch、Vue3。

---

>在线演示地址 [**www.luckylottery.site/raffle/100301**](www.luckylottery.site/raffle/100301)

>项目出处：小傅哥(京东T8架构师)，小傅哥真的是踏实分享技术的博主，在此推荐给大家，有兴趣的请加入小傅哥星球继续学习~

![](https://github.com/1321928757/static-resources/blob/main/zhishixq.png?raw=true)  

## 💫运行配置

### 运行环境
- Linux: Centos7.6 4H4G
- Docker:25.0.3
- Springboot:2.7.12
- JDK:1.8

### 服务环境
- Mysql:8.2
- Redis:5.0
- xxl-job:2.4.2
- Rabbitmq:3.8.34
- Elasticsearch:7.17.21

## ⭐总体开发进度

- ✅抽奖策略和奖品库表设计
- ✅抽取概率区间算法实现
- ✅概率预装配，权重概率预装配
- ✅抽奖前，责任链规则校验(黑名单处理，权重处理，抽取处理)
- ✅抽奖后，配合数据库构建决策树，完成次数锁判断，库存扣减判断，兜底处理等分支流程
- ✅实现活动与用户的库表设计，设计分库分表的库表设计
- ✅实现分库分表的路由
- ✅实现抽奖次数获取入库
- ✅实现用户参与活动抽奖，获奖记录入库
- ✅实现登录模块的设计
- ✅活动API的完善，前端展示活动详细信息
- ✅获奖API的完善，用户可查看获奖记录
- ✅完善保底策略【为每个用户维护保底计数器，保底后清空计数器】
- ✅Web添加奖品详细信息，概率等信息的展示
- ✅实现活动最近获奖记录展示榜【分库分表的聚合操作，整合ES，异步双写同步数据】
- ✅实现积分类奖品的发放
- 实现积分兑换功能
- 

看这里！！！！！定时任务选用的xxl-job,但原版滥用xxl-job，存在多端口问题，每个服务的定时任务执行器都需要占用一个端口，当我们部署到类似与docker的容器中时，如果两个服务
执行器占用的端口一样就会产生端口冲突问题，我们需要主动为他们分配不同的端口，这非常不利于我们服务的水平扩容，所以我这里找了一个老哥修改的版本https://github.com/kdyzm/xxl-job
，这个修改版本去除了netty组件，任务调用端口和服务端口是同样的，看自己选择吧~如果需要用这个改版可以看我的博客https://blog.csdn.net/qq_35716689/article/details/138769153?spm=1001.2014.3001.5501

## 🪐前端说明

前端提供了vue2 vue3两个版本，/docs/web/vue和/docs/web/vue3

vue2版本(暂时没有维护啦)

```
npm install
npm run dev
```

vue3版本(推荐)

```
yarn install
yarn run dev
```

**效果图预览**

登录界面
![](https://img-blog.csdnimg.cn/direct/7f313b52a7b043ccb0f87ac639aaee44.png)

活动主界面  
电脑端网页效果  
![](https://github.com/1321928757/static-resources/blob/main/PC1.png?raw=true)  
![](https://github.com/1321928757/static-resources/blob/main/PC2.png?raw=true)  

移动端网页效果  
![](https://github.com/1321928757/static-resources/blob/main/PE1.jpg?raw=true)  
前端获奖记录展示没有找到合适的组件(有一个上下滚动展示的，但是太吃性能了，就换成这个横向滚动库了)，效果貌似也还行？
![](https://github.com/1321928757/static-resources/blob/main/PE2.jpg?raw=true)
![](https://github.com/1321928757/static-resources/blob/main/PE3.jpg?raw=true)


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

### 核心业务流程
参与活动&活动抽奖核心业务流程  
![](https://github.com/1321928757/static-resources/blob/main/yuque_diagram%20(12).jpg?raw=true)
