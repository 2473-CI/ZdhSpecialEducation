import { defineStore } from 'pinia';

interface Navigation {
    index: number,
    title: string,
    router: string
}

// 定义容器
export const useNavStore = defineStore('navs', {
    state: () => {
        return {
            navigation: [] as Navigation[]
        }
    },

    getters: {

    },

    actions: {
        load(){
            this.navigation = [
                {index:1, title: "产品列表", router: "/index/welcome"},
                {index:2, title: "共享中心", router: "/index/resList"},
                {index:3, title: "使用说明", router: "/index/systemDesc"},
                {index:4, title: "更新日志", router: "/index/versionList"},
            ]
        }
    }
})