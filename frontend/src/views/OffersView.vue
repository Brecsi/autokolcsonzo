<template>
    <div class="special-offer">
      <h1>Welcome to Junkie Rental's Special Offer Page</h1>
      <p>Check out our current deals on car rentals:</p>
  
      <div class="offer">
        <h2>Weekend Getaway</h2>
        <p>Rent a car for a weekend getaway and receive 20% off your rental</p>
        <button @click="rentWeekend()">Rent Now</button>
      </div>
  
      <div class="offer">
        <h2>Long-Term Rental</h2>
        <p>Rent a car for 3 or more weeks and receive 30% off your rental</p>
        <button @click="rentLongTerm()">Rent Now</button>
      </div>
  
      <div class="offer">
        <h2>Special Occasion</h2>
        <p>Rent a car for a special occasion and receive 10% off your rental</p>
        <button @click="rentSpecial()">Rent Now</button>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    methods: {
      rentWeekend() {
        // Code to rent a car for a weekend getaway
        // Apply the 20% discount to the rental price
      },
      rentLongTerm() {
        // Code to rent a car for a long-term rental
        // Apply the 30% discount to the rental price
      },
      rentSpecial() {
        // Code to rent a car for a special occasion
        // Apply the 10% discount to the rental price
      }
    }
  }
  </script>
  