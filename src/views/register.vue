<script setup>
import { useUserStore } from "../store/user";
import { useRouter } from "vue-router";
import { ref } from "vue";
import Axios from "../request/index";
import { ElMessage } from "element-plus";
const userStore = useUserStore();
const router = useRouter();

const phone = ref("");
const postbox = ref("");
const password = ref("");
const repassword = ref("");
const role = ref("");
const value = ref("");
const options = ref("");
const value1 = ref("");
const username = ref("");
const zh = ref("");

const load = async () => {
  const { data } = await Axios.get("/school/getAll");
  options.value = data;
  console.log(data);
};
load();

// const checkPhone = /^1[3|4|5|6|7|8|9][0-9]\d{8}$/;
const register = () => {
  if (username.value.length == 0) {
    ElMessage({
      showClose: true,
      message: "用户名未填写",
      type: "error",
    });
  } else if (username.value.length < 1 || username.value.length >= 5) {
    ElMessage({
      showClose: true,
      message: "用户名格式错误",
      type: "error",
    });
  } else if (zh.value.length == 0) {
    ElMessage({
      showClose: true,
      message: "账号不能为零",
      type: "error",
    });
  } else if (zh.value.length < 2 || zh.value.length >= 12) {
    ElMessage({
      showClose: true,
      message: "账号不符合规范",
      type: "error",
    });
  } else if (password.value.length == 0) {
    ElMessage({
      showClose: true,
      message: "密码不能为零",
      type: "error",
    });
  } else if (password.value.length < 6 || password.value.length >= 18) {
    ElMessage({
      showClose: true,
      message: "密码不符合规范",
      type: "error",
    });
  } else {
    Axios.post("/user/register", {
      userAccount: zh.value,
      passWord: password.value,
      userName: username.value,
    }).then((res) => {
      console.log(res);
      if (res.success == true) {
        ElMessage({
          showClose: true,
          message: res.data,
          type: "success",
        });
        router.push("/login");
      } else {
        ElMessage({
          showClose: true,
          message: res.message,
          type: "error",
        });
      }
    });
  }
};
</script>

<template>
  <div id="box">
    <div id="from">
      <p id="title_login">注册账号</p>
      <div id="user_info">
        <div style="display: flex; align-items: center">
          <span style="white-space: nowrap">手机号：</span>
          <el-input
            v-model="phone"
            placeholder="请输入手机号"
            id="phone"
            input-style="width:300px;"
          />
        </div>
        <div style="display: flex; align-items: center">
          &nbsp;&nbsp;&nbsp;
          <span style="white-space: nowrap">账号：</span>
          <el-input
            v-model="zh"
            placeholder="请设置账号"
            id="zh"
            input-style="width:300px;"
          />
        </div>
        <div style="display: flex; align-items: center">
          <span style="white-space: nowrap">用户名：</span>
          <el-input
            v-model="username"
            placeholder="请输入用户名"
            id="username"
            input-style="width:300px;"
          />
        </div>
        <div style="display: flex; align-items: center">
          &nbsp;&nbsp;&nbsp;
          <span style="white-space: nowrap">邮箱：</span>
          <el-input
            v-model="postbox"
            placeholder="请输入邮箱"
            id="postbox"
            input-style="width:300px;"
          />
        </div>
        <div style="white-space: nowrap">
          &nbsp;&nbsp;
          <span style="white-space: nowrap">身份：</span>
          <el-radio-group v-model="role">
            <el-radio label="系统管理" size="small" border>系统管理</el-radio>
            <el-radio label="学校管理" size="small" border>学校管理</el-radio>
            <el-radio label="教师" size="small" border>教师</el-radio>
            <el-radio label="委员会" size="small" border>委员会</el-radio>
          </el-radio-group>
        </div>
        <div style="white-space: nowrap">
          &nbsp;&nbsp;
          <span style="white-space: nowrap">学校:</span>
          &nbsp;
          <el-select
            v-model="value1"
            class="m-2"
            placeholder="请选择学校"
            size="large"
          >
            <el-option
              v-for="item in options"
              :key="item.schoolId"
              :label="item.schoolName"
              :value="item.schoolId"
            />
          </el-select>
        </div>
        <div style="display: flex; align-items: center">
          &nbsp;&nbsp;&nbsp;
          <span style="white-space: nowrap">密码：</span>
          <el-input
            v-model="password"
            placeholder="请输入密码"
            id="password"
            show-password
            input-style="width:300px;"
          />
        </div>
        <div style="display: flex; align-items: center; margin-left: -50px">
          <span style="white-space: nowrap">重新输入密码：</span>
          <el-input
            v-model="repassword"
            placeholder="请重新输入密码"
            id="repassword"
            show-password
            input-style="width:300px;"
          />
        </div>
        <button id="btn" @click="register">注册</button>
        <div id="register">
          <p @click="$router.push('/login')">已有账号，去登陆</p>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
#box {
  width: 100vw;
  height: 100vh;
  background-image: url("https://gw.alipayobjects.com/zos/rmsportal/TVYTbAXWheQpRcWDaDMu.svg");
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
}

#from {
  width: 600px;
  height: 700px;
  background-color: aliceblue;
}

#title_login {
  font-weight: 600;
  font-size: 33px;
  text-align: center;
  width: 400px;
  margin: 10px auto;
}
#user_info {
  width: 450px;
  margin: 20px auto;
  height: 600px;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
}
#btn {
  width: 100%;
  background-color: #1677ff;
  border-radius: 6px;
  color: #fff;
  border: 1px solid transparent;
  height: 32px;
  font-size: 14px;
}
#register {
  text-align: right;
}
</style>
