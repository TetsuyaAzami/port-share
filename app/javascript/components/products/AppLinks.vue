<template>
  <div class="sorts-list d-flex justify-content-around mb-4">
    <router-link to="/products" active-class="link--active" exact
      >新着投稿</router-link
    >
    <router-link to="products_favor" active-class="link--active" exact
      >人気の投稿</router-link
    >
  </div>
</template>

<style>
.link--active{
  font-size: 20px;
}
</style>
