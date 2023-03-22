<script setup lang="ts">
import { useUserStore } from "../store/user";
import { useRouter } from "vue-router";
import { ref } from "vue";
const userStore = useUserStore();
const router = useRouter();
const login = () => {
  userStore.loadUserInfo();
  router.push("/index/welcome");
};

const input1 = ref("");
const input2 = ref("");
</script>

<template>
  <div id="box">
    <div id="from">
      <p id="title_login">登录界面</p>
      <div id="user_info">
        <el-input v-model="input1" placeholder="请输入账号" id="username" />
        <el-input
          v-model="input2"
          placeholder="请输入密码"
          id="password"
          show-password
        />
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
  height: 300px;
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
  height: 180px;
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
