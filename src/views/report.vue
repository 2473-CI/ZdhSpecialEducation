<script setup>
import { House } from "@element-plus/icons-vue";
import { ref, reactive, onMounted, watch } from "vue";
import Axios from "../request/index.ts";

const student = reactive({});
const studentB = reactive({});
const regionPlace = ref("");
const birthPlace = ref("");
const p1 = ref("");
const c1 = ref("");
const r1 = ref("");
const p2 = ref("");
const c2 = ref("");
const r2 = ref("");
Axios.get(
  `/studentBasic/get?studentId=${
    JSON.parse(localStorage.getItem("sq")).studentId
  }`
).then(async (res) => {
  console.log(res);
  Object.keys(res.data.student).map((k) => {
    student[k] = res.data.student[k];
  });
  console.log(student);

  Object.keys(res.data.studentBasic).map((k) => {
    studentB[k] = res.data.studentBasic[k];
  });
  regionPlace.value = res.data.studentBasic.registeredResidence;
  birthPlace.value = res.data.studentBasic.birthplace;

  Axios.get(`/region/select?`).then((res) => {
    p1.value = res.data.filter(
      (item) => item.provinceCode == regionPlace.value.slice(0, 2) + "0000"
    )[0].provinceName;
    console.log(p1.value);
  });

  Axios.get(
    `/region/select?provinceCode=${regionPlace.value.slice(0, 2) + "0000"}`
  ).then((res) => {
    c1.value = res.data.filter(
      (item) => item.cityCode == regionPlace.value.slice(0, 4) + "00"
    )[0].cityName;
    console.log(c1.value);
  });

  Axios.get(
    `/region/select?cityCode=${regionPlace.value.slice(0, 4) + "00"}`
  ).then((res) => {
    r1.value = res.data.filter(
      (item) => item.regionCode == regionPlace.value
    )[0].regionName;
    console.log(r1.value);
  });

  Axios.get(`/region/select?`).then((res) => {
    p2.value = res.data.filter(
      (item) => item.provinceCode == birthPlace.value.slice(0, 2) + "0000"
    )[0].provinceName;
    console.log(p2.value);
  });

  Axios.get(
    `/region/select?provinceCode=${birthPlace.value.slice(0, 2) + "0000"}`
  ).then((res) => {
    c2.value = res.data.filter(
      (item) => item.cityCode == birthPlace.value.slice(0, 4) + "00"
    )[0].cityName;
    console.log(c2.value);
  });

  Axios.get(
    `/region/select?cityCode=${birthPlace.value.slice(0, 4) + "00"}`
  ).then((res) => {
    r2.value = res.data.filter(
      (item) => item.regionCode == birthPlace.value
    )[0].regionName;
    console.log(r2.value);
  });
});

const Growth = reactive({});
Axios.get(
  `/growUp/get?studentId=${JSON.parse(localStorage.getItem("sq")).studentId}`
).then((res) => {
  Object.keys(res.data).map((k) => (Growth[k] = res.data[k]));
});

const special = reactive({});
Axios.get(
  `/physiology/get?studentId=${
    JSON.parse(localStorage.getItem("sq")).studentId
  }`
).then((res) => {
  Object.keys(res.data).map((k) => (special[k] = res.data[k]));
});

const hobby = reactive({});
Axios.get(
  `/love/get?studentId=${JSON.parse(localStorage.getItem("sq")).studentId}`
).then((res) => {
  Object.keys(res.data).map((k) => (hobby[k] = res.data[k]));
});

const family = reactive({});
Axios.get(
  `/familyBasic/get?studentId=${
    JSON.parse(localStorage.getItem("sq")).studentId
  }`
).then((res) => {
  Object.keys(res.data).map((k) => (family[k] = res.data[k]));
});

const handleChange = (val) => {
  console.log(val);
};

