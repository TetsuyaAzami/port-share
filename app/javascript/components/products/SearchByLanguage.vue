<template>
  <div>
    <input type="text" v-model="keyword" />
    <div class="products-list">
      <div v-for="product in filteredProducts" :key="product.id">
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
  </div>
</template>

<script>
export default {
  data() {
    return {
      keyword: "",
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
  computed: {
    filteredProducts() {
      let users = [];
      this.products.forEach(function (product) {
        if (product.indexOf(this.keyword) > -1) {
          users.push(product);
        }
      });
      return users
    },
  },
};
</script>
