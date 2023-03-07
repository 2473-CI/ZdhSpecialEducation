<script setup lang="ts">
import { useVersionStore } from '../store/version'

const versionStore = useVersionStore()
versionStore.loadVersion()
</script>

<template>
    <div class="box">
        <el-timeline>
            <el-timeline-item
                v-for="version in versionStore.VersionList"  :key="version._id"
                :timestamp="version.date" placement="top" 
                type="primary" :hollow="true" 
                >
                <el-card>
                    <h4 v-for="line in version.content.split('\n')">{{ line }}</h4>
                    <!-- <p>Tom committed 2018/4/12 20:46</p> -->
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
