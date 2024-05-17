import { createApp } from 'vue'
import './style/global.css'

// 滚动数据组件
import Vue3Marquee from 'vue3-marquee'

// element-plus
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import * as ElementPlusIconsVue from '@element-plus/icons-vue'

// pinia
import pinia from './stores'  //引入
import piniaPluginPersistedstate from 'pinia-plugin-persistedstate' //引入持久化插件
pinia.use(piniaPluginPersistedstate) //将插件添加到 pinia 实例上

// Lucky抽奖插件
import VueLuckyCanvas from '@lucky-canvas/vue'

import App from './App.vue'

// 导入路由文件
import router from './router/index'


const app = createApp(App)

for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
    app.component(key, component)
  }
app.use(Vue3Marquee)
app.use(pinia)
app.use(ElementPlus)
app.use(router)
app.use(VueLuckyCanvas)
app.mount('#app')
