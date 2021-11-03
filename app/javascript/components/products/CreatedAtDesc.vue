<template>
  <div>
    <div class="products-list">
      <div v-for="product in getPaginateItems" :key="product.id">
        <div class="card">
          <cld-image
            v-if="product.image.url"
            class="product-image"
            :publicId="`${product.image.url}`"
          >
          </cld-image>
          <cld-image v-else class="product-image" publicId="Noimage.png">
          </cld-image>
          <div class="card-body text-center">
            <h5 class="card-title">{{ product.name }}</h5>
            <p class="card-text text-left">
              {{ product.description | truncate }}
            </p>
            <a :href="`/products/${product.id}`"> この作品を見る </a>
          </div>
        </div>
      </div>
    </div>
    <paginate
      class="mx-auto my-3"
      style="width: fit-content"
      :page-count="getPageCount"
      :page-range="3"
      :click-handler="clickCallback"
      :prev-text="'＜'"
      :next-text="'＞'"
      :container-class="'pagination'"
      :page-class="'page-item'"
    >
    </paginate>
  </div>
</template>

<script>
import Vue from "vue";
import Paginate from "vuejs-paginate";
Vue.component("paginate", Paginate);
export default {
  data() {
    return {
      currentPage: 1,
      perPage: 9,
    };
  },
  props: {
    products: {
      type: Array,
      default: () => "",
    },
  },
  filters: {
    truncate(value, length = 15) {
      if (value.length <= length) {
        return value;
      }
      return value.substring(0, length) + "...";
    },
  },
  methods: {
    clickCallback(pageNum) {
      this.currentPage = Number(pageNum);
    },
  },
  created() {
    this.sort_by_created_at;
  },
  computed: {
    sort_by_created_at() {
      this.products.sort(function (a, b) {
        if (a.id > b.id) {
          return -1;
        } else {
          return 1;
        }
      });
    },
    getPaginateItems() {
      let start = (this.currentPage - 1) * this.perPage;
      let end = this.currentPage * this.perPage;
      return this.products.slice(start, end);
    },
    getPageCount() {
      return Math.ceil(this.products.length / 9);
    },
  },
};
</script>
