import Vue from 'vue'
import VueRouter from 'vue-router'
import SongList from './components/SongList'

Vue.use(VueRouter)
const router = new VueRouter({
  routes: [
    {
      path: '/',
      component: SongList
    }
  ]
})
export default router
