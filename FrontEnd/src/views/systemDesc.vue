<script setup lang="ts">
import { useVideoStore } from '../store/videos'

/**
 * 从Store中获取视频列表
 */
const videoStore = useVideoStore()
videoStore.loadVideos()

</script>

<template>
    <div id="box">
        <!-- 遍历视频列表并渲染 -->
        <div class="item" :key="video.id" v-for="video in videoStore.videos">
            <div>
                <h1>{{ video.title }}</h1>
            </div>
            <video controls :src="video.video" ></video>
        </div>
    </div>
</template>

<style scoped>
#box{
    width: 100%;
    /* height: 20px; */
    background-color: #fff;
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
}
.item{
    /* width: 45% !important; */
    box-sizing: border-box;
    padding: 20px;
    display: flex;
    flex-direction: column;
}

.item>video{
    width: 100%;
}
.item>div{
    display: inline-block;
    width: 100%;
}
@media screen and (min-width: 100px) {
    .item{
        width: 100%;
    }
}
@media screen and (min-width: 800px) {
    .item{
        width: 50%;
    }
}
</style>
