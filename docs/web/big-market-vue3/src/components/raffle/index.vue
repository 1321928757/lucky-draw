<script setup>
import { ref, watchEffect } from "vue";
import {
  assembleActivity,
  queryAwardListByActivityID,
  queryUserAccountById,
  queryRuleWeightById,
  queryActivityById,
} from "@/api/raffle.js";
import { succesMsg, errorMsg, warnMsg } from "@/utils/remind.js";
import { topathReplace } from '@/utils/router.js'
import { useRoute } from "vue-router";

import RaffleCanvas from "./raffleCanvas/RaffleCanvas.vue";
import RuleWeight from "./ruleWeight/RuleWeight.vue";
import ActivityInfo from "./activityInfo/ActivityInfo.vue";
import UserAccountInfo from "./userAccountInfo/UserAccountInfo.vue";
import SignUpBoard from "./signUpBoard/SignUpBoard.vue";
import MyAwards from "./myEarningAward/MyAwards.vue";
import emitter from "@/utils/mitt";

const route = useRoute();
const query = ref({});

// 当前活动信息
const activityInfo = ref({
  activityId: 100301, //活动id
  activityName: "",
});

// 用户次数账户信息(比如剩余抽奖次数，总抽取次数)
const userAccountInfo = ref({});

// 活动奖品列表信息
const prizes = ref([]);

// 用户抽奖权重信息
const ruleWeightInfo = ref({});

// 加载动画,防止高频点击
const load_btn_query = ref(false);
const load_btn_prepare = ref(false);

// 活动概率装配
const prepareAward = async () => {
  load_btn_prepare.value = true;
  const res = await assembleActivity(activityInfo.value.activityId);

  if (res.code == "0000") {
    succesMsg("概率装配成功，请开始抽奖");

    // 关闭动画
    setTimeout(() => {
      load_btn_prepare.value = false;
    }, 1000);
  } else {
    // errorMsg(res.info);
  }
};

// 查询当前活动的奖品信息(活动详细信息，活动下的奖品信息，用户的抽奖剩余次数等)
const queryActivityAwards = async () => {
  // 1.加载动画
  load_btn_query.value = true;
  // 2.请求数据
  const res = await queryAwardListByActivityID(activityInfo.value);
  if (res.code == "0000") {
    // 3.请求成功，转换奖品数组为抽奖插件格式数据
    const awardListData = res.data;
    const awardCount = awardListData.length;
    let awardListDate = []; //转换格式后的数据数组
    let index = 0; // 当前格式化遍历到奖品

    // 4.为每个奖品数据格式化
    for (let y = 0; y < 3; y++) {
      for (let x = 0; x < 3; x++) {
        // 中间的按钮位置不要替换了
        if (x == 1 && y == 1) continue;
        // 没奖品了，就不用格式化了
        if (index >= awardCount) break;
        // 当前奖品
        let award = awardListData[index++];
        let awardItem = {
          x: x,
          y: y,
          background: "rgba(226, 205, 176, 0.47)",
          borderRadius: "5px",
          shadow: " 5px 5px 5px #dbb581",
          fonts: [
            {
              text: award.isAwardUnlock
                ? award.awardTitle
                : "再抽奖" + award.waitUnLockCount + "次解锁",
              top: "75%",
              fontSize: "14px",
              fontWeight: "800",
              fontColor: "#b78c51",
            },
          ],
          imgs: [
            {
              // 这个src换成本地静态文件就没问题，换成网络地址会自动加上当前服务的IP，http://localhost:5173/https//luckysj-1314434715.cos.ap-shanghai.myqcloud.com/8c825935-816b-4c6b-b99d-4677c336607c.jpg
              src: award.awardImage, //Image的值示例：https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/8c825935-816b-4c6b-b99d-4677c336607c.jpg
              width: "65px",
              height: "65px",
              // activeSrc: "../src/assets/img/rotate.png",
              activeSrc: "../rotate.png",
            },
          ],
        };

        // 根据解锁情况选择显示不同的图片
        if (award.isAwardUnlock == false) {
          // awardItem.imgs[0].src = "../src/assets/img/waitLock.png";
          // awardItem.imgs[0].activeSrc = "../src/assets/img/waitLock.png";

          awardItem.imgs[0].src = "../waitLock.png";
          awardItem.imgs[0].activeSrc = "../waitLock.png";
        }

        awardListDate.push(awardItem);
      }
    }
    prizes.value = awardListDate;

    // succesMsg("获取当前活动奖品信息成功，请继续抽奖");
    // 关闭动画
    setTimeout(() => {
      load_btn_query.value = false;
    }, 1000);
  } else {
    // warnMsg(res.info);
  }
};

// 查询当前用户的次数账户信息
const queryUserAccountInfo = async () => {
  const res = await queryUserAccountById(activityInfo.value.activityId);
  if (res.code == "0000") {
    userAccountInfo.value = res.data;
  } else {
    // errorMsg(res.info);
  }
};

// 查询当前活动用户的权重信息
const queryRuleWeightInfo = async () => {
  const res = await queryRuleWeightById(activityInfo.value.activityId);
  if (res.code == "0000") {
    ruleWeightInfo.value = res.data;
  } else {
    // errorMsg(res.info);
  }
};

