import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import PaySuccess from "../views/PaySuccess";
import Oldbook from "../views/Oldbook";
import paysuccess2 from "../views/paysuccess2";
Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path:'/success',
    name:'success',
    component: PaySuccess
  },
    {
    path:'/success2',
    name:'success2',
    component: paysuccess2
  },

  {
    path:'/oldbook',
    name:'oldbook',
    component: Oldbook
  }
  // {
  //   path: '/about',
  //   name: 'About',
  //   // route level code-splitting
  //   // this generates a separate chunk (about.[hash].js) for this route
  //   // which is lazy-loaded when the route is visited.
  //   component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  // }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
