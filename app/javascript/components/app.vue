<template>
  <div>
    <router-link to="/products" active-class="link--active" exact
      >新着投稿</router-link
    >
    <router-link to="#" active-class="link--active" exact
      >人気の投稿</router-link
    >
    <router-link to="#" active-class="link--active" exact
      >言語で調べる</router-link
    >
  </div>
</template>

<style scoped>
.link--active {
  font-size: 20px;
}
</style>
