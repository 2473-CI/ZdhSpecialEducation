import { defineStore } from 'pinia';
import axios from 'axios'




export const useActiveStore = defineStore('activeStore', {
    state: () => {
        return {
            activeList: [] ,
            Total: 0,
            activeDetail: {}
        }
    },

    getters: {

    },

    actions: {
        async loadActivedetail(body) {

              var config = {
                method: 'post',
              maxBodyLength: Infinity,
                url: 'https://rrp.yirenyian.com/api/activity/detail',
                headers: { 
                  'accessKey': '5033b7eef85f81bbdf40df0fd5c383406611393d6b8775468d19e3a01fc91a17a9523e204e8e1e39d57a1bc58fb1c3fac5d8706708375549b8209e5879461b6022d57be79ad8fa5d5073447c7bf027c070e917996fe34bae69ed1a8d4afcf824c3e59a43bf623c8806a64c95e882706d', 
                  'Content-Type': 'application/json'
                },
                data : JSON.stringify(body)
              };
              const { data: { data } } = await axios(config);            
              this.activeDetail = data
              
        },
        async loadActive() {
            var config = {
                method: 'post',
                maxBodyLength: Infinity,
                url: 'https://rrp.yirenyian.com/api/activity/getList',
                headers: {
                    'accessKey': '5033b7eef85f81bbdf40df0fd5c383406611393d6b8775468d19e3a01fc91a17a9523e204e8e1e39d57a1bc58fb1c3fac5d8706708375549b8209e5879461b6022d57be79ad8fa5d5073447c7bf027c070e917996fe34bae69ed1a8d4afcf824c3e59a43bf623c8806a64c95e882706d',
                    'Content-Type': 'application/json'
                },
                data: JSON.stringify({
                    "current": 1,
                    "pageSize": 10,
                    "pageNo": 1,
                    "relativeCategories": ""
                })
            };
            const { data: { data } } = await axios(config);            
            this.activeList = data.rows
            this.Total = data.total
        }
    }
})