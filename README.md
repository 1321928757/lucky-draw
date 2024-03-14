# 营销抽奖系统 - By 刘仕杰

项目介绍：营销抽奖系统是各个互联网公司用于拉新、促活、留存、转化的重要手段，此项目针对高并发场景，搭建为各平台促销提效的营销抽奖平台，管理员可通过后台管理活动与奖品，用户可以通过抽奖的方式获取奖品，在寻常抽奖的基础上扩展了黑名单用户兜底，用户权重分析，次数解锁奖品，兜底奖品随机积分等功能。整体采用DDD架构设计，支持分布式水平扩展，单实例部署下QPS实测1000左右。

核心技术：SpringBoot、MyBatis、MySQL、Redis、Redisson、Guava、RabbitMQ。

项目尚未完结，只完成了一个简单的抽奖功能，仍在持续迭代，小伙伴可以先行扩展

前端很简单，故就没有上传了，使用了 https://100px.net/ 这个大转盘插件，vue/react/原生js都可以实现的

---

>**作者**：LuckySJ-刘仕杰 - 在线演示地址 [**www.luckylottery.site**](www.luckylottery.site)

## 运行配置

- 运行环境：JDK 1.8+
- Springboot：2.7.12
- mysql：8.2
- redis：5.0

## 后端开发进度
- ✅抽奖策略和奖品库表设计 
- ✅抽取概率区间算法实现 
- ✅概率预装配，权重概率预装配 
- ✅抽奖前，责任链规则校验(黑名单处理，权重处理，抽取处理) 
- ✅抽奖后，配合数据库构建决策树，完成次数锁判断，库存扣减判断，兜底处理等分支流程 
- 🔥实现活动与用户的库表设计 分支liushijie-20240313-activity开发中 
- 实现分库分表(利用shardingsphere分库分表组件)
- 实现活动发布流程(后台发布活动 -> 概率区间等缓存数据预热 -> 等待到开启活动时间)
- 实现获奖数据入库()
- 实现发货功能(完成获奖人信息填写，进行奖品发货，这里有时间的话会尝试对接大语言模型平台)


## 前端开发进度
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
- ✅实现抽奖功能 
- 🔥实现活动说明，活动概率说明等信息
- 实现后台-活动发布
- 实现后台-数据统计




