
<template>
  <div>
    <h1>Kölcsönzések</h1>

    <div v-for="(car, index) in carsWithLoans" :key="`car${index}`">
      <p>
        {{ car.year }} {{ car.type }} ( {{ car.license }} ) 
      </p>
      <ul>
        <li v-for="(loan, index) in car.loans" :key="`loans${index}`">
          {{ loan.loanStart }}, {{ loan.numberOfDays }}, {{ loan.dailyRate }}
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import { useUrlStore } from "@/stores/url";
import { useLoginStore } from "@/stores/login";
const storeUrl = useUrlStore();
const storeLogin = useLoginStore();
export default {
  data() {
    return {
      storeUrl,
      storeLogin,
      carsWithLoans: [],
    };
  },
  mounted() {
    this.getCarsWithLoans();
  },
  methods: {
    async getCarsWithLoans() {
      let url = this.storeUrl.urlCarsWithLoans;
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.carsWithLoans = data.data;
    },
  },
};
</script>
<style>
</style>
