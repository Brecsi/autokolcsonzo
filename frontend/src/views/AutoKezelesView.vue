
<template>
  <div>
    <h1>Manage Cars</h1>

    <!--#region táblázat -->
    <table class="table table-bordered table-hover">
      <thead>
        <tr>
          <th>
            <!-- New car -->
            <button
              type="button"
              class="btn btn-success btn-sm"
              @click="onClickNew()"
            >
              New car
            </button>
          </th>
          <th>Edit</th>
          <th @click="sort('year')">Manufacture year</th>
          <th @click="sort('type')">Type (brand, model)</th>
          <th @click="sort('color')">Color</th>
          <th @click="sort('license')">Licence number</th>
          <th @click="sort('dailyRate')">Daily rate</th>
        </tr>
      </thead>
      <tbody v-for="(car, index) in sortedCars" :key="`car${index}`">
        <tr :class="currentRowBackground(car.id)" @click="onClikRow(car.id)">
          <td class="text-nowrap">
            <!-- törlés -->
            <button
              type="button"
              class="btn btn-danger btn-sm"
              @click="onClickDelete(car.id)"
            >
              <i class="bi bi-trash3-fill"></i>
            </button>

            <!-- módosítás -->
            
          </td>
          <td>
            <button
              type="button"
              class="btn btn-primary btn-sm ms-2 w-auto"
              @click="onClickEdit(car.id)"
            >
              <i class="bi bi-pencil-fill"></i>
            </button>
          </td>
          <td>{{ car.year }}</td>
          <td>{{ car.type }}</td>
          <td>{{ car.color }}</td>
          <td>{{ car.license }}</td>
          <td>{{ car.dailyRate }}</td>
        </tr>
      </tbody>
    </table>
      <th>
        <button class="btn btn-dark btn-sm" @click="prevPage">Previous</button>
      </th>
      <th>
        <button class="btn btn-dark btn-sm" @click="nextPage">Next</button>
      </th>
    page
    {{ currentPage }}
    <!--#endregion táblázat -->

    <!--#region Modal -->
    <div
      class="modal fade"
      id="modalCar"
      tabindex="-1"
      aria-labelledby="modalCarModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">
              {{ stateTitle }}
            </h1>
            <button
              type="button"
              class="btn-close"
              @click="onClickCancel()"
              aria-label="Close"
            ></button>
          </div>

          <!--#region Modal body -->
          <div class="modal-body">
            <!--#region Form -->

            <form class="row g-3 needs-validation" novalidate>
              <!-- Autó név -->
              <div class="col-md-12">
                <label for="year" class="form-label">Manufacture year</label>
                <input
                  type="text"
                  class="form-control"
                  id="year"
                  required
                  v-model="editableCar.year"
                />
                <div class="invalid-feedback">This field is mandatory</div>
              </div>

              <div class="col-md-6">
                <label for="color" class="form-label">Color</label>
                <input
                  type="text"
                  class="form-control"
                  id="color"
                  required
                  v-model="editableCar.color"
                />
                <div class="invalid-feedback">This field is mandatory</div>
              </div>

              <!-- Rendszám -->
              <div class="col-md-6">
                <label for="type" class="form-label">Type (brand, model)</label>
                <input
                  type="text"
                  class="form-control"
                  id="type"
                  required
                  v-model="editableCar.type"
                />
                <div class="invalid-feedback">This field is mandatory</div>
              </div>

              <!-- Rendszám -->
              <div class="col-md-6">
                <label for="license" class="form-label">Licence number</label>
                <input
                  type="text"
                  class="form-control"
                  id="license"
                  required
                  v-model="editableCar.license"
                />
                <div class="invalid-feedback">This field is mandatory</div>
              </div>
              <div class="col-md-6">
                <label for="dailyRate">Daily rate</label>
                <input
                  type="number"
                  class="form-control"
                  id="dailyRate"
                  required
                  v-model="editableCar.dailyRate"
                />
              </div>
            </form>
            <!--#endregion Form -->
          </div>
          <!--#endregion Modal body -->

          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              @click="onClickCancel()"
            >
              Close
            </button>
            <button
              type="button"
              class="btn btn-primary"
              @click="onClickSave()"
            >
              Save changes
            </button>
          </div>
        </div>
      </div>
    </div>
    <!--#endregion Modal -->
  </div>
</template>

<script>
import * as bootstrap from "bootstrap";
import { useUrlStore } from "@/stores/url";
import { useLoginStore } from "@/stores/login";
const storeUrl = useUrlStore();
const storeLogin = useLoginStore();

