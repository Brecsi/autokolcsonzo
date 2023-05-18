<template>
  <div>
    <h1>Manage Rents</h1>

    <!-- #Region table -->
    <table class="table table-bordered">
      <thead>
        <tr>
          <th>Car</th>
          <th>Loaner</th>
          <th>loaner license</th>
          <th>loaner phone number</th>
          <th>loan start</th>
          <th>days loaned</th>
          <th v-if="storeLogin.number == 0">Edit</th>
        </tr>
      </thead>
      <tbody v-for="(car, index) in carsWithLoans" :key="`car${index}`">
        <tr v-for="(loaner, index) in loaners" :key="`loaner${index}`">
            <td>{{ car.type }}</td>
            <td>{{ loaner.name }}</td>
            <td>{{ loaner.licenseNum }}</td>
            <td>+36 {{ loaner.phoneNum }}</td>
            <td>{{ car.loanStart }}</td>
            <td>{{ car.numberOfDays }}</td>
            <td v-if="storeLogin.number == 0">
              <button type="button" class="btn btn-primary btn-sm ms-2 w-auto" @click="onClickEdit(user.id)">
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
const storeUrl = useUrlStore();
const storeLogin = useLoginStore();

class Loan {
  constructor(
    id = 0,
    loanId = null,
    carId = null,
    loanStart = null,
    numberOfDays = null
  ) {
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
      storeUrl,
      storeLogin,
      carsWithLoans: [],
      loans: [],
      loaners: [],
      editableLoan: new Loan(),
      modal: null,
      form: null,
      state: "view",
    };
  },
  mounted(){
    this.getCarsWithLoans();
    this.getLoans();
    this.getLoaners();
  },
  methods: {
    // urlCarsWithLoans
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

    async getCarsWithLoansById(id) {
      let url = `${this.storeUrl.urlCarsWithLoans}/${id}`;
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.carsWithLoans = data.data[0];
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
    async getLoanById(id) {
      let url = `${this.storeUrl.urlLoans}/${id}`;
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.editableLoan = data.data[0];
    },
    async postLoan() {
      let url = this.storeUrl.urlLoans;
      const body = JSON.stringify(this.editableLoan);
      const config = {
        method: "POST",
        headers: {
          "content-type": "application/json",
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
        body: body,
      };
      const response = await fetch(url, config);
      const data = await response.json();
      console.log(data.data);
      this.getLoans();
    },
    async putLoan() {
      const id = this.editableLoan.id;
      let url = `${this.storeUrl.urlLoans}/${id}`;
      const body = JSON.stringify(this.editableLoan);
      const config = {
        method: "PUT",
        headers: {
          "content-type": "application/json",
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
        body: body,
      };
      const response = await fetch(url, config);
      this.getLoans();
    },
    async deleteLoan(id) {
      let url = `${this.storeUrl.urlLoans}/${id}`;
      const config = {
        method: "DELETE",
        headers: {
          "content-type": "application/json",
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      this.getLoans();
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
    async getLoanerById(id) {
      let url = `${this.storeUrl.urlLoaners}/${id}`;
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.editableLoan = data.data[0];
    },
  }
}
// functionality (buttons)
</script>

<style></style>
