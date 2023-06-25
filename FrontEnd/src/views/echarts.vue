<script setup>
import { ref, reactive, onMounted } from "vue";
import * as echarts from "echarts";
import Axios from "../request/index";
import { useRouter } from "vue-router";
const route = useRouter();
console.log(route.currentRoute._value.query.schoolId);

const teacherNum = ref(0);
Axios.get(
  `/echarts/countTeacherByStudentId?id=${route.currentRoute._value.query.schoolId}`
).then((res) => {
  teacherNum.value = res.data;
  console.log(res);
});

const obsList = ref([]);

const load = async () => {
  const data = await Axios.get(
    `/echarts/obsProportion?id=${route.currentRoute._value.query.schoolId}`
  );
  obsList.value = data.data;
  console.log(obsList.value);
};

const left_item = ref(null);
const chart = () => {
  console.log(obsList.value);
  // 解决echarts在vue中切换到其他页面再返回来就不显示的问题
  left_item.value.setAttribute("_echarts_instance_", "");
  // 这里使用chart1.value的形式获取到dom节点
  let myChart = echarts.init(left_item.value);
  // 绘制图表
  myChart.setOption({
    tooltip: {
      trigger: "item",
    },
    legend: {
      top: "5%",
      left: "right",
      orient: "vertical",
    },
    series: [
      {
        type: "pie",
        radius: ["40%", "70%"],
        avoidLabelOverlap: false,
        label: {
          show: false,
          position: "center",
        },
        labelLine: {
          show: false,
        },
        data: obsList.value.map((k) => {
          return {
            name: k.obstacleName,
            value: k.sum,
          };
        }),
      },
    ],
  });
  // echarts 自适应，如果dom元素是自适应高宽，会随之改变echarts大小
  window.addEventListener("resize", () => {
    myChart.resize();
  });
};

const classList = ref([]);
const studentNum = ref(0);

const right_item = ref(null);
const clssSta = async () => {
  const data = await Axios.get(
    `/echarts/classStatistics?id=${route.currentRoute._value.query.schoolId}`
  );
  console.log(data);
  classList.value = data.data;
  for (let item of data.data) {
    studentNum.value += item.sum;
  }
};

const classChart = () => {
  console.log(classList.value);
  // 解决echarts在vue中切换到其他页面再返回来就不显示的问题
  right_item.value.setAttribute("_echarts_instance_", "");
  // 这里使用chart1.value的形式获取到dom节点
  let myChart = echarts.init(right_item.value);
  // 绘制图表
  myChart.setOption({
    tooltip: {
      trigger: "axis",
      axisPointer: {
        type: "shadow",
      },
    },
    xAxis: {
      type: "category",
      data: classList.value.map((k) => k.gradeName),
      axisLabel: {
        rotate: 60,
        interval: 0,
        fontSize: 10,
      },
    },
    yAxis: {
      type: "value",
    },
    series: [
      {
        data: classList.value.map((k) => k.sum),
        type: "bar",
        showBackground: true,
        backgroundStyle: {
          color: "rgba(180, 180, 180, 0.2)",
        },
      },
    ],
  });
  // echarts 自适应，如果dom元素是自适应高宽，会随之改变echarts大小
  window.addEventListener("resize", () => {
    myChart.resize();
  });
};

// 数据渲染完成后在这里挂载
onMounted(async () => {
  await load();
  chart();
  await clssSta();
  classChart();
});

const newStudentCount = ref("");
Axios.get(
  `/echarts/countNewStudentBySchoolId?schoolId=${route.currentRoute._value.query.schoolId}`
).then((res) => {
  newStudentCount.value = res.data;
});

const selfCount = ref("");
Axios.get(
  `/echarts/countFileBySchoolId?schoolId=${route.currentRoute._value.query.schoolId}`
).then((res) => {
  selfCount.value = res.data;
});

