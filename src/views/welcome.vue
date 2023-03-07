<script setup lang="ts">
import { useUserStore } from '../store/user'
import { useProductStore } from '../store/product'

// 获取用户信息
const userStore = useUserStore()
userStore.loadUserInfo()

// 获取产品列表包括 {标题|图片|路由}
const productStore = useProductStore()
productStore.loadProductList()
</script>

<template>
    <!-- 欢迎模块 -->
    <div class="context">
        <div class="top">
            <el-image class="head-img" :src="userStore.userInfo.avatar" fit="fit"></el-image>
            <div class="hello-text">
                <div class="hello-top">下午好，{{ userStore.userInfo.name }}，祝你开心每一天！</div>
                <div class="hello-bottom">
                    {{ userStore.userInfo.schoolName }}
                </div>
            </div>
        </div>
        <div style="height: 20px; background-color: rgb(240,242,245);"></div>

        <!-- 产品列表 -->
        <el-card class="box-card box" body-style="padding:0;">
            <template #header>
                <div class="card-header">
                    <span>产品列表</span>
                </div>
            </template>
            <div class="box-bottom">
                <el-card shadow="hover" @click="$router.push(product.router)" class="item" :key="product.id" v-for="product in productStore.ProductList">
                    <el-image class="img" :src="product.img" fit="cover"></el-image>
                    {{ product.title }}
                </el-card>
            </div>
        </el-card>

        <!-- 情怀日历 -->
        <div style="height: 20px; background-color: rgb(240,242,245);"></div>
        <el-card class="box-card">
            <template #header>
                <div class="card-header">
                    <span>情怀日历</span>
                </div>
            </template>
            <!-- <div v-for="o in 4" :key="o" class="text item">{{ 'List item ' + o }}</div> -->
            <template style="display: flex;align-items: center;" >
                <el-image style="width: 30%; " src="https://api.dujin.org/bing/1366.php" fit="fill" />
                <h1>1997年5月11日，超级计算机“深蓝”首次打败国际象棋世界冠军卡斯帕罗夫</h1>
            </template>
        </el-card>
    </div>
</template>

<style scoped>
.context {
    background-color: aqua;
    font-size: 14px;
    font-variant: tabular-nums;
    line-height: 1.5715;
    background-color: #fff;
    font-feature-settings: "tnum";
}

.top {
    background-color: #fff;
    box-sizing: border-box;
    padding: 20px 20px;
    display: flex;
}

.head-img {
    height: 90px;
    background-color: aqua;
    width: 90;
}

.hello-text {
    width: 80%;
    margin-left: 10px;
    display: flex;
    flex-direction: column;
    justify-content: flex-end;
}

.hello-top {
    margin-bottom: 12px;
    color: rgba(0, 0, 0, .85);
    font-weight: 500;
    font-size: 20px;
    line-height: 28px;
}

.hello-bottom {
    margin-bottom: 12px;
    color: rgba(0, 0, 0, .55);
    font-weight: 500;
    font-size: 20px;
    line-height: 28px;
}

.box-top {
    height: 50px;
    box-sizing: border-box;
    padding: 0 20px;
    display: flex;
    align-items: center;
    background-color: #fff;
}

.box-bottom {
    display: flex;
    background-color: #fff;
    flex-wrap: wrap;

}

.item {
    height: 250px;
    border-style: solid;
    border-width: 1px;
    border-color: rgb(240, 242, 245);
    box-sizing: border-box;
    padding: 20px;
}

.item>.img {
    width: 100%;
    height: 90%;
}

@media screen and (min-width: 300px) {
    .item {
        width: 100%;
    }
}

@media screen and (min-width: 600px) {
    .item {
        width: 50%;
    }
}

@media screen and (min-width: 900px) {
    .item {
        width: 33.33%;
    }
}

@media screen and (min-width: 1200px) {
    .item {
        width: 25%;
    }
}
</style>
