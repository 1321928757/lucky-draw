<script setup>
import {} from "vue";
const prop = defineProps({
  prizes: Array,
});
</script>

<template>
  <div class="activity-detail">
    <h3>奖品说明</h3>
    <el-table :data="prop.prizes" style="width: 100%">
      <el-table-column prop="awardTitle" label="奖品名称" />
      <el-table-column prop="awardImage" label="奖品预览">
        <template #default="scope">
          <el-image
            v-if="scope.row.awardImage != null"
            style="width: 50px; height: 50px"
            :src="scope.row.awardImage"
            :fit="fill"
          />
        </template>
      </el-table-column>
      <el-table-column prop="awardSubtitle" label="奖品描述" />
      <el-table-column prop="awardRate" label="中奖概率" >
        <template #default="scope">
            <el-text>{{ scope.row.awardRate * 100 }} %</el-text>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<style scoped lang="less">
.activity-detail {
  color: gray;
  background-color: rgba(195, 195, 195, 0.095);
  padding: 5px 20px;
  box-sizing: border-box;
  border-radius: 20px;
  font-weight: 550;
}

::v-deep .el-table,
::v-deep .el-table__expanded-cell {
  background-color: transparent;
}

::v-deep .el-table th,
::v-deep .el-table tr,
::v-deep .el-table td {
  background-color: transparent;
}
</style>
