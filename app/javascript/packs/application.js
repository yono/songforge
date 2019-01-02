import Vue from 'vue'
import store from '../store'
import App from '../components/App.vue'

document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('app'))
  const app = new Vue({
    el,
    store,
    render: h => h(App)
  })
})
