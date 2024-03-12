<template>
  <div class="box-container">
    <el-row :gutter="20">
      <el-col :span="24">
        <h1 class="title">大营销平台-抽奖演示</h1>
      </el-col>
      <el-col :span="24" style="margin-bottom: 20px">
        <span style="color: gray">当前抽奖策略：</span
        ><el-tag type="success">{{ currentStrategy.strategyDesc }}</el-tag>
      </el-col>
      <el-col :span="24">
        <el-button type="primary" @click="prepaAward">概率装配</el-button>
      </el-col>
      <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
        <div class="lottery-box">
          <template>
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
          </template>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import {
  getAwardDataByStrategyId,
  assembleOdds,
  startRaffle
} from "@/api/rattleAPI";
import { warn,success, error } from "@/utils/remind";

export default {
  name: "FrontHome",
  components: {},
  data() {
    return {
      // 当前抽奖策略
      currentStrategy: {
        strategyId: 100006,
        strategyDesc: "抽奖策略-规则树",
      },
      // 奖品数据列表
      awardListData: [],

      blocks: [{ padding: "13px", background: "#617df2" }],
      prizes: [
        { fonts: [{ text: "请选择策略", top: "10%" }], background: "#e9e8fe" },
        { fonts: [{ text: "请选择策略", top: "10%" }], background: "#b8c5f2" },
        { fonts: [{ text: "请选择策略", top: "10%" }], background: "#e9e8fe" },
        { fonts: [{ text: "请选择策略", top: "10%" }], background: "#b8c5f2" },
        { fonts: [{ text: "请选择策略", top: "10%" }], background: "#e9e8fe" },
        { fonts: [{ text: "请选择策略", top: "10%" }], background: "#b8c5f2" },
      ],
      buttons: [
        {
          radius: "35%",
          background: "#8a9bf3",
          pointer: true,
          fonts: [{ text: "开始", top: "-10px" }],
        },
      ],
    };
  },

  methods: {
    // 选择策略
    selectStrategy(steategy) {
      // 保存策略信息
      this.currentStrategy.strategyId = steategy.strategyId;
      this.currentStrategy.strategyDesc = steategy.strategyDesc;
    },

    // 概率装配
    async prepaAward() {
      // 保存策略信息
      const { data: res } = await assembleOdds(this.currentStrategy.strategyId)
      if (res.code == "0000") {
        success("概率装配成功，请开始抽奖")
      }else{
        error(res.info)
      }
    },

    // 根据策略查询奖品
    async queryStrategy() {
      const { data: res } = await getAwardDataByStrategyId(
        this.currentStrategy
      );

      if (res.code == "0000") {
        this.awardListData = res.data;

        let awardListDate = [];
        // 转换为抽奖插件格式数据
        res.data.forEach((element,index) => {
          const isOddIndex = index % 2 !== 0;
          const background = isOddIndex ? "#b8c5f2" : "#e9e8fe";
          
          awardListDate.push({
            fonts: [{ text: element.awardTitle, top: "10%" }],
            background
          });
          
        });
        this.prizes = awardListDate;
        console.log(this.prizes)
      } else {
        warn(res.info);
      }
    },

    // 点击抽奖按钮会触发star回调
    async startCallback() {
      // 调用抽奖组件的play方法开始游戏
      this.$refs.myLucky.play();
      // 调用抽奖接口
      const { data: res }  = await startRaffle(this.currentStrategy);
      if (res.code == "0000") {
        // 我们在库中序号是从1号开始，但是这个转盘索引是从0开始，所以减1
        let index = res.data.awardIndex - 1
        // 调用stop停止旋转并传递中奖索引
        this.$refs.myLucky.stop(index);
      } else {
        error(res.info);
      }
    },


    // 抽奖结束会触发end回调
    endCallback(prize) {
      success("恭喜您抽中奖品：" + prize.fonts[0].text)
    },
  },
  created() {
    this.queryStrategy();
  },
};
</script>

<style scoped>
.box-container {
  position: absolute;
  height: 100%;
  width: 100%;
  background-image: url("../../assets/img/common-bg.jpg");
  background-size: cover;
  background-repeat: repeat;
  touch-action: none;
  user-select: none;
  text-align: center;
  overflow-x: hidden;
}
.title {
  color: rgb(97, 97, 97);
}

.lottery-box {
  margin-top: 30px;
  display: flex; /* 启用 Flex 布局 */
  justify-content: center; /* 水平居中 */
  align-items: center; /* 垂直居中 */
  height: 100%; /* 确保父容器有足够的高度 */
}
</style>
