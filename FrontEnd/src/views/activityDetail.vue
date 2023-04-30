<script setup lang="ts">
import { useRouter } from 'vue-router'
import { useActiveStore } from '../store/activity'
const router = useRouter()
const activeStore = useActiveStore()
activeStore.loadActivedetail(router.currentRoute.value.query)
console.log(activeStore.activeDetail.prepare)
// $route.query
</script>

<template>
    <div class="box">
        <el-card > 
            <h1  style="text-align: center; font-size: 30px; color: #333;">{{ activeStore.activeDetail.title }}</h1>  
            <div  style="margin: 10px 0;text-align: center; font-size: 16px; color: #888">
                —— <span >{{ activeStore.activeDetail.tip }}</span>  
            </div>  
            
            <h1 class="subTitle"> 1、目标领域 </h1>
            <h1 class="content"> {{ activeStore.activeDetail.targetArea }}</h1>
            <h1 class="subTitle"> 二、准备活动 </h1>
            <h1 class="content"> {{ activeStore.activeDetail.prepare }}</h1>
            <h1 class="subTitle"> 三、活动过程 </h1>
            <h1 class="content"> {{ activeStore.activeDetail.process }}</h1>
        
        </el-card>       
    </div>
</template>

<style scoped>
.box {
    padding: 48px 32px;
    box-sizing: border-box;
}
.subTitle {
    font-size: 18px;
    margin-bottom: 10px;
    font-weight: 500;
    text-align: left;
}
.content{
    margin-bottom: 28px;
    color: #888;
    font-size: 15px;
    line-height: 24px;
    text-align: left;
}
</style>
