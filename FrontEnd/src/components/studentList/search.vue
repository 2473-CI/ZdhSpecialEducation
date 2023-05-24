<script setup>
import { reactive, ref } from "vue";

import { useStudentStore } from "../../store/student";
import Axios from "../../request";

const StudentStore = useStudentStore();

const isExpansion = ref(false);

StudentStore.search();

const options = ref("");
Axios.get("/school/getAll").then((res) => {
  options.value = res.data;
});

const options3 = ref("");
Axios.get("/obstacle/getAll").then((res) => {
  options3.value = res.data;
});

const options2 = ref("");
Axios.get("/clazz/getAll").then((res) => {
  options2.value = res.data;
});

const reSeach = reactive({
  schoolId: "",
  clazzId: "",
  studentName: "",
  studentGender: "",
  obstacleId: "",
  arrangeId: "",
});

const clear = () => {
  StudentStore.searchStudent = reSeach;
};
</script>

<template>
  <el-card class="box-card">
    <el-form
      :inline="true"
      :model="StudentStore.searchStudent"
      class="all-form"
    >
      <el-form-item label="学校" class="top-item">
        <el-select
          v-model="StudentStore.searchStudent.schoolId"
          placeholder="请选择"
        >
          <el-option
            :label="school.schoolName"
            :value="school.schoolId"
            v-for="school in options"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="班级" class="top-item">
        <el-select
          v-model="StudentStore.searchStudent.clazzId"
          placeholder="请选择"
        >
          <el-option
            :label="item.clazzName"
            :value="item.clazzId"
            :key="item.clazzId"
            v-for="item in options2"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="姓名" v-show="isExpansion" class="top-item">
        <el-input
          v-model="StudentStore.searchStudent.studentName"
          placeholder="请输入"
        />
      </el-form-item>
      <el-form-item label="性别" v-show="isExpansion" class="top-item">
        <el-select
          v-model="StudentStore.searchStudent.studentGender"
          placeholder="请选择"
        >
          <el-option label="男" value="男" />
          <el-option label="女" value="女" />
        </el-select>
      </el-form-item>
      <el-form-item label="障碍类型" v-show="isExpansion" class="top-item">
        <el-select
          v-model="StudentStore.searchStudent.obstacleId"
          placeholder="请选择"
        >
          <el-option
            v-for="item in options3"
            :label="item.obstacleName"
            :value="item.obstacleId"
            :key="item.obstacleId"
          />
        </el-select>
      </el-form-item>

      <el-form-item label="安置方式" v-show="isExpansion" class="top-item">
        <el-select
          v-model="StudentStore.searchStudent.arrangeId"
          placeholder="请选择"
        >
          <el-option label="特殊学校" value="特殊学校" />
        </el-select>
      </el-form-item>
      <el-form-item class="right-bottom">
        <el-button @click="clear()">重置</el-button>
        <el-button type="primary" @click="StudentStore.search()"
          >查询</el-button
        >
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
  right: -10px;
}
.top-item {
  width: 300px;
}
</style>
