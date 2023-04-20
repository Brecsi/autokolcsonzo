
<template>
  <div class="container-fluid my-container p-0">
    <Menu />

    <RouterView />
  </div>
</template>

<script>
import Menu from "@/components/Menu.vue";
// import { useUrlStore } from "./stores/url";
// const storeUrl = useUrlStore();

export default {
  components: { Menu },
};
</script>

<style>
</style>

