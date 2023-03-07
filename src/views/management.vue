
<script lang="ts" setup>
import { ref } from 'vue'
import { Avatar, Expand, Fold, CopyDocument, UserFilled, Menu, QuestionFilled } from '@element-plus/icons-vue'
import { useNavStore } from '../store/navs'
import UserHead from '../components/userHead.vue'

const NavStore = useNavStore()
NavStore.loadMM()
const isCollapse = ref(true)
</script>


<template>
    <div class="page">
        <!-- 导航栏 -->
        <div class="navs">
            <!-- 显示logo图片 -->
            <div class="logo">
                <el-image style="width: 50px; height: 50px" :src="NavStore.logo" fit="fill" />
            </div>
            <!-- 导航栏列表 -->
            <el-menu background-color="#001529" text-color="hsla(0,0%,100%)" active-text-color="#fff"
                style="border-bottom: none !important; overflow: hidden; line-height: 64px;" default-active="1"
                :collapse="!isCollapse">
                <el-menu-item @click="$router.push(nav.router)" :index="nav.index" v-for="nav in NavStore.MMNavs">
                    <!-- 此处需要优化 -->
                    <el-icon>
                        <Avatar v-if="nav.icon == 'Avatar'" />
                        <CopyDocument v-if="nav.icon == 'CopyDocument'" />
                        <UserFilled v-if="nav.icon == 'UserFilled'" />
                        <Menu v-if="nav.icon == 'Menu'" />
                        <QuestionFilled v-if="nav.icon == 'QuestionFilled'" />
                    </el-icon>
                    <template #title>{{ nav.title }}</template>
                </el-menu-item>
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
                    <p class="titleFont">特殊儿童评估干预系统（随班就读）</p>
                </div>
                <!-- 用户头像 和 姓名 -->
                <UserHead :color="'#000'" />
            </div>

            <!-- 内容区域 用于渲染子组件 -->
            <div style="height:91vh;width:100%;background-color:#f8f8f8;overflow: auto;">
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