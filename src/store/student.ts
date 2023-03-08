import { defineStore } from 'pinia';
import axios from 'axios'

export interface Student {
    _id: string, // id
    clsId: string, // 班级ID
    clsName: string,  // 班级名称
    name: string, // 学生姓名
    avatar: string, // 头像地址
    sex: string, // 性别
    birthday: string, // 生日
    obstacleType: string, // 残疾类型
    placement: string, // 安置方式 (特殊学校|随班就读...)
    schoolId: string // 学校ID
}

interface SearchStuImp {
    current?: number,
    pageSize?: number,
    schoolId: string[]|string,
    clsId?: string,
    name?: string,
    sex?: string,
    obstacleType?: string,
    placement?: string,
    pageNo?: number
}

export const useStudentStore = defineStore('studentStore', {
    state: () => {
        return {
            Students: [],
            Sex: [{name: "男", value: 1}, {name: "女", value: 2}],
            searchStuImp: {schoolId: []} as SearchStuImp,
            Total: 0
        }
    },

    getters: {
        getSex(){
            
        }
    },

    actions: {
        clear(){
            this.searchStuImp = {schoolId: ["5f4c6b2857852c176c03aacf"]}
        },
        async delStu(stuId: string){
            console.log(stuId+ "被删除")
        },
        async search() {
            if(this.searchStuImp.schoolId == undefined || this.searchStuImp.schoolId.length == 0 ){
                this.searchStuImp.schoolId = ["5f4c6b2857852c176c03aacf"]
            }
            console.log(this.searchStuImp)
            var config = {
                method: 'post',
                maxBodyLength: Infinity,
                url: 'https://www.yirenyian.com/api/student/getList',
                headers: {
                    'accessKey': '5033b7eef85f81bbdf40df0fd5c383406611393d6b8775468d19e3a01fc91a17a9523e204e8e1e39d57a1bc58fb1c3fac5d8706708375549b8209e5879461b6022d57be79ad8fa5d5073447c7bf027c070e917996fe34bae69ed1a8d4afcf824c3e59a43bf623c8806a64c95e882706d',
                    'Content-Type': 'application/json'
                },
                data: JSON.stringify(this.searchStuImp)
            };
            const { data: { data } } = await axios(config);            
            this.Students = data.rows
            this.Total = data.total
            // console.log(this.Students)
        }
    }
})