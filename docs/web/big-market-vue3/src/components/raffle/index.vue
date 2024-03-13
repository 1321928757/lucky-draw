<script setup>
import {ref} from 'vue';
import {assembleOdds, getAwardDataByStrategyId, startRaffle} from '@/api/raffle.js'
import {succesMsg, errorMsg, warnMsg} from '@/utils/remind.js'

// 当前抽奖策略
const strategyInfo = ref({
  strategyId: 100006, //抽奖策略
  strategyDesc: "抽奖策略-规则树" //策略描述
})
// 抽奖转盘相关配置
const blocks = ref([{padding: '13px', background: '#617df2'}]);
const buttons = ref([{
  radius: '35%',
  background: '#8a9bf3',
  pointer: true,
  fonts: [{text: '开始', top: '-10px'}]
}]);

// 抽奖转盘dom实体
const myLucky = ref(null);

// 奖品列表
const prizes = ref([])

// 加载动画,防止高频点击
const load_btn_query = ref(false)
const load_btn_prepare = ref(false)

// 概率装配
const prepareAward = async () => {
  load_btn_prepare.value = true
  const res = await assembleOdds(strategyInfo.value.strategyId);

  if (res.code == "0000") {
    succesMsg("概率装配成功，请开始抽奖");

    // 关闭动画
    setTimeout(() => {
      load_btn_prepare.value = false
    }, 1000)
  } else {
    errorMsg(res.info);
  }
};

// 根据策略查询奖品
const queryStrategy = async () => {
  load_btn_query.value = true
  const res = await getAwardDataByStrategyId(strategyInfo.value);
  if (res.code == "0000") {
    const awardListData = res.data;
    let awardListDate = [];
    // 转换为抽奖插件格式数据
    res.data.forEach((element, index) => {
      const isOddIndex = index % 2 !== 0;
      const background = isOddIndex ? "#b8c5f2" : "#e9e8fe";

      awardListDate.push({
        fonts: [{text: element.awardTitle, top: "10%", fontColor: "#5b5b5b"}],
        background
      });

    });
    prizes.value = awardListDate;

    succesMsg("获取当前策略奖品信息成功，请继续抽奖");
    // 关闭动画
    setTimeout(() => {
      load_btn_query.value = false
    }, 1000)
  } else {
    warnMsg(res.info);
  }
};

// 点击抽奖按钮会触发start回调
const startCallback = async () => {
  myLucky.value.play();
  // 调用抽奖接口
  const res = await startRaffle(strategyInfo.value);
  if (res.code == "0000") {
    let index = res.data.awardIndex - 1; // 转盘索引调整
    myLucky.value.stop(index);
  } else {
    errorMsg(res.info);
  }
};

// 抽奖结束会触发end回调
const endCallback = (prize) => {
  succesMsg("恭喜您抽中奖品：" + prize.fonts[0].text);
};

</script>

<template>
  <div class="box-container">
    <div class="backgroud"></div>
    <el-row :gutter="10">
      <el-col :span="24">
        <h1>✨大营销平台-抽奖展示✨️︎</h1>
      </el-col>
      <el-col :span="24" style="margin-bottom: 20px">
        <span>当前策略:<el-tag class="strategy-desc" type="success"
                               size="large">{{ strategyInfo.strategyDesc }}</el-tag></span>
      </el-col>
      <el-col :span="24">
        <el-button type="primary" :loading="load_btn_query" @click="queryStrategy">获取当前策略奖品信息</el-button>
        <el-button type="success" :loading="load_btn_prepare" @click="prepareAward">概率装配</el-button>
      </el-col>

    </el-row>
    <div class="lucky-canvas">
      <LuckyWheel
          ref="myLucky"
          width="300px"
          height="300px"
          :prizes="prizes"
          :blocks="blocks"
          :buttons="buttons"
          @start="startCallback"
          @end="endCallback"
      />
    </div>

  </div>
</template>

<style lang="less" scoped>
.box-container {
  text-align: center;
  overflow-x: hidden;
  .backgroud{
    position: absolute;
    height: 100%;
    width: 100%;
    background-image: url("../../assets/img/common-bg.jpg");
    background-size: cover;
    background-repeat: repeat;
    touch-action: none;
  }

  //text-align: center;
  h1 {
    font-size: 35px;
    color: #797979;
  }

  span {
    color: #595959;
    font-size: 20px;
    font-weight: 550;

    .strategy-desc {
      margin-left: 20px;
      margin-right: 20px;
    }
  }
  .lucky-canvas{
    margin-top: 30px;
    display: flex; /* 启用 Flex 布局 */
    justify-content: center; /* 水平居中 */
    align-items: center; /* 垂直居中 */
    height: 100%; /* 确保父容器有足够的高度 */
  }

}
</style>
