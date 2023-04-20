<template>
    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>Year</th>
                    <th>Model</th>
                    <th>Color</th>
                    <th>License</th>
                    <th>Price/Day</th>
                    <th>Availability</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(car, index) in cars" :key="`car${index}`">
                    <td>{{ car.year }}</td>
                    <td>{{ car.type }}</td>
                    <td>{{ car.color }}</td>
                    <td>{{ car.license }}</td>
                    <td>{{ car.dailyRate }}</td>
                    <td>{{ car.isAvailable ? 'Available' : 'Not Available' }}</td>
                </tr>
            </tbody>
        </table>
    </div>
</template>
  
<script>
import * as bootstrap from "bootstrap";
import { useUrlStore } from "@/stores/url";
import { useLoginStore } from "@/stores/login";
const storeUrl = useUrlStore();
const storeLogin = useLoginStore();

export default {
    data() {
        return {
            storeUrl,
            storeLogin,
            cars: [],
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
    },

}
</script>
  
<style>
.table-container {
    max-width: 800px;
    margin: auto;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th,
td {
    text-align: left;
    padding: 8px;
    border-bottom: 1px solid #ddd;
}

th {
    background-color: #f2f2f2;
}
</style>
  