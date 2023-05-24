<script setup >
import { useNavStore } from '../store/navs'
import UserHead from '../components/userHead.vue'

/**
 * 获取导航栏列表
 */
const NavStore = useNavStore()
NavStore.load()
</script>

<template>
    <div id="box">
        <div class="top">

            <!-- logo区域 -->
            <router-link to="/index/welcome" id="logo">
                <el-image style="width: 60px; height: 60px" :src="NavStore.logo" fit="cover" />
                <h1>七维教育</h1>
            </router-link>

            <!-- 导航栏 -->
            <el-menu default-active="1" :ellipsis="false" mode="horizontal" background-color="#001529"
                text-color="hsla(0,0%,100%)" active-text-color="#fff"
                style="border-bottom: none !important; overflow: hidden; line-height: 64px;">
                <el-menu-item :index="nav.index.toString()" v-for="nav in NavStore.navigation"
                    @click="$router.push(nav.router)">{{ nav.title }}</el-menu-item>
            </el-menu>

            <!-- 头像 和 姓名 -->
            <div class="head-picture">
                <UserHead :color="'#fff'"/>
            </div>

        </div>

        <!-- 视图渲染 -->
        <div id="main">
            <router-view></router-view>
        </div>

    </div>
</template>

<style scoped>
#box {
    display: flex;
    flex-direction: column;
    align-items: center;
    -webkit-user-select: none;
    -moz-user-select: none;
    -o-user-select: none;
    user-select: none;

}

.top {
    display: flex;
    align-items: center;
    width: 100%;
    padding: 0 50px;
    padding-left: 50px;
    line-height: 64px;
    box-sizing: border-box;
    color: rgba(0, 0, 0, .85);
    background: #001529;
}

#logo {
    display: flex;
    min-width: 218px;
}

h1 {
    color: #fff;
    display: inline-block;
    margin: 0;
    font-weight: 500;
    box-sizing: border-box;
}

.el-menu-item:hover {
    background-color: rgb(24, 144, 255, 0.5) !important;
    border-bottom: none !important;
}

.el-menu-item {
    border-bottom: none !important;
    width: 100px;
    height: 64px;
    min-width: 100px;
    max-height: 64px;
}

.el-menu-item.is-active {
    background-color: rgb(24, 144, 255) !important;
    border-bottom: none !important;
}

.head-picture {
    width: 200px;
    height: 64px;
    /* background-color: red; */
    position: absolute;
    right: 0;
}

#main {
    box-sizing: border-box;
    background: #f0f2f5;
    padding: 24px 50px;
    width: 100%;
    min-height: 80vh !important;
}
</style>
