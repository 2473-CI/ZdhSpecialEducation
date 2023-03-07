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
        ]
    },
]

export const router = createRouter({
    history: createWebHistory(),
    routes: routes
})