<script setup>
import { reactive, ref } from "vue";
import { useSchoolStore } from "../../store/school";

import { useStudentStore } from "../../store/student";
import { useUserStore } from "../../store/user";
import Axios from "../../request";
import UserPwd from "../../views/userPwd.vue";
const UserStore = useUserStore();
Axios.post("/user/getRole").then(async (res) => {
  if (res.data.role == "学校管理员") {
    await useUserStore().selfSearch(res.data.schoolId);
  } else {
    await useUserStore().search();
  }
});
const researchUser = reactive({
  schoolId: "",
  userName: "",
  userPhone: "",
  userMail: "",
});
const options = ref("");
const ob = reactive({});
const showSch = ref(false);
Axios.get("/school/getAll").then((res) => {
  let arr = [];
  Axios.post("/user/getRole").then((res2) => {
    if (res2.data.role == "学校管理员") {
      console.log(res);
      arr = res.data.filter((k) => k.schoolId == res2.data.schoolId);
      options.value = arr;
    } else {
      options.value = res.data;
      showSch.value = true;
    }
  });

  for (let item of res.data) {
    ob[item["schoolId"].toString()] = item["schoolName"];
  }
  console.log(ob);
});

const isExpansion = ref(false);
const name = ref("");
const phone = ref("");
const postbox = ref("");

const teacherSeach = () => {
  Axios.post("/user/getRole").then(async (res) => {
    if (res.data.role == "学校管理员") {
      await UserStore.selfSearch(res.data.schoolId);
    } else {
      await UserStore.search();
    }
  });
};
</script>

<template>
  <el-card class="box-card">
    <el-form :inline="true" :model="UserStore.searchUser" class="all-form">
      <el-form-item label="学校" v-show="showSch">
        <el-select v-model="UserStore.searchUser.schoolId" placeholder="请选择">
          <el-option
            :label="school.schoolName"
            :value="school.schoolId"
            v-for="school in options"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="姓名">
        <el-input
          v-model="UserStore.searchUser.userName"
          placeholder="请输入"
        />
      </el-form-item>
      <el-form-item label="手机号">
        <el-input
          v-model="UserStore.searchUser.userPhone"
          placeholder="请输入"
        />
      </el-form-item>
      <br />
      <el-form-item label="邮箱" v-show="isExpansion">
        <el-input
          v-model="UserStore.searchUser.userMail"
          placeholder="请输入"
        />
      </el-form-item>
      <el-form-item class="right-bottom">
        <el-button @click="UserStore.searchUser = researchUser">重置</el-button>
        <el-button type="primary" @click="teacherSeach()">查询</el-button>
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
  top: 10px;
}
</style>
