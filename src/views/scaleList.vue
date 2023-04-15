<script setup>
import { House } from "@element-plus/icons-vue";
import { ref, reactive, onMounted, watch } from "vue";
import Axios from "../request/index.ts";
import { useRouter } from "vue-router";
import { ElMessage, ElMessageBox } from "element-plus";
import { h } from "vue";
import { Document, EditPen } from "@element-plus/icons-vue";
const route = useRouter();
const list = ref([{}, {}, {}, {}]);
const radio1 = ref([]);
const radio2 = ref([]);
const scoreSelf = ref("");
const isShow = ref(false);
const hisList = ref([]);
const per = ref([]);
const ansId = ref("");
console.log(route);
const getAllHis = () => {
  Axios.get(
    `/answer/getAll?studentId=${
      JSON.parse(localStorage.getItem("sq")).studentId
    }`
  ).then((res) => {
    hisList.value = res.data;
    console.log(hisList.value);
    for (let item of hisList.value) {
      item["percentage"] = "";
      let alone = 0;
      per.value = JSON.parse(item.context)["_value"];
      // console.log(Array.isArray(per.value));
      if (Array.isArray(per.value)) {
        for (let it of per.value) {
          if (it.isFalse == [] || it.isFalse == 0) {
            alone++;
          }
        }
        item["percentage"] = parseInt(
          ((per.value.length - alone) / per.value.length) * 100
        );
      }
    }
  });
};
getAllHis();
const scalarArrayEquals = (array1, array2) => {
  return (
    array1.length === array2.length &&
    array1.every((ele) => array2.includes(ele))
  );
};

const num = ref(0);
const handleChange = (value) => {
  console.log(value);
};

const form = reactive({
  classify1: "",
  classify2: "",
  classify3: "",
  title: "",
});

const optionsTwo = ref([]);
const optionsThree = ref("");
const optionsTitle = ref("");
// if (route.currentRoute.value.query.classify1) {
form.classify1 = route.currentRoute.value.query.classify1;
Axios.post("/scale/search", form).then((res) => {
  res.data = [...new Set(res.data.map((k) => k.classify2))];
  console.log(res.data);
  optionsTwo.value = res.data.map((k) => {
    return {
      classify2: k,
    };
  });
});
optionsTwo.value = [
  ...new Set(optionsTwo.value.map((o) => JSON.stringify(o))),
].map((o) => JSON.parse(o));
// } else if (route.currentRoute.value.query.classify2) {
//   form.classify2 = route.currentRoute.value.query.classify2;
//   Axios.post("/scale/search", form).then((res) => {
//     res.data = [...new Set(res.data.map((k) => k.classify3))];
//     optionsTwo.value = res.data.map((k) => {
//       return {
//         classify3: k,
//       };
//     });
//   });
// }

const findThree = () => {
  if (route.currentRoute.value.query.classify1) {
    form.classify3 = "";
    form.title = "";
    Axios.post("/scale/search", form).then((res) => {
      res.data = [...new Set(res.data.map((k) => k.classify3))];
      optionsThree.value = res.data.map((k) => {
        return {
          classify3: k,
        };
      });
    });
  } else if (route.currentRoute.value.query.classify2) {
    Axios.post("/scale/search", form).then((res) => {
      optionsTitle.value = res.data.map((k) => {
        return {
          title: k.title,
          scaleId: k.scaleId,
        };
      });
    });
  }
};

