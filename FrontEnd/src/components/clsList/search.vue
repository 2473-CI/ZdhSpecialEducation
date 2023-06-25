<script setup>
import { ref, reactive } from "vue";
import { useClassStore } from "../../store/cls";
import Axios from "../../request/index";

const classStore = useClassStore();
const isExpansion = ref(false);

const options = ref("");
const showSchoolSearch = ref(true);
Axios.get("/school/getAll").then(async (res) => {
  options.value = res.data;
  await Axios.post("/user/getRole").then(async (res2) => {
    if (res2.data.role == "学校管理员") {
      showSchoolSearch.value = false;
      await classStore.selfSearch(res2.data.schoolId);
    }
  });
});

const options2 = ref("");
Axios.get("/grade/getAll").then((res) => {
  options2.value = res.data;
});

const options3 = ref("");
Axios.get("/clazz/getAll").then((res) => {
  options3.value = res.data;
});

const reseach = reactive({
  schoolId: "",
  gradeId: "",
  clazzName: "",
});

const clear = () => {
  classStore.searchClass = reseach;
};
const clsSearch = () => {
  Axios.post("/user/getRole").then(async (res2) => {
    if (res2.data.role == "学校管理员") {
      showSchoolSearch.value = false;
      await classStore.selfSearch(res2.data.schoolId);
    } else {
      classStore.search();
    }
  });
};
</script>

<template>
  <el-card class="box-card">
    <el-form :inline="true" :model="classStore.searchClass" class="all-form">
      <el-form-item label="学校" style="width: 40%" v-show="showSchoolSearch">
        <el-select
          v-model="classStore.searchClass.schoolId"
          placeholder="请选择"
        >
          <el-option
            :label="school.schoolName"
            :value="school.schoolId"
            :key="school.schoolId"
            v-for="school in options"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="年级" style="width: 40%">
        <el-select
          v-model="classStore.searchClass.gradeId"
          placeholder="请选择"
        >
          <el-option
            :label="grade.gradeName"
            :value="grade.gradeId"
            :key="grade.gradeId"
            v-for="grade in options2"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="班级名" style="width: 280px" v-show="isExpansion">
        <el-input
          v-model="classStore.searchClass.clazzName"
          placeholder="请输入"
        />
      </el-form-item>

      <el-form-item class="right-bottom" style="width: 25%">
        <el-button @click="clear()">重置</el-button>
        <el-button type="primary" @click="clsSearch()">查询</el-button>
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
  display: flex;
  flex-wrap: wrap;
}
.right-bottom {
  position: absolute;
  right: 0px;
}
</style>
