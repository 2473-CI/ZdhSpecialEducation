import { defineStore } from "pinia";
import Axios from "../request";

// 存储当前用户信息
export const useUserStore = defineStore("user", {
  state: () => {
    return {
      userList: [],
      teacherList: [],
      total: 0,
      page: 1,
      size: 10,
      searchUser: {
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
      const data = await Axios.post(
        `/teacher/search?page=${this.page}&size=${this.size}`,
        this.searchUser
      );
      this.total = data.data.length;
      this.userList = data.data;
      console.log(data);
    },

    // async newSearch(){
    //   const data = await Axios.post(`/teacher/`)
    // }
    async selfSearch(id) {
      console.log("搜索");
      const data = await Axios.post(`/teacher/search?page=1&size=99`, {
        schoolId: id,
        userName: this.searchUser.userName,
        userPhone: this.searchUser.userPhone,
        userMail: this.searchUser.userPhone,
      });
      this.total = data.data.length;
      this.userList = data.data;
      console.log(data);
    },
  },
});
