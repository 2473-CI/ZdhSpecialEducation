<script setup>
import { useUserStore } from "../store/user";
import { useRouter } from "vue-router";
import { ref } from "vue";
import Axios from "../request/index";
import { ElMessage } from "element-plus";
const userStore = useUserStore();
const router = useRouter();
const showRoleSchool = ref(false);
const showRoleCommit = ref(false);
const showRoleStudent = ref(false);
const whether = ref("");

const phone = ref("");
const postbox = ref("");
const password = ref("");
const repassword = ref("");
const role = ref("");
const value = ref("");
const options = ref([]);
const value1 = ref("");
const username = ref("");
const zh = ref("");
const userHead = ref("");
const sex = ref("");
const optionsCommit = ref([{}, {}]);
const value2 = ref("");

const load = async () => {
  const { data } = await Axios.get("/school/getAll");
  options.value = data;
  console.log(data);
};
load();

Axios.get("/committee/").then((res) => {
  console.log(res);
  optionsCommit.value = res.data;
});

const change = () => {
  console.log(role.value);
  if (role.value == "学校管理员或教师") {
    showRoleSchool.value = true;
    showRoleCommit.value = false;
    showRoleStudent.value = false;
  } else if (role.value == "系统管理") {
    showRoleSchool.value = false;
    showRoleCommit.value = false;
    showRoleStudent.value = false;
  } else if (role.value == "委员会") {
    showRoleSchool.value = false;
    showRoleCommit.value = true;
    showRoleStudent.value = false;
  } else if (role.value == "学生") {
    showRoleSchool.value = false;
    showRoleCommit.value = false;
    showRoleStudent.value = true;
  }
};

const changeS = () => {
  if (sex.value == "男") {
    userHead.value = "https://static.yirenyian.com/opoc/sysImg/avatar-boy.png";
  } else if (sex.value == "女") {
    userHead.value = "https://static.yirenyian.com/opoc/sysImg/avatar-girl.png";
  }
};

const checkPhone = /^1[3|4|5|6|7|8|9][0-9]\d{8}$/;
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
      message: "用户名格式错误,用户名长度为2-4",
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
      message: "账号不符合规范,账号长度为2-11",
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
      message: "密码不符合规范,密码长度为6-17",
      type: "error",
    });
  } else {
    if (role.value == "学校管理员或教师") {
      if (whether.value == "是") {
        role.value = "学校管理员";
      } else if (whether.value == "否") {
        role.value = "教师";
      }

      Axios.post("/user/register", {
        schoolId: value1.value,
        account: zh.value,
        userName: username.value,
        passWord: password.value,
        userHead: userHead.value,
        userGender: sex.value,
        userPhone: phone.value,
        userMail: postbox.value,
        schoolAdmin: whether.value,
        role: role.value,
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
    } else if (role.value == "委员会") {
      Axios.post("/user/register", {
        committeeId: value2.value,
        account: zh.value,
        userName: username.value,
        passWord: password.value,
        userHead: userHead.value,
        userGender: sex.value,
        userPhone: phone.value,
        userMail: postbox.value,
        role: role.value,
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
  }
};
</script>

<template>
  <div id="box">
    <div id="from">
      <p id="title_login">注册账号</p>
      <div id="user_info">
        <div style="white-space: nowrap">
          &nbsp;&nbsp;
          <span style="white-space: nowrap">身份：</span>
          <el-radio-group v-model="role" @change="change()">
            <!-- <el-radio label="系统管理" size="small" border>系统管理</el-radio> -->
            <el-radio label="学校管理员或教师" size="small" border
              >学校管理员或教师</el-radio
            >
            <el-radio label="委员会" size="small" border>委员会</el-radio>
            <!-- <el-radio label="学生" size="small" border>学生</el-radio> -->
          </el-radio-group>
        </div>

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

        <div>
          <span style="margin-left: 15px"> 头像： </span>
          <img
            :src="userHead"
            style="height: 30px; width: 30px; border-radius: 50px"
          />
        </div>

        <div>
          <span slot="label" style="margin-left: 15px"> 性别： </span>
          <el-radio-group v-model="sex" :change="changeS()">
            <el-radio label="男" size="large">男</el-radio>
            <el-radio label="女" size="large">女</el-radio>
          </el-radio-group>
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

        <div style="white-space: nowrap" v-if="showRoleStudent">
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

        <div
          style="white-space: nowrap; margin-left: -50px"
          v-if="showRoleSchool"
        >
          <span style="white-space: nowrap">是否是管理员:</span>
          &nbsp;
          <el-radio-group v-model="whether">
            <el-radio label="是" size="small" border>是</el-radio>
            <el-radio label="否" size="small" border>否</el-radio>
          </el-radio-group>
        </div>

        <div style="white-space: nowrap" v-if="showRoleSchool">
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

        <div
          style="white-space: nowrap; margin-left: -18px"
          v-if="showRoleCommit"
        >
          &nbsp;&nbsp;
          <span style="white-space: nowrap">委员会:</span>
          &nbsp;
          <el-select
            v-model="value2"
            class="m-2"
            placeholder="请选择委员会"
            size="large"
          >
            <el-option
              v-for="item in optionsCommit"
              :key="item.id"
              :label="item.committeeName"
              :value="item.id"
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
          <p @click="$router.push('/login')">已有账号，去登录</p>
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
  margin-top: 30px;
  background-color: aliceblue;
}

#title_login {
  font-weight: 600;
  font-size: 33px;
  text-align: center;
  width: 400px;
  margin: 20px auto;
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
