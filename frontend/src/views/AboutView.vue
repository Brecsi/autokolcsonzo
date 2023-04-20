<template>
  <div>
    <h1>About Us</h1>
    <p>At Junkie Car Rentals, we pride ourselves on offering a wide range of top quality vehicles to suit everyone's
      needs. Whether you're a business traveler, a vacationer, or just needing a reliable car for your daily commute, we
      have the right rental for you.</p>
    <p>Our dedication to providing excellent customer service is what sets us apart from our competition. We understand
      that renting a car can be a stressful process, which is why we make sure to walk our customers through every step of
      the reservation process. Our knowledgeable and friendly staff is on hand to answer any questions you may have,
      whether you're a first-time renter or a regular customer.</p>
    <p>At Junkie Car Rentals, we also prioritize our customers' safety. We ensure that all of our vehicles are
      well-maintained and meet the latest safety standards. We also offer a variety of optional insurance coverages to
      protect you against any potential accidents or damage to your rental vehicle.</p>
    <p>So if you're looking for a high-quality rental car and excellent customer service, look no further than Junkie Car
      Rentals. We can't wait to get you behind the wheel of your perfect rental car today!</p>

      <h2>Contact Us</h2>
      <p>We're always here to help. If you have any questions or concerns related to our service, please don't hesitate to
        get in touch with us using the form below. We'll do our best to respond as soon as possible.</p>
    <form>
      <input name="name" type="text" class="feedback-input" placeholder="Name" />
      <input name="email" type="text" class="feedback-input" placeholder="Email" />
      <textarea name="text" class="feedback-input" placeholder="Comment"></textarea>
      <input type="submit" value="SUBMIT" />
    </form>




    <!-- <div class="container">
      <
        <p>
          <label for="first_name">First Name:</label>
          <input type="text" class="form-control" id="userName" placeholder="Fisrt name" required/>
          <label for="last_name">Last Name:</label>
          <input type="text" class="form-control" name="last_name" id="last_name" placeholder="Last name" required>
          <label for="email">Email Address:</label>
          <input type="email" class="form-control" name="email" id="email" placeholder="Email address" required>
          <label for="phone_number">Phone Number:</label>
          <input type="text" class="form-control" name="phone_number" id="phone_number" placeholder="Phone number">
          <label for="reason_for_contacting_us">Reason for Contacting Us:</label>
          <select class="form-control" name="reason_for_contacting_us" id="reason_for_contacting_us">
            <option value="">Select a reason</option>
            <option value="reservation_issue">Reservation issue</option>
            <option value="customer_service_issue">Customer service issue</option>
            <option value="payment_issue">Payment issue</option>
          </select>
          <textarea name="message" id="message" rows="5" required class="form-control" placeholder="Write us a message"></textarea>
          <button class="btn btn-primary" type="submit">Submit</button>
        </p>
      </form>
    </div> -->
  </div>
</template>

<style>
@import url(https://fonts.googleapis.com/css?family=Montserrat:400,700);

body { background-image: url(/background.jpg); }
form { max-width:420px; margin:50px top; margin: auto; }

.feedback-input {
  color:white;
  font-family: Helvetica, Arial, sans-serif;
  font-weight:300;
  font-size: 18px;
  border-radius: 5px;
  line-height: 10px;
  background-color: transparent;
  border:2px solid #000000;
  transition: all 0.3s;
  padding: 13px;
  margin-bottom: 15px;
  width:100%;
  box-sizing: border-box;
  outline:0;
}

.feedback-input:focus { border:2px solid #CC4949; }

textarea {
  height: 150px;
  line-height: 100%;
  resize:vertical;
}

[type="submit"] {
  font-family: 'Montserrat', Arial, Helvetica, sans-serif;
  width: 100%;
  background:#000000;
  border-radius:5px;
  border:0;
  cursor:pointer;
  color:white;
  font-size:24px;
  padding-top:10px;
  padding-bottom:10px;
  transition: all 0.3s;
  margin-top:-4px;
  font-weight:700;
}
[type="submit"]:hover { background:#136d29; }


/* h1,
h2 {
  text-align: center;
}

p {
  margin-bottom: 20px;
}

form {
  align-items: center;
}

label {
  flex-grow: 1;
  margin-right: 10px;
}

label,
input,
select,
textarea {
  display: block;
  margin-top: 10px;
  margin-bottom: 10px;
}

input,
select,
textarea {
  width: 100%;
  padding: 10px;
  border-radius: 5px;
  font-family: Arial, sans-serif;
  box-shadow: 0px 2px 6px #888888;
}

textarea {
  height: 80px;
}

div {
  align-items: center;
}

button {
  width: 100%;
  padding: 10px 20px;
  font-family: Arial, sans-serif;
  text-decoration: none;
  color: #333;
  background-color: #f5f5f5;
  border: none;
  border-radius: 5px;
  box-shadow: 0 2px 6px #888888;
  cursor: pointer;
} */
</style>


  

