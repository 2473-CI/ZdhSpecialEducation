<script setup lang="ts">
import { reactive, ref } from "vue";
import { useSchoolStore } from "../../store/school";
import { useClsStore } from "../../store/cls";
import { useStudentStore } from "../../store/student";
import Axios from "../../request";
const SchoolStore = useSchoolStore();
const ClsStore = useClsStore();
const StudentStore = useStudentStore();

const isExpansion = ref(false);
const name = ref("");
const phone = ref("");
const postbox = ref("");
StudentStore.searchStuImp.schoolId = SchoolStore.schoolList[0].schoolId;
StudentStore.search();
</script>

<template>
  <el-card class="box-card">
    <el-form :inline="true" :model="StudentStore.searchStuImp" class="all-form">
      <el-form-item label="学校">
        <el-select
          v-model="StudentStore.searchStuImp.schoolId"
          placeholder="请选择"
        >
          <el-option
            :label="school.schoolName"
            :value="school.schoolId"
            v-for="school in SchoolStore.schoolList"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="姓名" v-show="isExpansion">
        <el-input v-model="name" placeholder="请输入" />
      </el-form-item>
      <el-form-item label="手机号" v-show="isExpansion">
        <el-input v-model="phone" placeholder="请输入" />
      </el-form-item>
      <el-form-item label="邮箱" v-show="isExpansion">
        <el-input v-model="postbox" placeholder="请输入" />
      </el-form-item>
      <el-form-item class="right-bottom">
        <el-button @click="StudentStore.clear()">重置</el-button>
        <!-- <el-button type="primary" @click="seachList()">查询</el-button> -->
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
