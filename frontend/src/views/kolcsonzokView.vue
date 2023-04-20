<template>
  <div>
    <h1>Registered Loaners</h1>
    <table class="table table-bordered table-hover w-auto">
      <thead>
        <tr>
          <th>
            <button class="btn btn-dark" type="button" @click="onClickNew()">
              New loaner
            </button>
          </th>
          <th>Name</th>
          <th>License number</th>
          <th>Phone number</th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="(loaner, index) in loaners"
          :key="`loaner${index}`"
          :class="currentRowBackground(loaner.id)"
          @click="onClikRow(loaner.id)"
        >
          <td class="text-nowrap">
            <!-- törlés -->
            <button
              type="button"
              class="btn btn-danger btn-sm"
              @click="onClickDelete(loaner.id)"
            >
              <i class="bi bi-trash3-fill"></i>
            </button>

            <!-- módosítás -->
            <button
              type="button"
              class="btn btn-primary btn-sm ms-2"
              @click="onClickEdit(loaner.id)"
            >
              <i class="bi bi-pencil-fill"></i>
            </button>
          </td>
          <td>{{ loaner.name }}</td>
          <td>{{ loaner.licenseNum }}</td>
          <td>{{ loaner.phoneNum }}</td>
        </tr>
      </tbody>
    </table>

<!--#region Modal -->
<div
      class="modal fade"
      id="modalLoaner"
      tabindex="-1"
      aria-labelledby="modalLoanerModalLabel"
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
                <label for="name" class="form-label">Loaner name</label>
                <input
                  type="text"
                  class="form-control"
                  id="name"
                  required
                  v-model="editableLoaner.name"
                />
                <div class="invalid-feedback">This field is mandatory</div>
              </div>

              <!-- Rendszám -->
              <div class="col-md-6">
                <label for="licenseNum" class="form-label">License number</label>
                <input
                  type="text"
                  class="form-control"
                  id="licenseNum"
                  required
                  v-model="editableLoaner.licenseNum"
                />
                <div class="invalid-feedback">
                    This field is mandatory
                </div>
              </div>
              <div class="col-md-12">
                <label for="phoneNum" class="form-label">Phone number</label>
                <input
                  type="text"
                  class="form-control"
                  id="phoneNum"
                  required
                  v-model="editableLoaner.phoneNum"
                />
                <div class="invalid-feedback">This field is mandatory</div>
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

class Loaner {
  constructor(id = null, name = null, licenseNum = null, phoneNum = null) {
    this.id = id;
    this.name = name;
    this.licenseNum = licenseNum;
    this.phoneNum = phoneNum;
  }
}

export default {
  data() {
    return {
      storeUrl,
      storeLogin,
      loaners: [],
      editableLoaner: new Loaner(),
      modal: null,
      form: null,
      state: "view",
      currentId: null,
    };
  },
  mounted() {
    this.getLoaners();
    this.modal = new bootstrap.Modal(document.getElementById("modalLoaner"), {
      keyboard: false,
    });

    this.form = doument.querySelector(".needs-validation");
  },
  methods: {
    async getLoaners() {
      let url = this.storeUrl.urlLoaners;
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.loaners = data.data;
    },
    async getLoanerById(id) {
      let url = `${this.storeUrl.urlLoaners}/${id}`;
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.editableLoaner = data.data;
    },
    async postLoaner() {
      let url = this.storeUrl.urlLoaners;
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
      this.getLoaners();
    },
    async putLoaner() {
      const id = this.editableLoaner.id;
      let url = `${this.storeUrl.urlLoaners}/${id}`;
      const body = JSON.stringify(this.editableLoaner);
      const config = {
        method: "PUT",
        headers: {
          "content-type": "application/json",
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
        body: body,
      };
      const response = await fetch(url, config);
      this.getLoaners();
    },
    async deleteLoaner(id) {
      let url = `${this.storeUrl.urlLoaners}/${id}`;
      const config = {
        method: "DELETE",
        headers: {
          "content-type": "application/json",
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      this.getLoaners();
    },
    onClikRow(id) {
      this.currentId = id;
    },
    onClickNew() {
      this.state = "new";
      this.currentId = null;
      this.editableLoaner = new Loaner();
      this.modal.show();
    },
    onClickDelete(id) {
      this.state = "delete";
      this.deleteLoaner(id);
      this.currentId = null;
    },
    onClickEdit(id) {
      this.state = "edit";
      this.getLoanerById(id);
      this.modal.show();
    },
    onClickCancel() {
      this.editableLoaner = new Loaner();
      this.modal.hide();
    },
    onClickSave() {
      this.form.classList.add("was-validated");
      if (this.form.checkValidity()) {
        if (this.state == "edit") {
          this.putLoaner();
        } else if (this.state == "new") {
          this.postLoaner();
        }
        this.modal.hide();
      }
    },
    currentRowBackground(id) {
      return this.currentId == id ? "my-bg-current-row" : "";
    },
  },
  computed: {
    stateTitle() {
        if (this.state === "new") {
            return "New loaner"
        }else if (this.state === "edit") {
            return "Edit loaner"
        }
    }
  }
};
</script>

<style>
</style>