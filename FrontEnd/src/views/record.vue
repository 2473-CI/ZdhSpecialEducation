<script setup>
import { ref, reactive, getCurrentInstance, toRefs, defineProps } from "vue";
import { House } from "@element-plus/icons-vue";
import { ElMessage, ElMessageBox } from "element-plus";
import Axios from "../request/index";

const allList = ref([]);
const dialogFormVisible = ref(false);

const sureList = ref([]);
const reasonList = ref([]);
Axios.post("/transfer/selectByStudentId", {
  studentId: JSON.parse(localStorage.getItem("sq")).studentId,
}).then(async (res) => {
  console.log(res);
  allList.value = res.data;
  for (let item of allList.value) {
    console.log(item.fromRegionCode, item.toRegionCode);
    await Axios.get(
      `/region/getOneMess?regionCode=${item.fromRegionCode}`
    ).then((res) => {
      item["fromRegionName"] = res.data.regionName;
      console.log(res);
    });
    await Axios.get(`/region/getOneMess?regionCode=${item.toRegionCode}`).then(
      (res) => {
        item["toRegionName"] = res.data.regionName;
        console.log(res);
      }
    );
    if (
      item.status != "驳回" &&
      (item.startTime == null ||
        item.centerTime == null ||
        item.boardTime == null ||
        item.endTime == null)
    ) {
      sureList.value.push(item);
      sureList.value[0].startTime = steTime(
        new Date(sureList.value[0].startTime),
        "-"
      );
      sureList.value[0].centerTime = steTime(
        new Date(sureList.value[0].centerTime),
        "-"
      );
      sureList.value[0].boardTime = steTime(
        new Date(sureList.value[0].boardTime),
        "-"
      );
    } else {
      reasonList.value.push(item);
    }
  }

  console.log(sureList.value, reasonList.value);
});

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

const schoolOptions = ref([]);
//获取所有学校
Axios.get("/school/getAll").then((res) => {
  console.log(res);
  schoolOptions.value = res.data.map((k) => {
    return {
      label: k.schoolName,
      value: k.schoolId,
      regionCode: k.regionCode,
    };
  });
  console.log(schoolOptions.value);
});

const toStart = () => {
  if (form.fromSchoolName) {
    form.fromRegionCode = schoolOptions.value.filter(
      (k) => k.label == form.fromSchoolName
    )[0].regionCode;
  }
  if (form.toSchoolId) {
    form.toSchoolName = schoolOptions.value.filter(
      (k) => k.value == form.toSchoolId
    )[0].label;
    form.toRegionCode = schoolOptions.value.filter(
      (k) => k.value == form.toSchoolId
    )[0].regionCode;
  }
  console.log(form);

  if (
    form.fromSchollName != "" &&
    form.toSchoolId != "" &&
    form.studentName != ""
  ) {
    Axios.post("/transfer/start", form).then((res) => {
      console.log(res);
      if (res.success == true) {
        ElMessage({
          showClose: true,
          message: res.data,
          type: "success",
        });
        dialogFormVisible.value = false;
        form.studentName = "";
        form.fromSchoolName = "";
        form.fromRegionCode = "";
        form.toSchoolName = "";
        form.toSchoolId = "";
        form.toRegionCode = "";
      } else {
        ElMessage({
          showClose: true,
          message: res.message,
          type: "error",
        });
      }
    });
  } else {
    ElMessage({
      showClose: true,
      message: "信息不完善",
      type: "error",
    });
  }
};
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
    >发起转衔</el-button
  >

  <el-dialog v-model="dialogFormVisible" title="发起转衔" style="width: 600px">
    <el-form :model="form" style="width: 500px; margin: auto">
      <el-form-item label="学生姓名:">
        <el-input v-model="form.studentName" style="width: 300px" disabled />
      </el-form-item>
      <el-form-item label="来源学校:" :label-width="formLabelWidth">
        <el-select
          v-model="form.fromSchoolName"
          placeholder="请选择来源学校"
          disabled
        >
          <el-option
            v-for="(item, index) in schoolOptions"
            :key="index"
            :label="item.label"
            :value="item.label"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="转衔学校:">
        <el-select v-model="form.toSchoolId" placeholder="请选择转衔学校">
          <el-option
            v-for="(item, index) in schoolOptions"
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
    <h3>正在转衔</h3>
    <el-empty
      description="暂无正在转衔"
      style="height: 200px"
      v-if="!sureList.length"
    />
    <el-steps
      v-if="sureList.length"
      :active="
        sureList[0].centerTime != null
          ? sureList[0].boardTime != null
            ? 3
            : 2
          : 1
      "
      align-center
      style="margin-top: 50px"
    >
      <el-step title="来源学校审批" :description="sureList[0].startTime" />
      <el-step title="特教中心审批" :description="sureList[0].centerTime" />
      <el-step title="委员会审批" :description="sureList[0].boardTime" />
      <el-step title="转衔学校审批" description="暂未审批" />
    </el-steps>
  </el-card>

  <el-card class="box-card">
    <h3>转衔记录</h3>
    <div class="demo-collapse">
      <el-empty description="暂无正在转衔" v-if="!reasonList.length" />
      <el-collapse v-if="reasonList.length">
        <el-collapse-item
          :title="`状态：${item.status}`"
          :name="index"
          v-for="(item, index) in reasonList"
        >
          <div style="height: 120px; display: flex">
            <div>
              <p>姓名：{{ item.studentName }}</p>
              <p>学校名称：{{ item.fromSchollName }}</p>
              <p>学校所在地区：{{ item.fromRegionName }}</p>
              <p>转衔学校名称：{{ item.toSchoolName }}</p>
              <p>转衔学校所在地区：{{ item.toRegionName }}</p>
            </div>
            <div style="margin-left: 150px">
              <p v-if="item.other">驳回原因：{{ item.other }}</p>
              <p v-if="item.schoolTime">
                学校发起时间：{{ steTime(new Date(item.schoolTime), "-") }}
              </p>
              <p v-if="item.centerTime">
                特教中心审批时间：{{ steTime(new Date(item.centerTime), "-") }}
              </p>
              <p v-if="!item.boardTime">委员会审批时间:无</p>
              <p v-if="!item.endTime">转衔学校审批:无</p>
              <p v-if="item.boardTime">
                委员会审批时间:{{ steTime(new Date(item.boardTime), "-") }}
              </p>
              <p v-if="item.endTime">
                转衔学校审批:{{ steTime(new Date(item.endTime), "-") }}
              </p>
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
