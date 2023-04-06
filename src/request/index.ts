import axios from "axios";
import { router } from "../router";

const Axios = axios.create({
  // baseURL: "http://192.168.10.142:8080",
  baseURL: "http://47.115.207.245:8080",
  timeout: 5000,
});

Axios.interceptors.request.use(
  (config) => {
    config.headers["Content-Type"] = "application/json;charset=UTF-8";
    if (localStorage.getItem("user")) {
      config.headers["token"] = localStorage.getItem("user");
    }
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

Axios.interceptors.response.use((response) => {
  // console.log(response.status);
  const res = response.data;
  // console.log(res);
  // if () {
  //   localStorage.clear();
  //   router.replace("/login");
  // }

  return res;
});

export default Axios;
