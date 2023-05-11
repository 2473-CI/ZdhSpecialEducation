<script setup>
import { ref, reactive, getCurrentInstance, toRefs, defineProps } from "vue";
import { House } from "@element-plus/icons-vue";

import Axios from "../request/index.ts";
import { asBlob } from "html-docx-js-typescript";
import { saveAs } from "file-saver";
import allWord from "../components/exer/allWord.vue";
import stAction from "../components/stAction.vue";
import myEditor from "../components/editor/myEditor.vue";

const showEditor = ref(false);
const showSecond = ref(false);
const activeName = ref("fourth");
const specialLession = reactive({
  startYear: "",
  lastYear: "",
  semester: "",
  studentName: "",
  teacherName: "",
  basicArea: "",
  gbArea: "",
  targetArea: "",
  psychologyArea: "",
  advantageArea: "",
  defectArea: "",
});
const planForm = reactive({
  height: "",
  weight: "",
  leftEyes: "",
  rightEyes: "",
  radio: "",
  perception: "",
  action: "",
  language: "",
  cognition: "",
  socialize: "",
  life: "",
  emotion: "",
  advantage: "",
  defect: "",
  startYear: "",
  lastYear: "",
  semester: "",
});
const schoolHome = reactive({
  startYear: "",
  lastYear: "",
  semester: "",
  studentName: "",
  teacherName: "",
  situation: "",
  assist: "",
  feedback: "",
});

const reflectForm = reactive({
  startYear: "",
  lastYear: "",
  semester: "",
  studentName: "",
  teacherName: "",
  success: "",
  problem: "",
  improve: "",
});

const cxt = getCurrentInstance();
const bus = cxt.appContext.config.globalProperties.$bus;

const firstExportWordTpl = () => {
  bus.emit("firstMessage", specialLession);
};

const planExportWordTpl = () => {
  bus.emit("printMessage", planForm);
};

const connectExportWordTpl = () => {
  bus.emit("homeMessage", schoolHome);
};

const lastExportWordTpl = () => {
  bus.emit("reflectMessage", reflectForm);
};

const handleClick = (tab, event) => {
  console.log(tab, event);
};

const getFileList = ref([{}, {}]);
const getAllFile = () => {
  // Axios.get(
  //   `/studentDevelopment/getAll?studentId=${
  //     JSON.parse(localStorage.getItem("sq")).studentId
  //   }`
  // ).then((res) => {
  //   getFileList.value = res.data;
  //   console.log(getFileList.value);
  // });
};

const testcomRef = ref();
const getSonHander = () => {
  showEditor.value = false;
  // Axios.post("/studentDevelopment/add", {
  //   studentId: JSON.parse(localStorage.getItem("sq")).studentId,
  //   richText: testcomRef.value.valueHtml,
  // }).then(async (res) => {
  //   if (res.success == true) {
  //     ElMessage({
  //       showClose: true,
  //       message: res.data,
  //       type: "success",
  //     });
  //     await getAllFile();
  //   } else if (res.success == false) {
  //     ElMessage({
  //       showClose: true,
  //       message: res.message,
  //       type: "error",
  //     });
  //   }
  // });
};

const parentVal = ref("");
const todetail = (content) => {
  parentVal.value = "";
  parentVal.value = content;
  console.log(parentVal.value);
};

