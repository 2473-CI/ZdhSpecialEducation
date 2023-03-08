<script setup lang="ts">
import { useUserStore } from '../store/user'
import {  toRefs } from 'vue'

const UserStore = useUserStore()
UserStore.loadUserInfo()

const props = defineProps({
    // 父组件定义用户名颜色, 用于兼容index和MM两个页面的使用
    color: String,
})

const { color } = toRefs(props)

</script>

<template>
    <div class="rightTopBar">
        <img :src="UserStore.userInfo.avatar" class="userImg" />
        <p class="userName" :style="{ 'color': color }">{{ UserStore.userInfo.name }}</p>
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
</style>
