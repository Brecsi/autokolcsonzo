<template>
  <div class="container">
    <div>
      <h1>Why Choose Junkie Rentals?</h1>
      <div class="renting-info">
        <ul>
          <li>Flexible rental options to meet your needs</li>
          <li>
            A wide selection of vehicles, from compact cars to SUVs and more
          </li>
          <li>24/7 customer support to assist you throughout your rental</li>
          <li>Affordable rates and transparent pricing</li>
          <li>Convenient online booking system</li>
        </ul>
      </div>
      <h2>How it Works</h2>
      <div class="renting-info">
        <ol>
          <li>Choose your rental location and dates</li>
          <li>Select the vehicle type that suits your needs</li>
          <li>Choose your rental location and dates</li>
          <li>Select the vehicle type that suits your needs</li>
          <li>Confirm your rental reservation</li>
          <li>Pick up your vehicle and hit the road!</li>
        </ol>
      </div>
    </div>
    <footer>
      <nav>
        <ul class="links">
          <li><router-link to="/about">About Us</router-link></li>
          <li><router-link to="/faq">FAQ</router-link></li>
          <li><router-link to="/privacypolicy">Privacy Policy</router-link></li>
        </ul>
      </nav>
    </footer>
  </div>
</template>

<script>

</script>

<style>
.home {
  text-align: center;
  margin: 50px 0;
}

.subtitle {
  font-size: 1.2rem;
  margin-bottom: 40px;
}

.renting-info {
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
  max-width: 900px;
  margin: 0 auto;
}

.renting-option {
  width: calc(33.33% - 20px);
  background-color: #fff;
  box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
  border-radius: 5px;
  padding: 20px;
  margin-bottom: 40px;
  text-align: center;
  transition: box-shadow 0.3s ease-in-out;
}

.renting-option:hover {
  box-shadow: 0px 0px 15px 0px rgba(0, 0, 0, 0.4);
}

.renting-option i {
  font-size: 4rem;
  color: #007bff;
  margin-bottom: 20px;
}

.renting-option h3 {
  font-size: 1.5rem;
  margin-bottom: 10px;
}

.renting-option p {
  font-size: 1.2rem;
  margin-bottom: 20px;
}

.btn {
  font-size: 1rem;
  padding: 10px 20px;
  border-radius: 3px;
  cursor: pointer;
  transition: background-color 0.3s ease-in-out;
}

.btn-primary {
  background-color: #007bff;
  color: #fff;
}

.btn-primary:hover {
  background-color: #0062cc;
}

h1, h2 {
  text-align: center;
}

</style>
