import { defineStore } from "pinia";
import Axios from "../request";

// 存储当前用户信息
export const useUserStore = defineStore("user", {
  state: () => {
    return {
      userList: [],
      total: 0,
      searchUser: {
        page: 1,
        size: 10,
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
      console.log("搜索");
      console.log(this.searchUser.page);
      const data = await Axios.post(
        `/user/search?page=${this.searchUser.page}&size=${this.searchUser.size}`,
        this.searchUser
      );
      this.total = data.length;
      this.userList = data.data;
      console.log(data);
    },
  },
});
