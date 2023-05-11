<template>
  <div>
    <section class="car-option">
      <div class="car-image">
        <img src="../assets/mercedes-s-class.png" alt="Luxurious Car" />
      </div>
    </section>

    <section class="car-options">
      <h2>Why Choose Us?</h2>
      <div class="car-option">
        <div class="car-image">
          <img src="/assets/sports-car.jpg" alt="Sports Car" />
        </div>
        <div class="car-info">
          <h3>Sports Cars</h3>
          <p>
            Looking for an adrenaline rush? Our sports cars will satisfy your
            need for speed.
          </p>
        </div>
      </div>
      <div class="car-option">
        <div class="car-image">
          <img src="/assets/luxury-suv.jpg" alt="Luxury SUV" />
        </div>
        <div class="car-info">
          <h3>Luxury SUVs</h3>
          <p>Travel in style and comfort with our luxurious SUVs.</p>
        </div>
      </div>
      <div class="car-option">
        <div class="car-image">
          <img src="/assets/economy-car.jpg" alt="Economy Car" />
        </div>
        <div class="car-info">
          <h3>Economy Cars</h3>
          <p>
            Need a car for your daily commute or weekend getaway? Our economy
            cars are perfect for you.
          </p>
        </div>
      </div>
    </section>

    <section class="services">
      <h2>Our Services</h2>
      <div class="service">
        <div class="service-image">
          <img src="/assets/service-desk.jpg" alt="Service Desk" />
        </div>
        <div class="service-info">
          <h3>Friendly Customer Service</h3>
          <p>
            Our friendly and knowledgeable staff is always ready to assist you
            with any queries or concerns.
          </p>
        </div>
      </div>
      <div class="service">
        <div class="service-image">
          <img src="/assets/gps-device.jpg" alt="GPS Device" />
        </div>
        <div class="service-info">
          <h3>Advanced GPS Technology</h3>
          <p>
            Our cars come equipped with advanced GPS technology to help you
            navigate unfamiliar roads.
          </p>
        </div>
      </div>
      <div class="service">
        <div class="service-image">
          <img src="/assets/child-seat.jpg" alt="Child Seat" />
        </div>
        <div class="service-info">
          <h3>Accessories Available</h3>
          <p>
            We offer a range of accessories, including child seats, to ensure
            the safety and comfort of your loved ones.
          </p>
        </div>
      </div>
    </section>

    <section class="testimonials">
      <h2>What Our Customers Say</h2>
      <div class="testimonial">
        <div class="testimonial-image">
          <img src="/assets/happy-customer.jpg" alt="Happy Customer" />
        </div>
        <div class="testimonial-info">
          <p>
            "I had an amazing experience renting a car from [Car Rental Company
            Name]. The staff was friendly and helpful, and the car was in
            excellent condition."
          </p>
        </div>
      </div>
      <div class="testimonial">
        <div class="testimonial-image">
          <img src="/assets/satisfied-customer.jpg" alt="Satisfied Customer" />
        </div>
        <div class="testimonial-info">
          <p>
            "I rented a luxurious SUV for my family vacation, and it was the
            best decision ever. The car was spacious, comfortable, and had all
            the latest features."
          </p>
        </div>
      </div>
    </section>

    <footer>
      <nav>
        <ul>
          <li><a href="#">About Us</a></li>
          <li><a href="#">Contact Us</a></li>
          <li><a href="#">FAQs</a></li>
          <li><a href="#">Privacy Policy</a></li>
          <li><a href="#">Terms and Conditions</a></li>
        </ul>
      </nav>
      <div class="social-icons">
        <a href="#"><i class="fab fa-facebook-f"></i></a>
        <a href="#"><i class="fab fa-twitter"></i></a>
        <a href="#"><i class="fab fa-instagram"></i></a>
      </div>
    </footer>
  </div>
</template>

<script setup>
import Counter from "@/components/Counter.vue";
import { useCounterStore } from "@/stores/counter";
const storeCounter = useCounterStore();
</script>

<style>
ul {
  display: flex;
  align-items: center;
  justify-content: space-around;
  margin: 0;
  padding: 0;
  list-style-type: none;
}

div.car-image {
  width: 100%;
  background-color: white;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
section {
  text-align: center;
  padding: 10px 20px;
}

img {
  width: 50%;
}
</style>
