<script setup>
import { ref, reactive, getCurrentInstance, toRefs, defineProps } from "vue";
import { House } from "@element-plus/icons-vue";
import { ElMessage, ElMessageBox } from "element-plus";
import Axios from "../request/index.ts";

const allList = ref([]);
const dialogFormVisible = ref(false);

const sureList = ref([]);

const form = reactive({
  studentId: JSON.parse(localStorage.getItem("sq")).studentId,
  studentName: JSON.parse(localStorage.getItem("sq")).name,
  fromSchoolName: JSON.parse(localStorage.getItem("sq")).schoolName,
  fromRegionCode: "",
  toSchoolName: "",
  toSchoolId: "",
  toRegionCode: "",
});

function steTime(time, style) {
  var N = time.getFullYear(); //年
  var Y =
    time.getMonth() + 1 < 10
      ? "0" + (time.getMonth() + 1)
      : time.getMonth() + 1; //月
  var R = time.getDate() < 10 ? "0" + time.getDate() : time.getDate(); //日
  var H = time.getHours() < 10 ? "0" + time.getHours() : time.getHours(); //时
  var F = time.getMinutes() < 10 ? "0" + time.getMinutes() : time.getMinutes(); //分
  var M = time.getSeconds() < 10 ? "0" + time.getSeconds() : time.getSeconds(); //秒
  return N + style + Y + style + R + " " + H + ":" + F + ":" + M;
}

//获取所有学校
const schoolObj = ref("");
Axios.get("/school/getAll").then((res) => {
  console.log(res);
  schoolObj.value = res.data.filter(
    (k) => JSON.parse(localStorage.getItem("sq")).schoolName == k.schoolName
  );
});

//获取所有安置方式
const arrangeOptions = ref([]);
const startArrage = ref("");
Axios.get("/arrange/getAll").then((res) => {
  console.log(res);
  arrangeOptions.value = res.data.map((k) => {
    return {
      label: k.arrangeName,
      value: k.arrangeId,
    };
  });
  console.log(arrangeOptions.value);
  startArrage.value = arrangeOptions.value.filter(
    (k) => JSON.parse(localStorage.getItem("sq")).arrangeName == k.label
  );
  console.log(startArrage.value);
});

const toArrage = ref("");
const toArrageName = ref("");
const toStart = () => {
  console.log(arrangeOptions.value, toArrage.value);
  toArrageName.value = [...arrangeOptions.value].filter(
    (k) => toArrage.value == k.value
  );

  Axios.post("/placement/add", {
    studentId: JSON.parse(localStorage.getItem("sq")).studentId,
    studentName: JSON.parse(localStorage.getItem("sq")).name,
    schoolId: schoolObj.value[0].schoolId,
    schoolName: schoolObj.value[0].schoolName,
    from: startArrage.value[0].label,
    to: toArrageName.value[0].label,
    toId: toArrageName.value[0].value,
  }).then(async (res) => {
    console.log(res);
    if (res.success == true) {
      dialogFormVisible.value = false;
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });
      await Axios.post("/placement/selectBuStudentId", {
        studentId: JSON.parse(localStorage.getItem("sq")).studentId,
      }).then((res) => {
        console.log(res);
        passing.value.length = 0;
        reasonList.value.length = 0;
        for (let item of res.data) {
          if (item.pass == "待审批") {
            passing.value.push(item);
          } else {
            reasonList.value.push(item);
          }
        }
      });
    } else if (res.success == false) {
      ElMessage({
        showClose: true,
        message: res.message,
        type: "error",
      });
    }
  });
};

const passing = ref([]);
const reasonList = ref([]);
Axios.post("/placement/selectBuStudentId", {
  studentId: JSON.parse(localStorage.getItem("sq")).studentId,
}).then((res) => {
  console.log(res);
  passing.value.length = 0;
  reasonList.value.length = 0;
  for (let item of res.data) {
    if (item.pass == "待审批") {
      passing.value.push(item);
    } else {
      reasonList.value.push(item);
    }
  }
  console.log(reasonList.value);
});

const showBtn = ref(false);
Axios.get("/user/getRole").then((res) => {
  console.log(res);
  if (res.data == "教师") {
    showBtn.value = true;
  }
});
</script>

<template>
  <p
    style="
      color: #1677ff;
      font-size: 14px;
      margin-left: 30px;
      display: flex;
      align-items: center;
      margin-top: 10px;
    "
    @click="$router.push('/management/studentCenter')"
  >
    <el-icon><House /></el-icon>返回学生主页
  </p>

  <el-button
    type="primary"
    round
    style="margin-left: 15px; margin-top: 10px"
    @click="dialogFormVisible = true"
    v-if="showBtn"
    >修改安置方式</el-button
  >

  <el-dialog
    v-model="dialogFormVisible"
    title="修改安置方式"
    style="width: 600px"
  >
    <el-form :model="form" style="width: 500px; margin: auto">
      <el-form-item label="学生姓名:">
        <el-input v-model="form.studentName" style="width: 300px" disabled />
      </el-form-item>
      <el-form-item label="学校名称">
        <el-input
          disabled
          v-model="schoolObj[0].schoolName"
          style="width: 300px"
        >
        </el-input>
      </el-form-item>
      <el-form-item label="原安置方式:">
        <el-input v-model="startArrage[0].label" disabled style="width: 300px">
        </el-input>
      </el-form-item>
      <el-form-item label="需修改的安置方式:">
        <el-select placeholder="请选择安置方式" v-model="toArrage">
          <el-option
            v-for="(item, index) in arrangeOptions"
            :key="index"
            :label="item.label"
            :value="item.value"
          />
        </el-select>
      </el-form-item>
    </el-form>
    <template #footer>
      <span class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取消</el-button>
        <el-button type="primary" @click="toStart()"> 确定 </el-button>
      </span>
    </template>
  </el-dialog>

  <el-card style="margin: 1%; height: 250px; margin-top: 1%">
    <h3>正在安置</h3>
    <el-empty
      description="暂无正在安置"
      style="height: 200px"
      v-if="!passing.length"
    />
    <el-steps
      align-center
      style="margin-top: 50px"
      v-if="passing.length"
      :active="passing.length ? 1 : ''"
    >
      <el-step title="教师发起" :description="passing[0].createTime" />
      <el-step title="学校审批" :description="passing[0].pass" />
    </el-steps>
  </el-card>

  <el-card class="box-card">
    <h3>安置记录</h3>
    <div class="demo-collapse">
      <el-empty description="暂无安置记录" v-if="!reasonList.length" />
      <el-collapse v-if="reasonList.length">
        <el-collapse-item
          :title="`状态：${item.pass}`"
          :name="index"
          v-for="(item, index) in reasonList"
        >
          <div style="display: flex; align-items: center">
            <div style="margin-left: 20px">
              <p>学生姓名：{{ item.studentName }}</p>
              <p>发起时间：{{ item.createTime }}</p>
              <p>原安置方式：{{ item.from }}</p>
              <p>转换安置方式：{{ item.to }}</p>
              <p v-if="item.pass == '驳回'">驳回理由：{{ item.other }}</p>
            </div>
          </div>
        </el-collapse-item>
      </el-collapse>
    </div>
  </el-card>
</template>

<style scoped>
.box-card {
  margin: 1%;
  height: 300px;
  overflow-y: auto;
}
</style>
