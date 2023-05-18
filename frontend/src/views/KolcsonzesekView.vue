<template>
  <div>
    <h1>Manage Rents</h1>

    <!-- #Region table -->
    <table class="table table-bordered">
      <thead>
        <tr>
          <th>Car</th>
          <th>Loaner</th>
          <th>Loaner License</th>
          <th>Loaner Phone Number</th>
          <th>Loan Start</th>
          <th>Days Loaned</th>
          <th v-if="storeLogin.number === 0">Edit</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(car, index) in carsWithLoans" :key="`car${index}`">
          <td>{{ car.type }}</td>
          <td>{{  }}</td>
          <td>{{ getLoanerLicenseNum(car) }}</td>
          <td>{{ getLoanerPhoneNumber(car) }}</td>
          <td>{{ car.loanStart }}</td>
          <td>{{ car.numberOfDays }}</td>
          <td v-if="storeLogin.number === 0">
            <button type="button" class="btn btn-primary btn-sm ms-2 w-auto" @click="onClickEdit(car.id)">
              <i class="bi bi-pencil-fill"></i>
            </button>
          </td>
        </tr>
      </tbody>
    </table>
    <!-- #Endregion table -->
  </div>
</template>

<script>
import * as bootstrap from "bootstrap";
import { useUrlStore } from "@/stores/url";
import { useLoginStore } from "@/stores/login";

class Loan {
  constructor(id = 0, loanId = null, carId = null, loanStart = null, numberOfDays = null) {
    this.id = id;
    this.loanId = loanId;
    this.carId = carId;
    this.loanStart = loanStart;
    this.numberOfDays = numberOfDays;
  }
}

export default {
  data() {
    return {
      storeUrl: useUrlStore(),
      storeLogin: useLoginStore(),
      carsWithLoans: [],
      loans: [],
      loaners: [],
      editableLoan: new Loan(),
      modal: null,
      form: null,
      state: "view",
    };
  },
  mounted() {
    this.getCarsWithLoans();
    this.getLoans();
    this.getLoaners();
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

    async getLoans() {
      let url = this.storeUrl.urlLoans;
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.loans = data.data;
    },

    async getLoaners() {
      let url = this.storeUrl.urlLoaners;
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.loaners = data.data;
    },

    getLoanerName(car) {
      const loaner = this.loaners.find((loaner) => loaner.id === car.loanerId);
      return loaner ? loaner.name : "";
    },

    getLoanerLicenseNum(car) {
      const loaner = this.loaners.find((loaner) => loaner.id === car.loanerId);
      return loaner ? loaner.licenseNum : "";
    },

    getLoanerPhoneNumber(car) {
      const loaner = this.loaners.find((loaner) => loaner.id === car.loanerId);
      return loaner ? `+36${loaner.phoneNum}` : "";
    },

    onClickEdit(id) {
      // Handle edit logic
    },
  },
};
</script>

<style></style>
