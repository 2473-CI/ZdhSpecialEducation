<script setup>
import { ref, reactive } from "vue";
import { useClassStore } from "../store/cls";
import { ElMessage, ElMessageBox } from "element-plus";
import Axios from "../request/index";
const activeName = ref("first");
const classStore = useClassStore();
const isExpansion = ref(false);
const dialogFormVisible = ref(false);
const dialogdetFormVisible = ref(false);
const twoInput = ref(false);
const showDetail = ref(false);

const toWhere = () => {
  activeName.value = "third";
};

const options = ref([]);
Axios.post("/scaleClassify/search", {}).then((res) => {
  options.value = res.data;
});

const detailOptions = ref([]);
Axios.get("/scale/getAll").then((res) => {
  detailOptions.value = res.data;
});

const optionsOne = [
  {
    value: "学业水平",
    label: "学业水平",
  },
  {
    value: "基础疾病",
    label: "基础疾病",
  },
];

const form = reactive({
  classify1: "",
  classify2: "",
  classify3: "",
});

const formDetail = reactive({
  classify1: "",
  classify2: "",
  classify3: "",
  context: "",
});

const formQues = reactive({
  classify1: "",
  classify2: "",
  classify3: "",
});

const optionsTwo = ref([]);
const optionsThree = ref([]);
const optionsFour = ref([]);
const optionsFive = ref([]);

const change = () => {
  form.classify2 = "";
  form.classify3 = "";
  Axios.post("/scaleClassify/search", form).then((res) => {
    optionsTwo.value = [...new Set(res.data.map((k) => k.classify2))];
  });
};

const change2 = () => {
  console.log(form);
  Axios.post("/scaleClassify/search", form).then((res) => {
    optionsThree.value = [...new Set(res.data.map((k) => k.classify3))];
  });
};

const change3 = () => {
  Axios.post("/scaleClassify/search", formQues).then((res) => {
    optionsFour.value = [...new Set(res.data.map((k) => k.classify2))];
  });
};

const change4 = () => {
  Axios.post("/scaleClassify/search", formQues).then((res) => {
    optionsFive.value = [...new Set(res.data.map((k) => k.classify3))];
  });
};

const addForm = reactive({
  classify1: "",
  classify2: "",
  classify3: "",
});

const seach = () => {
  Axios.post("/scaleClassify/search", {
    ...form,
  }).then((res) => {
    options.value = res.data;
  });
};

const addOptionsTwo = ref([]);
const addOptionsThree = ref([]);

const change1 = () => {
  addForm.classify2 = "";
  addForm.classify3 = "";
  Axios.post("/scaleClassify/search", addForm).then((res) => {
    addOptionsTwo.value = [...new Set(res.data.map((k) => k.classify2))];
  });
};

