<script setup >
import { ref } from 'vue'
import { judgeIsSignUp, userSignUp } from '@/api/raffle.js'
import { succesMsg, errorMsg, warnMsg } from "@/utils/remind.js";
import emitter from "@/utils/mitt";
const time = ref(new Date()) 
const isSignUp = ref(false)
// 判断当日是否签到，我们这里可以调用API去查询(后端写了判断接口)，也可以在本地记录用户每次的签到记录，减小对服务器的请求压力
const judgeSigned = async () => {
    const res = await judgeIsSignUp()
    if(res.code == "0000"){
        isSignUp.value = res.data
    }
}

// 用户签到
const signUp = async() =>{
    if(isSignUp.value) {
        warnMsg("用户当日已经签到过啦~")
    }
    const res = await userSignUp()
    if(res.code == "0000"){
        succesMsg("签到成功~~~")
        isSignUp.value = true

        // 延时一段时间后重新加载次数信息
        setTimeout(() => {
            emitter.emit("updateAccountData", true);
        }, 300)
    }else{
        warnMsg(res.info)
    }
}

const init = () => {
    if(!localStorage.getItem("luckysj-draw-token")){
    return
  }
  judgeSigned();
}
init()
</script>

<template>
    <div class="sign-up-board">
        <h3>获取次数</h3>
        <el-calendar v-model="time" style="margin-bottom: 10px;"/>
        <el-button type="success" plain icon="CircleCheck" style="height: 40px;width: 100px;" :disabled="true" v-if="isSignUp">当日已签到</el-button>
        <el-button type="primary" @click="signUp" plain icon="Edit" style="height: 40px;width: 100px;" v-else>今日签到</el-button>

    </div>
</template>

<style scoped lang="less">
.sign-up-board{
    color: gray;
  background-color: rgba(195, 195, 195, 0.095);
  padding: 5px 20px;
  box-sizing: border-box;
  border-radius: 20px;
}
.el-calendar{
  border-radius: 10px;
  
  font-size: 20px;
}
:deep(.el-calendar__header){
    font-family: "Xingxin", sans-serif;
}
:deep(thead){
    font-family: "Xingxin", sans-serif;
}

:deep(tbody){
    font-family: "Luckysj", sans-serif;
}

:deep(.el-button-group .el-button) {
  display: none !important;
}

:deep(.el-calendar-table .el-calendar-day) {
  height: 45px !important;
}
</style>