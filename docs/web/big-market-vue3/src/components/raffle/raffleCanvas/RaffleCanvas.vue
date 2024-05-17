<script setup>
import { ref } from "vue";
import {
  assembleActivity,
  queryAwardListByActivityID,
  partakeRaffle,
} from "@/api/raffle.js";
import { succesMsg, errorMsg, warnMsg } from "@/utils/remind.js";
import emitter from "@/utils/mitt";

// 抽奖转盘相关配置
const blocks = ref([
  { padding: "3px", background: "#d7c7b1" },
  { padding: "10px", background: "#FFFDFC" },
]);

// 按钮配置
const buttons = [
  {
    x: 1,
    y: 1,
    background: "#916426",
    borderRadius: "80px",
    fonts: [
      { text: "GO", top: "18%", fontSize: "26px", fontColor: "#f0d5b1" },
      { text: "参加抽奖", top: "58%", fontSize: "10px", fontColor: "#f0d5b1" },
    ],
  },
];

// 默认配置
const defaultConfig = {
  gutter: 10,
  speed: 15,
};

// 抽奖转盘dom实体
const myLucky = ref(null);

const prop = defineProps({
  activityInfo: Object,
  prizes: Array,
  weightRuleValues: Array,
});

// 用户相关信息(比如剩余抽奖次数，总抽取次数)

// 奖品列表
const prizes = ref([]);

// 点击抽奖按钮会触发start回调
const startCallback = async () => {
  // 1.首先判断参数是否合法
  if (prop.prizes == null || prop.prizes.length == 0) {
    errorMsg("活动信息错误");
    return;
  }
  if (prop.activityInfo == null) {
    errorMsg("活动信息错误");
    return;
  }

  // 2.调用抽奖接口
  const res = await partakeRaffle(prop.activityInfo);
  if (res.code == "0000") {
    myLucky.value.play();
    let index = res.data.awardIndex - 1; // 转盘索引调整
    myLucky.value.stop(index);
  } else {
    errorMsg(res.info);
  }
};

// 抽奖结束会触发end回调
const endCallback = (prize) => {
  // 通知父级重新查询一遍数据（主要是为了更新次数锁的状态）
  emitter.emit("updateActivityData", true);

  // 延迟一会再展示获奖信息
  succesMsg("恭喜您抽中奖品：" + prize.awardName);
};
</script>

<template>
  <div>
    
    <!-- 抽奖canvas -->
    <div class="lucky-canvas">
      <LuckyGrid
        ref="myLucky"
        width="300px"
        height="300px"
        :defaultConfig="defaultConfig"
        :prizes="prop.prizes"
        :blocks="blocks"
        :buttons="buttons"
        @start="startCallback"
        @end="endCallback"
      />
    </div>
  </div>
</template>

<style scoped lang="less">
.lucky-canvas{
  h3{
    color: gray;
  }
}
</style>
