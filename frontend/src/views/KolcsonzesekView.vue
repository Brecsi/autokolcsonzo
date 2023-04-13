
<template>
  <div>
    
    <h1>Kölcsönzések</h1>

    <table class="table table-bordered table-hover table-dark">
      <thead>
        <tr>
          <th>Autó Típusa</th>
          <th>Gyártási év</th>
          <th>Rendszám</th>
          <th>Kölcsönzés dátuma</th>
          <th>Napok száma</th>
          <th>Ft/nap</th>
        </tr>
      </thead>
      <tbody v-for="(car, index) in carsWithLoans"
          :key="`car${index}`">
        <tr
        v-for="(loan, index) in car.loans" :key="`loans${index}`">
          <td>{{ car.type }}</td>
          <td>{{ car.year }}</td>
          <td>{{ car.license }}</td>
          <td>{{ loan.loanStart }}</td>
          <td>{{ loan.numberOfDays }}</td>
          <td>{{ car.dailyRate }}</td>
        </tr>
      </tbody>
    </table>
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
