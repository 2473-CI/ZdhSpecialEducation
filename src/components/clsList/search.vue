<script setup lang="ts">
import { ref } from "vue";
import { useClasStore } from "../../store/cls";
import Axios from "../../request/index";

const classStore = useClassStore();
const isExpansion = ref(false);
classStore.search();
</script>

<template>
  <el-card class="box-card">
    <el-form :inline="true" :model="classStore.searchClass" class="all-form">
      <el-form-item label="学校">
        <el-select
          v-model="classStore.searchClass.schoolId"
          placeholder="请选择"
        >
          <!-- <el-option
            :label="school.schoolName"
            :value="school.schoolId"
            :key="school.schoolId"
            v-for="school "
          /> -->
        </el-select>
      </el-form-item>
      <el-form-item label="年级">
        <el-select
          v-model="classStore.searchClass.gradeId"
          placeholder="请选择"
        >
          <!-- <el-option :label="grade.name" :value="grade.gradeCode" :key="grade.index" v-for="grade in 1"/> -->
        </el-select>
      </el-form-item>
      <el-form-item label="班级名" v-show="isExpansion">
        <el-input
          v-model="classStore.searchClass.clazzName"
          placeholder="请输入"
        />
      </el-form-item>

      <el-form-item class="right-bottom">
        <el-button>重置</el-button>
        <el-button type="primary" @click="SchoolStore.search()">查询</el-button>
        <el-button @click="isExpansion = !isExpansion">
          <span v-show="isExpansion">收起</span>
          <span v-show="!isExpansion">展开</span>
        </el-button>
      </el-form-item>
    </el-form>
  </el-card>
</template>

<style scoped>
.all-form {
  position: relative;
}
.right-bottom {
  position: absolute;
  right: 0px;
}
</style>
