<script setup>
import { ref, reactive } from "vue";
import { useClassStore } from "../store/cls";
import { ElMessage, ElMessageBox } from "element-plus";
import Axios from "../request/index";
import axios from "axios";
import pdfPreview from "../components/file/pdfPreview.vue";
import excelPreview from "../components/file/excelPreview.vue";
import docPreview from "../components/file/docPreview.vue";

const dialogFormVisible = ref(false);
const showInput = ref(false);
const dialogVisible = ref(false);
const detailOptions = ref([]);

const optionsTwo = ref([]);

const getAll = () => {
  Axios.post("/file/search", {}).then((res) => {
    console.log(res);
    detailOptions.value = res.data;

    res.data = [...new Set(res.data.map((k) => k["contextType"]))];
    for (let item of res.data) {
      console.log(item);
      optionsTwo.value.push(item);
    }
    optionsTwo.value = optionsTwo.value.map((k) => {
      return {
        label: k,
        value: k,
      };
    });
    console.log(optionsTwo.value);
  });
};
getAll();

const ob = {
  privated: "否",
  publiced: "是",
};

const formSeach = reactive({
  fileType: "",
  fileTitle: "",
  fileSubtitle: "",
  contextType: "",
  publiced: "",
});
const addForm = reactive({
  fileType: "",
  fileTitle: "",
  fileSubtitle: "",
  contextType: "",
  publiced: "",
  file: "",
});
const optionsOne = [
  {
    label: "Excel",
    value: "Excel",
  },
  {
    label: "word",
    value: "word",
  },
  {
    label: "pdf",
    value: "pdf",
  },
  {
    label: "mp4",
    value: "mp4",
  },
];

const isAdd = () => {
  const formdata = new FormData();
  console.log(addForm.file);

  formdata.append("fileType", addForm.fileType);
  formdata.append("contextType", addForm.contextType);
  formdata.append("fileTitle", addForm.fileTitle);
  formdata.append("fileSubtitle", addForm.fileSubtitle);
  formdata.append("publiced", addForm.publiced);
  formdata.append("file", addForm.file);

  axios({
    method: "post",
    url: "http://47.98.50.217:82/file/source",
    data: addForm,

    headers: {
      "Content-Type": "multipart/form-data",
      token: localStorage.getItem("user"),
    },
  }).then(async (res) => {
    console.log(res);
    if (res.status == 200) {
      ElMessage({
        showClose: true,
        message: res.data.data,
        type: "success",
      });
      addForm.fileType = "";
      addForm.contextType = "";
      addForm.fileTitle = "";
      addForm.fileSubtitle = "";
      addForm.publiced = "否";
      addForm.file = "";
      await Axios.post("/file/search", {}).then((res) => {
        console.log(res);
        detailOptions.value = res.data;
      });
    } else {
      ElMessage({
        showClose: true,
        message: "保存失败",
        type: "error",
      });
    }
  });
};

const fileList = ref([]);

const handleChange = (uploadFile, uploadFiles) => {
  console.log(uploadFile, uploadFiles);
  fileList.value = uploadFiles;
  let tmp = uploadFile["response"];
  if (uploadFile["response"] != undefined) {
    console.log(uploadFile["response"]["data"]["url"]);
    addForm.file = uploadFile["response"]["data"]["url"];
  }
};
const seach = () => {
  Axios.post("/file/search", formSeach).then((res) => {
    detailOptions.value = res.data;
  });
};

const reset = () => {
  formSeach.fileType = "";
  formSeach.fileTitle = "";
  formSeach.fileSubtitle = "";
  formSeach.contextType = "";
  formSeach.publiced = "";
};

const showExcel = ref(false);
const showWord = ref(false);
const showPdf = ref(false);
const showMp4 = ref(false);
const filePath = ref("");
const toPerview = (type, scope) => {
  console.log(type);
  console.log(scope.row.filePath);
  filePath.value = scope.row.filePath;
  if (type == "Excel") {
    showExcel.value = true;
  } else if (type == "word") {
    showWord.value = true;
  } else if (type == "mp4") {
    console.log(123123);
    showMp4.value = true;
  }
};

const ret = () => {
  showExcel.value = false;
  showWord.value = false;
  showPdf.value = false;
  showMp4.value = false;
};
</script>

