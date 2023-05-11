
<template>
  <div class="container-fluid my-container p-0" id="app">
    
    <PageLoader />
    <Menu />

    <RouterView />
  </div>
</template>

<script>
import Menu from "@/components/Menu.vue";
import PageLoader from './components/PageLoader.vue'
// import { useUrlStore } from "./stores/url";
// const storeUrl = useUrlStore();

export default {
  data: () => {
    return {
      cards: [
        { img: '/img-1.jpg', grid: 'card-2-1' },
        { img: '/img-2.jpg', grid: 'card-1-1' },
        { img: '/img-3.jpg', grid: 'card-1-1' },
        { img: '/img-4.jpg', grid: 'card-2-1' },
        { img: '/img-5.jpg', grid: 'card-1-1' },
        { img: '/img-6.jpg', grid: 'card-1-1' }
      ],
    }
  },
  components: {
    PageLoader,
    Menu,
  },
};
</script>

<style>

</style>

