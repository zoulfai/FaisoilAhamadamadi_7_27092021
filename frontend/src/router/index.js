//Le fichier router contient tout le code permettant la navigation de l'utilisateur sur le site
import { createRouter, createWebHashHistory } from "vue-router";
import MyHome from "../views/MyHome.vue";


const routes = [
  {
    path: "/home",
    name: "MyHome",
    component: MyHome,
  },
  {
    path: "/",
    name: "MySignup",
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/MySignup.vue"),
  },
  {
    path: '/user/:userId',
    name: 'MyUser',
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/MyUser.vue"),
  },
  {
    path: '/settings',
    name: 'MySetting',
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/MySetting.vue"),
  },
];

const router = createRouter({
  history: createWebHashHistory(),
  routes,
});

export default router;
