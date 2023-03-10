import { defineStore } from 'pinia';
import axios from 'axios'

// 用户接口
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


interface SearchUserImp {
    current?: number,
    pageSize?: number,
    schoolId?: string[] | string,
    name?: string,
    phone?: string,
    email?: string,
    pageNo?: string
}

interface UpdateUserPassword {
    OriginalPassword: string, // 原来的密码
    NewPassword: string, // 新密码
    ConfirmPassword: string // 确认密码
}


// 存储当前用户信息
export const useUserStore = defineStore('user', {
    state: () => {
        return {
            userInfo: {} as UserInfo,
            count: 1,
            searchUserImp: {} as SearchUserImp,
            userList: [] as UserInfo[],
            Total: 0,
            userUpdateFrom: {} as UserInfo,
            password: {} as UpdateUserPassword
        }
    },

    getters: {

    },

    actions: {
        // 获取UserInfo
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
            this.userUpdateFrom = {...data}

        },
        async searchUserInfo() {
            if(this.searchUserImp.schoolId == undefined || this.searchUserImp.schoolId.length == 0 ){
                this.searchUserImp.schoolId = ["5f4c6b2857852c176c03aacf"]
            }
            var config = {
                method: 'post',
                maxBodyLength: Infinity,
                url: 'https://www.yirenyian.com/api/user/getList',
                headers: {
                    'accessKey': '5033b7eef85f81bbdf40df0fd5c383406611393d6b8775468d19e3a01fc91a17a9523e204e8e1e39d57a1bc58fb1c3fac5d8706708375549b8209e5879461b6022d57be79ad8fa5d5073447c7bf027c070e917996fe34bae69ed1a8d4afcf824c3e59a43bf623c8806a64c95e882706d',
                    'Content-Type': 'application/json'
                },
                data: this.searchUserImp,
            };
            const { data: { data } } = await axios(config);            
            this.userList = data.rows
            this.Total = data.total
            console.log(this.userList)
        }
    }
})