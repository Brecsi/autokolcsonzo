<template>
    <div class="help-container">
      <h1>Help Center</h1>
      <div class="help-sections">
        <div v-for="section in sections" :key="section.id" class="help-section">
          <h3>{{ section.title }}</h3>
          <div v-html="section.content"></div>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    name: 'HelpPage',
    data() {
      return {
        sections: [
          {
            id: 1,
            title: 'How to book a car',
            content: '<p>To book a car, follow these steps:</p><ol><li>Select your desired car from the available options.</li><li>Choose your preferred dates and times.</li><li>Provide the required information during the checkout process.</li></ol>'
          },
          {
            id: 2,
            title: 'What documents do I need to rent a car?',
            content: '<p>To rent a car, you will need the following documents:</p><ul><li>A valid driver\'s license.</li><li>A credit card in your name for the security deposit.</li><li>A proof of insurance (if required).</li></ul>'
          },
          {
            id: 3,
            title: 'How to cancel a reservation',
            content: '<p>To cancel a reservation, go to the My Reservations section of your account, select the reservation you want to cancel, and click the Cancel Reservation button. Please note that cancellation policies may vary depending on the rental agency.</p>'
          },
          {
            id: 4,
            title: 'What to do in case of an accident',
            content: '<p>In case of an accident, make sure to first seek medical attention if necessary. Then, call the rental agency and report the accident. Follow their instructions for next steps and provide all necessary information and documentation.</p>'
          },
          {
            id: 5,
            title: 'How to extend a rental period',
            content: '<p>To extend a rental period, go to the My Reservations section of your account, select the reservation you want to extend, and click the Extend Reservation button. Please note that additional charges may apply.</p>'
          }
        ]
      }
    }
  }
  </script>
  
  <style>
  .help-container {
    max-width: 800px;
    margin: auto;
  }
  
  .help-sections {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 32px;
  }
  
  .help-section {
    border: 1px solid #ccc;
    padding: 16px;
    border-radius: 8px;
  }
  
  .help-section h3 {
    font-size: 20px;
    margin-bottom: 16px;
  }
  
  .help-section p {
    font-size: 16px;
    line-height: 1.5;
  }
  </style>
  