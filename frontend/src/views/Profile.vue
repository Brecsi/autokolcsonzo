<template>
    <div class="container bootstrap snippets bootdey">
<div class="panel-body inf-content">
    <div class="row">
        <div class="col-md-4">
            <h2>Profile</h2>
        </div>
        <div class="col-md-6">
            <div class="table-responsive">
            <table class="table table-user-information" v-for="(user, index) in users" :key="`user${index}`">
                <tbody v-if="storeLogin.userId == user.id">
                    <tr>        
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-asterisk text-primary"></span>
                                <i class="bi bi-person-vcard"></i> Identificacion                                                
                            </strong>
                        </td>
                        <td>
                            123456789     
                        </td>
                    </tr>
                    <tr>    
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-user  text-primary"></span>    
                                <i class="bi bi-person-vcard"></i> Name                                                
                            </strong>
                        </td>
                        <td>
                            {{user.firstName}} {{ user.lastName }}    
                        </td>
                    </tr>
                    <tr>        
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-bookmark text-primary"></span> 
                                <i class="bi bi-person"></i> Username                                                
                            </strong>
                        </td>
                        <td>
                            {{ user.userName }} 
                        </td>
                    </tr>


                    <tr>        
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-eye-open text-primary"></span> 
                                <i class="bi bi-r-circle"></i> Role                                                
                            </strong>
                        </td>
                        <td>
                            {{ role }}
                        </td>
                    </tr>
                    <tr>        
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-envelope text-primary"></span> 
                                <i class="bi bi-envelope"></i> Email                                                
                            </strong>
                        </td>
                        <td>
                            {{ user.email }}
                        </td>
                    </tr>                                    
                </tbody>
            </table>
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
    number = null
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

export default {
  data() {
    return {
      storeUrl,
      storeLogin,
      users: [],
      editableUser: new User(),
    //   modal: null,
    //   form: null,
      state: "view",
      role: null,
    };
  },
  mounted() {
    this.getUsers();
    // this.modal = new bootstrap.Modal(document.getElementById("modalUser"), {
    //   keyboard: false,
    // });

    console.log(storeLogin.number);

    // this.form = document.querySelector(".needs-validation");
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
      this.editableUser = data.data[0];
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
    onClickDelete(id) {
      let text = "Confirm delete?";
      if (confirm(text) == true) {
        this.state = "delete";
        this.deleteUser(id);
        this.modal.hide();
      }
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
        } else if ((this.state = "new")) {
          this.postUser();
        }
        this.modal.hide();
      }
    },
  },
  computed: {
    stateTitle() {
      if (this.state === "new") {
        return "New User";
      } else if (this.state === "edit") {
        return "Edit User";
      }
    },
    roleTitle(){
        if(storeLogin.number == 0){
            this.role = "Administrator";
        }else if(storeLogin.number == 1){
            this.role = "Page Editor";
        }else if(storeLogin.number == 2){
            this.role = "User";
        }
    },
  },
};
</script>

  
  <style>
   .inf-content{
    border:1px solid #DDDDDD;
    -webkit-border-radius:10px;
    -moz-border-radius:10px;
    border-radius:10px;
    box-shadow: 7px 7px 7px rgba(0, 0, 0, 0.3);
}	
  </style>
  