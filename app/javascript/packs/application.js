import Vue from 'vue'
import store from '../store'
import router from '../router'
import App from '../components/App.vue'

document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('app'))
  const app = new Vue({
    el,
    store,
    router,
    render: h => h(App)
  })
})
