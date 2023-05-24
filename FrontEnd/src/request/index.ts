import axios from "axios";
import { router } from "../router";

const Axios = axios.create({
  // baseURL: "http://192.168.10.105:82",
  baseURL: "http://47.98.50.217:82",
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

Axios.interceptors.response.use(
  (response) => {
    const res = response.data;
    // const code = response.errorCode;
    // console.log("c", response);
    // console.log("拦截响应成功");
    return res;
  },
  (error) => {
    console.log("拦截响应失败");
    // console.log(error);
    // console.log(error.response.status);
    return Promise.reject(error);
  }
);

// Axios.interceptors.response.use(
//   (response) => {
//     console.log(response.status);
//     // 根据状态码进行处理
//     if (response.status === 200) {
//       const res = response.data;
//       // 处理响应数据
//       return res;
//     } else if (response.status === 401 || response.status === 403) {
//       // 处理未授权错误
//       console.log("未授权");
//       // 重定向到登录页面
//       router.push("/login");
//       return Promise.reject(response);
//     } else {
//       // 处理其他错误
//       console.log("发生错误", response);
//       return Promise.reject(response);
//     }
//   },
//   (error) => {
//     console.log("请求失败", error);
//     return Promise.reject(error);
//   }
// );

export default Axios;