const findTitle = () => {
  Axios.post("/scale/search", form).then((res) => {
    optionsTitle.value = res.data.map((k) => {
      return {
        title: k.title,
        scaleId: k.scaleId,
      };
    });
  });
};
const showNum = ref(false);
const content = ref([]);
const textTitle = ref("");
const scoring = ref("");
const setTheme = () => {
  showNum.value = true;
  ansId.value = "";
  Axios.get(`/scale/getById?scaleId=${form.title}`).then((res) => {
    console.log(JSON.parse(res.data.context));
    content.value = JSON.parse(res.data.context);
    textTitle.value = res.data.title;
    scoring.value = res.data.scoring;
    console.log(res.data);
    console.log(scoring.value);
    for (let item of content.value) {
      item["isFalse"] = [];
      item["remarks"] = "";
    }
  });
};
// watch(content.value, (newValue, oldValue) => {
//   console.log(">>>", newValue, oldValue);
// });
const allScore = ref("");
const score = ref(0);
const number = ref("");
const time = ref(0);
const timer = ref(0);
const isZero = ref(false);
const noMake = ref(false);
const isSure = () => {
  isShow.value = true;
  timer.value = 0;
  if (time.value < content.value.length) {
    for (let item of content.value) {
      if (item.isFalse == [] || item.isFalse == 0) {
        timer.value++;
      }
    }

    if (timer.value > 0) {
      degree.value = "未完成";
    } else {
      degree.value = "已完成";
    }

    for (let item of content.value) {
      if (timer.value != 0) {
        ElMessage({
          showClose: true,
          message: "题目未完成！",
          type: "error",
        });
        noMake.value = true;
        break;
      } else if (timer.value == 0) {
        {
          time.value++;
          if (time.value == content.value.length) {
            Axios.post(`/answer/add`, {
              scaleId: form.title,
              studentId: JSON.parse(localStorage.getItem("sq")).studentId,
              title: textTitle.value,
              context: JSON.stringify(content),
              degree: degree.value,
              evaluation1: textarea1.value,
              evaluation2: textarea2.value,
              answerId: ansId.value,
            }).then(async (res) => {
              ElMessage({
                showClose: true,
                message: "提交成功",
                type: "success",
              });
              await getAllHis();
              //
            });
          }
          console.log(time.value);
          if (item.qyestionType == "单选") {
            if (item.isFalse == item.isTrue) {
              score.value += item.qyestionScore;
            }
          } else if (item.qyestionType == "多选") {
            if (scalarArrayEquals(item.isFalse, item.isTrue)) {
              score.value += item.qyestionScore;
            }
          } else if (item.qyestionType == "主观") {
            score.value += item.isFalse;
          }
        }
      }
    }
  } else {
    ElMessage({
      showClose: true,
      message: "已经提交过了！",
      type: "error",
    });
  }
};

const t = ref([]);

const degree = ref("");
const textarea1 = ref("");
const textarea2 = ref("");
const percentage1 = ref("");
const draft = () => {
  number.value = 0;
  console.log(content.value);
  for (let item of content.value) {
    if (item.isFalse == []) {
      number.value++;
    } else if (item.isFalse == 0) {
      number.value++;
    }
  }

  if (number.value > 0) {
    degree.value = "未完成";
  } else {
    degree.value = "已完成";
  }

  Axios.post("/answer/add", {
    scaleId: form.title,
    studentId: JSON.parse(localStorage.getItem("sq")).studentId,
    title: textTitle.value,
    context: JSON.stringify(content),
    degree: degree.value,
    evaluation1: textarea1.value,
    evaluation2: textarea2.value,
    answerId: ansId.value,
  }).then(async (res) => {
    if (res.data) {
      ansId.value = res.data;
    }
    ElMessage({
      showClose: true,
      message: "保存成功！",
      type: "success",
    });
    await getAllHis();
    //
  });
};

const open = (index) => {
  ElMessageBox.prompt("备注", "添加备注", {
    confirmButtonText: "确认",
    cancelButtonText: "取消",
    inputErrorMessage: "",
  })
    .then(({ value }) => {
      console.log(index);

      content.value[index].remarks = value;

      ElMessage({
        type: "success",
        message: "添加备注成功",
      });
    })
    .catch(() => {
      ElMessage({
        type: "info",
        message: "已取消",
      });
    });
};

const toHistory = (answerId) => {
  showNum.value = true;
  Axios.get(`/answer/get?answerId=${answerId}`).then((res) => {
    console.log(JSON.parse(res.data.context)["_value"]);
    content.value = JSON.parse(res.data.context)["_value"];
    textTitle.value = res.data.title;
    textarea1.value = res.data.evaluation1;
    textarea2.value = res.data.evaluation2;
    ansId.value = answerId;
  });
};
const open2 = () => {
  console.log(scoring.value);
  ElMessageBox.alert(`${scoring.value}`, "量表评估标准", {
    confirmButtonText: "确认",
  });
};
</script>

