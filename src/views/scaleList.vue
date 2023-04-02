<script setup>
import { House } from "@element-plus/icons-vue";
import { ref, reactive, onMounted, watch } from "vue";
import Axios from "../request/index.ts";
import { useRouter } from "vue-router";
import { ElMessage, ElMessageBox } from "element-plus";
import { Document } from "@element-plus/icons-vue";
const route = useRouter();
const list = ref([{}, {}, {}, {}]);
const radio1 = ref([]);
const radio2 = ref([]);
const scoreSelf = ref("");
const isShow = ref(false);

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
if (route.currentRoute.value.query.classify1) {
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
  // optionsTwo.value = [
  //   ...new Set(optionsTwo.value.map((o) => JSON.stringify(o))),
  // ].map((o) => JSON.parse(o));
  // console.log(optionsTwo);
} else if (route.currentRoute.value.query.classify2) {
  form.classify2 = route.currentRoute.value.query.classify2;
  Axios.post("/scale/search", form).then((res) => {
    res.data = [...new Set(res.data.map((k) => k.classify3))];
    optionsTwo.value = res.data.map((k) => {
      return {
        classify3: k,
      };
    });
  });
}

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
const setTheme = () => {
  showNum.value = true;
  Axios.get(`/scale/getById?scaleId=${form.title}`).then((res) => {
    console.log(JSON.parse(res.data.context));
    content.value = JSON.parse(res.data.context);
    textTitle.value = res.data.title;
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
const isSure = () => {
  isShow.value = true;
  if (time.value < content.value.length) {
    for (let item of content.value) {
      if (item.isFalse == [] || item.isFalse == 0) {
        ElMessage({
          showClose: true,
          message: "题目未作答完整！",
          type: "error",
        });
        break;
      } else if (item.isFalse != [] && item.isFalse != 0) {
        time.value++;
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
      } else if (time.value == content.value.length) {
        ElMessage({
          showClose: true,
          message: "提交成功!",
          type: "success",
        });
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

const draft = () => {
  number.value = 0;
  for (let item of content.value) {
    if (item.isFalse == []) {
      number.value++;
    } else if (item.isFalse == 0) {
      number.value++;
    }
  }
  console.log(number.value);
  if (number.value > 0) {
    degree.value = "未完成";
  } else {
    degree.value = "已完成";
  }

  console.log(content);
  Axios.post("/answer/add", {
    scaleId: form.title,
    studentId: JSON.parse(localStorage.getItem("sq")).studentId,
    title: textTitle.value,
    context: JSON.stringify(content),
    degree: degree.value,
    evaluation1: textarea1.value,
    evaluation2: textarea2.value,
  }).then((res) => {
    console.log(res);
  });
};
</script>

<template>
  <p
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
          v-if="route.currentRoute.value.query.classify1"
          v-model="form.classify2"
          class="m-2"
          placeholder="请选择二级分类"
          size="large"
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
          v-if="route.currentRoute.value.query.classify1"
          v-model="form.classify3"
          class="m-2"
          placeholder="请选择三级分类"
          size="large"
          @change="findTitle()"
        >
          <el-option
            v-for="item in optionsThree"
            :key="item.classify3"
            :label="item.classify3"
            :value="item.classify3"
          />
        </el-select>

        <el-select
          v-if="route.currentRoute.value.query.classify2"
          v-model="form.classify3"
          class="m-2"
          placeholder="请选择三级分类"
          size="large"
          @change="findThree()"
          style="width: 30%"
        >
          <el-option
            v-for="item in optionsTwo"
            :key="item.classify3"
            :label="item.classify3"
            :value="item.classify3"
          />
        </el-select>

        <el-select
          style="width: 30%"
          v-model="form.title"
          class="m-2"
          placeholder="请选择试卷"
          size="large"
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
          >查看报告</el-button
        >
      </div>
      <div
        style="
          height: 10vh;
          background-color: #fff;
          display: flex;
          align-items: center;
          width: 40%;
          justify-content: center;
          font-size: 1vw;
        "
      >
        <span v-show="showNum"
          >评估目录（该套评估量表一共有{{ content.length }}道题目）</span
        >
      </div>
      <div style="width: 80%; background-color: #fff">
        <div
          v-for="(item, index) in content"
          :key="index"
          style="
            height: 10vh;
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
          </p>
          <div style="display: flex">
            <div>
              <el-radio-group
                v-model="item.isFalse"
                v-if="item.qyestionType == '单选'"
              >
                <el-radio
                  :label="it.name"
                  size="large"
                  v-for="(it, ind) in item.select"
                  :key="ind"
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
              <el-input-number
                v-model="item.isFalse"
                :min="0"
                :max="item.qyestionScore"
                @change="handleChange"
              />
            </div>
          </div>
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
          <el-input
            v-model="textarea1"
            :rows="10"
            type="textarea"
            placeholder="Please input"
            style="width: 45%"
          />
          <el-input
            v-model="textarea2"
            :rows="10"
            type="textarea"
            placeholder="Please input"
            style="width: 45%"
          />
        </div>
      </div>
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
    </div>
  </div>
</template>

<style scoped></style>
