import { defineStore } from "pinia";

export const useUrlStore = defineStore({
  id: "url",
  state: () => ({
    urlData: "http://localhost:3000",
    urlAuth: "http://localhost:4000",
  }),
  getters: {
    urlLogin() {
      return `${this.urlAuth}/login`;
    },
    urlLogout() {
      return `${this.urlAuth}/logout`;
    },
    urlToken() {
      return `${this.urlAuth}/token`;
    },
    urlCars(){
      return `${this.urlData}/cars`
    },
    urlCarsWithLoans(){
      return `${this.urlData}/carsWithLoans`
    },
    urlUsers(){
      return `${this.urlData}/users`
    },
    urlLoaners(){
      return `${this.urlData}/loaners`
    },
    urlLoans(){
      return `${this.urlData}/loans`
    },
    urlCarsByYear(){
      return `${this.urlData}/carsByYear`
    },
    urlCarsAvailability(){
      return `${this.urlData}/carsAvailability`
    }
  },
});
