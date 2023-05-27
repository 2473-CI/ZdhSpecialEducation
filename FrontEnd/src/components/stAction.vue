<script setup>
import { ref, reactive, getCurrentInstance, toRefs, defineProps } from "vue";
import Axios from "../request/index.js";
import { ElMessage, ElMessageBox } from "element-plus";
import { Plus } from "@element-plus/icons-vue";
import pdfPreview from "../components/file/pdfPreview.vue";
import excelPreview from "../components/file/excelPreview.vue";
import docPreview from "../components/file/docPreview.vue";

const dialogFormVisible = ref(false);
const fileType = ref("");
const fileName = ref("");

const showBtn = ref(true);
Axios.get("/user/getRole").then((res) => {
  console.log(res);
  if (res.data == "学生") {
    showBtn.value = false;
  }
});

const optionsType = [
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
    label: "MP4",
    value: "MP4",
  },
];

const scalarArrayEquals = (array1, array2) => {
  return (
    array1.length === array2.length &&
    array1.every((ele) => array2.includes(ele))
  );
};
const formDetail = reactive({
  classify1: "",
  classify2: "",
  classify3: "",
  context: "",
});
const showPage = ref(false);

const startTime = ref("");
const endTime = ref("");

const optionsOne = ref([]);

const getAllScale = () => {
  Axios.get("/scaleClassify/getAll").then((res) => {
    console.log(res.data);
    optionsOne.value = [...new Set(res.data.map((k) => k.classify1))];

    optionsOne.value = optionsOne.value.map((k) => {
      return {
        label: k,
        value: k,
      };
    });
  });
};

const AllList = ref([]);
const content = ref([]);
const getAllRecord = () => {
  Axios.get(
    `/exercise/getByStudentId?studentId=${
      JSON.parse(localStorage.getItem("sq")).studentId
    }`
  ).then((res) => {
    console.log(res);
    for (let item of res.data) {
      item["startTime"] = new Date(item["startTime"]).toLocaleDateString();
      item["endTime"] = new Date(item["endTime"]).toLocaleDateString();
    }
    AllList.value = res.data;

    for (let item of AllList.value) {
      console.log(item);
      if (item["context"] != "") {
        let tmp = JSON.parse(item["context"]);
        for (let it of tmp) {
          if (!it.hasOwnProperty("isFalse")) it["isFalse"] = [];
          if (!it.hasOwnProperty("remarks")) it["remarks"] = "";
          if (!it.hasOwnProperty("scoreSelf")) it["scoreSelf"] = 0;
        }
        item["context"] = JSON.stringify(tmp);
      }
    }
    // console.log(AllList.value);
  });
};
getAllRecord();

const optionsTwo = ref([]);
const change = () => {
  formDetail.classify2 = "";
  formDetail.classify3 = "";
  Axios.post("/scaleClassify/search", formDetail).then((res) => {
    optionsTwo.value = [...new Set(res.data.map((k) => k.classify2))];
    formDetail.classify2 = "";
    formDetail.classify3 = "";
  });
};

const optionsThree = ref([]);
const change2 = () => {
  formDetail.classify3 = "";

  Axios.post("/scaleClassify/search", formDetail).then((res) => {
    optionsThree.value = [...new Set(res.data.map((k) => k.classify3))];
  });
};

getAllScale();

const context = ref("");
const title = ref("");
const rid = ref("");

const addItem = () => {
  if (
    formDetail.classify1 == "" ||
    formDetail.classify2 == "" ||
    formDetail.classify3 == ""
  ) {
    ElMessage({
      showClose: true,
      message: "相关字段为空",
      type: "error",
    });
  } else {
    Axios.post("/scale/search", {
      classify1: formDetail.classify1,
      classify2: formDetail.classify2,
      classify3: formDetail.classify3,
      title: formDetail.context,
    }).then((res) => {
      console.log(res);
      console.log(res.data);
      if (res.data.length != 0) {
        context.value = res.data[0].context;
        ElMessageBox.confirm("确认要增加该学习任务吗?")
          .then(async (a) => {
            if (a == "confirm") {
              Axios.post("/exercise/add", {
                studentId: JSON.parse(localStorage.getItem("sq")).studentId,
                title: formDetail.classify3,
                subTitle: "未完成",
                context: context.value,
                annex: "",
                startTime: startTime.value,
                endTime: endTime.value,
                id: null,
              }).then(async (res) => {
                if (res.success == true) {
                  ElMessage({
                    showClose: true,
                    message: "新增成功！",
                    type: "success",
                  });
                  await getAllRecord();
                } else if (res.success == false) {
                  ElMessage({
                    showClose: true,
                    message: "新增失败！",
                    type: "error",
                  });
                }
              });
              close();
            } else {
              close();
            }
          })
          .catch(() => {
            // catch error
          });
      } else {
        ElMessage({
          showClose: true,
          message: "该量表内容为空",
          type: "error",
        });
      }
    });
  }
};

