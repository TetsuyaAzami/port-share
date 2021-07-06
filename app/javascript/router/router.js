// vue --version2以前
import Vue from 'vue';
import VueRouter from 'vue-router';
import App from "../components/app.vue"

Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  routes: [
    {
      path: '/products',
      component: App,
      name: 'App'
    }
  ]
})

// vue --version3以降

// import { createRouter, createWebHistory } from "vue-router";
// const router = createRouter({
//   history: createWebHistory(),
//   routes: [
//     {
//       path: "/products",
//       component: App,
//       name: "App",
//     },
//   ],
// });
// app.use(router);
