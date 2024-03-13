const routes = [
    {
        path: '/',
        name: 'index',
        title: '首页',
        component: () => import('../components/raffle/index.vue'), //.vue不能省略
    }
]
export default routes
