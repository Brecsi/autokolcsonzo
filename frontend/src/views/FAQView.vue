<template>
    <div class="faq-container">
      <h1>Frequently Asked Questions</h1>
        <label v-for="(faq, index) in faqs" :key="index">
          <h3>Q: {{ faq.question }}</h3>
          <p>A: {{ faq.answer }}</p>
        </label>
    </div>
  </template>
  
  <script>
  export default {
    name: 'FAQPage',
    data() {
      return {
        faqs: [
          {
            question: 'What types of cars are available for rent?',
            answer: 'We have a wide selection of cars including sedans, SUVs, sports cars, and luxury vehicles.'
          },
          {
            question: 'What is the minimum age requirement for renting a car?',
            answer: 'The minimum age requirement for renting a car is 21 years old. Drivers between the ages of 21 and 24 may be subject to additional fees.'
          },
          {
            question: 'Do I need insurance to rent a car?',
            answer: 'Yes, we require all renters to have liability insurance. You may also purchase additional insurance coverage if desired.'
          },
          {
            question: 'How do I make a reservation?',
            answer: 'You can make a reservation online or by calling our customer service center.'
          },
          {
            question: 'What is your cancellation policy?',
            answer: 'We offer a flexible cancellation policy. Please refer to the terms and conditions of your reservation for details.'
          }
        ]
      }
    }
  }
  </script>
  
  <style>
  .faq-container {
    max-width: 800px;
    margin: auto;
  }
  
  h1 {
    margin-top: 20px;
  }
  
  h3 {
    margin-bottom: 10px;
    font-size: 18px;
  }
  
  p {
    font-size: 16px;
  }
  </style>
  