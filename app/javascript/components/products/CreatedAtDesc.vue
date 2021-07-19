<template>
  <div class="products-list">
    <div v-for="product in products" :key="product.id">
      <div class="card">
        <cld-image
          v-if="productImage"
          class="product-image"
          publicId="seed-images/React.png"
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
</template>

<!--
 <div class="card">
        <% if product.image.present? %>
        <%= cl_image_tag(product.image,class:"product-image") %>
        <% else %>
        <%= cl_image_tag "Noimage.png", class:"product-image" %>
        <% end %>

        <div class="card-body text-center">
          <h5 class="card-title"><%=product.name%></h5>
          <p class="card-text text-left"><%= truncate(product.description,length: 13,separator: /。/)%> </p>
          <%= link_to  "この作品を見る", product_path(product), class:"product"%>
        </div>
      </div>
-->

<script>
export default {
  data() {
    return {
      productImage: false,
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
        return value.substring(0,length) + "...";
    },
  },
  // created: function(){
  //  this.clImage()
  // },
  //   computed:{
  //   clImage(){
  //   if (typeof this.products.image === 'undefined'){
  //  productImage === false
  //   }else{
  // productImage === true
  //   }
  // }

  //   }
};
</script>