<template>
  <el-button @click="ret()" v-if="showPdf || showWord || showExcel || showMp4"
    >返回</el-button
  >
  <pdfPreview v-if="showPdf" :path="filePath"> </pdfPreview>
  <docPreview v-if="showWord" :path="filePath"></docPreview>
  <excelPreview v-if="showExcel" :path="filePath"> </excelPreview>
  <video
    width="600"
    height="450"
    controls
    v-if="showMp4"
    style="
      position: absolute;
      top: 50%;
      left: 50%;
      margin-top: -175px;
      margin-left: -250px;
    "
  >
    <source :src="`http://47.98.50.217:82` + filePath" type="video/mp4" />
  </video>

  <el-tabs
    v-model="activeName"
    style="background-color: #fff"
    tab-position="center"
    v-if="!showPdf && !showWord && !showExcel && !showMp4"
  >
    <div style="padding: 1%">
      <el-card class="box-card">
        <el-form :inline="true" class="all-form">
          <el-form-item label="文件分类">
            <el-select v-model="formSeach.fileType" placeholder="请选择">
              <el-option
                :label="item.label"
                :value="item.value"
                :key="item.value"
                v-for="item in optionsOne"
              />
            </el-select>
          </el-form-item>
          <el-form-item label="文件名称">
            <el-input
              placeholder="请输入文件名称"
              v-model="formSeach.fileTitle"
              style="width: 300px"
            />
          </el-form-item>
          <el-form-item label="文件副标题">
            <el-input
              placeholder="请输入文件副标题"
              v-model="formSeach.fileSubtitle"
              style="width: 300px"
            />
          </el-form-item>
          <el-form-item label="文件内容标签">
            <el-input
              placeholder="请输入文件内容标签"
              v-model="formSeach.contextType"
              style="width: 300px"
            />
          </el-form-item>

          <el-form-item class="right-bottom">
            <el-button @click="reset()">重置</el-button>
            <el-button type="primary" @click="seach">查询</el-button>
          </el-form-item>
        </el-form>
      </el-card>
    </div>
    <div style="height: 20px"></div>

    <div style="padding: 1%">
      <el-card class="box-card">
        <div>
          <el-button
            class="button"
            text
            @click="dialogFormVisible = true"
            style="background-color: #1677ff; color: #fff"
            >+新建</el-button
          >
        </div>

        <el-dialog
          v-model="dialogFormVisible"
          title="新建个人资源"
          style="text-align: center; width: 500px; height: 600px"
        >
          <el-form :model="addForm">
            <el-form-item>
              <span style="margin-left: 28px">文件类型：</span>
              <!-- 这里需添加一个输入框 -->
              <el-select
                placeholder="请选择文件类型"
                style="width: 300px"
                v-model="addForm.fileType"
              >
                <el-option
                  :label="item.label"
                  :value="item.value"
                  :key="item.value"
                  v-for="item in optionsOne"
                />
              </el-select>
            </el-form-item>

            <el-form-item>
              <span style="">文件内容标签：</span>

              <el-select
                placeholder="请选择文件内容："
                style="width: 300px"
                v-if="!showInput"
                v-model="addForm.contextType"
              >
                <el-option
                  :label="item.label"
                  :value="item.value"
                  :key="item.value"
                  v-for="item in optionsTwo"
                />
              </el-select>

              <el-input
                placeholder="请输入文件内容："
                style="width: 300px"
                v-model="addForm.contextType"
                v-if="showInput"
              />
              <el-button
                @click="showInput = !showInput"
                style="
                  background-color: #fff;
                  border: 2px solid #f8f8f8;
                  width: 30px;
                  height: 30px;
                  border-radius: 50px;
                  color: blue;
                  font-weight: bolder;
                "
              >
                +
              </el-button>
            </el-form-item>

            <el-form-item>
              <el-upload
                v-model:file-list="fileList"
                class="upload-demo"
                action="http://47.98.50.217:82/file/upload"
                :on-change="handleChange"
              >
                <el-button type="primary">点击上传文件</el-button>
              </el-upload>
            </el-form-item>

            <el-form-item>
              <span style="margin-left: 29px">文件名称：</span>
              <el-input
                placeholder="请输入文件名称"
                style="width: 300px"
                v-model="addForm.fileTitle"
              />
            </el-form-item>
            <el-form-item>
              <span style="margin-left: 15px">文件副标题：</span>
              <el-input
                placeholder="请输入文件副标题"
                style="width: 300px"
                v-model="addForm.fileSubtitle"
              />
            </el-form-item>

            <!-- <el-form-item>
              <span style="margin-left: 30px">是否公开：</span>
              <el-radio-group v-model="addForm.publiced">
                <el-radio label="privated" size="large">否</el-radio>
                <el-radio label="publiced" size="large">是</el-radio>
              </el-radio-group>
            </el-form-item> -->
          </el-form>
          <template #footer>
            <span class="dialog-footer">
              <el-button @click="dialogFormVisible = false">取消</el-button>
              <el-button
                type="primary"
                @click="(dialogFormVisible = false), isAdd()"
              >
                确认
              </el-button>
            </span>
          </template>
        </el-dialog>

        <el-table
          :data="detailOptions"
          :cell-style="{ textAlign: 'left' }"
          :header-cell-style="{
            'text-align': 'left',
            fontWeight: 'bolder',
            color: 'black',
          }"
        >
          <el-table-column label="文件类型" width="auto" min-width="10%">
            <template #default="scope">{{ scope.row.fileType }}</template>
          </el-table-column>
          <el-table-column label="文件内容标签" width="auto" min-width="10%">
            <template #default="scope">{{ scope.row.contextType }} </template>
          </el-table-column>
          <el-table-column label="文件名称" width="auto" min-width="10%">
            <template #default="scope"> {{ scope.row.fileTitle }}</template>
          </el-table-column>
          <el-table-column label="文件副标题" width="auto" min-width="10%">
            <template #default="scope">{{ scope.row.fileSubtitle }} </template>
          </el-table-column>
          <!-- <el-table-column label="是否公开" width="auto" min-width="10%">
            <template #default="scope">{{ ob[scope.row.publiced] }} </template>
          </el-table-column> -->

          <el-table-column label="操作" width="auto" min-width="10%">
            <template #default="scope">
              <!-- <el-button type="danger" text style="margin-left: -15px" @click=""
                >删除</el-button
              > -->
              <el-button
                type="danger"
                text
                style=""
                @click="
                  dialogVisible = true;
                  toPerview(scope.row.fileType, scope);
                "
                >查看</el-button
              >
            </template>
          </el-table-column>
        </el-table>
      </el-card>
    </div>
  </el-tabs>
</template>

<style scoped></style>
