import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "home",
      component: HomeView,
      meta: {
        requiresAuth: false,
        title: "Home / Junkie Rental",
      },
    },
    {
      path: "/about",
      name: "about",
      component: () => import("@/views/AboutView.vue"),
      meta: {
        requiresAuth: false,
        title: "About / Junkie Rental",
      },
    },

    {
      path: "/privacypolicy",
      name: "privacypolicy",
      component: () => import("@/views/PrivacyPolicy.vue"),
      meta: {
        requiresAuth: false,
        title: "Privacy Policy / Junkie Rental",
      },
    },

    {
      path: "/kolcsonzesek",
      name: "kolcsonzesek",
      component: () => import("@/views/KolcsonzesekView.vue"),
      meta: {
        requiresAuth: true,
        title: "Rents / Junkie Rental",
      },
    },
    {
      path: "/autoKezeles",
      name: "autoKezeles",
      component: () => import("@/views/AutoKezelesView.vue"),
      meta: {
        requiresAuth: true,
        title: "Manage Cars / Junkie Rental",
      },
    },
    {
      path: "/autok",
      name: "autok",
      component: () => import("@/views/CarsView.vue"),
      meta: {
        requiresAuth: false,
        title: "Cars / Junkie Rental",
      }
    },
    {
      path: "/offers",
      name: "offers",
      component: () => import("@/views/OffersView.vue"),
      meta: {
        requiresAuth: false,
        title: "Offers / Junkie Rental",
      }
    },
    {
      path: "/faq",
      name: "faq",
      component: () => import("@/views/FAQView.vue"),
      meta: {
        requiresAuth: false,
        title: "FAQ / Junkie Rental",
      }
    },
    {
      path: "/help",
      name: "help",
      component: () => import("@/views/HelpView.vue"),
      meta: {
        requiresAuth: false,
        title: "Help / Junkie Rental",
      }
    },
    {
      path: "/kolcsonzokKezelese",
      name: "kolcsonzok",
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import("@/views/kolcsonzokView.vue"),
      meta: {
        requiresAuth: true,
        title: "Renters / Junkie Rental",
      },
    },
    {
      path: "/bookRent",
      name: "bookRent",
      component: () => import("@/views/BookRentView.vue"),
      meta: {
        requiresAuth: false,
        title: "Register Rent / Junkie Rental",
      },
    },
    {
      path: "/rentRegister",
      name: "rentRegister",
      component: () => import("@/views/RegisterRentView.vue"),
      meta: {
        requiresAuth: true,
        title: "Register Rent / Junkie Rental",
      },
    },
    {
      path: "/count1",
      name: "count1",
      component: () => import("@/views/Count1View.vue"),
      meta: {
        requiresAuth: true,
        title: "Counter 1 / Taxi",
      },
    },
    {
      path: "/admin",
      name: "admin",
      component: () => import("@/views/AdminPanelView.vue"),
      meta: {
        requiresAuth: true,
        title: "Admin Panel / Junkie Rental",
      },
    },
    {
      path: "/count2",
      name: "count2",
      component: () => import("../views/Count2View.vue"),
      meta: {
        requiresAuth: true,
        title: "Counter 2 / Taxi",
      },
    },
    {
      path: "/login",
      name: "login",
      component: () => import("@/views/LoginView.vue"),
      meta: {
        requiresAuth: false,
        title: "Login / Junkie Rental",
      },
    },
    {
      path: "/:pathMatch(.*)*",
      name: "PageNotFound",
      component: () => import("../views/404View.vue"),
      meta: {
        requiresAuth: false,
        title: "404 / Junkie Rental",
      },
    },
  ],
});

export default router;
