/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

// vue --version2以前
import Vue from "vue";
import App from "../components/products/app.vue";
import router from "../router/router";
import Cloudinary from "cloudinary-vue";
Vue.use(Cloudinary, {
  configuration: {
    cloudName: "hqyupfdfe",
    secure: true,
  },
});

Vue.config.productionTip = false;

document.addEventListener("DOMContentLoaded", () => {
  const node = document.getElementById("productsIndex");
  const props = JSON.parse(node.getAttribute("data"));
  const nodeRanking = document.getElementById("productsRanking");
  const propsRanking = JSON.parse(nodeRanking.getAttribute("data"));
  const nodeLikesCounts = document.getElementById("likesCounts");
  const propsLikesCounts = JSON.parse(nodeLikesCounts.getAttribute("data"));
  const app = new Vue({
    el: "#vue-template",
    router,
    render: (h) =>
      h(App, {
        props: {
          products: props.products,
          products_ranking: propsRanking.products,
          products_likescounts: propsLikesCounts.likes_counts
        },
      }),
  });
});

//vue --version3以降
// import { createApp } from "vue";
// import App from '../components/app.vue'
// import router from "../router/router";

// document.addEventListener('DOMContentLoaded', () => {
//   const app = createApp(App)
//   app.use(router)
//   app.mount("#vue-template");
// })

// The above code uses Vue without the compiler, which means you cannot
// use Vue to target elements in your existing html templates. You would
// need to always use single file components.
// To be able to target elements in your existing html/erb templates,
// comment out the above code and uncomment the below
// Add <%= javascript_pack_tag 'hello_vue' %> to your layout
// Then add this markup to your html template:
//
// <div id='hello'>
//   {{message}}
//   <app></app>
// </div>

// import Vue from 'vue/dist/vue.esm'
// import App from '../components/app.vue'

// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: {
//       message: "Can you say hello?"
//     },
//     components: { App }
//   })
// })
//
//
//
// If the project is using turbolinks, install 'vue-turbolinks':
//
// yarn add vue-turbolinks
//
// Then uncomment the code block below:
//
// import TurbolinksAdapter from 'vue-turbolinks'
// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// Vue.use(TurbolinksAdapter)
//
// document.addEventListener('turbolinks:load', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: () => {
//       return {
//         message: "Can you say hello?"
//       }
//     },
//     components: { App }
//   })
// })
