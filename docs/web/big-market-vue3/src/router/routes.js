const routes = [
    // {
    //     path: '/',
    //     redirect: {
    //         path: '/raffle',
    //     }
    // },
    {
        path: '/404',
        name: '404',
        component: () => import('../components/error/Error404.vue')
    },
    {
        path: '/:pathMatch(.*)',
        redirect: '/404'
    },
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
