import App from './App.vue'
import ElementPlus from 'element-plus'

import { createApp } from 'vue'
import { router } from './router/index'
import { createPinia } from 'pinia'

import './style.css'
import 'element-plus/dist/index.css'
// // 夜晚模式的css
// import 'element-plus/theme-chalk/dark/css-vars.css'


const app = createApp(App)

app.use(router)
app.use(ElementPlus)
app.use(createPinia())

app.mount('#app')
