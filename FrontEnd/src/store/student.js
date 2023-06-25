import { defineStore } from "pinia";
import Axios from "../request/index";

export const useStudentStore = defineStore("student", {
  state: () => {
    return {
      studentList: [],
      total: 0,
      page: 1,
      size: 10,
      searchStudent: {
        schoolId: "",
        studentName: "",
        clazzId: "",
        studentGender: "",
        obstacleId: "",
        arrangeId: "",
      },
      studentQuery: {
        headUrl: "",
        name: "",
        schoolName: "",
        className: "",
        sex: "",
        obstacle: "",
        studentId: "",
        arrangeName: "",
      },
    };
  },

  getters: {},
  actions: {
    async search() {
      const data = await Axios.post(
        `/student/search?page=${this.page}&size=${this.size}`,
        this.searchStudent
      );
      this.total = data.length;
      this.studentList = data.data;
      console.log(this.studentList);
    },
    getStorage() {
      localStorage.setItem("sq", JSON.stringify(this.studentQuery));
    },
    async selfSearch(id) {
      const data = await Axios.post(`/student/search?page=1&size=99`, {
        schoolId: id,
        studentName: this.searchStudent.studentName,
        clazzId: this.searchStudent.clazzId,
        studentGender: this.searchStudent.studentGender,
        obstacleId: this.searchStudent.obstacleId,
        arrangeId: this.searchStudent.arrangeId,
      });
      this.total = data.length;
      this.studentList = data.data;
      console.log(this.studentList);
    },
  },
});