// 查询当前活动的详细信息
const queryActivityInfo = async () => {
  const res = await queryActivityById(activityInfo.value.activityId);
  if (res.code == "0000") {
    activityInfo.value = res.data;
  } else {
    // errorMsg(res.info);
  }
};

// 初始化函数
const init = () => {
  // 1.首先检查是否存在用户信息
  if(!localStorage.getItem("luckysj-draw-token")){
    errorMsg("要先登录才能参与活动哦~")
    topathReplace("/auth/login")
    return
  }

  queryActivityInfo();
  queryRuleWeightInfo();
  queryUserAccountInfo();
  queryActivityAwards();

  // 注册数据更新监听
  emitter.on("updateActivityData", (param) => {
    // 重新查询奖品信息(更新次数锁)
    queryActivityAwards();
    // 重新查询权重信息
    queryRuleWeightInfo();
    // 重新查询账户次数信息
    queryUserAccountInfo();
  });

  // 注册次数账户更新监听
  emitter.on("updateAccountData", (param) => {
    // 重新查询账户次数信息
    queryUserAccountInfo();
  })
};

watchEffect(() => {
  query.value = route.params;
  console.log(route.params);
  if (query.value.activityId != null) {
    activityInfo.value.activityId = query.value.activityId;
  }
});

init();
</script>

<template>
  <div class="box-container">
    <div class="backgroud"></div>
    <div class="activity-box">
      <el-row :gutter="20">
        <el-col :xs="24" :sm="12" :md="12" :lg="8" :xl="8" style="margin-bottom: 10px;">
          <!-- 活动信息 -->
          <div class="activity-info" style="margin-bottom: 10px;">
            <ActivityInfo :activity-info="activityInfo"></ActivityInfo>
          </div>
          <div class="my-award">
            <MyAwards></MyAwards>
          </div>
        </el-col>
        <el-col :xs="24" :sm="12" :md="12" :lg="8" :xl="8" style="margin-bottom: 10px;">
          <!-- 抽奖主要部分【转盘，权重值】 -->
          <div class="draw-main">
            <div class="lucky-canvas">
              <RaffleCanvas
                :activityInfo="activityInfo"
                :prizes="prizes"
                :weightRuleValues="ruleWeightInfo"
              ></RaffleCanvas>
            </div>
            <div class="rule-weight">
              <RuleWeight :weightRuleValues="ruleWeightInfo"></RuleWeight>
            </div>
          </div>
        </el-col>
        <el-col :xs="24" :sm="12" :md="12" :lg="8" :xl="8" style="margin-bottom: 10px;">
          <!-- 用户次数账户信息 -->
          <div class="acccount-info" style="margin-bottom: 10px;">
            <userAccountInfo
              :userAccountInfo="userAccountInfo"
            ></userAccountInfo>
          </div>
          <div class="sign-up">
            <SignUpBoard>

            </SignUpBoard>
          </div>
        </el-col>
        <!-- 我的奖品 -->
        <el-col :xs="24" :sm="12" :md="12" :lg="8" :xl="8">
         
         </el-col>
         <el-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
          <!-- 最近获奖名单展示，滚动展示 -->
         </el-col>
      </el-row>

    </div>
  </div>
</template>

<style lang="less" scoped>
.box-container {
  text-align: center;
  overflow-x: hidden;
  .backgroud {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-image: url("../../assets/img/common-bg.jpg");
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed;
  }
  .activity-box {
    text-align: center;
    margin: 20px;
    padding: 20px;
    box-sizing: border-box;
    background-color: rgba(255, 255, 255, 0.3);
    backdrop-filter: blur(0px);
    -webkit-backdrop-filter: blur(0px);
    border: 0.8px solid rgba(255, 255, 255, 0.18);
    box-shadow: rgba(142, 142, 142, 0.19) 0px 6px 15px 0px;
    -webkit-box-shadow: rgba(142, 142, 142, 0.19) 0px 6px 15px 0px;
    border-radius: 12px;
    -webkit-border-radius: 12px;
    z-index: -1;

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
    .draw-main {
      padding: 5px 20px;
      box-sizing: border-box;
      border-radius: 20px;
      font-weight: 550;
      background-color: rgba(195, 195, 195, 0.095);
      .lucky-canvas {
        display: flex; /* 启用 Flex 布局 */
        justify-content: center; /* 水平居中 */
        align-items: center; /* 垂直居中 */
        margin-bottom: 20px;
      }
      .rule-weight {
        text-align: center;
        padding: 0 40px 0 40px;
      }
    }

    .acccount-info {
    }
  }
  .activity-box:before {
    content: "";
    position: absolute;
    left: 10px;
    top: 5px;
    display: inline-block;
    width: 12px;
    height: 12px;
    border-radius: 50%;
    background-color: #fd6458;
    box-shadow: 20px 0 0 #ffbf2b, 40px 0 0 #24cc3d;
  }
  @media screen and (max-width: 500px) {
    .activity-box {
      margin: 0 !important;
    }
  }
}
</style>
