<script setup>
import { ref } from "vue";
import { queryPageAwardRecord } from "@/api/raffle.js";
import { formattedDate } from "@/utils/time.js";
import emitter from "@/utils/mitt";
// 分页请求信息
const requestInfo = ref({
  page: 1,
  pageSize: 5,
});
const total = ref(0);

// 获奖记录信息
const awardRecords = ref([]);

// 分页查询获奖记录
const queryAwardRecords = async () => {
  const res = await queryPageAwardRecord(requestInfo.value);

  if (res.code == "0000") {
    awardRecords.value = res.data.data;
    total.value = res.data.total;
  }
};
// 分页信息改变
const handleCurrentChange = (newPage) =>{
    requestInfo.value.page = newPage
    queryAwardRecords();
}

const init = () => {
    if(!localStorage.getItem("luckysj-draw-token")){
    return
  }
  queryAwardRecords();

  //注册数据更新监听，每次抽奖完后重新查询获奖记录
  emitter.on("updateActivityData", (param) => {
    queryAwardRecords()
  });
}
init()
</script>

<template>
  <div class="my-award">
    <h3>我的奖品</h3>
    <el-table :data="awardRecords" style="width: 100%">
      <el-table-column prop="awardTitle" label="奖品名称" />
      <el-table-column prop="awardState" label="奖品状态">
        <template #default="scope">
          <el-tag type="primary" v-show="scope.row.awardState == 'create'"
            >待发奖</el-tag
          >
          <el-tag type="success" v-show="scope.row.awardState == 'complete'"
            >已发奖</el-tag
          >
          <el-tag type="warning" v-show="scope.row.awardState == 'fail'"
            >发奖失败</el-tag
          >
        </template>
      </el-table-column>
      <el-table-column prop="awardTime" label="获奖日期" :width="180">
        <template #default="scope">
          {{ formattedDate(scope.row.awardTime) }}
        </template>
      </el-table-column>
    </el-table>
    <div class="pager">
      <el-pagination
        layout="prev, pager, next"
        :total="total"
        :page-size="requestInfo.pageSize"
        :v-model="requestInfo.page"
        @current-change="handleCurrentChange"
      />
    </div>
  </div>
</template>

<style scoped lang="less">
.my-award {
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
.el-pagination {
  margin-top: 15px;
  justify-content: center;
}
:deep .el-pager li {
  background-color: transparent;
}

:deep .el-pagination button{
    background-color: transparent;
}
</style>