const reset = () => {
  formDetail.classify1 = "";
  formDetail.classify2 = "";
  formDetail.classify3 = "";
  formDetail.context = "";
  startTime.value = "";
  endTime.value = "";
};

const getList = ref([]);
const optionScore = ref([]);
const score = ref(0);
const subT = ref("");
const Index = ref("");
const giveContent = (
  context,
  index,
  startTime,
  endTime,
  title,
  id,
  isFalse,
  subTitle
) => {
  score.value = 0;
  console.log(context, index, startTime, endTime, title, id, isFalse, subTitle);
  Index.value = index;
  rid.value = id;
  getList.value = JSON.parse(context);
  subT.value = subTitle;
  console.log(content.value);
  console.log(getList.value);
  let s = [];

  for (let it of getList.value) {
    if (it.qyestionType == "单选") {
      if (it.isFalse == it.isTrue) {
        it.scoreSelf += it.qyestionScore;
      }
    } else if (it.qyestionType == "多选") {
      if (scalarArrayEquals(it.isFalse, it.isTrue)) {
        it.scoreSelf += it.qyestionScore;
      }
    } else if (it.qyestionType == "主观") {
      it.scoreSelf += it.isFalse - 0;
      console.log(typeof it.scoreSelf);
    } else if (it.qyestionType == "单选判断") {
      for (let o of content.value) {
        o.select = o.select.map((k, index) => {
          return {
            i: index,
            name: k["name"],
          };
        });
        for (let k of item.select) {
          if (k.name == it.isFalse) {
            it.scoreSelf += it.Single[it["i"]];
          }
        }
      }
    }
  }

  for (let item of getList.value) {
    score.value += item.scoreSelf;
  }

  for (let item of getList.value) {
    s.push(item["qyestionScore"]);
  }
  for (let i = 0; i < s.length; i++) {
    optionScore.value.push([]);
  }

  for (let i = 0; i < s.length; i++) {
    for (let j = 0; j < s[i] + 1; j++) {
      optionScore.value[i].push({ value: j, label: j });
    }
  }
  console.log(optionScore.value);
};

const time = ref(0);
const submit = () => {
  console.log(getList.value);
  console.log(Index.value);
  let alone = 0;
  for (let it of getList.value) {
    it["noMake"] = 0;

    if (it.qyestionType == "主观" && typeof it.isFalse != "number") {
      it["noMake"] = 1;
      alone++;
    } else if (it.qyestionType == "单选" && typeof it.isFalse != "string") {
      it["noMake"] = 1;
      alone++;
    } else if (it.qyestionType == "多选" && it.isFalse.length == 0) {
      it["noMake"] = 1;
      alone++;
    }
  }
  console.log(alone);
  if (time.value != 0 || subT.value == "已完成") {
    ElMessage({
      showClose: true,
      message: "已经提交过了!",
      type: "error",
    });
  } else if (alone != 0) {
    ElMessage({
      showClose: true,
      message: "题目未完成！",
      type: "error",
    });
  } else {
    console.log(formDetail.classify3);
    Axios.post("/exercise/add", {
      studentId: JSON.parse(localStorage.getItem("sq")).studentId,
      title: formDetail.classify3,
      subTitle: "已完成",
      context: JSON.stringify(getList.value),
      annex: "",
      startTime: startTime.value,
      endTime: endTime.value,
      id: rid.value,
    }).then(async (res) => {
      if (res.success == true) {
        ElMessage({
          showClose: true,
          message: "提交成功！",
          type: "success",
        });

        for (let it of JSON.parse(res.data.context)) {
          if (it.qyestionType == "单选") {
            if (it.isFalse == it.isTrue) {
              score.value += it.qyestionScore;
            }
          } else if (it.qyestionType == "多选") {
            if (scalarArrayEquals(it.isFalse, it.isTrue)) {
              score.value += it.qyestionScore;
            }
          } else if (it.qyestionType == "主观") {
            score.value += it.isFalse;
          } else if (it.qyestionType == "单选判断") {
            for (let o of content.value) {
              o.select = o.select.map((k, index) => {
                return {
                  i: index,
                  name: k["name"],
                };
              });
              for (let k of item.select) {
                if (k.name == it.isFalse) {
                  score.value += it.Single[it["i"]];
                }
              }
            }
          }
        }

        time.value++;
        await getAllRecord();
      } else if (res.success == false) {
        ElMessage({
          showClose: true,
          message: "提交失败！",
          type: "error",
        });
      }
    });
  }
};

