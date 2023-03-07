import { defineStore } from 'pinia';
/**
 * 导航栏单个元素
 */
interface Navigation {
    index: number, // 索引 用于v-for
    title: string, // 导航栏文字
    router: string, // 导航路由 点击导航栏后需要跳转到哪里
    icon?: string, // 图标
}

// 定义容器
export const useNavStore = defineStore('navs', {
    state: () => {
        return {
            navigation: [] as Navigation[],  // 前台导航栏
            MMNavs: [] as Navigation[],  // 管理端导航栏 management 简写为 MM
            logo: "https://cn.vitejs.dev/logo-with-shadow.png"
        }
    },

    getters: {

    },

    actions: {
        /**
         * 加载前台导航栏数据
         */
        load(){
            this.navigation = [
                {index:1, title: "产品列表", router: "/index/welcome"},
                {index:2, title: "共享中心", router: "/index/resList"},
                {index:3, title: "使用说明", router: "/index/systemDesc"},
                {index:4, title: "更新日志", router: "/index/versionList"},
            ]
        },
        /**
         * 加载后台导航栏数据
         * management 简写为 MM
         */
        loadMM(){
            this.MMNavs = [
                {index:1, title: "学生管理", router: "/management/studentList", icon: "Avatar"},
                {index:2, title: "班级管理", router: "/management/clsList", icon: "CopyDocument"},
                {index:3, title: "用户管理", router: "/management/userList", icon: "UserFilled"},
                {index:4, title: "训练活动", router: "/management/activityList", icon: "Menu"},
                {index:5, title: "系统介绍", router: "/management/about", icon: "QuestionFilled"},
            ]
        }
    }
})