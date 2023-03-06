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
    <div class="context">
        <div class="top">
            <el-image
            class="head-img"
            :src="userStore.userInfo.avatar"
            fit="fit"
            ></el-image>
            <div class="hello-text">
                <div class="hello-top">下午好，{{ userStore.userInfo.name }}，祝你开心每一天！</div>
                <div class="hello-bottom">
                    {{ userStore.userInfo.schoolName }}
                </div>
            </div>
        </div>
        <div style="height: 20px; background-color: rgb(240,242,245);"></div>
        <div class="box">
            <div class="box-top">产品列表</div>
            <!-- <hr> -->
            <div class="box-bottom">
                <div class="item" :key="product.id" v-for="product in productStore.ProductList" >
                    <el-image class="img" :src="product.img" fit="cover"></el-image>
                    {{ product.title }}
                </div>
            </div>
        </div>

    </div>
</template>

<style scoped>
.context {
    /* width: 93%; */
    /* height: 20px; */
    background-color: aqua;
    font-size: 14px;
    font-variant: tabular-nums;
    line-height: 1.5715;
    background-color: #fff;
    font-feature-settings: "tnum";
}
.top{
    background-color: #fff;
    box-sizing: border-box;
    padding: 20px 20px;
    display: flex;
}
.head-img{
    /* padding: 20px 20px; */
    height: 90px;
    background-color: aqua;
    width: 90;
}
.hello-text{
    width: 80%;
    /* background-color: antiquewhite; */
    margin-left: 10px;
    display: flex;
    flex-direction: column;
    justify-content: flex-end;
}
.hello-top{
    margin-bottom: 12px;
    color: rgba(0,0,0,.85);
    font-weight: 500;
    font-size: 20px;
    line-height: 28px;
}
.hello-bottom{
    margin-bottom: 12px;
    color: rgba(0,0,0,.55);
    font-weight: 500;
    font-size: 20px;
    line-height: 28px;
}

.box-top{
    height: 50px;
    box-sizing: border-box;
    padding: 0 20px;
    display: flex;
    align-items: center;
    background-color: #fff;
}
.box-bottom{
    margin-top: 1px;
    /* height: 50px; */
    box-sizing: border-box;
    padding: 0 20px 20px 20px;
    display: flex;
    /* align-items: center; */
    background-color: #fff;
    flex-wrap: wrap;
    /* justify-content: space-between; */

}
/* .item{
    width: 400px;
    height: 10px;
    border:1px solid black;
    background-color: antiquewhite;
} */
.item{
    height: 250px;
	border-style:solid;
	border-width:1px;
    border-color: rgb(240,242,245);
    box-sizing: border-box;
    padding: 20px;
}
.item>.img{
    width: 100%;
    height: 90%;
}
.item:hover{
    box-shadow: 2px 0 0 0 #f0f0f0, 0 2px 0 0 #f0f0f0, 2px 2px 0 0 #f0f0f0, inset 2px 0 0 0 #f0f0f0, inset 0 2px 0 0 #f0f0f0;
    transition: all .3s;
}
@media screen and (min-width: 300px) {
    .item{
        width: 100%;
    }
}

@media screen and (min-width: 600px){
    .item{
        width: 50%;
    }
}
@media screen and (min-width: 900px) {
    .item{
        width: 33.33%;
    }
}

@media screen and (min-width: 1200px) {
    .item{
        width: 25%;
    }
}
</style>
