<script setup lang="ts">
import { useAboutStore } from '../store/about'

const aboutStore = useAboutStore()
</script>

<template>
    <div class="box">
        <template  :key="msg.id" v-for="msg in aboutStore.aboutMess">
            <el-card shadow="hover" class="box-card">
                <template #header>
                    <div class="card-header">
                        <span style="font-size: 1.3rem;">{{ msg.title }}</span>
                    </div>
                </template>
                <div v-for="(line, index) in msg.context.split('\n')" :key="index">
                    <span style="font-size: 0.9rem;">{{ line }}</span>
                </div>
            </el-card>
            <div style="height: 20px"></div>
        </template>
    </div>
</template>

<style scoped>
.box {
    padding: 48px 32px;
    box-sizing: border-box;
}
</style>
