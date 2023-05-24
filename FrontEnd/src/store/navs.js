import { defineStore } from "pinia";
/**
 * 导航栏单个元素
 */

// 定义容器
export const useNavStore = defineStore("navs", {
  state: () => {
    return {
      navigation: [], // 前台导航栏
      MMNavs: [] , // 管理端导航栏 management 简写为 MM
      logo: "https://cn.vitejs.dev/logo-with-shadow.png",
    };
  },

  getters: {},

  actions: {
    /**
     * 加载前台导航栏数据
     */
    load() {
      this.navigation = [
        { index: 1, title: "产品列表", router: "/index/welcome" },
        { index: 2, title: "共享中心", router: "/index/resList" },
        { index: 3, title: "使用说明", router: "/index/systemDesc" },
        { index: 4, title: "更新日志", router: "/index/versionList" },
      ];
    },
    /**
     * 加载后台导航栏数据
     * management 简写为 MM
     */
    loadMM() {
      this.MMNavs = [
        {
          index: 1,
          title: "学生管理",
          router: "/management/studentList",
          icon: "Avatar",
        },
        {
          index: 2,
          title: "班级管理",
          router: "/management/clsList",
          icon: "CopyDocument",
        },
        {
          index: 3,
          title: "用户管理",
          router: "/management/userList",
          icon: "UserFilled",
        },
        {
          index: 4,
          title: "学校管理",
          router: "/management/schoolList",
          icon: "School",
        },
        {
          index: 5,
          title: "量表管理",
          router: "/management/scale",
          icon: "Memo",
        },
        {
          index: 6,
          title: "委员会管理",
          router: "/management/committee",
          icon: "Memo",
        },
        {
          index: 7,
          title: "委员会成员",
          router: "/management/ComBers",
          icon: "Memo",
        },
        {
          index: 8,
          title: "转衔审批",
          router: "/management/Transition",
          icon: "Memo",
        },
        {
          index: 9,
          title: "注册审批",
          router: "/management/enroll",
          icon: "Memo",
        },
        {
          index: 10,
          title: "个人资源",
          router: "/management/PerResources",
          icon: "Memo",
        },
        {
          index: 11,
          title: "共享资源",
          router: "/management/sharedResources",
          icon: "Memo",
        },
        // {
        //   index: 6,
        //   title: "训练活动",
        //   router: "/management/activityList",
        //   icon: "Menu",
        // },
        // {
        //   index: 7,
        //   title: "系统介绍",
        //   router: "/management/about",
        //   icon: "QuestionFilled",
        // },
      ];
    },
  },
});