const his = ref([]);
Axios.get(
  `/answer/getAll?studentId=${JSON.parse(localStorage.getItem("sq")).studentId}`
).then((res) => {
  console.log(res);
  console.log(JSON.parse(res.data[1].context)._value[0].qyestionContent);
  for (let item of res.data) {
    item["context"] = JSON.parse(item["context"])._value;
    if (item.isFalse == item.isTrue) {
      item["isPass"] = "是";
    } else {
      item["isPass"] = "否";
    }
    for (let it of item["context"]) {
      if (it["subjectivity"]) {
        it["subjectivity"] = it["subjectivity"]
          .split("\n")
          .filter((k) => k != "");
      }
    }
  }

  his.value = res.data;
  console.log(his.value);
});
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
  <div style="width: 100%; display: flex; justify-content: center">
    <div style="width: 96%; background-color: #fff">
      <h3 style="margin-left: 20px; margin-top: 10px">儿童基本信息</h3>
      <div
        style="
          margin-left: 20px;
          height: 150px;
          width: 99%;
          border-bottom: 1px solid #f8f8f8;
          display: flex;
          flex-wrap: wrap;
          margin-top: 30px;
        "
      >
        <p style="width: 24%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">姓名：</span>{{ student.studentName }}
        </p>
        <p style="width: 24%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">昵称：</span>{{ studentB.nickname }}
        </p>
        <p style="width: 24%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">性别：</span>{{ student.studentGender }}
        </p>
        <p style="width: 24%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">血型：</span>{{ studentB.bloodGroup }}
        </p>
        <p
          style="
            width: 24%;
            height: 20px;
            color: #000;
            font-size: 14px;
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 1;
            text-overflow: ellipsis;
            overflow: hidden;
          "
        >
          <span style="color: #8c8c8c">出生日期：</span>{{ studentB.birthday }}
        </p>
        <p style="width: 24%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">年龄：</span>
        </p>
        <p style="width: 24%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">班级：</span>{{ student.clazzName }}
        </p>
        <p style="width: 24%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">名族：</span>{{ studentB.nation }}
        </p>
        <p style="width: 24%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">户籍地：</span>{{ p1 }}/{{ c1 }}/{{ r1 }}
        </p>
        <p style="width: 24%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">生长地：</span>{{ p2 }}/{{ c2 }}/{{ r2 }}
        </p>
        <p style="width: 24%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">障碍类型：</span
          >{{ student.obstacleName }}
        </p>
      </div>

      <h3 style="margin-left: 20px; margin-top: 10px">生长史</h3>
      <div
        style="
          margin-left: 20px;
          height: 150px;
          width: 99%;
          border-bottom: 1px solid #f8f8f8;
          display: flex;
          flex-wrap: wrap;
          margin-top: 30px;
        "
      >
        <p style="width: 24%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">抬头时间：</span>{{ Growth.headUpTime }}
        </p>
        <p style="width: 24%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">独立坐时间：</span
          >{{ Growth.independentSittingTime }}
        </p>
        <p style="width: 24%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">独立站时间：</span
          >{{ Growth.independentStationTime }}
        </p>
        <p style="width: 24%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">独立走时间：</span
          >{{ Growth.independentTravelTime }}
        </p>
        <p style="width: 24%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">学会表达小便需求时间：</span
          >{{ Growth.headUpTime }}
        </p>
        <p style="width: 24%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c"> 学会表达大便需求时间：</span
          >{{ Growth.headUpTime }}
        </p>
        <p style="width: 24%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">独立小便时间：</span
          >{{ Growth.urinationTime }}
        </p>
        <p style="width: 24%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">独立大便时间：</span
          >{{ Growth.stoolTime }}
        </p>
        <p style="width: 24%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">首个词汇出现时间：</span
          >{{ Growth.firstWordAppears }}
        </p>
        <p style="width: 24%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">首个句子出现时间：</span
          >{{ Growth.firstSentence }}
        </p>
      </div>

      <h3 style="margin-left: 20px; margin-top: 10px">医疗史</h3>
      <div
        style="
          margin-left: 20px;
          height: 70px;
          width: 99%;
          border-bottom: 1px solid #f8f8f8;
          display: flex;
          flex-wrap: wrap;
          margin-top: 30px;
        "
      >
        <p style="width: 24%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">遗传病史：</span
          >{{ Growth.geneticHistory }}
        </p>
        <p
          style="
            width: 24%;
            height: 20px;
            color: #000;
            font-size: 14px;
            margin-left: 320px;
          "
        >
          <span style="color: #8c8c8c">重大疾病史：</span
          >{{ Growth.majorDiseases }}
        </p>
      </div>

      <h3 style="margin-left: 20px; margin-top: 10px">生理特殊情况</h3>
      <div
        style="
          margin-left: 20px;
          height: 100px;
          width: 99%;
          border-bottom: 1px solid #f8f8f8;
          display: flex;
          flex-wrap: wrap;
          margin-top: 30px;
        "
      >
        <p style="width: 24%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">过敏情况：</span
          >{{ special.irritability }}
        </p>
        <p style="width: 24%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">存在健康问题：</span
          >{{ special.healthProblem }}
        </p>
        <p style="width: 24%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">其他健康问题：</span
          >{{ special.otherHealthProblem }}
        </p>
        <p style="width: 24%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">正在用药/矫正器具为：</span
          >{{ special.pharmacy }}
        </p>
        <p style="width: 24%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">无语言需要沟通辅具：</span
          >{{ special.speakAssist }}
        </p>
        <p style="width: 24%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c"> 其他沟通辅具：</span
          >{{ special.otherAssist }}
        </p>
      </div>

      <h3 style="margin-left: 20px; margin-top: 10px">兴趣偏好</h3>
      <div
        style="
          margin-left: 20px;
          height: 220px;
          width: 99%;
          border-bottom: 1px solid #f8f8f8;
          display: flex;
          flex-wrap: wrap;
          margin-top: 30px;
        "
      >
        <p style="width: 30%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">喜欢的物品：</span
          >{{ hobby.loveArticle }}
        </p>
        <p style="width: 30%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">喜欢的活动：</span
          >{{ hobby.loveActivity }}
        </p>
        <p style="width: 30%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">喜欢的人物：</span>{{ hobby.loveFigure }}
        </p>
        <p style="width: 30%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">性格的优势：</span
          >{{ hobby.characterAdvantage }}
        </p>
        <p style="width: 30%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">能力和特长：</span>{{ hobby.shtick }}
        </p>
        <p style="width: 30%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">其他：</span>{{ hobby.other }}
        </p>
        <p style="width: 30%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">不喜欢的物品：</span
          >{{ hobby.unLoveArticle }}
        </p>
        <p style="width: 30%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">不喜欢的活动：</span
          >{{ hobby.unLoveActivity }}
        </p>
        <p style="width: 30%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">不喜欢的人物：</span
          >{{ hobby.unLoveFigure }}
        </p>
        <p style="width: 30%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">其他因素：</span>{{ hobby.otherFactors }}
        </p>
        <p style="width: 30%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">说明：</span>{{ hobby.explain_ }}
        </p>
      </div>

      <h3 style="margin-left: 20px; margin-top: 10px">家庭基本信息</h3>
      <div
        style="
          margin-left: 20px;
          height: 80px;
          width: 99%;
          border-bottom: 1px solid #f8f8f8;
          display: flex;
          flex-wrap: wrap;
          margin-top: 30px;
        "
      >
        <p style="width: 30%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">家庭年收入：</span
          >{{ family.annualIncome }}
        </p>
        <p style="width: 30%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">家庭地址：</span>{{ family.homeAddress }}
        </p>
        <p style="width: 30%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">家庭语言环境：</span
          >{{ family.languageEnvironment }}
        </p>
      </div>
      <el-table
        :data="tableData"
        :cell-style="{
          textAlign: 'left',
          marginLeft: '0px',
          marginRight: '0px',
          fontSize: '12px',
        }"
        :header-cell-style="{
          'text-align': 'left',
          color: 'black',
          fontWeight: 'bolder',
          backgroundColor: '#fafafa',
        }"
      >
        <el-table-column
          prop="relation"
          label="关系"
          width="auto"
          min-width="20%"
        />
        <el-table-column
          prop="name"
          label="姓名"
          width="auto"
          min-width="20%"
        />
        <el-table-column
          prop="birth"
          label="出生日期"
          width="auto"
          min-width="20%"
        />
        <el-table-column prop="job" label="职业" width="auto" min-width="20%" />
        <el-table-column
          prop="phone"
          label="电话"
          width="auto"
          min-width="20%"
        />
      </el-table>

      <h3 style="margin-left: 20px; margin-top: 30px">特殊儿童评估干预</h3>
      <div style="margin-top: 10px; color: #8c8c8c; margin-bottom: 20px">
        <p style="margin-left: 20px">无</p>
      </div>
      <h3 style="margin-left: 20px; margin-top: 30px; margin-bottom: 20px">
        志培学校国家课程标准评估
      </h3>
      <div class="demo-collapse">
        <el-collapse
          v-model="activeNames"
          @change="handleChange"
          style="border: 1px solid #ccc; border-radius: 10px"
        >
          <el-collapse-item
            :title="item.title"
            :name="index + 1"
            style="padding-left: 20px; font-weight: bold"
            v-for="(item, index) in his"
            :key="index"
          >
            <div>
              <el-table
                :data="item.context"
                style="width: 98%"
                :cell-style="{
                  textAlign: 'left',
                  marginLeft: '0px',
                  marginRight: '0px',
                  fontSize: '12px',
                }"
                :header-cell-style="{
                  'text-align': 'left',
                  color: 'black',
                  fontWeight: 'bolder',
                  backgroundColor: '#fafafa',
                  marginLeft: '-20px',
                }"
              >
                <el-table-column label="长期目标" width="auto" min-width="15%">
                  <template #default="scope">{{
                    scope.row.qyestionContent
                  }}</template>
                </el-table-column>
                <el-table-column label="短期目标" width="auto" min-width="70%">
                  <template #default="scope">
                    <p
                      v-for="(it, ind) in scope.row.select"
                      v-if="!scope.row.subjectivity"
                    >
                      {{ it.value }}
                    </p>
                    <p
                      v-if="scope.row.subjectivity"
                      v-for="(ite, inde) in scope.row.subjectivity"
                      :key="inde"
                    >
                      {{ ite }}
                    </p>
                  </template>
                </el-table-column>
                <el-table-column label="是否通过" width="auto" min-width="15%">
                  <template #default="scope">{{ item.isPass }}</template>
                </el-table-column>
              </el-table>
            </div>
          </el-collapse-item>
        </el-collapse>
      </div>
      <h3 style="margin-left: 20px; margin-top: 30px; margin-bottom: 20px">
        随班就读儿童评估干预
      </h3>
      <div style="margin-top: 10px; color: #8c8c8c; margin-bottom: 20px">
        <p style="margin-left: 20px">无</p>
      </div>
      <h3 style="margin-left: 20px; margin-top: 30px; margin-bottom: 20px">
        送教上门儿童评估干预
      </h3>
      <div style="margin-top: 10px; color: #8c8c8c; margin-bottom: 20px">
        <p style="margin-left: 20px">无</p>
      </div>
    </div>
  </div>
</template>

<style scoped></style>