const exeNum = ref("");
Axios.get(
  `/echarts/countExerciseBySchoolId?schoolId=${route.currentRoute._value.query.schoolId}`
).then((res) => {
  console.log(res);
  exeNum.value = res.data;
});

const answerAll = ref("");
const answerScale = ref("");
Axios.get(
  `/echarts/countAnswerBySchoolId?schoolId=${route.currentRoute._value.query.schoolId}`
).then((res) => {
  console.log(res);
  answerAll.value = res.data.all;
  if (res.data.all == 0) {
    answerScale.value = 1;
  } else {
    answerScale.value = res.data.end / res.data.all;
  }
});

const classNum = ref("");
Axios.get(
  `/echarts/countClassBySchoolId?schoolId=${route.currentRoute._value.query.schoolId}`
).then((res) => {
  classNum.value = res.data;
});

const IEPNum = ref("");
Axios.get(
  `/echarts/countIepEnd?schoolId=${route.currentRoute._value.query.schoolId}`
).then((res) => {
  console.log(res);
  IEPNum.value = res.data;
});

const IEPScale = ref("");
Axios.get(
  `/echarts/countIep?schoolId=${route.currentRoute._value.query.schoolId}`
).then((res) => {
  console.log(res);
  IEPScale.value = res.data;
});
</script>

