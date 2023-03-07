
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
            <div class="logo">
                <el-image style="width: 50px; height: 50px" :src="NavStore.logo" fit="fill" />
            </div>
            <el-menu background-color="#001529" text-color="hsla(0,0%,100%)" active-text-color="#fff"
                style="border-bottom: none !important; overflow: hidden; line-height: 64px;" default-active="1"
                :collapse="!isCollapse">
                <el-menu-item :index="nav.index" v-for="nav in NavStore.MMNavs">
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
        <div class="right-box">
            <div class="topBar">
                <div class="leftTopBar">
                    <el-icon class="ic" size="20px" @click="isCollapse = !isCollapse">
                        <Expand v-if="!isCollapse" />
                        <Fold v-else="isCollapse" />
                    </el-icon>
                    <p class="titleFont">特殊儿童评估干预系统（随班就读）</p>
                </div>
                <UserHead />
            </div>
            <div style="height:91vh;width:100%;background-color:#f8f8f8;overflow: auto;">
                <div style="width:90%;height:100vh;border:1px solid black;">

                </div>
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