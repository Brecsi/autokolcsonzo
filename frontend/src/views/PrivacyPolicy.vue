<template>
    <div class="privacy-policy">
      <h1 class="title">Privacy Policy</h1>
      <div v-for="(section, index) in policySections" :key="index" class="section">
        <h2 class="section-title">{{ section.title }}</h2>
        <p class="section-text">{{ section.content }}</p>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        policySections: [
          {
            title: "Personal Information",
            content:
              "We collect personal information such as name, email, and phone number to process reservations and communicate with customers.",
          },
          {
            title: "Payment Information",
            content:
              "We collect payment information such as credit card numbers to process transactions securely.",
          },
          {
            title: "Location Information",
            content:
              "We collect location information to provide directions and help customers find our rental locations.",
          },
          {
            title: "Sharing of Information",
            content:
              "We do not share customer information with third parties unless required by law or necessary to provide our services.",
          },
          {
            title: "Data Retention",
            content:
              "We retain customer information for as long as necessary to provide our services and comply with legal obligations.",
          },
          {
            title: "Security",
            content:
              "We take measures to protect customer information from unauthorized access, disclosure, and alteration.",
          },
          {
            title: "Updates to Policy",
            content:
              "We may update this privacy policy from time to time. Customers will be notified of any changes.",
          },
        ],
      };
    },
  };
  </script>
  
  <style>
  .privacy-policy {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
  }
  
  .title {
    font-size: 36px;
    text-align: center;
    margin-bottom: 20px;
  }
  
  .section-title {
    font-size: 24px;
    margin-bottom: 10px;
  }
  
  .section-text {
    font-size: 16px;
    margin-bottom: 20px;
  }
  </style>
  