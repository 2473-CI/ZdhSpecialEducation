<script setup>
import { useRouter } from "vue-router";
import { ref } from "vue";
import Axios from "../request/index";
import { ElMessage } from "element-plus";

const router = useRouter();
const role = ref("");

const login = () => {
  Axios.post("/user/login", {
    account: account.value,
    passWord: password.value,
    role: role.value,
  }).then((res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: "登录成功",
        type: "success",
      });
      localStorage.setItem(
        "user",
        res.data
        // encodeURIComponent(
        //   JSON.stringify({
        //     token: res.data,
        //   })
        // )
      );
      router.push("/management/studentList");
    } else {
      ElMessage({
        showClose: true,
        message: "账号或密码不存在",
        type: "error",
      });
    }
  });
};

const account = ref("");
const password = ref("");
</script>

<template>
  <div id="box">
    <div id="from">
      <p id="title_login">登录界面</p>
      <div id="user_info">
        <el-input v-model="account" placeholder="请输入账号" id="username" />
        <el-input
          v-model="password"
          placeholder="请输入密码"
          id="password"
          show-password
        />

        <el-radio-group v-model="role" style="display: flex; width: 100%">
          <el-radio label="系统管理员" size="small" border>系统管理员</el-radio>
          <el-radio label="委员会" size="small" border>委员会</el-radio>
          <el-radio label="学生" size="small" border>学生</el-radio>
          <el-radio label="学校管理员" size="small" border>学校管理员</el-radio>
          <el-radio label="教师" size="small" border>教师</el-radio>
        </el-radio-group>

        <button id="btn" @click="login">登录</button>
        <div id="register">
          <p @click="$router.push('/register')">还没账号？去注册</p>
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
  width: 500px;
  height: 400px;
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
  width: 368px;
  margin: 20px auto;
  height: 300px;
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
