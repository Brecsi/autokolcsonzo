<template>
  <div id="app">
    <div class="login-page">
      <div class="container">
        <div class="row">
          <div class="col-lg-4 col-md-6 col-sm-8 w-auto mx-auto">
            <div
              v-if="!registerActive"
              class="card login"
              v-bind:class="{ error: emptyFields }"
            >
              <h1>Sign In</h1>
              <form class="form-group">
                <input
                  type="text"
                  class="form-control"
                  id="userName"
                  v-model="storeLogin.userName"
                  placeholder="Username"
                  required
                />
                <input
                  type="password"
                  class="form-control"
                  id="password"
                  v-model="storeLogin.password"
                  placeholder="Password"
                  required
                />
                <button type="button" class="btn btn-primary" @click="login()">
                  Login
                </button>
                <p>
                  Don't have an account?
                  <a
                    href="#"
                    @click="
                      (registerActive = !registerActive), (emptyFields = false)
                    "
                    >Sign up here</a
                  >
                </p>
                <div
                  v-if="loginErrorMessage"
                  class="alert alert-danger"
                  role="alert"
                >
                  {{ loginErrorMessage }}
                </div>
              </form>
            </div>

            <div
              v-else
              class="card register"
              v-bind:class="{ error: emptyFields }"
            >
              <h1>Sign Up</h1>
              <form class="form-group">
                <input
                  type="text"
                  class="form-control"
                  id="userName"
                  v-model="storeLogin.userName"
                  placeholder="Username"
                  required
                />
                <input
                  type="password"
                  class="form-control"
                  id="password"
                  v-model="storeLogin.password"
                  placeholder="Password"
                  required
                />
                <button class="btn btn-primary" @click="Register()">
                  Register
                </button>
                <p>
                  Already have an account?
                  <a
                    href="#"
                    @click="
                      (registerActive = !registerActive), (emptyFields = false)
                    "
                    >Sign in here</a
                  >
                </p>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { useUrlStore } from "@/stores/url";
const storeUrl = useUrlStore();
import { useLoginStore } from "@/stores/login";
import router from "../router";
const storeLogin = useLoginStore();
export default {
  data() {
    return {
      storeUrl,
      storeLogin,
      loginErrorMessage: null,
    };
  },
  methods: {
    loginErrorMessageShow(message) {
      this.loginErrorMessage = message;
      setTimeout(() => {
        this.loginErrorMessage = null;
      }, 3000);
    },
    async login() {
      const url = this.storeUrl.urlLogin;
      const user = {
        userName: this.storeLogin.userName,
        password: this.storeLogin.password,
      };
      const config = {
        method: "POST",
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json",
        },
        body: JSON.stringify(user),
      };
      try {
        // this.errorMessage = null;
        const response = await fetch(url, config);
        if (!response.ok) {
          this.loginErrorMessageShow("Server error 1");
          return;
        }
        const data = await response.json();
        if (data.success) {
          //sikeres bejelentkezés
          this.storeLogin.loginSuccess = data.success;
          this.storeLogin.accessToken = data.data.accessToken;
          this.storeLogin.refreshToken = data.data.refreshToken;
          this.storeLogin.userId = data.data.userId;
          this.storeLogin.number = data.data.number;
          this.storeLogin.loginSuccess = data.success;
          this.storeLogin.accessTime = parseInt(data.data.accessTime);
          router.push("/");
          // this.timer();
          // this.getTodos();
        } else {
          //sikertelen bejelenkezés
          this.loginErrorMessageShow("Username or password incorrect");
        }
      } catch (error) {
        // this.errorMessage = `Server error`;
        this.loginErrorMessageShow("Server error");
      }
    },
  },
};
</script>

<style>
.my-width-login {
  max-width: 500px;
}

p {
  line-height: 1rem;
}

.card {
  padding: 20px;
}

.login-page {
  align-items: center;
  display: flex;
  height: 500px;
}

h1 {
      margin-bottom: 1.5rem;
   }
</style>