const isAdd = () => {
  Axios.put("/scaleClassify/add", addForm).then(async (res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });
      await Axios.post("/scaleClassify/search", {}).then((res) => {
        options.value = res.data;
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

const from = reactive({
  paperType: "",
  paperTitle: "",
  qyestionList: [],
});

const addQuestion = () => {
  from.qyestionList.push({
    qyestionType: "",
    qyestionScore: "",
    qyestionContent: "",
    select: [],
    isTrue: [],
  });
};

const qyestionTypeSelect = [
  { value: "单选" },
  { value: "多选" },
  { value: "主观" },
];

const qyestionScoreSelect = [
  { name: "5分", value: 5 },
  { name: "10分", value: 10 },
  { name: "15分", value: 15 },
  { name: "20分", value: 20 },
];
const addSelect = (index) => {
  from.qyestionList[index].select.push({
    value: "",
    name: String.fromCharCode(65 + from.qyestionList[index].select.length),
  });
};

const del = (index, ind) => {
  console.log(index, ind);
  from.qyestionList[index].select.splice(ind, 1);
  from.qyestionList[index].select = from.qyestionList[index].select.map(
    (k, index) => {
      return {
        name: String.fromCharCode(65 + index),
        value: k.value,
      };
    }
  );
};

const del2 = (index, ind) => {
  console.log(index, ind);
  from.qyestionList[index].select.splice(ind, 1);
  from.qyestionList[index].select = from.qyestionList[index].select.map(
    (k, index) => {
      return {
        name: String.fromCharCode(65 + index),
        value: k.value,
      };
    }
  );
};

const addSelect2 = (index) => {
  from.qyestionList[index].select.push({
    value: "",
    name: String.fromCharCode(65 + from.qyestionList[index].select.length),
  });
};

const scaleId = ref("");
const getId = () => {
  Axios.post("/scaleClassify/search", formQues).then((res) => {
    scaleId.value = res.data[0].id;
    console.log(scaleId.value);
  });
};

const c = () => {
  if (from.qyestionList.length == 0) {
    ElMessage({
      showClose: true,
      message: "试卷内容为空",
      type: "error",
    });
  } else {
    Axios.post("/scale/add", {
      studentBasicId: scaleId.value,
      context: JSON.stringify(from.qyestionList),
      title: from.paperTitle,
    }).then(async (res) => {
      if (res.success == true) {
        ElMessage({
          showClose: true,
          message: res.data,
          type: "success",
        });
        activeName.value = "second";
        await Axios.get("/scale/getAll").then((res) => {
          detailOptions.value = res.data;
        });
        from.paperType = "";
        from.qyestionList = [];
        from.paperTitle = "";
        formQues.classify1 = "";
        formQues.classify2 = "";
        formQues.classify3 = "";
      } else if (res.success == false) {
        ElMessage({
          showClose: true,
          message: res.message,
          type: "error",
        });
      }
    });
  }
};

const delScale = (id) => {
  Axios.delete(`/scale/delete?scaleId=${id}`).then((res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });
      Axios.get("/scale/getAll").then((res) => {
        detailOptions.value = res.data;
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

const handleClose = (id) => {
  ElMessageBox.confirm("确认要删除该量表吗?")
    .then(async (a) => {
      if (a == "confirm") {
        await delScale(id);
        close();
      } else {
        close();
      }
    })
    .catch(() => {
      // catch error
    });
};

const seachDetail = () => {
  Axios.post("/scale/search", {
    classify1: formDetail.classify1,
    classify1: formDetail.classify2,
    classify1: formDetail.classify3,
    title: formDetail.context,
  }).then((res) => {
    detailOptions.value = res.data;
  });
};

const viewList = ref([]);
const viewTitle = ref("");
const toDetail = (scaleId) => {
  console.log(scaleId);
  Axios.get(`/scale/getById?scaleId=${scaleId}`).then((res) => {
    console.log(res);
    viewTitle.value = res.data.title;
    viewList.value = JSON.parse(res.data.context);
    console.log(viewList.value);
  });
};

const rePreserve = () => {
  console.log(viewList.value);
};

const delType = (id) => {
  Axios.delete(`/scaleClassify/delete?id=${id}`).then((res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });
      Axios.post("/scaleClassify/search", {}).then((res) => {
        options.value = res.data;
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

const handleClose2 = (id) => {
  ElMessageBox.confirm("确认要删除该量表分类吗?")
    .then(async (a) => {
      if (a == "confirm") {
        await delType(id);
        close();
      } else {
        close();
      }
    })
    .catch(() => {
      // catch error
    });
};
</script>

<template>
  <el-tabs
    v-model="activeName"
    style="background-color: #fff"
    tab-position="center"
  >
    <el-tab-pane label="量表分类" name="first">
      <div style="padding: 1%">
        <el-card class="box-card">
          <el-form :inline="true" class="all-form">
            <el-form-item label="一级分类">
              <el-select
                v-model="form.classify1"
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
                v-model="form.classify2"
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
              <el-select v-model="form.classify3" placeholder="请选择">
                <el-option
                  :label="item"
                  :value="item"
                  :key="item"
                  v-for="item in optionsThree"
                />
              </el-select>
            </el-form-item>

            <el-form-item class="right-bottom">
              <el-button>重置</el-button>
              <el-button type="primary" @click="seach">查询</el-button>
            </el-form-item>
          </el-form>
        </el-card>
        <div style="height: 20px"></div>

        <el-card class="box-card">
          <template #header>
            <div class="card-header">
              <el-button
                class="button"
                text
                @click="dialogFormVisible = true"
                style="background-color: #1677ff; color: #fff"
                >+新建</el-button
              >
              <el-dialog
                v-model="dialogFormVisible"
                title="新建量表分类"
                style="text-align: center; width: 500px; height: 600px"
              >
                <el-form :model="addForm">
                  <el-form-item>
                    <span style="margin-left: 40px">一级分类</span>
                    <el-select
                      v-model="addForm.classify1"
                      placeholder="请选择一级分类"
                      style="width: 300px"
                      @change="change1"
                    >
                      <el-option
                        v-for="item in optionsOne"
                        :key="item.label"
                        :label="item.label"
                        :value="item.value"
                      />
                    </el-select>
                  </el-form-item>

                  <el-form-item>
                    <span style="margin-left: 40px">二级分类</span>
                    <el-select
                      v-show="!twoInput"
                      v-model="addForm.classify2"
                      placeholder="请选择二级分类"
                      style="width: 300px"
                      @change="change3"
                    >
                      <el-option
                        v-for="item in addOptionsTwo"
                        :key="item"
                        :label="item"
                        :value="item"
                      />
                    </el-select>

                    <el-input
                      v-show="twoInput"
                      v-model="addForm.classify2"
                      placeholder="请输入二级分类"
                      style="width: 300px"
                    />

                    <el-button
                      style="
                        background-color: #fff;
                        border: 2px solid #f8f8f8;
                        width: 30px;
                        height: 30px;
                        border-radius: 50px;
                        color: blue;
                        font-weight: bolder;
                      "
                      @click="twoInput = !twoInput"
                    >
                      +
                    </el-button>
                  </el-form-item>

                  <el-form-item>
                    <span style="margin-left: 40px">三级分类</span>
                    <el-input
                      v-model="addForm.classify3"
                      placeholder="请输入三级分类"
                      style="width: 300px"
                    />
                  </el-form-item>
                </el-form>
                <template #footer>
                  <span class="dialog-footer">
                    <el-button @click="dialogFormVisible = false"
                      >取消</el-button
                    >
                    <el-button
                      type="primary"
                      @click="(dialogFormVisible = false), isAdd()"
                    >
                      确认
                    </el-button>
                  </span>
                </template>
              </el-dialog>

              <!-- <el-button class="button" text>导入</el-button>
              <el-button class="button" text>下载模板</el-button> -->
            </div>
          </template>
          <el-table
            :data="options"
            :cell-style="{ textAlign: 'left' }"
            :header-cell-style="{
              'text-align': 'left',
              fontWeight: 'bolder',
              color: 'black',
            }"
          >
            <el-table-column label="一级分类" width="auto" min-width="25%">
              <template #default="scope">
                {{ scope.row.classify1 }}
              </template>
            </el-table-column>
            <el-table-column label="二级分类" width="auto" min-width="25%">
              <template #default="scope">
                {{ scope.row.classify2 }}
              </template>
            </el-table-column>
            <el-table-column label="三级分类" width="auto" min-width="25%">
              <template #default="scope">
                {{ scope.row.classify3 }}
              </template>
            </el-table-column>
            <!-- <el-table-column label="量表数量" width="auto" min-width="20%">
              <template #default="scope"> </template>
            </el-table-column> -->
            <el-table-column label="操作" width="auto" min-width="25%">
              <template #default="scope">
                <el-button
                  type="danger"
                  text
                  style="margin-left: -15px"
                  @click="handleClose2(scope.row.id)"
                  >删除</el-button
                >
              </template>
            </el-table-column>
          </el-table>
        </el-card>
      </div>
    </el-tab-pane>
    <el-tab-pane label="量表详情" name="second">
      <div style="padding: 1%" v-if="!showDetail">
        <el-card class="box-card">
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
            <el-form-item label="量表内容">
              <el-input
                v-model="formDetail.context"
                placeholder="请填写量表内容"
                style="width: 220px"
              >
              </el-input>
            </el-form-item>

            <el-form-item class="right-bottom">
              <el-button>重置</el-button>
              <el-button type="primary" @click="seachDetail">查询</el-button>
            </el-form-item>
          </el-form>
        </el-card>
        <div style="height: 20px"></div>
        <el-card>
          <div>
            <el-button
              class="button"
              text
              @click="toWhere()"
              style="background-color: #1677ff; color: #fff"
              >+新建</el-button
            >
          </div>
          <el-table
            :data="detailOptions"
            :cell-style="{ textAlign: 'left' }"
            :header-cell-style="{
              'text-align': 'left',
              fontWeight: 'bolder',
              color: 'black',
            }"
          >
            <el-table-column label="一级分类" width="auto" min-width="20%">
              <template #default="scope">
                {{ scope.row.classify1 }}
              </template>
            </el-table-column>
            <el-table-column label="二级分类" width="auto" min-width="20%">
              <template #default="scope">
                {{ scope.row.classify2 }}
              </template>
            </el-table-column>
            <el-table-column label="三级分类" width="auto" min-width="20%">
              <template #default="scope">
                {{ scope.row.classify3 }}
              </template>
            </el-table-column>
            <el-table-column label="量表内容" width="auto" min-width="20%">
              <template #default="scope">
                {{ scope.row.title }}
              </template>
            </el-table-column>
            <el-table-column label="操作" width="auto" min-width="20%">
              <template #default="scope">
                <el-button
                  type="danger"
                  text
                  style="margin-left: -15px"
                  @click="handleClose(scope.row.scaleId)"
                  >删除</el-button
                >
                <el-button
                  type="danger"
                  text
                  style=""
                  @click="
                    showDetail = true;
                    toDetail(scope.row.scaleId);
                  "
                  >查看</el-button
                >
              </template>
            </el-table-column>
          </el-table>
        </el-card>
      </div>

      <div v-if="showDetail" style="display: flex; justify-content: center">
        <el-card class="box-card" style="width: 98%; display: flex">
          <div style="width: 90%; display: flex; align-items: center">
            <span style="width: 80px">标题：</span
            ><el-input
              v-model="viewTitle"
              style="width: 400px"
              resize="none"
              type="textarea"
              :rows="2"
            />
          </div>
          <div
            v-for="(item, index) in viewList"
            :key="index"
            style="margin-top: 60px"
          >
            <p style="display: flex; align-items: center">
              <span style="font-weight: bold"
                >{{ index + 1 }}.&nbsp;&nbsp;</span
              >

              <el-input
                v-model="item.qyestionContent"
                type="textarea"
                resize="none"
                :rows="2"
                style="width: 400px"
              />

              <el-input-number
                v-model="item.qyestionScore"
                :min="1"
                style="margin-left: 10px"
                size="large"
              />
            </p>

            <div v-if="item.qyestionType == '单选'">
              <el-radio-group
                v-model="item.isTrue"
                style="
                  display: flex;
                  flex-direction: column;
                  text-align: left;
                  margin-left: -100px;
                "
              >
                <el-radio
                  :label="sel.name"
                  v-for="(sel, ind) in item.select"
                  size="larg"
                  :key="index"
                  :style="{
                    marginLeft: ind == item.select.length - 1 ? '-30px' : '0px',
                  }"
                  style="margin-top: 30px"
                >
                  <span style="position: relative; right: 35px; top: 25px">
                    {{ sel.name }}
                  </span>
                  <div style="">
                    <el-input
                      v-model="sel.value"
                      type="textarea"
                      resize="none"
                      :rows="2"
                      style="width: 400px"
                    >
                    </el-input>
                  </div>
                </el-radio>
              </el-radio-group>
            </div>

            <div v-if="item.qyestionType == '主观'">
              <el-input
                v-model="item.value"
                type="textarea"
                resize="none"
                :rows="2"
                style="width: 400px; margin-left: 20px; margin-top: 20px"
              >
              </el-input>
            </div>

            <div v-if="item.qyestionType == '多选'">
              <el-checkbox-group
                v-model="item.isTrue"
                style="display: flex; flex-direction: column; text-align: left"
              >
                <el-checkbox
                  :label="sel.name"
                  v-for="(sel, ind) in item.select"
                  size="larg"
                  :key="index"
                  style="margin-top: 30px; margin-left: 25px"
                >
                  <span style="position: relative; right: 35px; top: 25px">
                    {{ sel.name }}
                  </span>
                  <div style="">
                    <el-input
                      v-model="sel.value"
                      type="textarea"
                      resize="none"
                      :rows="2"
                      style="width: 400px"
                    >
                    </el-input>
                  </div>
                </el-checkbox>
              </el-checkbox-group>
            </div>
          </div>
          <div
            style="
              margin-top: 30px;
              display: flex;
              justify-content: space-evenly;
            "
          >
            <el-button @click="showDetail = !showDetail">返回</el-button>
            <el-button type="primary" @click="rePreserve">提交</el-button>
          </div>
        </el-card>
      </div>
    </el-tab-pane>

    <!-- 出题目 -->
    <el-tab-pane label="新建量表" name="third">
      <div style="padding: 1%">
        <el-card class="box-card">
          <div
            style="
              display: flex;
              justify-content: space-around;
              border-bottom: 2px solid #f8f8f8;
            "
          >
            <el-form-item label="一级分类">
              <el-select
                v-model="formQues.classify1"
                placeholder="请选择"
                @change="change3"
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
                v-model="formQues.classify2"
                placeholder="请选择"
                @change="change4"
              >
                <el-option
                  :label="item"
                  :value="item"
                  :key="item"
                  v-for="item in optionsFour"
                />
              </el-select>
            </el-form-item>
            <el-form-item label="三级分类">
              <el-select
                v-model="formQues.classify3"
                placeholder="请选择"
                @change="getId"
              >
                <el-option
                  :label="item"
                  :value="item"
                  :key="item"
                  v-for="item in optionsFive"
                />
              </el-select>
            </el-form-item>
          </div>
          <div
            style="
              display: flex;
              align-items: center;
              justify-content: center;
              margin-top: 10px;
            "
          >
            试卷名称：<el-input
              v-model="from.paperTitle"
              placeholder="请输入试卷名称"
              style="width: 400px"
            />
          </div>
          <div
            style="display: flex; flex-direction: column; align-items: center"
          >
            <div style="display: inline-block; width: 100%">
              <div
                :key="index"
                v-for="(question, index) in from.qyestionList"
                style="
                  margin-left: 5vw;
                  display: flex;
                  flex-direction: column;
                  width: 100%;
                "
              >
                <div
                  style="margin-top: 20px; display: flex; align-items: center"
                >
                  <span>{{ index + 1 }}.</span>
                  <el-select
                    v-model="question.qyestionType"
                    placeholder="请选择题目类型"
                    size="default"
                    style="width: 10%"
                  >
                    <el-option
                      v-for="item in qyestionTypeSelect"
                      :key="item.value"
                      :label="item.value"
                      :value="item.value"
                    />
                  </el-select>

                  <el-input-number v-model="question.qyestionScore" :min="0" />

                  <!-- <el-select
                    v-model="question.qyestionScore"
                    placeholder="请选择题目分值"
                    size="default"
                    style="width: 13%"
                  >
                    <el-option
                      v-for="item in qyestionScoreSelect"
                      :key="item.value"
                      :label="item.name"
                      :value="item.value"
                    />
                  </el-select> -->
                  <!-- <el-input
                    v-model="question.qyestionContent"
                    placeholder="请输入题目内容："
                    style="width: 60%"
                    size="large"  
                  /> -->

                  <el-input
                    v-model="question.qyestionContent"
                    :rows="1"
                    type="textarea"
                    placeholder="请输入题目内容："
                    input-style="width:80%;"
                  />
                </div>

                <div
                  v-if="question.qyestionType == '单选'"
                  style="margin-top: 30px; display: flex"
                >
                  <div>
                    <el-radio-group
                      v-model="question.isTrue"
                      style="
                        display: flex;
                        flex-direction: column;
                        align-items: normal;
                      "
                    >
                      <el-radio
                        :key="ind"
                        v-for="(sel, ind) in question.select"
                        :label="sel.name"
                        size="large"
                      >
                        <span
                          style="position: relative; right: 35px; top: 25px"
                          >{{ sel.name }}</span
                        >

                        <div>
                          <el-input v-model="sel.value"> </el-input>
                        </div>
                        <span
                          @click="del(index, ind)"
                          style="
                            color: red;
                            position: relative;
                            left: 100%;
                            top: -25px;
                          "
                          >-删除</span
                        >
                      </el-radio>
                    </el-radio-group>
                    <el-button
                      @click="addSelect(index)"
                      style="margin-top: 30px"
                      >+添加选项</el-button
                    >
                  </div>
                </div>

                <div
                  v-if="question.qyestionType == '多选'"
                  style="margin-top: 20px; display: flex"
                >
                  <div style="position: relative">
                    <el-checkbox-group
                      v-model="question.isTrue"
                      style="
                        display: flex;
                        flex-direction: column;
                        text-align: left;
                      "
                    >
                      <el-checkbox
                        :label="sel.name"
                        v-for="(sel, ind) in question.select"
                        size="larg"
                        :key="index"
                        style="margin-top: 10px"
                      >
                        <span
                          style="position: relative; right: 35px; top: 23px"
                        >
                          {{ sel.name }}
                        </span>
                        <div style="">
                          <el-input v-model="sel.value"> </el-input>
                        </div>
                        <span
                          @click="del2(index, ind)"
                          style="
                            color: red;
                            position: relative;
                            left: 100%;
                            top: -25px;
                          "
                          >-删除</span
                        >
                      </el-checkbox>
                      <el-button
                        @click="addSelect2(index)"
                        style="width: 95px; height: 32px; margin-top: 30px"
                        >+添加选项</el-button
                      >
                    </el-checkbox-group>
                  </div>
                </div>

                <div
                  v-if="question.qyestionType == '主观'"
                  style="margin-top: 30px"
                ></div>
              </div>
            </div>
          </div>
          <div style="text-align: center; margin-top: 20px">
            <el-button
              type="primary"
              @click="addQuestion"
              style="background-color: #fafcff; color: #606266"
              >新增题目</el-button
            >
            <el-button
              type="primary"
              @click="c"
              style="background-color: #fafcff; color: #606266"
              >保存题目</el-button
            >
          </div>
        </el-card>
      </div>
    </el-tab-pane>
  </el-tabs>
</template>

<style scoped>
.all-form {
  position: relative;
}
.right-bottom {
  position: absolute;
  right: 0px;
}

.slider-demo-block {
  display: flex;
  align-items: center;
}
.slider-demo-block .el-slider {
  margin-top: 0;
  margin-left: 12px;
}
</style>
