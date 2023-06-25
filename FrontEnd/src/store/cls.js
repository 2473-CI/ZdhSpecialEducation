import { defineStore } from "pinia";
import Axios from "../request/index";

export const useClassStore = defineStore("class", {
  state: () => {
    return {
      classList: [],
      total: 0,
      page: 1,
      size: 10,
      searchClass: {
        schoolId: "",
        gradeId: "",
        clazzName: "",
      },
    };
  },

  getters: {},
  actions: {
    async search() {
      const data = await Axios.post(
        `/clazz/search?page=${this.page}&size=${this.size}`,
        this.searchClass
      );
      this.total = data.length;
      this.classList = data.data;
    },

    async selfSearch(id) {
      const data = await Axios.post(`/clazz/search?page=1&size=99`, {
        schoolId: id,
        gradeId: this.searchClass.gradeId,
        clazzName: this.searchClass.clazzName,
      });
      this.total = data.length;
      this.classList = data.data;
      console.log(data);
    },
  },
});
