<script setup>
import { House } from "@element-plus/icons-vue";
</script>

<template>
  <p
    style="
      color: #1677ff;
      font-size: 14px;
      margin-left: 20px;
      margin-top: 5px;
      margin-bottom: 10px;
    "
    @click="$router.push('/management/studentCenter')"
  >
    <el-icon><House /></el-icon>返回学生主页
  </p>
  <div style="display: flex; justify-content: center; width: 100%">
    <div style="width: 97%; background-color: #fff; height: 50vh"></div>
  </div>
</template>

<style scoped></style>
