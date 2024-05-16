<script setup>
import { ref } from "vue";
import { Vue3Marquee } from 'vue3-marquee'
import {formatDate} from '@/utils/time.js'

const isScroll = ref(false)
const prop = defineProps({
    latestAwardRecords: Array,
});

setTimeout(() => {
    isScroll.value = true
}, 2000)

</script>

<template>
  <div>
    <Vue3Marquee  :list="list" class="scroll" :duration="70">
      <div class="item"  :isWatch="true" v-for="(awardRecord, index) in prop.latestAwardRecords" :key="index">
        <span>用户{{ awardRecord.userId }}在{{ formatDate(awardRecord.awardTime) }}抽取到了奖品【{{awardRecord.awardTitle}}】</span>
      </div>
    </Vue3Marquee>
  </div>
</template>

<style scoped>
.scroll {
  width: 100%;
  overflow: hidden;
  color: gray;
}

.scroll .item {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 3px 0;
  margin-right: 20px;
}
</style>
