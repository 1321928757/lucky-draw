<script setup>
import {watchEffect, ref} from 'vue'
import dayjs from "dayjs";
const prop = defineProps({
  activityInfo: Object,
});

const formattedDate = (value) => {
  return dayjs(value).format("YYYY-MM-DD HH:mm:ss");
};

const activityState = ref("open")
// 定义监听，根据当前时间计算下活动是否开始(这个不影响后端，只是方便用户看)

watchEffect(() => {
  // 格式化时间，方便比对
  const beginTime = formattedDate(prop.activityInfo.beginDateTime)
  const endTime = formattedDate(prop.activityInfo.endDateTime)
  const currentTime = formattedDate(new Date)
  if(currentTime > endTime){
    activityState.value = "Ended"
  }
  if(currentTime < beginTime){
    activityState.value = "NoStart"
  }
  activityState.value = prop.activityInfo.state
});

</script>

<template>
  <div>
    <div class="activity-info">
      <h3>活动介绍</h3>
      <el-form label-width="auto">
        <el-form-item label="活动名称">
          {{ prop.activityInfo.activityName }}
        </el-form-item>
        <el-form-item label="活动介绍">
          {{ prop.activityInfo.activityDesc }}
        </el-form-item>
        <el-form-item label="活动状态">
          <el-tag type="primary" v-if="activityState == 'create'"
            >未开启</el-tag
          >
          <el-tag type="success" v-if="activityState == 'open'"
            >活动进行中</el-tag
          >
          <el-tag type="info" v-if="activityState == 'close'"
            >关闭</el-tag
          >
          <el-tag type="info" v-if="activityState == 'NoStart'"
            >活动未开始</el-tag
          >
          <el-tag type="info" v-if="activityState == 'Ended'"
            >活动已结束</el-tag
          >
        </el-form-item>
        <el-form-item label="活动时间">
          <el-timeline style="max-width: 600px">
            <el-timeline-item
              type="primary"
              size="large"
              :timestamp="formattedDate(prop.activityInfo.beginDateTime)"
              index="1"
            >
              活动开始
            </el-timeline-item>
            <el-timeline-item type="success" size="large" index="2">
              活动进行中
            </el-timeline-item>
            <el-timeline-item
              type="warning"
              size="large"
              index="3"
              :timestamp="formattedDate(prop.activityInfo.endDateTime)"
            >
              活动结束
            </el-timeline-item>
          </el-timeline>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<style scoped>
.activity-info {
  color: gray;
  background-color: rgba(195, 195, 195, 0.095);
  padding: 5px 20px;
  box-sizing: border-box;
  border-radius: 20px;
}
:deep(.el-form-item) {
  font-weight: 550;
  color: gray;
}
</style>
