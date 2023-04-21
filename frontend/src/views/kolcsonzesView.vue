<template>
  <div>
    <h1>Car Rental Reservation</h1>
    <form @submit.prevent="makeReservation" >
      <div>
        <label for="name">Full name</label>
        <input type="text" v-model="name" id="name">
      </div>
      <div>
        <label for="licenseNum">License number (15 number digit)</label>
        <input type="text" v-model="licenseNum" id="licenseNum">
      </div>
      <div>
        <label for="phoneNum">Phone Number</label>
        <input type="text" v-model="phoneNum" id="phoneNum">
      </div>
      <div>
        <label for="loanStart">Rental Start Date</label>
        <input type="date" v-model="loanStart" id="loanStart">
      </div>
      <div>
        <label for="numberOfDays">Number of rental days</label>
        <input type="number" v-model.number="numberOfDays" id="numberOfDays">
      </div>
      <div>
        <label for="car">Vehicle</label>
        <select >
          <option value=""  selected>Select a Vehicle</option>
          <option v-for="(car, index) in cars" :key="`car${index}`"> {{ car.year }} {{ car.type }} ( {{ car.dailyRate }} Ft/day )</option>
        </select>
      </div>
      <button class="btn btn-dark" @click="rentCar()">Make Reservation</button>
      <ul v-if="errorMessage">
        <li v-for="error in errorMessages" :key="error">{{error}}</li>
      </ul>
    </form>
  </div>
</template>

<script>
import * as bootstrap from "bootstrap";
import { useUrlStore } from "@/stores/url";
import { useLoginStore } from "@/stores/login";
const storeUrl = useUrlStore();
const storeLogin = useLoginStore();

class Rent {
  constructor(
    id = 0,
    loanId = null,
    carId = null,
    loanStart = null,
    numberOfDays = null,
  ){
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
      name: "",
      licenseNum: "",
      phoneNum: "",
      loanStart: "",
      numberOfDays: "",
      cars: [],
      makeRent: new Rent(),
      errorMessage: "",
      errorMessages: []
    };
  },
  mounted() {
    this.getCars();
  },
  methods: {
    async getCars() {
      let url = this.storeUrl.urlCars;
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.cars = data.data;
    },

    makeReservation() {
      if (!this.firstName || !this.last_name || !this.email || !this.phone_number || this.rental_start_date === this.rental_end_date || this.vehicle === '') {
        this.errorMessage = 'All fields are required';
        return;
      }

      const requestData = {
        first_name: this.firstName,
        last_name: this.last_name,
        email: this.email,
        phone_number: this.phone_number,
        rental_start_date: this.rental_start_date.value,
        rental_end_date: this.rental_end_date.value,
        vehicle: this.vehicle.selectedIndex
      };

      // Make API request to reserve the vehicle
      fetch('/api/car-rental', {
        method: 'POST',
        body: JSON.stringify(requestData),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        }
      })
        .then(() => this.router.push('/thank-you'))
        .catch(error => {
          console.log('Something went wrong:', error);
          this.errorMessages.push('Server error. Please try again later.');
          this.errorMessage = 'Server error. Try again later.';
          return;
        });
    }
  }
};
</script>
```