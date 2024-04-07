# 营销抽奖系统 - By 刘仕杰

项目出处:小傅哥，[**小傅哥的博客**](https://bugstack.cn)
小傅哥真的是踏实分享技术的博主，有想要提升自己能力的都可以加入小傅哥的星球，强烈推荐~

代码不会全部上传，想要继续学习的同学可以加入小傅哥的星球学习，谢谢理解

项目介绍：营销抽奖系统是各个互联网公司用于拉新、促活、留存、转化的重要手段，此项目针对高并发场景，搭建为各平台促销提效的营销抽奖平台，管理员可通过后台管理活动与奖品，用户可以通过抽奖的方式获取奖品，在寻常抽奖的基础上扩展了黑名单用户兜底，用户权重分析，次数解锁奖品，兜底奖品随机积分等功能。整体采用DDD架构设计，支持分布式水平扩展，单实例部署下QPS实测1000左右。

核心技术：SpringBoot、MyBatis、MySQL、Redis、Redisson、Guava、RabbitMQ。

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
- ✅实现活动与用户的库表设计
- 🔥实现分库分表(利用一个小巧的分库分组开源组件，个人认为shardingsphere使用起来比较麻烦不灵活)
- 实现活动发布流程(后台发布活动 -> 概率区间等缓存数据预热 -> 等待到开启活动时间)
- 实现获奖数据入库
- 实现发货功能(完成获奖人信息填写，进行奖品发货，这里有时间的话会尝试对接大语言模型平台)

## 本章节分库分表组件使用教程

**依赖导入**

```xml
<dependency>
    <groupId>cn.bugstack.middleware</groupId>
    <artifactId>db-router-spring-boot-starter</artifactId>
    <version>1.0.2</version>
</dependency>
```

**路由配置 **

```yaml
# 多数据源路由配置，库数量 * 表数量 为2的次幂，如2库4表
# mysql 5.x 配置 driver-class-name: com.mysql.jdbc.Driver    mysql-connector-java 5.1.34
# mysql 8.x 配置 driver-class-name: com.mysql.cj.jdbc.Driver mysql-connector-java 8.0.22
mini-db-router:
  jdbc:
    datasource:
      dbCount: 2 #分库数量(必需配置，路由组件会根据这个值计算出路由值)
      tbCount: 4 #分表数量(必需配置，路由组件会根据这个值计算出路由值)
      default: db00	#主库(这个库不存放分表相关信息，作为一个配置主表)
      routerKey: userId  #根据哪个属性来进行路由操作，用户id用得比较多
      list: db01,db02 #分库
      db00:
        driver-class-name: com.mysql.cj.jdbc.Driver
        url: jdbc:mysql://127.0.0.1:3306/big_market?useUnicode=true&characterEncoding=utf8&autoReconnect=true&zeroDateTimeBehavior=convertToNull&serverTimezone=UTC&useSSL=true
        username: root
        password: 123123
        type-class-name: com.zaxxer.hikari.HikariDataSource #连接池配置
        pool:
          pool-name: Retail_HikariCP
          minimum-idle: 15 #最小空闲连接数量
          idle-timeout: 180000 #空闲连接存活最大时间，默认600000（10分钟）
          maximum-pool-size: 25 #连接池最大连接数，默认是10
          auto-commit: true  #此属性控制从池返回的连接的默认自动提交行为,默认值：true
          max-lifetime: 1800000 #此属性控制池中连接的最长生命周期，值0表示无限生命周期，默认1800000即30分钟
          connection-timeout: 30000 #数据库连接超时时间,默认30秒，即30000
          connection-test-query: SELECT 1
      db01:
        driver-class-name: com.mysql.cj.jdbc.Driver
        url: jdbc:mysql://127.0.0.1:3306/big_market_01?useUnicode=true&characterEncoding=utf8&autoReconnect=true&zeroDateTimeBehavior=convertToNull&serverTimezone=UTC&useSSL=true
        username: root
        password: lsj20030222
        type-class-name: com.zaxxer.hikari.HikariDataSource
        pool:
          pool-name: Retail_HikariCP
          minimum-idle: 15 #最小空闲连接数量
          idle-timeout: 180000 #空闲连接存活最大时间，默认600000（10分钟）
          maximum-pool-size: 25 #连接池最大连接数，默认是10
          auto-commit: true  #此属性控制从池返回的连接的默认自动提交行为,默认值：true
          max-lifetime: 1800000 #此属性控制池中连接的最长生命周期，值0表示无限生命周期，默认1800000即30分钟
          connection-timeout: 30000 #数据库连接超时时间,默认30秒，即30000
          connection-test-query: SELECT 1
      db02:
        driver-class-name: com.mysql.cj.jdbc.Driver
        url: jdbc:mysql://127.0.0.1:3306/big_market_02?useUnicode=true&characterEncoding=utf8&autoReconnect=true&zeroDateTimeBehavior=convertToNull&serverTimezone=UTC&useSSL=true
        username: root
        password: lsj20030222
        type-class-name: com.zaxxer.hikari.HikariDataSource
        pool:
          pool-name: Retail_HikariCP
          minimum-idle: 15 #最小空闲连接数量
          idle-timeout: 180000 #空闲连接存活最大时间，默认600000（10分钟）
          maximum-pool-size: 25 #连接池最大连接数，默认是10
          auto-commit: true  #此属性控制从池返回的连接的默认自动提交行为,默认值：true
          max-lifetime: 1800000 #此属性控制池中连接的最长生命周期，值0表示无限生命周期，默认1800000即30分钟
          connection-timeout: 30000 #数据库连接超时时间,默认30秒，即30000
          connection-test-query: SELECT 1
```

**在dao层使用注解指定是否走路由规则**

这是我认为这个组件最好用的一点就是，通过注解可以指定哪些dao要走路由

```java
@Mapper
@DBRouterStrategy(splitTable = true) //开启分库分表(splitTable属性代表是否开启分表)
public interface IRaffleActivityOrderDao {

    @DBRouter(key = "userId") //路由键
    void insert(RaffleActivityOrder raffleActivityOrder);

    @DBRouter
    List<RaffleActivityOrder> queryRaffleActivityOrderByUserId(String userId);

}

```

**单元测试**

```java
// 测试分库分表插入元素
    @Test
    public void test_insert_random() {
        for (int i = 0; i < 5; i++) {
            RaffleActivityOrder raffleActivityOrder = new RaffleActivityOrder();
            // EasyRandom 可以通过指定对象类的方式，随机生成对象值。如；easyRandom.nextObject(String.class)、easyRandom.nextObject(RaffleActivityOrder.class)
            raffleActivityOrder.setUserId(easyRandom.nextObject(String.class));
            raffleActivityOrder.setActivityId(100301L);
            raffleActivityOrder.setActivityName("测试活动");
            raffleActivityOrder.setStrategyId(100006L);
            raffleActivityOrder.setOrderId(RandomStringUtils.randomNumeric(12));
            raffleActivityOrder.setOrderTime(new Date());
            raffleActivityOrder.setState("not_used");
            // 插入数据
            raffleActivityOrderDao.insert(raffleActivityOrder);
        }
    }
```



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