<template>
  <p
    v-if="showNum == false"
    style="
      color: #1677ff;
      font-size: 14px;
      margin-left: 20px;
      margin-top: 5px;
      margin-bottom: 10px;
    "
    @click="$router.push('/management/studentCenter')"
  >
    <el-icon><House /></el-icon>返回学生主页
  </p>

  <p
    v-if="showNum"
    style="
      color: #1677ff;
      font-size: 14px;
      margin-left: 20px;
      margin-top: 5px;
      margin-bottom: 10px;
    "
    @click="showNum = false"
  >
    <el-icon><House /></el-icon>返回
  </p>

  <div style="display: flex; justify-content: center; width: 100%">
    <div style="width: 97%; background-color: #fff">
      <div
        style="
          display: flex;
          width: 70%;
          justify-content: space-evenly;
          align-items: center;
          margin-top: 20px;
          font-size: 1vw;
        "
      >
        <span
          style="
            display: inline-block;
            width: 15%;
            white-space: nowrap;
            text-align: center;
          "
          >评估领域：</span
        >

        <el-select
          v-model="form.classify2"
          class="m-2"
          placeholder="请选择二级分类"
          size="default"
          @change="findThree()"
          style="width: 30%"
        >
          <el-option
            v-for="item in optionsTwo"
            :key="item.classify2"
            :label="item.classify2"
            :value="item.classify2"
          />
        </el-select>

        <el-select
          style="width: 30%"
          v-model="form.classify3"
          class="m-2"
          placeholder="请选择三级分类"
          size="default"
          @change="findTitle()"
        >
          <el-option
            v-for="item in optionsThree"
            :key="item.classify3"
            :label="item.classify3"
            :value="item.classify3"
          />
        </el-select>

        <!-- <el-select
          v-if="route.currentRoute.value.query.classify2"
          v-model="form.classify3"
          class="m-2"
          placeholder="请选择三级分类"
          size="default"
          @change="findThree()"
          style="width: 30%"
        >
          <el-option
            v-for="item in optionsTwo"
            :key="item.classify3"
            :label="item.classify3"
            :value="item.classify3"
          />
        </el-select> -->

        <el-select
          style="width: 30%"
          v-model="form.title"
          class="m-2"
          placeholder="请选择试卷"
          size="default"
        >
          <el-option
            v-for="item in optionsTitle"
            :key="item.scaleId"
            :label="item.title"
            :value="item.scaleId"
          />
        </el-select>

        <el-button
          type="primary"
          style="width: 10%; font-size: 1vw"
          @click="setTheme()"
          >开始评估</el-button
        >
        <el-button
          style="width: 10%; font-size: 1vw"
          type="primary"
          v-if="route.currentRoute.value.query.classify2"
          >生成报告</el-button
        >
        <el-button type="primary" style="width: 10%; font-size: 1vw"
          >打印报告</el-button
        >
      </div>

      <div v-if="!showNum" style="width: 80%; display: flex; flex-wrap: wrap">
        <!-- <div
          @click="toHistory(item.answerId)"
          class="shaDow"
          v-for="(item, index) in hisList"
          :key="index"
          style="
            height: 10vh;
            width: 100%;
            border: 1px solid #e6e8eb;
            margin-top: 10px;
          "
        >
          <div style="height: 20%; display: flex; font-size: 12px">
            <p style="margin-left: 10px; margin-top: 10px">{{ item.title }}</p>
            <span
              style="margin-left: 20px; margin-top: 10px"
              :style="{ color: item.degree == '未完成' ? 'red' : 'green' }"
            >
              {{ item.degree }}</span
            >
          </div>
        </div> -->

        <el-card
          @click="toHistory(item.answerId)"
          class="box-card"
          style="background-color: #e6fffb"
          v-for="(item, index) in hisList"
          shadow="hover"
        >
          <p style="font-size: 12px; position: relative">
            {{ item.title }}
            <span
              style="font-size: 10px; color: #909090; margin-left: 10px"
              :style="{ color: item.degree == '未完成' ? 'red' : 'green' }"
              >{{ item.degree }}</span
            >
            <span style="position: absolute; right: 0">
              <el-icon style="color: blue"><EditPen /></el-icon>
            </span>
          </p>
          <div
            style="display: flex; justify-content: center; align-items: center"
          >
            <el-progress
              type="circle"
              :percentage="item.percentage"
              width="100"
            />
          </div>
        </el-card>
      </div>

      <div
        style="
          /* height: 10vh; */
          background-color: #fff;
          display: flex;
          align-items: center;
          width: 40%;
          justify-content: center;
          font-size: 1vw;
          margin-top: 10px;
        "
      >
        <span v-show="showNum" v-if="content"
          >评估目录（该套评估量表一共有{{ content.length }}道题目）

          <el-tooltip
            class="box-item"
            effect="dark"
            content="评估说明"
            placement="top"
          >
            <svg
              @click="open2()"
              t="1680606875171"
              class="icon"
              viewBox="0 0 1024 1024"
              version="1.1"
              xmlns="http://www.w3.org/2000/svg"
              p-id="2602"
              width="20"
              height="20"
              style="margin-top: -15px; margin-left: 10px"
            >
              <path
                d="M463.99957 784.352211c0 26.509985 21.490445 48.00043 48.00043 48.00043s48.00043-21.490445 48.00043-48.00043c0-26.509985-21.490445-48.00043-48.00043-48.00043S463.99957 757.842226 463.99957 784.352211z"
                fill="#1296db"
                p-id="2603"
              ></path>
              <path
                d="M512 960c-247.039484 0-448-200.960516-448-448S264.960516 64 512 64 960 264.960516 960 512 759.039484 960 512 960zM512 128.287273c-211.584464 0-383.712727 172.128262-383.712727 383.712727 0 211.551781 172.128262 383.712727 383.712727 383.712727 211.551781 0 383.712727-172.159226 383.712727-383.712727C895.712727 300.415536 723.551781 128.287273 512 128.287273z"
                fill="#1296db"
                p-id="2604"
              ></path>
              <path
                d="M512 673.695256c-17.664722 0-32.00086-14.336138-32.00086-31.99914l0-54.112297c0-52.352533 39.999785-92.352318 75.32751-127.647359 25.887273-25.919957 52.67249-52.67249 52.67249-74.016718 0-53.343368-43.07206-96.735385-95.99914-96.735385-53.823303 0-95.99914 41.535923-95.99914 94.559333 0 17.664722-14.336138 31.99914-32.00086 31.99914s-32.00086-14.336138-32.00086-31.99914c0-87.423948 71.775299-158.559333 160.00086-158.559333s160.00086 72.095256 160.00086 160.735385c0 47.904099-36.32028 84.191695-71.424378 119.295794-27.839699 27.776052-56.575622 56.511974-56.575622 82.3356l0 54.112297C544.00086 659.328155 529.664722 673.695256 512 673.695256z"
                fill="#1296db"
                p-id="2605"
              ></path>
            </svg>
          </el-tooltip>
        </span>
      </div>
      <div style="width: 80%; background-color: #fff" v-show="showNum">
        <div
          v-for="(item, index) in content"
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
          <p style="color: #1677ff">
            {{ index + 1 }}.{{ item.qyestionContent }}
            <span>
              <el-button text @click="open(index)"
                ><el-icon style="color: blue"><EditPen /></el-icon
              ></el-button>
            </span>
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
              <!-- <el-input
                v-model="item.subjectivity"
                type="textarea"
                autosize
                style="width: 400px; margin-left: 20px; margin-top: 20px"
              >
              </el-input> -->
              <p>{{ item.subjectivity }}</p>
              <el-input-number
                v-model="item.isFalse"
                :min="0"
                :max="item.qyestionScore"
                @change="handleChange"
              />
            </div>
          </div>
          <span style="color: #909090; font-size: 12px" v-if="item.remarks">
            备注：{{ item.remarks }}
          </span>
        </div>
      </div>
      <div
        style="width: 80%; text-align: right; margin-top: 10px"
        v-show="showNum"
      >
        <div style="display: flex; justify-content: space-between">
          <span style="margin-left: 20px">
            得分：<span v-if="isShow">{{ score }}</span>
          </span>
          <el-button
            type="primary"
            style="width: 10%; font-size: 1vw"
            @click="isSure()"
            >提交</el-button
          >
        </div>

        <div
          style="display: flex; justify-content: space-around; margin-top: 20px"
        >
          <!-- <div
            style="
              width: 45%;
              display: flex;
              flex-direction: column;
              justify-content: left;
            "
          >
            <p>自动计算结果</p>
            <el-input
              v-model="textarea1"
              :rows="10"
              type="textarea"
              placeholder=""
              input-style="width: 100%"
              disabled
              resize="none"
            />
          </div> -->

          <div
            style="
              width: 45%;
              display: flex;
              flex-direction: column;
              justify-content: left;
            "
          >
            <p>最终评估结果</p>
            <el-input
              v-model="textarea2"
              :rows="10"
              type="textarea"
              placeholder=""
              input-style="width: 100%"
              resize="none"
            />
          </div>
        </div>
      </div>
      <el-tooltip
        class="box-item"
        effect="dark"
        content="保存草稿"
        placement="top"
      >
        <el-button
          @click="draft()"
          v-show="showNum"
          type="primary"
          style="
            height: 40px;
            width: 40px;
            border-radius: 50px;
            position: fixed;
            top: 60%;
            right: 7%;
          "
        >
          <el-icon><Document /></el-icon>
        </el-button>
      </el-tooltip>
    </div>
  </div>
</template>

<style scoped>
.shaDow:hover {
  box-shadow: 0px 5px 10px rgba(125, 125, 125, 0.5);
}
.shaDwo {
  transition: 0.2s;
}

.box-card {
  width: 400px;
  height: 180px;
  margin-top: 10px;
  margin-left: 10px;
}
</style>
