<template>
  <div>
    <h1>Car Rental Reservation</h1>
    <form @submit.prevent="makeReservation">
      <div>
        <label for="name">Full name</label>
        <input type="text" v-model="name" id="name">
      </div>
      <div>
        <label for="licenseNum">License number</label>
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
        <input type="date" v-model="numberOfDays" id="numberOfDays">
      </div>
      <div>
        <label for="car">Vehicle</label>
        <select v-model="car">
          <option value="" disabled selected>Select a Vehicle</option>
          <option value="Toyota">Toyota</option>
          <option value="Honda">Honda</option>
          <option value="Mercedes">Mercedes</option>
          <option value="BMW">BMW</option>
        </select>
      </div>
      <button>Make Reservation</button>
      <ul v-if="errorMessage">
        <li v-for="error in errorMessages" :key="error">{{error}}</li>
      </ul>
    </form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      name: "",
      licenseNum: "",
      phoneNum: "",
      loanStart: "",
      numberOfDays: "",
      car: [],
      errorMessage: "",
      errorMessages: []
    };
  },
  methods: {
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