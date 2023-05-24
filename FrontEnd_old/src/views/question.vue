<script setup>
import { reactive } from "vue";

const from = reactive({
  paperType: "1",
  paperTitle: "线性代数",
  qyestionList: [],
});

const addQuestion = () => {
  from.qyestionList.push({
    qyestionType: "单选",
    qyestionScore: 20,
    qyestionContent: "1+1=?",
    select: [
      { name: "A", value: "0" },
      { name: "B", value: "1" },
    ],
    isTrue: [],
  });
};

const qyestionTypeSelect = [
  { value: "单选" },
  { value: "多选" },
  { value: "填空" },
  { value: "主观" },
];

const qyestionScoreSelect = [
  { name: "5分", value: 5 },
  { name: "10分", value: 10 },
  { name: "15分", value: 15 },
  { name: "20分", value: 20 },
];
const addSelect = (index) => {
  from.qyestionList[index].select.push({ name: "A", value: "0" });
};
const c = () => {
  console.log(from);
};
</script>

<template>
  <el-card class="box-card">
    <div style="display: flex">
      试卷名称：<el-input
        v-model="from.paperTitle"
        placeholder="Please input"
      />
    </div>

    <div style="display: flex; flex-direction: column">
      <div style="display: inline-block">
        <div :key="index" v-for="(question, index) in from.qyestionList">
          第{{ index + 1 }} 题
          <el-select
            v-model="question.qyestionType"
            placeholder="Select"
            size="large"
          >
            <el-option
              v-for="item in qyestionTypeSelect"
              :key="item.value"
              :label="item.value"
              :value="item.value"
            />
          </el-select>
          <el-select
            v-model="question.qyestionScore"
            placeholder="Select"
            size="large"
          >
            <el-option
              v-for="item in qyestionScoreSelect"
              :key="item.value"
              :label="item.name"
              :value="item.value"
            />
          </el-select>

          <el-input
            v-model="question.qyestionContent"
            placeholder="Please input"
          />
          <div v-if="question.qyestionType == '单选'">
            <el-radio-group v-model="question.isTrue">
              <el-radio
                :key="index"
                v-for="(sel, index) in question.select"
                :label="sel.name"
                size="large"
                >{{ sel.name }}.{{ sel.value }}</el-radio
              >
              <el-button type="primary" @click="addSelect(index)"
                >添加选项</el-button
              >
            </el-radio-group>
            {{ question.isTrue }}
          </div>
        </div>
      </div>
    </div>
    <el-button type="primary" @click="addQuestion">新增题目</el-button>
    <el-button type="primary" @click="c">打印题目</el-button>
  </el-card>
</template>

<style scoped>
.box-card {
  width: 1080px;
}
</style>
