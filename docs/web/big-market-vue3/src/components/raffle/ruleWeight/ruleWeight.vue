<script setup>
import { ref } from "vue";
const prop = defineProps({
  weightRuleValues: Array,
});
</script>

<template>
  <div>
    <p class="rule-tip">抽取到一定次数时，必定出范围内的奖品之一</p>
    <!-- 权重信息 -->
    <div class="rule-value">
      <div
        class="rule-value-per"
        v-for="(weightRule, index) in prop.weightRuleValues"
        :key="index"
      >
        <!-- 进度条 -->
        <el-progress
          :stroke-width="12"
          :percentage="
            (weightRule.userActivityAccountTotalUseCount /
              weightRule.ruleWeightCount) *
            100
          "
          :status="
            weightRule.userActivityAccountTotalUseCount >=
            weightRule.ruleWeightCount
              ? 'success'
              : ''
          "
        >
          <el-text class="mx-1"
            >{{ weightRule.userActivityAccountTotalUseCount }}
          </el-text>
          /
          <el-text class="mx-1" type="primary"
            >{{ weightRule.ruleWeightCount }} 次</el-text
          >
        </el-progress>

        <!-- 权重奖品 -->
        <el-text class="mx-1"
          >福利策略{{ index }}：
          <el-tag
            :type="
              weightRule.userActivityAccountTotalUseCount >=
              weightRule.ruleWeightCount
                ? `success`
                : ``
            "
            style="margin-right: 10px"
            v-for="(award, index) in weightRule.strategyAwards"
            :key="index"
            >{{ award.awardTitle }}</el-tag
          >
        </el-text>
      </div>
    </div>
  </div>
</template>

<style scoped lang="less">
.rule-title{
  color: gray;
}
.rule-tip{
  color: gray;

  
}
.rule-value {
  margin-top: 20px;
  .rule-value-per {
    text-align: left;
    font-weight: 550;
    margin-bottom: 20px;
  }
}
</style>
