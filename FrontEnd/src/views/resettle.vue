<script setup>
import { ref, reactive, getCurrentInstance, toRefs, defineProps } from "vue";
import { House } from "@element-plus/icons-vue";

import Axios from "../request/index.ts";
</script>

<template>
  <p
    style="
      color: #1677ff;
      font-size: 14px;
      margin-left: 30px;
      display: flex;
      align-items: center;
      margin-top: 10px;
    "
    @click="$router.push('/management/studentCenter')"
  >
    <el-icon><House /></el-icon>返回学生主页
  </p>
</template>

<style scoped></style>