<template>
  <el-button @click="$router.push('/management/schoolList')">返回</el-button>

  <div style="display: flex">
    <div
      style="
        height: 120px;
        width: 500px;
        border-radius: 5px;
        margin-left: 10px;
        margin-top: 10px;
      "
    >
      <div
        style="
          height: 40%;
          width: 500px;
          background-color: #f8fbff;
          border-top-right-radius: 5px;
          border-top-left-radius: 5px;
          display: flex;
          align-items: center;
        "
      >
        <span
          style="
            display: inline-block;
            height: 20px;
            width: 4px;
            background-color: #399dff;
            border-radius: 4px;
            margin-left: 15px;
          "
        ></span>
        <span style="font-weight: bold; margin-left: 10px">教师信息</span>
      </div>
      <div
        style="
          height: 60%;
          width: 500px;
          margin-bottom: 40px;
          background-image: linear-gradient(-20deg, #f6fafe 0%, #f1f1fd 100%);
          display: flex;
          justify-content: space-around;
        "
      >
        <div
          style="
            width: 23%;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            align-items: center;
            font-size: 14px;
          "
        >
          <p style="font-weight: bold">{{ teacherNum }}</p>
          <p>教师人数</p>
        </div>
        <div
          style="
            width: 23%;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            align-items: center;
            font-size: 14px;
          "
        >
          <p style="font-weight: bold">{{ classNum }}</p>
          <p>班级数量</p>
        </div>
        <div
          style="
            width: 23%;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            align-items: center;
            font-size: 14px;
          "
        >
          <p style="font-weight: bold">{{ selfCount }}</p>
          <p>上传教案</p>
        </div>
        <div
          style="
            width: 23%;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            align-items: center;
            font-size: 14px;
          "
        >
          <p style="font-weight: bold">{{ exeNum }}</p>
          <p>个训记录</p>
        </div>
      </div>
      <h2
        style="
          background-color: aliceblue;
          width: 500px;
          height: 40px;
          line-height: 40px;
        "
      >
        &nbsp; 学生障碍类型分布
      </h2>
      <div
        ref="left_item"
        style="height: 300px; width: 500px; background-color: aliceblue"
      ></div>
    </div>

    <div
      style="
        height: 120px;
        width: 40%;
        border-radius: 5px;
        margin-left: 20px;
        margin-top: 10px;
      "
    >
      <div
        style="
          height: 40%;
          width: 500px;
          background-color: #f8fbff;
          border-top-right-radius: 5px;
          border-top-left-radius: 5px;
          display: flex;
          align-items: center;
        "
      >
        <span
          style="
            display: inline-block;
            height: 20px;
            width: 4px;
            background-color: #399dff;
            border-radius: 4px;
            margin-left: 15px;
          "
        ></span>
        <span style="font-weight: bold; margin-left: 10px; width: 500px"
          >学生信息</span
        >
      </div>
      <div
        style="
          height: 60%;
          width: 500px;
          margin-bottom: 40px;
          background-image: linear-gradient(-20deg, #fffdfd 0%, #fff2f0 100%);
          display: flex;
          align-items: center;
        "
      >
        <div
          style="
            width: 23%;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            align-items: center;
            font-size: 14px;
          "
        >
          <p style="font-weight: bold">{{ studentNum }}</p>
          <p>学生人数</p>
        </div>
        <div
          style="
            width: 23%;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            align-items: center;
            font-size: 14px;
          "
        >
          <p style="font-weight: bold">{{ newStudentCount }}</p>
          <p>新入学</p>
        </div>
        <div
          style="
            width: 23%;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            align-items: center;
            font-size: 14px;
          "
        >
          <p style="font-weight: bold">{{ IEPNum }}</p>
          <p>IEP已有份数</p>
        </div>
        <div
          style="
            width: 23%;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            align-items: center;
            font-size: 14px;
          "
        >
          <p style="font-weight: bold">{{ studentNum }}</p>
          <p>IEP目标数</p>
        </div>
      </div>
      <h2
        style="
          background-color: aliceblue;
          width: 500px;
          height: 40px;
          line-height: 40px;
        "
      >
        &nbsp; 学生年级统计
      </h2>
      <div
        ref="right_item"
        style="height: 300px; width: 500px; background-color: aliceblue"
      ></div>
    </div>

    <div style="width: 320px; margin-right: 30px; margin-top: 10px">
      <h2 style="background-color: aliceblue; height: 48px; line-height: 48px">
        &nbsp; IEP统计及评估统计
      </h2>
      <div
        style="
          height: 452px;
          width: 320px;
          background-color: #fff;
          display: flex;
          flex-wrap: wrap;
          justify-content: space-around;
          align-items: center;
        "
      >
        <div
          style="
            width: 150px;
            height: 200px;
            border-right: 1px solid #ececec;
            border-bottom: 1px solid #ececec;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            align-items: center;
          "
        >
          <span style="font-weight: 30px; font-size: 14px">IEP制定率</span>
          <el-progress
            type="circle"
            :percentage="
              studentNum
                ? ((IEPScale / (studentNum * 3)) * 100).toFixed(0)
                : 100
            "
            color="#fda647"
          />
        </div>
        <div
          style="
            width: 150px;
            height: 200px;
            border-left: 1px solid #ececec;
            border-bottom: 1px solid #ececec;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            align-items: center;
          "
        >
          <span style="font-weight: 30px; font-size: 14px">IEP进度</span>
          <el-progress
            type="circle"
            :percentage="
              studentNum ? ((IEPNum / studentNum) * 100).toFixed(0) : 100
            "
            color="#35e4e4"
          />
        </div>
        <div
          style="
            width: 150px;
            height: 200px;
            border-right: 1px solid #ececec;
            border-top: 1px solid #ececec;
            display: flex;
            flex-direction: column;
            justify-content: space-evenly;
            align-items: center;
          "
        >
          <span style="font-weight: 30px; font-size: 14px; margin-top: -50px"
            >评估量表总数</span
          >
          <p style="font-weight: bold; font-size: 14px; margin-bottom: 20px">
            {{ answerAll }}条
          </p>
        </div>
        <div
          style="
            width: 150px;
            height: 200px;
            border-left: 1px solid #ececec;
            border-top: 1px solid #ececec;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            align-items: center;
          "
        >
          <span style="font-weight: 30px; font-size: 14px"
            >本学期评估完成率</span
          >
          <el-progress
            type="dashboard"
            :percentage="(answerScale * 100).toFixed(0)"
            color="#8fb2fa"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped></style>