class Car {
  constructor(
    id = 0,
    license = null,
    type = null,
    year = null,
    color = null,
    dailyRate = null
  ) {
    this.id = id;
    this.license = license;
    this.type = type;
    this.year = year;
    this.color = color;
    this.dailyRate = dailyRate;
  }
}

export default {
  data() {
    return {
      storeUrl,
      storeLogin,
      cars: [],
      editableCar: new Car(),
      modal: null,
      form: null,
      state: "view",
      currentId: null,
      currentSort: "name",
      currentSortDir: "asc",
      pageSize: 10,
      currentPage: 1,
    };
  },
  mounted() {
    this.getCars();
    this.modal = new bootstrap.Modal(document.getElementById("modalCar"), {
      keyboard: false,
    });

    this.form = document.querySelector(".needs-validation");
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
      // this.cars = data.data.map((car) => {
      //   car.outOfTraffic = car.outOfTraffic === 1;
      //   return car;
      // });
    },

    async getCarsByYear() {
      let url = this.storeUrl.urlCarsByYear;
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

    async getCarById(id) {
      let url = `${this.storeUrl.urlCars}/${id}`;
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.editableCar = data.data;
    },
    
    async postCar() {
      let url = this.storeUrl.urlCars;
      const body = JSON.stringify(this.editableCar);
      const config = {
        method: "POST",
        headers: {
          "content-type": "application/json",
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
        body: body,
      };
      const response = await fetch(url, config);
      const data = await response.json();
      console.log(data.data);
      this.getCars();
    },
    async putCar() {
      const id = this.editableCar.id;
      let url = `${this.storeUrl.urlCars}/${id}`;
      const body = JSON.stringify(this.editableCar);
      const config = {
        method: "PUT",
        headers: {
          "content-type": "application/json",
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
        body: body,
      };
      const response = await fetch(url, config);
      this.getCars();
    },
    async deleteCar(id) {
      let url = `${this.storeUrl.urlCars}/${id}`;
      const config = {
        method: "DELETE",
        headers: {
          "content-type": "application/json",
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      this.getCars();
    },
    sort: function (s) {
      //if s == current sort, reverse
      if (s === this.currentSort) {
        this.currentSortDir = this.currentSortDir === "asc" ? "desc" : "asc";
      }
      this.currentSort = s;
    },
    nextPage: function () {
      if (this.currentPage * this.pageSize < this.cars.length)
        this.currentPage++;
    },
    prevPage: function () {
      if (this.currentPage > 1) this.currentPage--;
    },
    onClikRow(id) {
      this.currentId = id;
    },
    onClickNew() {
      this.state = "new";
      this.currentId = null;
      this.editableCar = new Car();
      this.modal.show();
    },
    onClickDelete(id) {
      this.state = "delete";
      this.deleteCar(id);
      this.currentId = null;
    },
    onClickEdit(id) {
      this.state = "edit";
      this.getCarById(id);
      this.modal.show();
    },
    onClickCancel() {
      this.editableCar = new Car();
      this.modal.hide();
    },
    onClickSave() {
      this.form.classList.add("was-validated");
      if (this.form.checkValidity()) {
        if (this.state == "edit") {
          //put
          this.putCar();
          // this.modal.hide();
        } else if (this.state == "new") {
          //post
          this.postCar();
          // this.modal.hide();
        }
        this.modal.hide();
        //frissíti a taxisok listáját
      }
    },
    currentRowBackground(id) {
      return this.currentId == id ? "my-bg-current-row" : "";
    },
  },
  computed: {
    stateTitle() {
      if (this.state === "new") {
        return "New car";
      } else if (this.state === "edit") {
        return "Edit car";
      }
    },
    sortedCars: function () {
      return this.cars
        .sort((a, b) => {
          let modifier = 1;
          if (this.currentSortDir === "desc") modifier = -1;
          if (a[this.currentSort] < b[this.currentSort]) return -1 * modifier;
          if (a[this.currentSort] > b[this.currentSort]) return 1 * modifier;
          return 0;
        })
        .filter((row, index) => {
          let start = (this.currentPage - 1) * this.pageSize;
          let end = this.currentPage * this.pageSize;
          if (index >= start && index < end) return true;
        });
    },
  },
};
</script>


<style>
.my-bg-current-row {
  background-color: lightgrey;
}

td,
th {
  padding: 5px;
}

th {
  cursor: pointer;
}
</style>
