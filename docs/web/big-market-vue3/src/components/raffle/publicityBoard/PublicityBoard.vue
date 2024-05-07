<!--当前活动说明模块-->
<script setup>
import { ref } from 'vue'

const activeNames = ref(['1'])
const handleChange = (val) => {
  console.log(val)
}
</script>

<template>
  <div class="public-board">
    <h2 class="borad-title">📋公告板</h2>
    <el-collapse v-model="activeNames" @change="handleChange">
      <el-collapse-item title="活动说明" name="1">
        <div>
          这里到时候会换成活动说明
        </div>

      </el-collapse-item>
      <el-collapse-item title="活动概率公示" name="2">
        <div>
          这里到时候会换成奖品概率公示
        </div>

      </el-collapse-item>

    </el-collapse>
  </div>
</template>

<style lang="less" scoped>
.public-board{
  text-align: left;
  .borad-title{
    border-left: 3px #56d9d4;
    padding-left: 5px;
    color: #737373;
  }
  :deep(.el-collapse-item__header){
    color: #737373;
    font-size: 18px;
    font-weight: 550;
  }

}

</style>
