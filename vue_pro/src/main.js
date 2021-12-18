import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'   //导入安装的axios


//相当于把axios这个对象放到了vue对象中，以后用  vue对象.$axios
Vue.prototype.$axios = axios;
Vue.config.productionTip = false


// 配置全局样式
import '@/assets/css/global.css'

// 配置全局自定义设置
import settings from '@/assets/js/settings'
Vue.prototype.$settings = settings;
// 在所有需要与后台交互的组件中：this.$settings.base_url + '再拼接具体后台路由'

// vue - cookies配置
import cookies from 'vue-cookies'

Vue.prototype.$cookies = cookies;
// ElementUI的配置
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';

Vue.use(ElementUI);
// bootstrap配置
import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.min.css'


new Vue({
    router,
    store,
    render: h => h(App)
}).$mount('#app')
