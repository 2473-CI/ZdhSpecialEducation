import { defineStore } from 'pinia';
import axios from 'axios'

interface Cls {
    _id: string,  // 班级ID
    gradeCode: string,  // 班级代码
    name: string,  // 班级名称
    gradeName: string  // 年级
}
/**
 *                 "_id": "5f4c6ccc57852c176c03aada",
                "gradeCode": "206",
                "name": "启智9班",
                "gradeName": "六年级"
 */

// Pinia 容器规范
export const useClsStore = defineStore('clsStore', {
    state: () => {
        return {
            clsList: [] as Cls[]
        }
    },

    getters: {

    },

    actions: {
        async loadClsList(schoolId: string) {
            var body = JSON.stringify({
                "isForOption": true,
                "pageSize": 1000,
                "schoolId": schoolId
            });

            var config = {
                method: 'post',
                url: 'https://www.yirenyian.com/api/cls/getList',
                headers: {
                    'accessKey': '5033b7eef85f81bbdf40df0fd5c383406611393d6b8775468d19e3a01fc91a17a9523e204e8e1e39d57a1bc58fb1c3fac5d8706708375549b8209e5879461b6022d57be79ad8fa5d5073447c7bf027c070e917996fe34bae69ed1a8d4afcf824c3e59a43bf623c8806a64c95e882706d',
                    'Content-Type': 'application/json'
                },
                data: body
            };
            const { data: { data } } = await axios(config);            
            this.clsList = data.rows
        }
    }
})