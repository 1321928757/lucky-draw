const routes = [
    // {
    //     path: '/',
    //     redirect: {
    //         path: '/raffle',
    //     }
    // },
    {
        path: '/raffle/:activityId',
        name: 'raffle',
        title: '首页',
        component: () => import('../components/raffle/index.vue'), 
    },
    {
        path: '/auth/login',
        name: 'login',
        title: '登录界面',
        component: () => import('../components/auth/index.vue'), 
    }
]
export default routes
