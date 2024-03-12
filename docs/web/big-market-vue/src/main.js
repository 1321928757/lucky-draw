import Vue from 'vue'
import App from './App.vue'
import router from './router'
import VueLuckyCanvas from '@lucky-canvas/vue'

// 自定义全局样式
import './css/global.less'

// 导入iconFont图标
import './assets/icon/font_1u1jj30zix7/iconfont.css'
import './assets/icon/font_bjjhxpr8pnd/iconfont.css'

// Elementui
import ElementUI from 'element-ui';
import './css/element-topic/index.css';
import './css/element-topic/display.css';

// 高德amap地图
import AmapVue from '@amap/amap-vue';
AmapVue.config.version = '2.0'; // 默认2.0，这里可以不修改
AmapVue.config.key = '4927c6416c652d347fcddbf08b57b4f0';
AmapVue.config.plugins = [
  'AMap.ToolBar',
  'AMap.MoveAnimation',
  // 在此配置你需要预加载的插件，如果不配置，在使用到的时候会自动异步加载
];
Vue.use(AmapVue);
Vue.use(VueLuckyCanvas)


Vue.config.productionTip = false
// 关闭element遮罩层全屏
ElementUI.Dialog.props.lockScroll.default = false;
Vue.use(ElementUI);


new Vue({
  router,
  productionTip: false,
  render: h => h(App)
}).$mount('#app')
