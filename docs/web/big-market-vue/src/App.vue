<template>
  <div id="app">
    <router-view v-if="isRouterAlive"/>
  </div>
</template>

<script>
export default {
    name: 'App',
    // 为子组件提供方法，子组件可通过inject: ['reload']注入父组件提供的方法
    provide(){
      return{
        reload:this.reload
      }
    },
    data(){
      return{
        isRouterAlive:true,
      }
    },
    methods:{
      // 页面重载函数，该函数不会使页面闪动，但也能起到刷新界面的效果
      reload(){
        this.isRouterAlive = false;
        this.$nextTick(function () {
          this.isRouterAlive = true;
        });
      },
    }
  }
</script>
<style lang="less">
</style>
