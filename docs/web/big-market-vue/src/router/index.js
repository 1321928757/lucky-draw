import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [

  {
    path: '/',
    name: '重定向',
    redirect: "/front"
  },
  {
    path: '*',
    name: 'homeindex',
    component: resolve => require(['@/views/error/404.vue'], resolve)
  },
  {
    path: '/front',
    name: 'homeindex',
    component: resolve => require(['@/views/front/index.vue'], resolve)
  },
]

const router = new VueRouter({
  routes
})

// 在页面跳转后界面回到顶部
router.afterEach((to,from,next) => {
  window.scrollTo(0,0);
});

export default router
