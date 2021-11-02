<template>
  <div class="products-list">
    <div v-for="product in products_ranking" :key="product.id">
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
          <h5 class="card-title">
            {{ product.name }}<i class="heart fas fa-heart"></i
            ><span class="likescounts">{{
              products_likescounts[product.id]
            }}</span>
          </h5>
          <p class="card-text text-left">
            {{ product.description | truncate }}
          </p>
          <a :href="`/products/${product.id}`"> この作品を見る </a>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    products_ranking: {
      type: Array,
      default: () => "",
    },
    products_likescounts: {
      type: Object,
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
  created() {
    this.sort_by_like_count;
  },
};
</script>
<style>
.heart {
  font-size: 1rem;
  margin-left: 10px;
  color: red;
}
.likescounts {
  color: #01091c;
  padding-left: 5px;
  font-size: 1rem;
  font-weight: normal;
}
</style>
