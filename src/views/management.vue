<script lang="ts" setup>
import {
  Avatar,
  Expand,
  Fold,
  CopyDocument,
  UserFilled,
  Menu,
  QuestionFilled,
  School,
  Memo,
} from "@element-plus/icons-vue";
import { useNavStore } from "../store/navs";
import UserHead from "../components/userHead.vue";
import { ref } from "vue";
import Axios from "../request";

const NavStore = useNavStore();
NavStore.loadMM();
const isCollapse = ref(true);
const isShowG = ref(false);
const isShowW = ref(false);
const isShowX = ref(false);
const isShowJ = ref(false);
Axios.get("/user/getRole").then((res) => {
  console.log(res);
  if (res.data == "系统管理员") {
    isShowG.value = true;
  } else if (res.data == "委员会") {
    isShowW.value = true;
  } else if (res.data == "学校管理员") {
    isShowX.value = true;
  } else if (res.data == "教师") {
    isShowJ.value = true;
  }
});
</script>

<template>
  <div class="page">
    <!-- 导航栏 -->
    <div class="navs">
      <div class="logo" style="background-color: #001529">
        <el-image
          style="width: 50px; height: 50px"
          :src="NavStore.logo"
          fit="fill"
        />
      </div>

      <el-menu
        background-color="#001529"
        text-color="hsla(0,0%,100%)"
        active-text-color="#fff"
        style="
          border-bottom: none !important;
          overflow: hidden;
          line-height: 64px;
        "
        default-active="1"
        :collapse="!isCollapse"
        router
      >
        <!-- <el-menu-item
          @click="$router.push(nav.router)"
          :index="nav.index"
          v-for="nav in NavStore.MMNavs"
        >
          <el-icon>
            <Avatar v-if="nav.icon == 'Avatar'" />
            <CopyDocument v-if="nav.icon == 'CopyDocument'" />
            <UserFilled v-if="nav.icon == 'UserFilled'" />
            <School v-if="nav.icon == 'School'" />
            <Memo v-if="nav.icon == 'Memo'" />
            <Menu v-if="nav.icon == 'Menu'" />
            <QuestionFilled v-if="nav.icon == 'QuestionFilled'" />
          </el-icon>
          <template #title>{{ nav.title }}</template>
        </el-menu-item> -->

        <el-sub-menu index="1" v-if="isShowW || isShowG">
          <template #title>
            <el-icon><location /></el-icon>
            <span>委员会</span>
          </template>
          <el-menu-item index="/management/committee" v-if="isShowG"
            >委员会管理</el-menu-item
          >
          <el-menu-item index="/management/ComBers" v-if="isShowG || isShowW"
            >委员会成员</el-menu-item
          >
        </el-sub-menu>
        <el-sub-menu index="2" v-if="isShowG || isShowJ || isShowX">
          <template #title>
            <el-icon><location /></el-icon>
            <span>学校</span>
          </template>
          <el-menu-item index="/management/schoolList" v-if="isShowG"
            >学校管理</el-menu-item
          >
          <el-menu-item index="/management/clsList" v-if="isShowG || isShowX"
            >班级管理</el-menu-item
          >
          <el-menu-item index="/management/userList" v-if="isShowG || isShowX"
            >教师管理</el-menu-item
          >
          <el-menu-item
            index="/management/studentList"
            v-if="isShowG || isShowX || isShowJ"
            >学生管理</el-menu-item
          >
        </el-sub-menu>

        <el-sub-menu index="3">
          <template #title>
            <el-icon><location /></el-icon>
            <span>资源</span>
          </template>
          <el-menu-item
            index="/management/scale"
            v-if="isShowG || isShowX || isShowJ"
            >量表资源</el-menu-item
          >
          <el-menu-item
            index="/management/PerResources"
            v-if="isShowG || isShowJ"
            >个人资源</el-menu-item
          >
          <el-menu-item
            index="/management/sharedResources"
            v-if="isShowG || isShowW || isShowX || isShowJ"
            >共享资源</el-menu-item
          >
        </el-sub-menu>

        <el-sub-menu index="4">
          <template #title>
            <el-icon><location /></el-icon>
            <span>审批</span>
          </template>
          <el-menu-item
            index="/management/Transition"
            v-if="isShowG || isShowW || isShowX || isShowJ"
            >转衔审批</el-menu-item
          >
          <el-menu-item
            index="/management/enroll"
            v-if="isShowG || isShowW || isShowX"
            >注册审批</el-menu-item
          >
        </el-sub-menu>
      </el-menu>
    </div>

    <!-- 减去导航栏后的区域 -->
    <div class="right-box">
      <!-- 顶部区域 -->
      <div class="topBar">
        <div class="leftTopBar">
          <!-- 点击展开/收起导航栏 -->
          <el-icon class="ic" size="20px" @click="isCollapse = !isCollapse">
            <Expand v-if="!isCollapse" />
            <Fold v-else="isCollapse" />
          </el-icon>
          <p class="titleFont">特殊儿童评估干预系统</p>
        </div>
        <!-- 用户头像 和 姓名 -->
        <UserHead :color="'#000'" />
      </div>

      <!-- 内容区域 用于渲染子组件 -->
      <div
        style="
          height: 91vh;
          width: 100%;
          background-color: #f8f8f8;
          overflow: auto;
        "
      >
        <router-view></router-view>
      </div>
    </div>
  </div>
</template>

<style>
.page {
  width: 100vw;
  display: flex;
}

.navs {
  height: 100vh;
  background-color: rgb(0, 21, 41);
}

.logo {
  height: 66px;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: rgb(0, 33, 64);
}

.icon {
  height: 100%;
}

.el-menu-item:hover {
  background-color: rgb(24, 144, 255, 0.5) !important;
  border-bottom: none !important;
}

.el-menu-item {
  border-bottom: none !important;
  width: 130px;
  height: 64px;
  min-width: 100px;
  max-height: 64px;
}
.el-sub-menu {
  width: 130px;
}

.el-menu-item-group {
  width: 130px;
}

.el-menu-item.is-active {
  background-color: rgb(24, 144, 255) !important;
  border-bottom: none !important;
}
.right-box {
  width: 100%;
}

.topBar {
  height: 9vh;
  width: 100%;
  background-color: #fff;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.titleFont {
  font-size: 20px;
  font-weight: 600;
  margin-left: 20px;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 1;
  overflow: hidden;
  text-overflow: ellopsis;
}

.ic {
  margin-left: 20px;
}

.leftTopBar {
  display: flex;
}
</style>
