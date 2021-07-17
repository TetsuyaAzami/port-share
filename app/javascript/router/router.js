// vue --version2以前
import Vue from 'vue';
import VueRouter from 'vue-router';
import App from "../components/products/app.vue"
import CreatedAtDesc from "../components/products/CreatedAtDesc.vue"
import FavorDesc from "../components/products/FavorDesc.vue"
import SearchByLanguage from "../components/products/SearchByLanguage.vue"

Vue.use(VueRouter)

export default new VueRouter({
  mode: "history",
  routes: [
    {
      path: "/products",
      component: CreatedAtDesc,
      name: "CreatedAtDesc",
    },
    {
      path: "/products_favor",
      component: FavorDesc,
      name: "FavorDesc",
    },
    {
      path: "/products_search_by_language",
      component: SearchByLanguage,
      name: "SearchByLanguage",
    },
  ],
});

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
