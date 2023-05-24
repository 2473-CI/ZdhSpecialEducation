import { defineStore } from 'pinia';
import axios from 'axios'

// 单个版本
interface Version {
    _id: string,
    date: string,
    content: string,
    createdAt?: string,
    updatedAt?: string,
    __v?: number
}

/**
 * 所有历史版本列表
 */
export const useVersionStore = defineStore('version', {
    state: () => {
        return {
            VersionList: [] as Version[]
        }
    },

    getters: {

    },

    actions: {
        // 通过请求初始化版本列表
        async loadVersion() {

            var config = {
                method: 'post',
                url: 'https://www.yirenyian.com/api/version/getList',
                headers: {
                    'accessKey': '5033b7eef85f81bbdf40df0fd5c383406611393d6b8775468d19e3a01fc91a17a9523e204e8e1e39d57a1bc58fb1c3fac5d8706708375549b8209e5879461b6022d57be79ad8fa5d5073447c7bf027c070e917996fe34bae69ed1a8d4afcf824c3e59a43bf623c8806a64c95e882706d'
                }
            };
            const { data: { data } } = await axios(config);            
            this.VersionList = data
            console.log(data)
        }
    }
})