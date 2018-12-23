import Vue from 'vue'
import store from '../store.js'
import App from '../App.vue'
import 'vue-swipe-actions/dist/vue-swipe-actions.css';

document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('hello'))
  const app = new Vue({
    el,
    store,
    render: h => h(App)
  })
})
