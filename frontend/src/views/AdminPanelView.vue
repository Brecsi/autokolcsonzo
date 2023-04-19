<template>
  <div>
    <h1>Admin panel</h1>
    <table class="table table-bordered table-hover table-dark ">
      <thead>
        <tr>
          <th>
            <!-- New user -->
            <button
              type="button"
              class="btn btn-success btn-sm"
              @click="onClickNew()"
            >
              New User
            </button>
          </th>
          <th>First Name</th>
          <th>Last Name</th>
          <th>Gender</th>
          <th>Username</th>
          <th>E-mail</th>
          <th>Status</th>
        </tr>
      </thead>
      <tbody v-for="(user, index) in users"
          :key="`user${index}`">
        <tr>
          <td class="text-nowrap">
            <!-- törlés -->
            <button
              type="button"
              class="btn btn-danger btn-sm"
              @click="onClickDelete(user.id)"
            >
              <i class="bi bi-trash3-fill"></i>
            </button>

            <!-- módosítás -->
            <button
              type="button"
              class="btn btn-primary btn-sm ms-2"
              @click="onClickEdit(user.id)"
            >
              <i class="bi bi-pencil-fill"></i>
            </button>
          </td>
          <td>{{ user.firstName }}</td>
          <td>{{ user.lastName }}</td>
          <td>{{ user.gender }}</td>
          <td>{{ user.userName }}</td>
          <td>{{ user.email }}</td>
          <td>{{ user.number }}</td>
        </tr>
      </tbody>
    </table>

    <div
      class="modal fade"
      id="modalUser"
      tabindex="-1"
      aria-labelledby="modalUserModalLabel"
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
              <div class="col-md-12">
                <label for="firstName" class="form-label">First name</label>
                <input
                  type="text"
                  class="form-control"
                  id="firstName"
                  required
                  v-model="editableUser.firstName"
                />
                <div class="invalid-feedback">This field is mandatory</div>
              </div>

              <div class="col-md-12">
                <label for="lastName" class="form-label">Last name</label>
                <input
                  type="text"
                  class="form-control"
                  id="lastName"
                  required
                  v-model="editableUser.lastName"
                />
                <div class="invalid-feedback">This field is mandatory</div>
              </div>

              <div class="col-md-12">
                <label for="gender" class="form-label">Gender</label>
                <input
                  type="text"
                  class="form-control"
                  id="gender"
                  required
                  v-model="editableUser.gender"
                />
                <div class="invalid-feedback">This field is mandatory</div>
              </div>

              <div class="col-md-6">
                <label for="userName" class="form-label">Username</label>
                <input
                  type="text"
                  class="form-control"
                  id="userName"
                  required
                  v-model="editableUser.userName"
                />
                <div class="invalid-feedback">
                  This field is mandatory
                </div>
              </div>

              
              <div class="col-md-6">
                <label for="email" class="form-label">Email</label>
                <input
                type="text"
                class="form-control"
                id="email"
                required
                v-model="editableUser.email"
                />
                <div class="invalid-feedback">
                  This field is mandatory
                </div>
              </div>
              
              <div class="col-md-6">
                <label for="password" class="form-label">Password</label>
                <input
                  type="text"
                  class="form-control"
                  id="password"
                  required
                  v-model="editableUser.password"
                />
                <div class="invalid-feedback">
                  This field is mandatory
                </div>
              </div>

              <div class="col-md-6">
                <label for="number" class="form-label"
                  >Status number</label
                >
                <input
                  type="text"
                  class="form-control"
                  id="number"
                  required
                  v-model="editableUser.number"
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

  </div>
</template>

<script>
import * as bootstrap from "bootstrap";
import { useUrlStore } from "@/stores/url";
import { useLoginStore } from "@/stores/login";
const storeUrl = useUrlStore();
const storeLogin = useLoginStore();

class User {
  constructor(
      id = 0,
      firstName = null,
      lastName = null,
      gender = null,
      userName = null,
      email = null,
      password = null,
      number = null,
  ) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.gender = gender;
    this.userName = userName;
    this.email = email;
    this.password = password;
    this.number = number;
  }
}

export default{
  data(){
    return{
      storeUrl,
      storeLogin,
      users: [],
      editableUser: new User(),
      modal: null,
      form: null,
      state: "view",
    };
  },
  mounted() {
    this.getUsers();
    this.modal = new bootstrap.Modal(document.getElementById("modalUser"), {
      keyboard: false,
    });

    this.form = document.querySelector(".needs-validation");
  },
  methods: {
    async getUsers() {
      let url = this.storeUrl.urlUsers;
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.users = data.data;
    },
    async getUserById(id) {
      let url = `${this.storeUrl.urlUsers}/${id}`;
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.editableUser = data.data;
    },
    async postUser() {
      let url = this.storeUrl.urlUsers;
      const body = JSON.stringify(this.editableUser);
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
      this.getUsers();
    },
    async putUser() {
      const id = this.editableUser.id;
      let url = `${this.storeUrl.urlUsers}/${id}`;
      const body = JSON.stringify(this.editableUser);
      const config = {
        method: "PUT",
        headers: {
          "content-type": "application/json",
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
        body: body,
      };
      const response = await fetch(url, config);
      this.getUsers();
    },
    async deleteUser(id) {
      let url = `${this.storeUrl.urlUsers}/${id}`;
      const config = {
        method: "DELETE",
        headers: {
          "content-type": "application/json",
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      this.getUsers();
    },
    onClickNew() {
      this.state = "new";
      this.editableUser = new User();
      this.modal.show();
    },
    onClickDelete(id){
      this.state = "delete";
      this.deleteUser(id);
      this.modal.show();
    },
    onClickEdit(id) {
      this.state = "edit";
      this.getUserById(id);
      this.modal.show();
    },
    onClickCancel() {
      this.editableUser = new User();
      this.modal.hide();
    },
    onClickSave() {
      this.form.classList.add("was-validated");
      if (this.form.checkValidity()) {
        if (this.state == "edit") {
          this.putUser();
        }else if (this.state = "new") {
          this.postUser();
        }
        this.modal.hide();
      }
    }
  },
  computed: {
    stateTitle() {
      if (this.state === "new") {
        return "New User";
      } else if (this.state === "edit") {
        return "Edit User";
      }
    },
  },
}

</script>


<style>
</style>
