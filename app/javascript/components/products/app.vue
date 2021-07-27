<template>
  <div>
    <AppLinks></AppLinks>
    <router-view :products="products" :products_ranking="products_ranking"></router-view>
  </div>
</template>
<script>
import AppLinks from "./AppLinks.vue";
import CreatedAtDesc from "./CreatedAtDesc.vue";
import FavorDesc from "./FavorDesc.vue";
import SearchByLanguage from "./SearchByLanguage.vue";

export default {
  name: "App",
  components: {
    AppLinks,
    CreatedAtDesc,
    FavorDesc,
    SearchByLanguage,
  },
  props: {
    products: {
      type: Array,
      default: () => "",
    },
    products_ranking: {
      type: Array,
      default: () => "",
    },
  },
};
</script>
