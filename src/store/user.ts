import { defineStore } from "pinia";
import Axios from "../request";

// 存储当前用户信息
export const useUserStore = defineStore("user", {
  state: () => {
    return {
      userList: [],
      searchUser: {
        page: 1,
        size: 20,
        schoolId: "",
        userName: "",
        userPhone: "",
        userMail: "",
      },
    };
  },

  getters: {},
  actions: {
    async search() {
      const data = Axios.post(
        "http://192.168.10.144:8080/user/search?page=1&size=2",
        this.searchUser
      );
      console.log(data);
    },
  },
});
