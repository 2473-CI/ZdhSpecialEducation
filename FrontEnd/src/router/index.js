import { createRouter, createWebHistory } from "vue-router";

import login from "../views/login.vue";
import index from "../views/index.vue";
import welcome from "../views/welcome.vue";
import resList from "../views/resList.vue";
import systemDesc from "../views/systemDesc.vue";
import versionList from "../views/versionList.vue";
import userProfile from "../views/userProfile.vue";
import userPwd from "../views/userPwd.vue";
import v403 from "../views/403.vue";
import management from "../views/management.vue";
import studentList from "../views/studentList.vue";
import clsList from "../views/clsList.vue";
import userList from "../views/userList.vue";
import activityList from "../views/activityList.vue";
import about from "../views/about.vue";
import standard from "../views/standard.vue";
import activityDetail from "../views/activityDetail.vue";
import studentCenter from "../views/studentCenter.vue";
import register from "../views/register.vue";
import { useUserStore } from "../store/user";
import schoolList from "../views/schoolList.vue";
import studentDetail from "../views/studentDetail.vue";
import scale from "../views/scale.vue";
import question from "../views/question.vue";
import iepIndex from "../views/iepIndex.vue";
import iepReport from "../views/iepReport.vue";
import scaleList from "../views/scaleList.vue";
import Medical from "../views/Medical.vue";
import committee from "../views/committee.vue";
import ComBers from "../views/ComBers.vue";
import Transition from "../views/Transition.vue";
import enroll from "../views/enroll.vue";
import PerResources from "../views/PerResources.vue";
import sharedResources from "../views/sharedResources.vue";
import report from "../views/report.vue";
import exercise from "../views/exercise.vue";
import resettle from "../views/resettle.vue";
import record from "../views/record.vue";
import placement from "../views/placement.vue";
import echarts from "../views/echarts.vue";
import echartsSelf from "../views/echartsSelf.vue";
const routes = [
  {
    path: "/",
    redirect: "/login",
  },
  // 登录界面
  {
    path: "/login",
    name: "login",
    component: login,
  },
  {
    path: "/question",
    name: "question",
    component: question,
  },
  {
    path: "/register",
    name: "register",
    component: register,
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
        component: welcome,
      },
      // 共享中心
      {
        path: "resList",
        name: "resList",
        // component: resList,
        redirect: "/index/v403",
      },
      // 使用说明
      {
        path: "systemDesc",
        name: "systemDesc",
        component: systemDesc,
      },
      // 更新日志
      {
        path: "versionList",
        name: "versionList",
        component: versionList,
      },
      // 更新日志
      {
        path: "userProfile",
        name: "userProfile",
        component: userProfile,
      },
      // 更新日志
      {
        path: "userPwd",
        name: "userPwd",
        component: userPwd,
      },
      {
        path: "v403",
        name: "v403",
        component: v403,
      },
    ],
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
        component: studentList,
      },
      {
        // 班级管理
        path: "clsList",
        name: "clsList",
        component: clsList,
      },
      {
        // 用户管理
        path: "userList",
        name: "userList",
        component: userList,
      },
      {
        //学校管理
        path: "schoolList",
        name: "schoolList",
        component: schoolList,
      },
      {
        path: "echarts",
        name: "echarts",
        component: echarts,
      },
      {
        path: "echartsSelf",
        name: "echartsSelf",
        component: echartsSelf,
      },
      //量表管理
      {
        path: "scale",
        name: "scale",
        component: scale,
      },
      //委员会管理
      {
        path: "committee",
        name: "committee",
        component: committee,
      },
      //委员会成员管理
      {
        path: "ComBers",
        name: "ComBers",
        component: ComBers,
      },
      //转衔审批
      {
        path: "Transition",
        name: "Transition",
        component: Transition,
      },
      //注册审批
      {
        path: "enroll",
        name: "enroll",
        component: enroll,
      },
      //个人资源
      {
        path: "PerResources",
        name: "PerResources",
        component: PerResources,
      },
      //共享资源
      {
        path: "sharedResources",
        name: "sharedResources",
        component: sharedResources,
      },

      {
        // 系统介绍
        path: "about",
        name: "about",
        component: about,
      },
      {
        // 训练活动
        path: "activityList",
        name: "activityList",
        component: activityList,
      },
      {
        // 课程标准
        path: "standard",
        name: "standard",
        component: standard,
      },
      {
        // 活动详情
        path: "activityDetail",
        name: "activityDetail",
        component: activityDetail,
      },
      {
        path: "studentCenter",
        name: "studentCenter",
        component: studentCenter,
      },
      {
        path: "studentDetail",
        name: "studentDetail",
        component: studentDetail,
      },
      {
        path: "iepIndex",
        name: "iepIndex",
        component: iepIndex,
      },
      {
        path: "iepReport",
        name: "iepReport",
        component: iepReport,
      },
      {
        path: "scaleList",
        name: "scaleLsit",
        component: scaleList,
      },
      {
        path: "Medical",
        name: "Medical",
        component: Medical,
      },
      {
        path: "report",
        name: "report",
        component: report,
      },
      {
        path: "exercise",
        name: "exercise",
        component: exercise,
      },
      {
        path: "resettle",
        name: "resettle",
        component: resettle,
      },
      {
        path: "record",
        name: "record",
        component: record,
      },
      {
        path: "placement",
        name: "placement",
        component: placement,
      },
    ],
  },
];

export const router = createRouter({
  history: createWebHistory(),
  routes: routes,
});

// 注册一个全局前置守卫
router.beforeEach((to, from, next) => {
  if (to.path == "/login" || to.path == "/register") {
    next();
  } else {
    if (localStorage.getItem("user") != null) {
      next();
    } else {
      router.replace("/login");
    }
  }
});
