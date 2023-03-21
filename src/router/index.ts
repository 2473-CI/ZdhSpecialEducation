import { createRouter, createWebHistory } from "vue-router";

import login from '../views/login.vue';
import index from '../views/index.vue';
import welcome from '../views/welcome.vue';
import resList from '../views/resList.vue';
import systemDesc from '../views/systemDesc.vue';
import versionList from '../views/versionList.vue';
import userProfile from '../views/userProfile.vue';
import userPwd from '../views/userPwd.vue';
import v403 from '../views/403.vue';
import management from '../views/management.vue';
import studentList from '../views/studentList.vue';
import clsList from '../views/clsList.vue';
import userList from '../views/userList.vue';
import activityList from '../views/activityList.vue';
import about from '../views/about.vue';
import standard from '../views/standard.vue';
import activityDetail from '../views/activityDetail.vue';
import { useUserStore } from '../store/user'

const routes = [
    {
        path: "/",
        redirect: "/index/welcome"
    },
    // 登录界面
    {
        path: "/login",
        name: "login",
        component: login,
    },
    {
        path: "/index",
        name: "index",
        component: index,
        children: [
            // 产品列表
            {
                path: "welcome",
                name: "welcome",
                component: welcome
            },
            // 共享中心
            {
                path: "resList",
                name: "resList",
                // component: resList,
                redirect: "/index/v403"
            },
            // 使用说明
            {
                path: "systemDesc",
                name: "systemDesc",
                component: systemDesc
            },
            // 更新日志
            {
                path: "versionList",
                name: "versionList",
                component: versionList
            },
            // 更新日志
            {
                path: "userProfile",
                name: "userProfile",
                component: userProfile
            },
            // 更新日志
            {
                path: "userPwd",
                name: "userPwd",
                component: userPwd
            },
            {
                path: "v403",
                name: "v403",
                component: v403,
            },
        ]
    },
    {
        path: "/management",
        name: "management",
        component: management,
        children: [
            {
                // 学生管理
                path: "studentList",
                name: "studentList",
                component: studentList
            },
            {
                // 班级管理
                path: "clsList",
                name: "clsList",
                component: clsList
            },
            {
                // 用户管理
                path: "userList",
                name: "userList",
                component: userList
            },
            {
                // 系统介绍
                path: "about",
                name: "about",
                component: about
            },
            {
                // 训练活动
                path: "activityList",
                name: "activityList",
                component: activityList
            },
            {
                // 课程标准
                path: "standard",
                name: "standard",
                component: standard
            },
            {
                // 活动详情
                path: "activityDetail",
                name: "activityDetail",
                component: activityDetail
            },
        ]
    },
]



export const router = createRouter({
    history: createWebHistory(),
    routes: routes
})

// 注册一个全局前置守卫
router.beforeEach((to, from, next) => {
    
    if(to.name!="login") {    //判断当前路由是否需要进行权限控制
        const userStore = useUserStore()
        console.log(userStore.userInfo.name)
        if(userStore.userInfo.name != undefined){    //权限控制的具体规则
            next()
        }else {
            router.push("/login")
        }
    } else {
        next() // 放行
    }
})