const d = (id) => {
  Axios.delete(`/exercise/deleteById?id=${id}`).then(async (res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: "删除成功！",
        type: "success",
      });
      await getAllRecord();
    } else if (res.success == false) {
      ElMessage({
        showClose: true,
        message: "删除失败！",
        type: "error",
      });
    }
    console.log(res);
  });
};

const del = (id) => {
  ElMessageBox.confirm("确定要删除吗?")
    .then(async (a) => {
      if (a == "confirm") {
        await d(id);
        close();
      } else {
        close();
      }
    })
    .catch(() => {
      // catch error
    });
};

const goHome = () => {
  showPage.value = !showPage.value;
};

const file = ref("");
const handleChange = (uploadFile, uploadFiles) => {
  if (uploadFile.response) {
    console.log(uploadFile.response.data.url, uploadFiles);
    file.value = uploadFile.response.data.url;
  }
  // fileList.value = uploadFiles;
  // let tmp = uploadFile["response"];
  // if (uploadFile["response"] != undefined) {
  //   console.log(uploadFile["response"]["data"]["url"]);
  //   addForm.file = uploadFile["response"]["data"]["url"];
  // }
};
const fileTime = ref("");
const isAdd = () => {
  Axios.post("/exercise/add", {
    studentId: JSON.parse(localStorage.getItem("sq")).studentId,
    title: fileName.value,
    subTitle: fileType.value,
    context: "",
    annex: file.value,
    startTime: fileTime.value,
    endTime: "",
    id: null,
  }).then(async (res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: "新增成功！",
        type: "success",
      });
      await getAllRecord();
      fileName.value = "";
      fileType.value = "";
      file.value = "";
      fileTime.value = "";
    } else if (res.success == false) {
      ElMessage({
        showClose: true,
        message: "新增失败！",
        type: "error",
      });
    }
  });
};

const filePath = ref("");
const showExcel = ref(false);
const showWord = ref(false);
const showPdf = ref(false);
const showMP4 = ref(false);
const toPerview = (type, fileP) => {
  console.log(type);
  console.log(fileP);
  filePath.value = fileP;
  if (type == "Excel") {
    showExcel.value = true;
  } else if (type == "word") {
    showWord.value = true;
  } else if (type == "MP4") {
    showMP4.value = true;
  }
};