const saveSpecial = () => {
  console.log("保存");
};
const his = ref(false);
const seeHistory = () => {
  his.value = true;
  console.log("查看历史");
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
  <div>
    <allWord></allWord>
  </div>
  <el-tabs
    v-model="activeName"
    type="card"
    class="demo-tabs"
    @tab-click="handleClick"
    style="background-color: #fff; padding-left: 20px"
  >
    <el-tab-pane label="课程计划" name="first">
      <el-button
        type="info"
        v-show="!showEditor"
        plain
        @click="showEditor = true"
        >上传</el-button
      >
      <el-button
        type="info"
        v-show="showEditor"
        plain
        @click="showEditor = false"
        >取消</el-button
      >
      <myEditor v-if="showEditor" ref="testcomRef"> </myEditor>
      <el-button v-if="showEditor" @click="getSonHander">保存</el-button>
      <div style="display: flex; flex-wrap: wrap">
        <el-card
          class="box-card"
          shadow="hover"
          style="margin-top: 10px; margin-left: 10px"
          v-for="(item, index) in getFileList"
          :key="index"
          v-show="!showSecond"
          @click="
            // todetail(item.richText);
            showSecond = true
          "
        >
          <!-- <p>创建时间：</p>
          <p
            style="
              display: -webkit-box;
              -webkit-line-clamp: 2;
              -webkit-box-orient: vertical;
              text-overflow: ellipsis;
              overflow: hidden;
            "
          >
            {{ item.createTime }}
          </p>
          <p>
            内容简略：<span
              v-html="item.richText"
              style="
                display: -webkit-box;
                -webkit-line-clamp: 2;
                -webkit-box-orient: vertical;
                text-overflow: ellipsis;
                overflow: hidden;
              "
            ></span>
          </p> -->
        </el-card>
      </div>
      <myEditor v-if="showSecond" :value="parentVal" style="margin-top: 10px">
      </myEditor>
      <el-button v-if="showSecond" @click="showSecond = false">取消</el-button>
    </el-tab-pane>
    <el-tab-pane label="学生特殊课程评估" name="second">
      <el-button @click="his = false" v-show="his">返回</el-button>
      <div v-show="his">
        <el-card
          shadow="hover"
          style="margin-top: 10px; margin-left: 10px"
          :key="index"
        >
        </el-card>
      </div>
      <div v-show="!his">
        <h3>特殊课程评估</h3>
        <div style="display: flex; margin-top: 20px; flex-wrap: wrap">
          <p>
            <span>学生姓名：</span>
            <el-input
              v-model="specialLession.studentName"
              placeholder="请填写学生姓名"
              style="width: 300px"
            />
          </p>
          <p style="margin-left: 40px">
            <span>资源教师姓名：</span>
            <el-input
              v-model="specialLession.teacherName"
              placeholder="请填写资源教师姓名"
              style="width: 300px"
            />
          </p>
          <p style="margin-left: 40px">
            <span>年度：</span>
            <el-input
              v-model="specialLession.startYear"
              placeholder=""
              style="width: 100px"
            />&nbsp;--
            <el-input
              v-model="specialLession.lastYear"
              placeholder=""
              style="width: 100px"
            />
          </p>
          <p style="margin-left: 40px">
            <span>学期：</span>
            <el-input
              v-model="specialLession.semester"
              placeholder="请填写学期"
              style="width: 100px"
            />
          </p>
        </div>
        <div style="display: flex; align-items: center; margin-top: 30px">
          <div style="display: flex; align-items: center">
            <span style="width: 130px">基本情况分析：</span>
            <el-input
              v-model="specialLession.basicArea"
              :autosize="{ minRows: 4, maxRows: 4 }"
              type="textarea"
              placeholder="请输入基本情况分析"
              style="width: 500px"
              resize="none"
            />
          </div>
          <div style="display: flex; align-items: center; margin-left: 20px">
            <span style="width: 130px">优势与弱势分析：</span>
            <el-input
              v-model="specialLession.gbArea"
              :autosize="{ minRows: 4, maxRows: 4 }"
              type="textarea"
              placeholder="请输入优势与弱势分析"
              style="width: 500px"
              resize="none"
            />
          </div>
        </div>

        <div style="display: flex; margin-top: 20px; flex-wrap: wrap">
          <div style="display: flex; align-items: center">
            <span style="width: 130px">身体及体能（课程名称及目标）：</span>
            <el-input
              v-model="specialLession.targetArea"
              :autosize="{ minRows: 4, maxRows: 4 }"
              type="textarea"
              placeholder="请输入课程名称及目标"
              style="width: 500px"
              resize="none"
            />
          </div>
          <div style="display: flex; align-items: center; margin-left: 20px">
            <span style="width: 130px">个性心理发展(课程名称及目标)：</span>
            <el-input
              v-model="specialLession.psychologyArea"
              :autosize="{ minRows: 4, maxRows: 4 }"
              type="textarea"
              placeholder="请输入课程名称及目标"
              style="width: 500px"
              resize="none"
            />
          </div>
          <div style="display: flex; align-items: center; margin-top: 20px">
            <span style="width: 130px">优势特长发展(课程名称及目标)：</span>
            <el-input
              v-model="specialLession.advantageArea"
              :autosize="{ minRows: 4, maxRows: 4 }"
              type="textarea"
              placeholder="请输入课程名称及目标"
              style="width: 500px"
              resize="none"
            />
          </div>
          <div
            style="
              display: flex;
              align-items: center;
              margin-top: 20px;
              margin-left: 20px;
            "
          >
            <span style="width: 130px">缺陷补偿康复矫治(课程名称及目标)：</span>
            <el-input
              v-model="specialLession.defectArea"
              :autosize="{ minRows: 4, maxRows: 4 }"
              type="textarea"
              placeholder="请输入课程名称及目标"
              style="width: 500px"
              resize="none"
            />
          </div>
        </div>
        <el-button @click="firstExportWordTpl" style="margin-top: 20px"
          >导出word</el-button
        >
        <el-button @click="saveSpecial()" style="margin-top: 20px"
          >保存</el-button
        >
        <el-button @click="seeHistory(), (his = true)" style="margin-top: 20px"
          >查看历史</el-button
        >
        <el-divider />
        <h3 style="margin-top: 20px">特殊课程计划</h3>
        <div style="display: flex; flex-wrap: wrap; margin-top: 20px">
          <div style="width: 30%; display: flex; align-items: center">
            <span style="width: 20%">身高：</span>
            <el-input
              v-model="planForm.height"
              placeholder=""
              style="width: 80%"
            />
          </div>
          <div
            style="
              width: 30%;
              display: flex;
              align-items: center;
              margin-left: 20px;
            "
          >
            <span style="width: 20%">体重：</span>
            <el-input
              v-model="planForm.weight"
              placeholder=""
              style="width: 80%"
            />
          </div>
          <div
            style="
              width: 30%;
              display: flex;
              align-items: center;
              margin-left: 20px;
            "
          >
            <span style="width: 20%">左边视力：</span>
            <el-input
              v-model="planForm.leftEyes"
              placeholder=""
              style="width: 80%"
            />
          </div>
          <div
            style="
              width: 30%;
              display: flex;
              align-items: center;
              margin-top: 20px;
            "
          >
            <span style="width: 20%">右边视力：</span>
            <el-input
              v-model="planForm.rightEyes"
              placeholder=""
              style="width: 80%"
            />
          </div>
          <div
            style="
              width: 30%;
              display: flex;
              align-items: center;
              margin-top: 20px;
              margin-left: 20px;
            "
          >
            <span style="width: 20%">体质健康标准：</span>
            <el-radio-group v-model="planForm.radio">
              <el-radio label="优" size="small" border>优</el-radio>
              <el-radio label="良" size="small" border>良</el-radio>
              <el-radio label="及格" size="small" border>及格</el-radio>
              <el-radio label="不及格" size="small" border>不及格</el-radio>
            </el-radio-group>
          </div>
          <div
            style="
              width: 30%;
              display: flex;
              align-items: center;
              margin-top: 20px;
              margin-left: 20px;
            "
          >
            <span style="width: 20%">感知觉：</span>
            <el-input
              v-model="planForm.perception"
              placeholder=""
              style="width: 80%"
            />
          </div>

          <div
            style="
              width: 30%;
              display: flex;
              align-items: center;
              margin-top: 20px;
            "
          >
            <span style="width: 20%">社会交往：</span>
            <el-input
              v-model="planForm.socialize"
              placeholder=""
              style="width: 80%"
            />
          </div>
          <div
            style="
              width: 30%;
              display: flex;
              align-items: center;
              margin-top: 20px;
              margin-left: 20px;
            "
          >
            <span style="width: 20%">生活自理：</span>
            <el-input
              v-model="planForm.life"
              placeholder=""
              style="width: 80%"
            />
          </div>
          <div
            style="
              width: 30%;
              display: flex;
              align-items: center;
              margin-top: 20px;
              margin-left: 20px;
            "
          >
            <span style="width: 20%">认知：</span>
            <el-input
              v-model="planForm.cognition"
              placeholder=""
              style="width: 80%"
            />
          </div>

          <div
            style="
              width: 30%;
              display: flex;
              align-items: center;
              margin-top: 20px;
            "
          >
            <span style="width: 20%">粗大动作，精细动作：</span>
            <el-input
              v-model="planForm.action"
              placeholder=""
              style="width: 80%"
            />
          </div>
          <div
            style="
              width: 30%;
              display: flex;
              align-items: center;
              margin-top: 20px;
              margin-left: 20px;
            "
          >
            <span style="width: 20%">语言与言语沟通：</span>
            <el-input
              v-model="planForm.language"
              placeholder=""
              style="width: 80%"
            />
          </div>

          <div
            style="
              width: 30%;
              display: flex;
              align-items: center;
              margin-top: 20px;
              margin-left: 20px;
            "
          >
            <span style="width: 20%">情绪与行为：</span>
            <el-input
              v-model="planForm.emotion"
              placeholder=""
              style="width: 80%"
            />
          </div>
          <div
            style="
              width: 51%;
              display: flex;
              align-items: center;
              margin-top: 20px;
            "
          >
            <span style="width: 20%">优势的发展状况：</span>
            <el-input
              v-model="planForm.advantage"
              :autosize="{ minRows: 4, maxRows: 4 }"
              type="textarea"
              placeholder="请输入优势的发展状况"
              style="width: 500px"
              resize="none"
            />
          </div>
          <div
            style="
              width: 51%;
              display: flex;
              align-items: center;
              margin-top: 20px;
            "
          >
            <span style="width: 20%">缺陷障碍的矫治与康复状况：</span>
            <el-input
              v-model="planForm.defect"
              :autosize="{ minRows: 4, maxRows: 4 }"
              type="textarea"
              placeholder="请输入缺陷障碍的矫治与康复状况"
              style="width: 500px"
              resize="none"
            />
          </div>
          <p style="margin-left: 40px">
            <span>年度：</span>
            <el-input
              v-model="planForm.startYear"
              placeholder=""
              style="width: 100px"
            />&nbsp;--
            <el-input
              v-model="planForm.lastYear"
              placeholder=""
              style="width: 100px"
            />
          </p>
          <p style="margin-left: 40px">
            <span>学期：</span>
            <el-input
              v-model="planForm.semester"
              placeholder="请填写学期"
              style="width: 100px"
            />
          </p>
        </div>
        <el-button @click="planExportWordTpl" style="margin-top: 20px"
          >导出word</el-button
        >
        <el-divider />
      </div>
    </el-tab-pane>
    <el-tab-pane label="问题、反思和家长联系" name="third">
      <h3>家校联系卡</h3>
      <div style="display: flex; margin-top: 20px; flex-wrap: wrap">
        <p>
          <span>学生姓名：</span>
          <el-input
            v-model="schoolHome.studentName"
            placeholder="请填写学生姓名"
            style="width: 300px"
          />
        </p>
        <p style="margin-left: 40px">
          <span>资源教师姓名：</span>
          <el-input
            v-model="schoolHome.teacherName"
            placeholder="请填写资源教师姓名"
            style="width: 300px"
          />
        </p>
        <p style="margin-left: 40px">
          <span>年度：</span>
          <el-input
            v-model="schoolHome.startYear"
            placeholder=""
            style="width: 100px"
          />&nbsp;--
          <el-input
            v-model="schoolHome.lastYear"
            placeholder=""
            style="width: 100px"
          />
        </p>
        <p style="margin-left: 40px">
          <span>学期：</span>
          <el-input
            v-model="schoolHome.semester"
            placeholder="请填写学期"
            style="width: 100px"
          />
        </p>
      </div>
      <div
        style="
          display: flex;
          align-items: center;
          margin-top: 30px;
          flex-wrap: wrap;
        "
      >
        <div style="display: flex; align-items: center">
          <span style="width: 130px">出现的情况：</span>
          <el-input
            v-model="schoolHome.situation"
            :autosize="{ minRows: 4, maxRows: 4 }"
            type="textarea"
            placeholder="请输入出现的情况"
            style="width: 500px"
            resize="none"
          />
        </div>
        <div style="display: flex; align-items: center; margin-left: 20px">
          <span style="width: 130px">需要协助的事项：</span>
          <el-input
            v-model="schoolHome.assist"
            :autosize="{ minRows: 4, maxRows: 4 }"
            type="textarea"
            placeholder="请输入需要协助的事项"
            style="width: 500px"
            resize="none"
          />
        </div>
        <div style="display: flex; align-items: center; margin-top: 20px">
          <span style="width: 130px">家长反馈：</span>
          <el-input
            v-model="schoolHome.feedback"
            :autosize="{ minRows: 4, maxRows: 4 }"
            type="textarea"
            placeholder="请输入家长反馈"
            style="width: 500px"
            resize="none"
          />
        </div>
      </div>
      <el-button @click="connectExportWordTpl" style="margin-top: 20px"
        >导出word</el-button
      >
      <el-divider />
      <h3>教育教学的反思</h3>
      <div style="display: flex; margin-top: 20px; flex-wrap: wrap">
        <p>
          <span>学生姓名：</span>
          <el-input
            v-model="reflectForm.studentName"
            placeholder="请填写学生姓名"
            style="width: 300px"
          />
        </p>
        <p style="margin-left: 40px">
          <span>资源教师姓名：</span>
          <el-input
            v-model="reflectForm.teacherName"
            placeholder="请填写资源教师姓名"
            style="width: 300px"
          />
        </p>
        <p style="margin-left: 40px">
          <span>年度：</span>
          <el-input
            v-model="reflectForm.startYear"
            placeholder=""
            style="width: 100px"
          />&nbsp;--
          <el-input
            v-model="reflectForm.lastYear"
            placeholder=""
            style="width: 100px"
          />
        </p>
        <p style="margin-left: 40px">
          <span>学期：</span>
          <el-input
            v-model="reflectForm.semester"
            placeholder="请填写学期"
            style="width: 100px"
          />
        </p>
      </div>
      <div
        style="
          display: flex;
          align-items: center;
          margin-top: 30px;
          flex-wrap: wrap;
        "
      >
        <div style="display: flex; align-items: center; margin-top: 20px">
          <span style="width: 200px">成功之处及原因：</span>
          <el-input
            v-model="reflectForm.success"
            :autosize="{ minRows: 4, maxRows: 4 }"
            type="textarea"
            placeholder="请输入成功之处及原因"
            style="width: 600px"
            resize="none"
          />
        </div>
        <div style="display: flex; align-items: center; margin-top: 20px">
          <span style="width: 200px">存在的问题与困惑：</span>
          <el-input
            v-model="reflectForm.problem"
            :autosize="{ minRows: 4, maxRows: 4 }"
            type="textarea"
            placeholder="请输入存在的问题与困惑："
            style="width: 600px"
            resize="none"
          />
        </div>
        <div style="display: flex; align-items: center; margin-top: 20px">
          <span style="width: 200px">改进措施及建议：</span>
          <el-input
            v-model="reflectForm.improve"
            :autosize="{ minRows: 4, maxRows: 4 }"
            type="textarea"
            placeholder="请输入改进措施及建议："
            style="width: 600px"
            resize="none"
          />
        </div>
      </div>
      <el-button @click="lastExportWordTpl" style="margin-top: 20px"
        >导出word</el-button
      >
      <el-divider />
    </el-tab-pane>
    <el-tab-pane label="学习行为" name="fourth">
      <stAction></stAction>
    </el-tab-pane>
  </el-tabs>
</template>

<style scoped>
.demo-tabs > .el-tabs__content {
  padding: 32px;
  color: #6b778c;
  font-size: 32px;
  font-weight: 600;
}
</style>
