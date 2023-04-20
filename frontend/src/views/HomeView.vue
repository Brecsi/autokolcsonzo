<template>
  <div>
    <h1>Welcome to Our Car-Renting Website</h1>
    <p>Looking for a car for your next trip? Look no further! Our car renting company offers an extensive selection of vehicles to choose from, including economy cars, luxury SUVs, minivans, and sports cars. With us, you can drive away in style and without having to worry about gas or maintenance costs.</p>
    <p>But that's not all - our website is also user-friendly and accessible on any device. You can easily compare car models and rates to find the perfect fit for your budget. </p><p> Plus, our team of knowledgeable and dedicated representatives is here to help you every step of the way, ensuring your car-renting experience is stress-free and hassle-free.</p>
    <p>Ready to get started? Simply enter your travel details and preferences, and we'll show you our car selection. From there, you can book your car in just a few clicks. Our team is here to help you every step of the way, so don't hesitate to reach out if you have any questions or needs. Let us help you make your next car-renting experience memorable!</p>
  </div>
</template>

<script setup>
import Counter from "@/components/Counter.vue";
import { useCounterStore } from "@/stores/counter";
const storeCounter = useCounterStore();
</script>

<style>
h1, p{
  text-align: center;
}

ul {
  display: flex;
  align-items: center;
  justify-content: space-around;
  margin: 0;
  padding: 0;
  list-style-type: none;
}
</style>
