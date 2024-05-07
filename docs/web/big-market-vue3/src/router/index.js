// 导入router所需的方法
import { createRouter, createWebHistory } from 'vue-router'

// 导入路由页面的配置
import routes from './routes'

// 路由参数配置
const router = createRouter({
    // 使用hash(createWebHashHistory)模式，(createWebHistory是HTML5历史模式，支持SEO)
    history: createWebHistory(),
    routes: routes,
})


// 导出默认值
export default router
