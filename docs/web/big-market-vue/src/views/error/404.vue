// 403权限越界界面
<template>
  <div class="box404">
    <div class="box-container">
      <img
        class="img"
        src="https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/411ab761-443f-4836-a2b6-05d27bcc72e0.png"
      >
      <div class="box-text">
        <h1>404错误~目标路径资源不存在</h1>
        <span>{{time}}秒后将前往首页</span>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Error404",
  data(){
    return {
      time: 5,
      id: 0,
    }
  },
  methods:{
    // 开启跳转倒计数
    startTimes(){
      this.id = setInterval(() => {
        this.time -= 1
        if(this.time <= 0){
          // 页面跳转
          this.$router.replace('/login')
          this.time = 5
          // 关闭计时器
          clearInterval(this.id)
          this.id = 0
        }
      }, 1000)
    }
  },
  mounted(){
    this.startTimes()
  },
  // 退出该界面自动关闭自动跳转
  destroyed(){
    if(this.id != 0){
      // 关闭计时器
      clearInterval(this.id)
      this.id = 0
    }
  }
}
</script>

<style scoped>
.box404 {
  position: absolute;
  width: 100%;
  height: 100%;
  background-image: url("https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/0ae4fb07-54a5-4d06-93c1-733dc96f7f6a.png");
  background-size: cover;
  background-repeat: no-repeat;
}
.box-container{
  position: flex;
}
.img {
  width: 70%;
  position: absolute;
  bottom: 0;
  left: 50%;
  margin-left: -35%;
}
.box-text{
  width: 100%;
  text-align: center;
}
h1{
  color: #2fa7b9;
}

span{
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
.box-text{
  margin-top: 35px;
}
}
</style>