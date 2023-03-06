import { defineStore } from 'pinia';
import axios from 'axios'


interface UserInfo {
    _id: string,
    schoolIdList: [],
    avatar: string,
    isDeleted: boolean,
    manageClassList: [],
    teachClassList: [],
    isSpecialTeach: true,
    specialStuIdList: [],
    childStuIdList: [],
    authSystemList: [],
    totalVisitCount: number,
    exp: number,
    role: string,
    account: string,
    name: string,
    sex: string,
    phone: string,
    schoolId: string,
    schoolName: string,
    customList: [],
    password: string,
    createdAt: string,
    updatedAt: string,
    __v: number,
    lastVisitDate: string,
    lastVisitIp: string
}



// 定义容器
export const useUserStore = defineStore('user', {
    state: () => {
        return {
            userInfo: {} as UserInfo,
            count: 1
        }
    },

    getters: {

    },

    actions: {
        async loadUserInfo() {
            var config = {
                method: 'post',
                maxBodyLength: Infinity,
                url: 'https://www.yirenyian.com/api/user/getUserInfo',
                headers: {
                    'accessKey': '5033b7eef85f81bbdf40df0fd5c383406611393d6b8775468d19e3a01fc91a17a9523e204e8e1e39d57a1bc58fb1c3fac5d8706708375549b8209e5879461b6022d57be79ad8fa5d5073447c7bf027c070e917996fe34bae69ed1a8d4afcf824c3e59a43bf623c8806a64c95e882706d'
                }
            };
            const { data: { data } } = await axios(config);            
            this.userInfo = data

        }
    }
})