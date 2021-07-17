<template>
  <div class="products-list">
    <div v-for="product in products" :key="product.id">
      <div class="card">
      <cld-image cloudName="hqyupfdfe" publicId="seed-images/React.png"></cld-image>
      </div>
    </div>

  </div>

</template>

<script>

export default {
  data() {
    return {
      productImage: true,
    };
  },
  props: {
    products: {
      type: Array,
      default: () => "",
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
