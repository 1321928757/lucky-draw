<script setup>
import {} from "vue";
const prop = defineProps({
  userAccountInfo: Object,
});
</script>

<template>
  <div class="account-info">
    <h3>用户活动信息</h3>

    <el-form label-width="auto">
      <el-form-item label="总可抽取次数">
        <el-progress
          style="width: 100%"
          :stroke-width="12"
          :percentage="
            (prop.userAccountInfo.totalCountSurplus /
              prop.userAccountInfo.totalCount) *
            100
          "
          :status="
            prop.userAccountInfo.totalCountSurplus > 0 ? 'success' : 'warning'
          "
        >
          <el-text class="mx-1"
            >{{ prop.userAccountInfo.totalCountSurplus }} /
            {{ prop.userAccountInfo.totalCount }} 次
          </el-text>
        </el-progress>
      </el-form-item>
      <el-form-item label="月可抽取次数">
        
        <el-progress
          style="width: 100%"
          :stroke-width="12"
          :percentage="
            (prop.userAccountInfo.monthCountSurplus /
              prop.userAccountInfo.monthCount) *
            100
          "
          :status="
            prop.userAccountInfo.monthCountSurplus > 0 ? 'success' : 'warning'
          "
        >
          <el-text class="mx-1"
            >{{ prop.userAccountInfo.monthCountSurplus }} /
            {{ prop.userAccountInfo.monthCount }} 次
          </el-text>
        </el-progress>
        <p class="tip">月可抽取次数代表用户这个月的最大抽取次数</p>
      </el-form-item>

      <el-form-item label="日可抽取次数">
        
        <el-progress
          style="width: 100%"
          :stroke-width="12"
          :percentage="
            (prop.userAccountInfo.dayCountSurplus /
              prop.userAccountInfo.dayCount) *
            100
          "
          :status="
            prop.userAccountInfo.dayCountSurplus > 0 ? 'success' : 'warning'
          "
        >
          <el-text class="mx-1"
            >{{ prop.userAccountInfo.dayCountSurplus }} /
            {{ prop.userAccountInfo.dayCount }} 次
          </el-text>
        </el-progress>
        <p class="tip">日可抽取次数代表用户当日的最大抽取次数</p>
      </el-form-item>
    </el-form>
  </div>
</template>

<style scoped lang="less">
.account-info {
  color: gray;
  background-color: rgba(195, 195, 195, 0.095);
  padding: 5px 20px;
  box-sizing: border-box;
  border-radius: 20px;
  font-weight: 550;
  .tip{
    font-size: 10px;
    margin: 0;
    padding: 0;
  }
}
</style>
