import { defineStore } from 'pinia';
import axios from 'axios'

export interface Cls {
    _id: string,  // 班级ID
    gradeCode: string,  // 班级代码
    name: string,  // 班级名称
    gradeName: string  // 年级
    msg?: string
    school?: string
}
/**
 {"current":1,"pageSize":20,"schoolId":["5f4c6b2857852c176c03aacf"],"pageNo":1}
 */

interface SearchClsImp {
    schoolId: string[]|string, // 学校ID
    current?: string,  
    gradeCode?: string,  // 年级代码
    name?: string,   // 班级名称
    pageSize?: number,  // 每页的大小
    pageNo?: number, // 第N页
}
export const useClsStore = defineStore('clsStore', {
    state: () => {
        return {
            clsList: [] as Cls[],
            searchClsImp: {} as SearchClsImp,
            Total: 0,
            gradeCodes: [
                {index: 1, name: "早教班(0-3)岁", gradeCode: 101},
                {index: 2, name: "小班", gradeCode: 102},
                {index: 3, name: "中班", gradeCode: 103},
                {index: 4, name: "大班", gradeCode: 104},
                {index: 5, name: "学前班", gradeCode: 105},
                {index: 6, name: "学前混龄", gradeCode: 106},
                {index: 7, name: "学前已毕业", gradeCode: 107},
                {index: 8, name: "一年级", gradeCode: 108},
                {index: 9, name: "二年级", gradeCode: 109},
                {index: 10, name: "三年级", gradeCode: 110},
                {index: 11, name: "四年级", gradeCode: 111},
                {index: 12, name: "五年级", gradeCode: 112},
                {index: 13, name: "六年级", gradeCode: 113},
                {index: 14, name: "七年级", gradeCode: 114},
                {index: 15, name: "八年级", gradeCode: 115},
                {index: 16, name: "九年级", gradeCode: 116},
                {index: 17, name: "义务混龄", gradeCode: 117},
                {index: 18, name: "义务已毕业", gradeCode: 118},
            ]
        }
    },

    getters: {

    },

    actions: {
        clear(){
            this.searchClsImp = {schoolId: ["5f4c6b2857852c176c03aacf"]}
        },
        update(stu: Cls){
            console.log(stu)
        },
        async delCls(clsId: string){
            console.log("删除班级" + clsId)
        },
        async search() {
            if(this.searchClsImp.schoolId == undefined || this.searchClsImp.schoolId.length==0){
                this.searchClsImp.schoolId = ["5f4c6b2857852c176c03aacf"]
            }
            var config = {
                method: 'post',
                url: 'https://www.yirenyian.com/api/cls/getList',
                headers: {
                    'accessKey': '5033b7eef85f81bbdf40df0fd5c383406611393d6b8775468d19e3a01fc91a17a9523e204e8e1e39d57a1bc58fb1c3fac5d8706708375549b8209e5879461b6022d57be79ad8fa5d5073447c7bf027c070e917996fe34bae69ed1a8d4afcf824c3e59a43bf623c8806a64c95e882706d',
                    'Content-Type': 'application/json'
                },
                data: JSON.stringify(this.searchClsImp)
            };
            const { data: { data } } = await axios(config);            
            this.clsList = data.rows
            this.Total = data.total
        },
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