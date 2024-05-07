<!-- 404界面 -->

<script setup lang="ts">
</script>

<template>
  <div class="box404">
    <div class="box-container">
      <img class="img" src="../../assets/img/error404.png" />
      <div class="box-text">
        <h1>404错误~目标路径资源不存在</h1>
      </div>
    </div>
  </div>
</template>


<style scoped>
.box404 {
  position: absolute;
  width: 100%;
  height: 100%;
  background-image: url("../../assets/img/common-bg.jpg");
  background-size: cover;
  background-repeat: no-repeat;
  z-index: 200;
}
.box-container {
  position: flex;
}
.img {
  height: auto;
  width: 60%;
  position: absolute;
  bottom: 0;
  left: 50%;
  margin-left: -35%;
}
.box-text {
  width: 100%;
  text-align: center;
}
h1 {
  color: #2fa7b9;
}

span {
  color: gray;
}

@media screen and (max-width: 1000px) {
  .img {
    width: 100%;
    position: absolute;
    bottom: 0;
    left: 0;
    margin-left: 0;
  }
  .box-text {
    margin-top: 35px;
  }
}
</style>