const ret = () => {
  showExcel.value = false;
  showWord.value = false;
  showPdf.value = false;
  showMP4.value = false;
};
</script>
<template>
  <el-button @click="ret()" v-if="showPdf || showWord || showExcel || showMP4"
    >返回</el-button
  >
  <pdfPreview v-if="showPdf" :path="filePath"> </pdfPreview>
  <docPreview v-if="showWord" :path="filePath"></docPreview>
  <div style="height: 600px; width: 100%" v-if="showExcel">
    <excelPreview :path="filePath"> </excelPreview>
  </div>

  <video
    width="600"
    height="450"
    controls
    v-if="showMP4"
    style="display: block; margin: 30px auto"
  >
    <source :src="`http://47.98.50.217:82` + filePath" type="video/mp4" />
  </video>

  <div
    style="width: 100%"
    v-if="!showPdf && !showWord && !showExcel && !showMP4"
  >
    <el-card
      class="box-card"
      style="margin-left: 1%; margin-right: 1%"
      v-if="showBtn"
      v-show="!showPage"
    >
      <el-form :inline="true" class="all-form">
        <el-form-item label="一级分类">
          <el-select
            v-model="formDetail.classify1"
            placeholder="请选择"
            @change="change"
          >
            <el-option
              :label="item.label"
              :value="item.value"
              :key="item.value"
              v-for="item in optionsOne"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="二级分类">
          <el-select
            v-model="formDetail.classify2"
            placeholder="请选择"
            @change="change2"
          >
            <el-option
              :label="item"
              :value="item"
              :key="item"
              v-for="item in optionsTwo"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="三级分类">
          <el-select v-model="formDetail.classify3" placeholder="请选择">
            <el-option
              :label="item"
              :value="item"
              :key="item"
              v-for="item in optionsThree"
            />
          </el-select>
        </el-form-item>
        <br />
        <el-form-item label="学习作业标题">
          <el-input
            v-model="formDetail.context"
            placeholder="请填写学习作业标题"
            style="width: 220px"
          >
          </el-input>
        </el-form-item>
        <el-form-item>
          <span>开始时间：</span>
          <el-date-picker
            v-model="startTime"
            type="datetime"
            placeholder="请选择开始时间"
          />
        </el-form-item>
        <el-form-item>
          <span>结束时间：</span>
          <el-date-picker
            v-model="endTime"
            type="datetime"
            placeholder="请选择结束时间"
          />
        </el-form-item>

        <el-form-item class="right-bottom">
          <el-button @click="reset()">重置</el-button>
          <el-button type="primary" @click="addItem">添加任务</el-button>
        </el-form-item>
      </el-form>
      <el-form-item>
        <el-button @click="dialogFormVisible = true">添加附件</el-button>
      </el-form-item>
      <el-dialog v-model="dialogFormVisible" title="添加附件">
        <div style="margin-bottom: 40px">
          <span style="margin-left: 28px">文件类型：</span>
          <el-select
            placeholder="请选择文件类型"
            style="width: 300px"
            v-model="fileType"
          >
            <el-option
              :label="item.label"
              :value="item.value"
              :key="item.value"
              v-for="item in optionsType"
            />
          </el-select>
        </div>
        <div style="margin-bottom: 40px">
          <span style="margin-left: 28px">文件名称：</span>
          <el-input
            style="width: 300px"
            v-model="fileName"
            placeholder="请填写文件名称"
          ></el-input>
        </div>
        <div style="margin-bottom: 40px">
          <span style="margin-left: 28px">创建时间：</span>
          <el-date-picker
            v-model="fileTime"
            type="datetime"
            style="width: 300px"
            placeholder="请选择时间"
          />
        </div>
        <el-form-item>
          <el-upload
            v-model:file-list="fileList"
            class="upload-demo"
            action="http://47.98.50.217:82/file/upload"
            :on-change="handleChange"
          >
            <!-- <el-button type="primary">点击上传文件</el-button> -->

            <div
              style="
                height: 100px;
                width: 100px;
                border-radius: 15px;
                border: 4px dashed #f8f8f8;
                padding: 30px;
                margin-left: 28px;
              "
            >
              <Plus />
            </div>
          </el-upload>
        </el-form-item>

        <template #footer>
          <span class="dialog-footer">
            <el-button @click="dialogFormVisible = false">取消</el-button>
            <el-button
              type="primary"
              @click="(dialogFormVisible = false), isAdd()"
            >
              确定
            </el-button>
          </span>
        </template>
      </el-dialog>
    </el-card>

    <el-card style="margin: 1%">
      <el-timeline v-show="!showPage">
        <el-timeline-item
          :timestamp="item.startTime"
          placement="top"
          v-for="(item, index) in AllList"
          :color="item.subTitle == '未完成' ? 'red' : 'green'"
          :key="index"
        >
          <el-card style="position: relative">
            <h4>{{ item.title }}</h4>
            <p
              v-if="
                item.subTitle != 'Excel' &&
                item.subTitle != 'pdf' &&
                item.subTitle != 'word'
              "
            >
              结束时间{{ item.endTime }}
            </p>
            <span
              style="position: absolute; left: 50%; top: 20px"
              :style="{ color: item.subTitle == '未完成' ? 'red' : 'green' }"
              >{{ item.subTitle }}</span
            >

            <el-button
              type="danger"
              style="position: absolute; right: 150px; bottom: 40%"
              @click="del(item.id)"
              >删除</el-button
            >

            <el-button
              v-if="item.subTitle == '未完成'"
              style="position: absolute; right: 10px; bottom: 40%"
              @click="
                showPage = !showPage;
                giveContent(
                  item.context,
                  index,
                  item.startTime,
                  item.endTime,
                  item.title,
                  item.id,
                  item.isFalse,
                  item.subTitle
                );
              "
              >去完成></el-button
            >
            <!-- {{ item.context }} -->
            <el-button
              v-if="item.subTitle == '已完成'"
              style="position: absolute; right: 10px; bottom: 40%"
              @click="
                showPage = !showPage;
                giveContent(
                  item.context,
                  index,
                  item.startTime,
                  item.endTime,
                  item.title,
                  item.id,
                  item.isFalse,
                  item.subTitle
                );
              "
              >查看</el-button
            >
            <el-button
              style="position: absolute; right: 10px; bottom: 40%"
              v-if="
                item.subTitle == 'Excel' ||
                item.subTitle == 'pdf' ||
                item.subTitle == 'word' ||
                item.subTitle == 'MP4'
              "
              @click="toPerview(item.subTitle, item.annex)"
            >
              预览
            </el-button>
          </el-card>
        </el-timeline-item>
      </el-timeline>

      <el-button v-show="showPage" @click="goHome()">返回</el-button>
      <div v-if="showPage">
        <div
          v-for="(item, index) in getList"
          :key="index"
          style="
            width: 100%;
            margin-left: 20px;
            font-size: 1vw;
            display: flex;
            flex-direction: column;
            justify-content: space-evenly;
            border-bottom: 1px solid #ccc;
            margin-top: 5px;
          "
        >
          <p :style="{ color: item.noMake == 1 ? 'red' : '#1677ff' }">
            {{ item.qyestionContent }}
          </p>
          <div style="display: flex">
            <div v-if="item.qyestionType == '单选'">
              <el-radio-group
                v-model="item.isFalse"
                style="
                  position: relative;
                  display: flex;
                  flex-direction: column;
                "
              >
                <el-radio
                  :label="it.name"
                  size="large"
                  v-for="(it, ind) in item.select"
                  :key="ind"
                  :style="{
                    marginLeft: ind == item.select.length - 1 ? '-30px' : '0px',
                  }"
                >
                  <span style="font-size: 1vw">
                    {{ it.name }}.{{ it.value }}
                  </span>
                </el-radio>
              </el-radio-group>
            </div>

            <div v-if="item.qyestionType == '单选判断'">
              <el-radio-group
                v-model="item.isFalse"
                style="
                  position: relative;
                  display: flex;
                  flex-direction: column;
                "
              >
                <el-radio
                  :label="it.name"
                  size="large"
                  v-for="(it, ind) in item.select"
                  :key="ind"
                  :style="{
                    marginLeft: ind == item.select.length - 1 ? '-30px' : '0px',
                  }"
                >
                  <span style="font-size: 1vw">
                    {{ it.name }}.{{ it.value }}
                  </span>
                </el-radio>
              </el-radio-group>
            </div>

            <div>
              <el-checkbox-group
                v-model="item.isFalse"
                v-if="item.qyestionType == '多选'"
                style="display: flex; flex-direction: column"
              >
                <el-checkbox
                  :label="sel.name"
                  v-for="(sel, i) in item.select"
                  size="larg"
                  :key="i"
                  style="margin-top: 10px"
                >
                  <span> {{ sel.name }}.{{ sel.value }}</span>
                </el-checkbox>
              </el-checkbox-group>
            </div>

            <div v-if="item.qyestionType == '主观'">
              <p>{{ item.subjectivity }}</p>

              <el-select
                v-model="item.isFalse"
                class="m-2"
                placeholder="请选择分数"
              >
                <el-option
                  v-for="item in optionScore[index]"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                />
              </el-select>
            </div>
          </div>
        </div>
        <div style="display: flex; justify-content: space-between">
          <span>得分：{{ score }}</span>

          <el-button @click="submit()">提交</el-button>
          <el-button
            v-show="showPage"
            @click="goHome()"
            style="position: absolute; right: 100px"
            >返回</el-button
          >
        </div>
      </div>
    </el-card>
  </div>
</template>

<style scoped></style>
