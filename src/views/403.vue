<script setup>
import { ref } from "vue";
const list = [
  { nama: "A", id: 1 },
  { nama: "B", id: 2 },
  { nama: "C", id: 3 },
  { nama: "D", id: 4 },
  { nama: "E", id: 5 },
  { nama: "F", id: 6 },
];
const m = ref("D");
</script>

<template>
  <div class="box">
    <h1>403</h1>

    <el-select v-model="m" placeholder="请选择班级" style="width: 300px">
      <el-option
        v-for="item in list"
        :key="item.nama"
        :label="item.nama"
        :value="item.id"
      />
    </el-select>
    <!-- <button></button> -->
    {{ m }}

    <!-- <select value="3">
      <option
        v-for="item in list"
        :key="item.nama"
        :label="item.nama"
        :value="item.id"
      />
    </select> -->
  </div>
</template>

<style scoped>
.box {
  padding: 48px 32px;
  box-sizing: border-box;
}
</style>
