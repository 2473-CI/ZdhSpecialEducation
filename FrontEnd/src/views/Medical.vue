<script setup >
import { House } from "@element-plus/icons-vue";
import { ref, reactive, onMounted } from "vue";
const list = ref([
  {
    value: "医学评估",
  },
  {
    value: "医学康复",
  },
  {
    value: "医学咨询",
  },
  {
    value: "用药建议",
  },
  {
    value: "医学治疗",
  },
  {
    value: "备忘",
  },
]);
</script>

<template>
  <div class="box">
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
    <div style="display: flex; justify-content: space-around; flex-wrap: wrap">
      <div
        style="
          height: 90px;
          width: 32%;
          background-color: #fff;
          margin-top: 15px;
          border-radius: 15px;
          display: flex;
          justify-content: center;
          align-items: center;
        "
        v-for="(item, index) in list"
        :key="index"
      >
        <span>{{ item.value }}</span>
      </div>
    </div>
  </div>
</template>

<style scoped></style>
