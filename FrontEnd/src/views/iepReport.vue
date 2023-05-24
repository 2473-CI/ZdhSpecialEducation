<script setup >
import { House } from "@element-plus/icons-vue";
</script>

<template>
  <div class="box">
    <p
      style="
        color: #1677ff;
        font-size: 14px;
        margin-left: 10px;
        margin-top: 5px;
      "
      @click="$router.push('/management/studentCenter')"
    >
      <el-icon><House /></el-icon>返回学生主页
    </p>
  </div>
</template>

<style scoped></style>
