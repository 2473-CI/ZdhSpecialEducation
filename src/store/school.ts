import { defineStore } from 'pinia';

// Pinia 容器规范
export const useSchoolStore = defineStore('SchoolStore', {
    state: () => {
        return {
            schoolList: [
                {id:0, schoolName: "苏州市相城区特殊教育学校", schoolId: "5f4c6b2857852c176c03aacf"},
                // {id:1, schoolName: "苏州信息职业技术学院", schoolId: "5f4c6b2857852c176c03aac1"}
            ]
        }
    },

    getters: {

    },

    actions: {

    }
})