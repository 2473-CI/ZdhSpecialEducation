<script setup lang="ts">
import { useVersionStore } from '../store/version'

/**
 * 从Store中获取所有历史版本列表
 */
const versionStore = useVersionStore()
versionStore.loadVersion()
</script>

<template>
    <div class="box">
        <el-timeline>
            <!-- 循环遍历历史列表 -->
            <el-timeline-item
                v-for="version in versionStore.VersionList"  :key="version._id"
                :timestamp="version.date" placement="top" 
                type="primary" :hollow="true" 
                >
                <el-card>
                    <!-- 历史数据换行 -->
                    <h4 v-for="line in version.content.split('\n')">{{ line }}</h4>
                </el-card>
            </el-timeline-item>
        </el-timeline> 
    </div>
</template>

<style scoped>
.box {
    width: 100%;
    /* height: 100px; */
    background-color: #fff;
    box-sizing: border-box;
    padding: 40px 50px;
}
</style>
