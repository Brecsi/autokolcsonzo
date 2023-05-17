<template>
  <div>
    
    <h1>Manage Rents</h1>

    <table class="table table-bordered table-hover">
      <thead>
        <tr>
          <th>Car type</th>
          <th>Manufacture year</th>
          <th>License</th>
          <th>Loan start</th>
          <th>Number of days</th>
          <th>Daily fee</th>
        </tr>
      </thead>
      <tbody v-for="(car, index) in carsWithLoans"
          :key="`car${index}`">
        <tr
        v-for="(loan, index) in car.loans" :key="`loans${index}`" >
          <td>{{ car.type }}</td>
          <td>{{ car.year }}</td>
          <td>{{ car.license }}</td>
          <td>{{ loan.loanStart }}</td>
          <td :style="{ background: loan.numberOfDays == null ? 'rgba(255, 0, 0, 0.5)' : 'white' }">{{ loan.numberOfDays }}</td>
          <td>{{ car.dailyRate }}</td>
          <td v-if="storeLogin.number == 0">
            <button
              type="button"
              class="btn btn-primary btn-sm ms-2 w-auto"
              @click="onClickEdit(user.id)"
            >
              <i class="bi bi-pencil-fill"></i>
            </button>
          </td>
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
