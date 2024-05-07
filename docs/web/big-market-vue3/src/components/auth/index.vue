<script setup>
import { ref } from "vue";
import { userLogin } from "@/api/auth.js";
import { succesMsg, errorMsg, warnMsg, successNotify } from "@/utils/remind.js";
import { topathPush } from '@/utils/router.js'

const exp = /^\d{6,8}$/;
const loading = ref(false); //防抖&加载动画

const userLoginBtn = async () => {
  // 1.首先判断输入的验证码是否合法
  if (vericode.value == "") {
    warnMsg("请填写访问码哦~~~");
    return;
  }
  if (!exp.test(vericode.value)) {
    warnMsg("访问码格式不对哦~~~");
    return;
  }

  // 2.加载动画
  if (loading == true) return;
  loading.value = true;

  // 3.请求登录
  const res = await userLogin(vericode.value);
  console.log(res)
  if (res.code == "0000") {
    // 4.保存token到本地
    localStorage.setItem("luckysj-draw-token", res.data)

    setTimeout(() => {
      successNotify("访问码通过，即将自动跳转");
      loading.value = false;
      topathPush("/raffle/100301")
    }, 1000);
  } else {
    setTimeout(() => {
      errorMsg(res.info);
      loading.value = false;
    }, 1000);
  }
};

const vericode = ref("");
</script>

<template>
  <div class="box-container" v-loading="loading">
    <div class="center-container">
      <el-row :gutter="10">
        <!-- 头部logo -->
        <el-col :span="24">
          <img class="logo-img" src="../../assets/img/logo2.png" />
        </el-col>
        <!-- 头部标题 -->
        <el-col :span="24">
          <span class="logo-title">Lucky Draw</span>
        </el-col>
        <!-- 中间二维码部分 -->
        <el-col :span="24">
          <img class="QR-img" src="../../assets/img/qrcode.png" />
        </el-col>
        <!-- 填写验证码部分 -->
        <el-col :span="24">
          <p class="code-tip">扫码关注微信公众号，发送[403]获取访问密码</p>
          <el-input
            class="code-input"
            v-model="vericode"
            placeholder="在此填写访问码"
          />
        </el-col>
        <el-col :span="24">
          <el-button
            type="primary"
            :disabled="loading"
            style="width: 160px; height: 40px"
            plain
            @click="userLoginBtn"
            >🔑确定访问🔑</el-button
          >
        </el-col>
      </el-row>
      <p class="button-text">· Designed by Liushijie. All Rights Reserved. Copyright © 2024 Liushijie ·</p>
    </div>
  </div>
</template>

<style scoped>
p {
  margin: 0;
  padding: 0;
}
.box-container {
  position: absolute;
  height: 100%;
  width: 100%;
  left: 0;
  right: 0;
  touch-action: none;
  overflow: hidden;
  user-select: none;
  background-image: url("../../assets/img/login-bg.png");
  background-size: cover;
}

.center-container {
  text-align: center;
  margin-top: 6vh;
}

.logo-img {
  width: 100px;
  height: 100px;
}

.logo-title {
  font-family: "Luckysj", sans-serif;
  font-size: 60px;
  color: rgb(66, 120, 212);
}

.QR-img {
  width: 260px;
  height: 260px;
}

.code-tip {
  font-family: "Xingxin", sans-serif;
  font-size: 22px;
  color: rgb(53, 118, 230);
  margin-bottom: 15px;
}

.code-input {
  margin-bottom: 10px;
  max-width: 250px;
  height: 40px;
}

:deep(.el-input__inner) {
  text-align: center;
  font-weight: 550;
  color: gray;
  font-size: 18px;
}

.el-button{
  font-weight: 550;
}

.button-text{
  width: 100%;
  text-align: center;
  position: fixed;
  bottom: 10px;
  color: gray;
  font-size: 12px;
}
</style>
