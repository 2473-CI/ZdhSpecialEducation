<script setup lang="ts">
import { useUserStore } from '../store/user'
import { toRefs, ref } from 'vue'

const UserStore = useUserStore()
UserStore.loadUserInfo()

const props = defineProps({
    // 父组件定义用户名颜色, 用于兼容index和MM两个页面的使用
    color: String,
})
const isTure = ref(false)
const { color } = toRefs(props)


</script>

<template>
    <div class="rightTopBar">

        <img :src="UserStore.userInfo.avatar" class="userImg" @mouseenter="isTure = true" @mouseout="isTure = false" />
        <p class="userName" :style="{ 'color': color }" @mouseenter="isTure = true" @mouseout="isTure = false">{{
            UserStore.userInfo.name }}</p>


        <div class="allList" v-show="isTure" @mouseenter="isTure = true" @mouseout="isTure = false">
            <div class="wuyong"></div>
            <div class="bottom-box">
                <p class="loginList" @mouseenter="isTure = true" @mouseout="isTure = false">个人中心</p>
                <p class="loginList" @mouseenter="isTure = true" @mouseout="isTure = false">修改密码</p>
                <p class="loginList" @mouseenter="isTure = true" @mouseout="isTure = false">退出登录</p>
            </div>
        </div>
    </div>
</template>

<style scoped>
.rightTopBar {
    height: 100%;
    width: 20%;

    display: flex;
    align-items: center;
    justify-content: center;
}

.userImg {
    height: 50px;
    width: 50px;

    border-radius: 25px;
}

.userName {
    margin-left: 10px;
    font-weight: bold;
    white-space: nowrap
}

.wuyong {
    height: 30%;
    width: 100%;
}

.bottom-box {
    height: 50%;
    width: 100%;
    background-color: #fff;

}

.loginList {
    height: 30px;
    width: 100%;
    line-height: 30px;
    text-align: center;
    font-size: 1.1vw;
    position:relative;

}

.loginList:hover{
    box-shadow: 0 0 2px rgba(125,125,125,0.5);
    transition: 0.2s;
}

.allList {
    height: 200px;
    width: 100px;
    position: absolute;
    top: 0px;
    z-index: 1000;
}
</style>
