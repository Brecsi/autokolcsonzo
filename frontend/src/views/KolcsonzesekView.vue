<template>
  <div>
    <h1>Manage Rents</h1>

    <!-- #Region table -->
    <table class="table">
      <thead>
        <tr>
          <th scope="col">Loan</th>
          <th scope="col">Car</th>
          <th scope="col">Loan start</th>
          <th scope="col">Number of days</th>
          <th scope="col" v-if="storeLogin.number == 0 || storeLogin.number == 1">Edit</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row">loan.id</th>
          <td>car.type</td>
          <td>loan.loanstart</td>
          <td>loan.numberOfDays</td>
        </tr>
        <tr>
          <th scope="row">loan.id</th>
          <td>car.type</td>
          <td>loan.loanstart</td>
          <td>loan.numberOfDays</td>
        </tr>
        <tr>
          <th scope="row">loan.id</th>
          <td>car.type</td>
          <td>loan.loanstart</td>
          <td>loan.numberOfDays</td>
          <button class="btn btn-dark"><i class="bi bi-pencil-fill"></i></button>
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
      loans: [],
      editableLoans: new Loan(),
      modal: null,
      form: null,
      state: "view",
    };
  },
}

// cars (get)
// loans (get, put, post)
// cars with loans (get)
// functionality (buttons)
</script>

<style></style>
