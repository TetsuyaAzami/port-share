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
      ref="pagination"
      :page-count="getPageCount"
      :page-range="5"
      :margin-pages="0"
      :click-handler="clickCallback"
      :first-last-button="true"
      :first-button-text="firstButtonText"
      :last-button-text="last"
      :prev-text="prev"
      :next-text="next"
      :hide-prev-next="true"
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
      totalPage: Math.ceil(this.products.length / 9),
      prev: "<i class='fas fa-angle-left'></i>",
      next: "<i class='fas fa-angle-right'></i>",
      firstButtonText: "<i class='fas fa-angle-double-left'></i>",
      last: "<i class='fas fa-angle-double-right'></i>",
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
    //1ページ目でペジネーションの最初に戻るボタン’<<’を表示しない
    getFirstButtonText() {
      const pagination = this.$refs.pagination.$el;
      const firstChild = pagination.firstChild;
      if (this.currentPage == 1) {
        firstChild.style.display = "none";
      } else {
        firstChild.style.display = "block";
        return (this.firstButtonText =
          "<i class='fas fa-angle-double-left'></i>");
      }
    },
    //最後のページでペジネーションの最後に飛ぶボタン’>>’を表示しない
    getLastButtonText() {
      const pagination = this.$refs.pagination.$el;
      const lastChild = pagination.lastChild;
      if (this.currentPage == this.totalPage) {
        lastChild.style.display = "none";
      } else {
        lastChild.style.display = "block";
        return (this.firstButtonText =
          "<i class='fas fa-angle-double-left'></i>");
      }
    },
  },
  created() {
    this.sort_by_created_at;
  },
  mounted() {
    this.getFirstButtonText();
    this.getLastButtonText();
  },
  updated() {
    this.getFirstButtonText();
    this.getLastButtonText();
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
      return this.totalPage;
    },
  },
};
</script>
