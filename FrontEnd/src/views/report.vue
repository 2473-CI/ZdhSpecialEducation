<script setup>
import { House } from "@element-plus/icons-vue";
import { ref, reactive, onMounted, watch } from "vue";
import Axios from "../request/index.js";
import { getCurrentInstance } from "vue";
import { asBlob } from "html-docx-js-typescript";
import { saveAs } from "file-saver";

const lessionNear = ref("");
const lessionList = reactive({
  schedule: "",
  time: "",
  title: "",
});
const lessionStr = ref("");

Axios.post("/schedule/selectById", {
  studentId: JSON.parse(localStorage.getItem("sq")).studentId,
}).then((res) => {
  console.log(res);
  lessionNear.value = res.data[res.data.length - 1];
  console.log(lessionNear.value);

  lessionList.schedule = lessionNear.value.schedule;
  lessionList.time = lessionNear.value.time;
  lessionList.title = lessionNear.value.title;
  console.log(lessionList);

  lessionStr.value += ` <tr>
              <th class="bold-text" colspan="7">${lessionList.title}</th>
            </tr>
            <tr>
              <td>时段</td>
              <td>节次</td>
              <td>星期一</td>
              <td>星期二</td>
              <td>星期三</td>
              <td>星期四</td>
              <td>星期五</td>
            </tr>
            <tr>
              <td>
                上午
                <p>
                   ${JSON.parse(lessionList.time)[0].startTime}~${
    JSON.parse(lessionList.time)[0].endTime
  }
                </p>
              </td>
              <td>1</td>
              <td>
                <p>${JSON.parse(lessionList.schedule)[0].oneLessionName}</p>
                <p>${JSON.parse(lessionList.schedule)[0].oneTeacherName}</p>
                </td>
              <td><p>${JSON.parse(lessionList.schedule)[1].oneLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[1].oneTeacherName
                }</p></td>
              <td><p>${JSON.parse(lessionList.schedule)[2].oneLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[2].oneTeacherName
                }</p></td>
              <td><p>${JSON.parse(lessionList.schedule)[3].oneLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[3].oneTeacherName
                }</p></td>
              <td><p>${JSON.parse(lessionList.schedule)[4].oneLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[4].oneTeacherName
                }</p></td>
            </tr>
            <tr>
              <td>上午
                <p>
                   ${JSON.parse(lessionList.time)[1].startTime}~${
    JSON.parse(lessionList.time)[1].endTime
  }
                </p>
                </td>
              <td>2</td>
              <td><p>${JSON.parse(lessionList.schedule)[0].twoLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[0].twoTeacherName
                }</p></td>
              <td><p>${JSON.parse(lessionList.schedule)[1].twoLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[1].twoTeacherName
                }</p></td>
              <td><p>${JSON.parse(lessionList.schedule)[2].twoLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[2].twoTeacherName
                }</p></td>
              <td><p>${JSON.parse(lessionList.schedule)[3].twoLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[3].twoTeacherName
                }</p></td>
              <td><p>${JSON.parse(lessionList.schedule)[4].twoLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[4].twoTeacherName
                }</p></td>
            </tr>
            <tr>
              <td>上午<p>
                   ${JSON.parse(lessionList.time)[2].startTime}~${
    JSON.parse(lessionList.time)[2].endTime
  }
                </p></td>
              <td>3</td>
              <td><p>${JSON.parse(lessionList.schedule)[0].threeLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[0].threeTeacherName
                }</p></td>
              <td><p>${JSON.parse(lessionList.schedule)[1].threeLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[1].threeTeacherName
                }</p></td>
              <td><p>${JSON.parse(lessionList.schedule)[2].threeLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[2].threeTeacherName
                }</p></td>
              <td><p>${JSON.parse(lessionList.schedule)[3].threeLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[3].threeTeacherName
                }</p></td>
              <td><p>${JSON.parse(lessionList.schedule)[4].threeLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[4].threeTeacherName
                }</p></td>
            </tr>
            <tr>
              <td>上午
                <p>
                   ${JSON.parse(lessionList.time)[3].startTime}~${
    JSON.parse(lessionList.time)[3].endTime
  }
                </p>
                </td>
              <td>4</td>
              <td><p>${JSON.parse(lessionList.schedule)[0].fourLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[0].fourTeacherName
                }</p></td>
              <td><p>${JSON.parse(lessionList.schedule)[1].fourLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[1].fourTeacherName
                }</p></td>
              <td><p>${JSON.parse(lessionList.schedule)[2].fourLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[2].fourTeacherName
                }</p></td>
              <td><p>${JSON.parse(lessionList.schedule)[3].fourLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[3].fourTeacherName
                }</p></td>
              <td><p>${JSON.parse(lessionList.schedule)[4].fourLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[4].fourTeacherName
                }</p></td>
            </tr>
            <tr>
              <td></td>
            </tr>
            <tr>
              <td>下午
                <p>
                   ${JSON.parse(lessionList.time)[4].startTime}~${
    JSON.parse(lessionList.time)[4].endTime
  }
                </p>
                </td>
              <td>5</td>
              <td><p>${JSON.parse(lessionList.schedule)[0].fiveLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[0].fiveTeacherName
                }</p></td>
              <td><p>${JSON.parse(lessionList.schedule)[1].fiveLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[1].fiveTeacherName
                }</p></td>
              <td><p>${JSON.parse(lessionList.schedule)[2].fiveLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[2].fiveTeacherName
                }</p></td>
              <td><p>${JSON.parse(lessionList.schedule)[3].fiveLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[3].fiveTeacherName
                }</p></td>
              <td><p>${JSON.parse(lessionList.schedule)[4].fiveLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[4].fiveTeacherName
                }</p></td>
            </tr>

            <tr>
              <td>下午
                <p>
                   ${JSON.parse(lessionList.time)[5].startTime}~${
    JSON.parse(lessionList.time)[5].endTime
  }
                </p>
                </td>
              <td>6</td>
              <td><p>${JSON.parse(lessionList.schedule)[0].sixLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[0].sixTeacherName
                }</p></td>
              <td><p>${JSON.parse(lessionList.schedule)[1].sixLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[1].sixTeacherName
                }</p></td>
              <td><p>${JSON.parse(lessionList.schedule)[2].sixLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[2].sixTeacherName
                }</p></td>
              <td><p>${JSON.parse(lessionList.schedule)[3].sixLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[3].sixTeacherName
                }</p></td>
              <td><p>${JSON.parse(lessionList.schedule)[4].sixLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[4].sixTeacherName
                }</p></td>
            </tr>
            <tr>
              <td>下午
                <p>
                   ${JSON.parse(lessionList.time)[6].startTime}~${
    JSON.parse(lessionList.time)[6].endTime
  }
                </p>
                </td>
              <td>7</td>
              <td><p>${JSON.parse(lessionList.schedule)[0].sevenLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[0].sevenTeacherName
                }</p></td>
              <td><p>${JSON.parse(lessionList.schedule)[1].sevenLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[1].sevenTeacherName
                }</p></td>
              <td><p>${JSON.parse(lessionList.schedule)[2].sevenLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[2].sevenTeacherName
                }</p></td>
              <td><p>${JSON.parse(lessionList.schedule)[3].sevenLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[3].sevenTeacherName
                }</p></td>
              <td><p>${JSON.parse(lessionList.schedule)[4].sevenLessionName}</p>
                <p>${
                  JSON.parse(lessionList.schedule)[4].sevenTeacherName
                }</p></td>
            </tr>`;
  console.log(lessionStr.value);
});

const specialObj = ref("");
Axios.post(`/special/selectByStudentId`, {
  studentId: JSON.parse(localStorage.getItem("sq")).studentId,
}).then((res) => {
  console.log(res);
  specialObj.value = res.data[res.data.length - 1];
});

const planObj = ref("");
const planStr = ref("");
Axios.post(`/plan/selectByStudentId`, {
  studentId: JSON.parse(localStorage.getItem("sq")).studentId,
}).then((res) => {
  console.log(res);
  planObj.value = res.data[res.data.length - 1];

  if (planObj.value["radio"] == "优") {
    planStr.value += ` <td style="width: 12%" >Y</td>
                      <td style="width: 12%" ></td>
                      <td style="width: 12%" ></td>
                      <td style="width: 12%" ></td>`;
  } else if (planObj.value["radio"] == "良") {
    planStr.value += ` <td style="width: 12%" ></td>
                      <td style="width: 12%" >Y</td>
                      <td style="width: 12%" ></td>
                      <td style="width: 12%" ></td>`;
  } else if (planObj.value["radio"] == "及格") {
    planStr.value += ` <td style="width: 12%" ></td>
                      <td style="width: 12%" ></td>
                      <td style="width: 12%" >Y</td>
                      <td style="width: 12%" ></td>`;
  } else if (planObj.value["radio"] == "不及格") {
    planStr.value += ` <td style="width: 12%" ></td>
                      <td style="width: 12%" ></td>
                      <td style="width: 12%" ></td>
                      <td style="width: 12%" >Y</td>`;
  }
});

const supportObj = ref("");
const supportStr = ref("");
Axios.post("/serve/selectByStudentId", {
  studentId: JSON.parse(localStorage.getItem("sq")).studentId,
}).then((res) => {
  console.log(res);
  supportObj.value = res.data[res.data.length - 1];

  supportStr.value = `
                    <tr>
                      <th class="bold-text" colspan="3">服务内容</th>
                      <th class="bold-text" colspan="3">服务内容描述</th>
                      <th class="bold-text" colspan="3">负责单位（人）</th>
                    </tr>`;

  for (let item of JSON.parse(supportObj.value.content)) {
    supportStr.value += `<tr>
                            <td colspan="3">${item.content}</td>
                            <td colspan="3">${item.describe}</td>
                            <td colspan="3">${item.unit}</td>
                          </tr>`;
  }

  console.log(supportStr.value);
});

const homeObj = ref("");
Axios.post("/schoolHome/selectByStudentId", {
  studentId: JSON.parse(localStorage.getItem("sq")).studentId,
}).then((res) => {
  homeObj.value = res.data[res.data.length - 1];
});

const reflectObj = ref("");
Axios.post("/reflect/selectByStudentId", {
  studentId: JSON.parse(localStorage.getItem("sq")).studentId,
}).then((res) => {
  reflectObj.value = res.data[res.data.length - 1];
});

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
const str = ref("");
Axios.get(
  `/answer/getAll?studentId=${JSON.parse(localStorage.getItem("sq")).studentId}`
).then((res) => {
  console.log(res);
  console.log(JSON.parse(res.data[1].context)._value[0].qyestionContent);
  for (let item of res.data) {
    item["passTime"] = 0;
    item["context"] = JSON.parse(item["context"])._value;
    console.log(item);

    for (let it of item["context"]) {
      if (it["subjectivity"]) {
        it["subjectivity"] = it["subjectivity"]
          .split("\n")
          .filter((k) => k != "");
      }

      if (it.isFalse <= 2 && it.qyestionType == "主观") {
        it["isPass"] = "否";
      } else if (it.isFalse == it.isTrue && it.qyestionType != "主观") {
        it["isPass"] = "是";
        item["passTime"]++;
        it["isNone"] = true;
      } else if (it.isFalse > 2 && it.qyestionType == "主观") {
        it["isPass"] = "是";
        item["passTime"]++;
        it["isNone"] = true;
      } else {
        it["isPass"] = "否";
      }
      console.log(it);
    }

    if (item["passTime"] == item["context"].length) {
      item["pass"] = true;
    } else {
      item["pass"] = false;
    }
    console.log(item["context"]);
    for (let i = 0; i < item["context"].length; ) {
      if (item["context"][i]["isNone"]) {
        console.log(item["context"][i]);
        item["context"].splice(i, 1);
      } else {
        i++;
      }
    }

    for (let ob of item["context"]) {
      console.log(ob);
      if (ob["subjectivity"]) {
        for (let o of ob["subjectivity"]) {
          str.value += `
              <tr>
                <td colspan="2">${ob["qyestionContent"]}</td>
                <td colspan="3">${o}</td>
                <td colspan="3" >${ob["isPass"]}</td>
              </tr>
          `;
        }
      } else {
        for (let k of ob["select"]) {
          str.value += `
              <tr>
                <td  colspan="2">${ob["qyestionContent"]}</td>
                <td colspan="3">${k["value"]}</td>
                <td colspan="2">${ob["isPass"]}</td>
              </tr>
          `;
        }
      }
    }
  }

  his.value = res.data;
  console.log(his.value);
});

const exportWordTpl = () => {
  const htmlString = `<!DOCTYPE html>
                        <html lang="en">
                            <head>
                                <meta charset="UTF-8">
                                <title>Document</title>
                                <style>
                                #export-content{
                                    width: 100%;
                                    height: 100%;
                                    /* background-color: aqua; */
                                }
                                th, td {
                                    border: 1px solid black; padding: 8px; text-align: center;
                                }
                                .bold-text {
                                    font-weight: bold;
                                }
                                </style>
                            </head>
                            <body>
                              <div id="export-content">
    <h1 style="text-align: center; margin-top: 10px">个别化教育计划</h1>
    <div style="display: flex; justify-content: center">
      <span>（ 2023 年 02 月 —— 2023 年 09 月）</span>
    </div>
    <div style="display: flex; justify-content: center; margin-top: 20px">
      <table >
        <tbody>
          <tr>
            <td class="bold-text">姓名</td>
            <td>${student.studentName}</td>
            <td class="bold-text">昵称</td>
            <td>${studentB.nickname}</td>
            <td style="padding: 0">
              <table>
                <tbody>
                  <td
                    class="bold-text"
                    style="
                      border-left: none;
                      border-top: none;
                      border-bottom: none;
                    "
                  >
                    性别
                  </td>
                  <td
                    style="
                      border-left: none;
                      border-top: none;
                      border-bottom: none;
                      border-right: none;
                    "
                  >
                    ${student.studentGender}
                  </td>
                </tbody>
              </table>
            </td>
            <td style="padding: 0">
              <table style="width: 100%">
                <tbody>
                  <td
                    class="bold-text"
                    style="
                      border-left: none;
                      border-top: none;
                      border-bottom: none;
                    "
                  >
                    血型
                  </td>
                  <td
                    style="
                      border-left: none;
                      border-top: none;
                      border-bottom: none;
                      border-right: none;
                    "
                  >
                    ${studentB.bloodGroup}
                  </td>
                </tbody>
              </table>
            </td>
          </tr>
          <tr>
            <td class="bold-text">出生日期</td>
            <td>${steTime(new Date(studentB.birthday), "-")}</td>
            <td class="bold-text">年龄</td>
            <td></td>
            <td class="bold-text">班级</td>
            <td>${student.clazzName}</td>
          </tr>

          <tr>
            <td class="bold-text">身份证</td>
            <td>${studentB.cardId}</td>
            <td class="bold-text">学籍号</td>
            <td>${studentB.studentStatus}</td>
          </tr>

          <tr>
            <td class="bold-text">民族</td>
            <td>${studentB.nation}</td>
            <td class="bold-text">户籍地</td>
            <td>${p1.value}/${c1.value}/${r1.value}</td>
            <td class="bold-text">成长地</td>
            <td>${p2.value}/${c2.value}/${r2.value}</td>
          </tr>

          <tr>
            <td class="bold-text">障碍类型</td>
            <td>${student.obstacleName}</td>
            <td class="bold-text">障碍程度</td>
            <td>${studentB.obstacleDegree}</td>
            <td class="bold-text">伴随障碍类型</td>
            <td>${studentB.otherObstacleName}</td>
          </tr>

          <tr>
            <td class="bold-text" rowspan="10">生长史</td>
            <td rowspan="2">语言发展</td>
            <td colspan="4">首个词汇出现时间：</td>
          </tr>

          <tr>
            <td colspan="4">首个句子出现时间：${Growth.firstWordAppears}</td>
          </tr>
          <tr>
            <td rowspan="4">动作发展</td>
            <td colspan="4">抬头时间：${Growth.headUpTime}</td>
          </tr>
          <tr>
            <td colspan="4">独立坐时间：${Growth.independentSittingTime}</td>
          </tr>
          <tr>
            <td colspan="4">独立站时间：${Growth.independentStationTime}</td>
          </tr>

          <tr>
            <td colspan="4">独立走时间：${Growth.independentTravelTime}</td>
          </tr>
          <tr>
            <td rowspan="4">自理能力发展</td>
            <td colspan="4">学会表达小便需求的时间：${Growth.headUpTime}</td>
          </tr>
          <tr>
            <td colspan="4">独立小便时间：${Growth.urinationTime}</td>
          </tr>
          <tr>
            <td colspan="4">会表达大便需求的时间：${Growth.headUpTime}</td>
          </tr>
          <tr>
            <td colspan="4">独立大便时间：${Growth.stoolTime}</td>
          </tr>
          <tr>
            <td class="bold-text" rowspan="2">医疗史</td>
            <td colspan="5">遗传病史：${Growth.geneticHistory}</td>
          </tr>
          <tr>
            <td colspan="5">重大疾病史：${Growth.majorDiseases}</td>
          </tr>
          <tr>
            <td class="bold-text">教育史</td>
            <td colspan="5"></td>
          </tr>
          <tr>
            <td class="bold-text" rowspan="4">生理特殊情况</td>
            <td colspan="5">过敏情况：${special.irritability}</td>
          </tr>
          <tr>
            <td colspan="5">存在健康问题：${special.healthProblem
              .split(".")[0]
              .replace("[", "")
              .replace("]", "")}</td>
          </tr>
          <tr>
            <td colspan="5">用药/矫正器具：${special.pharmacy}</td>
          </tr>
          <tr>
            <td colspan="5">沟通辅具：${special.speakAssist
              .split(".")[0]
              .replace("[", "")
              .replace("]", "")}</td>
          </tr>
          <tr>
            <td class="bold-text" rowspan="11">兴趣偏好</td>
            <td colspan="5">喜欢的物品：${hobby.loveArticle}</td>
          </tr>
          <tr>
            <td colspan="5">喜欢的活动：${hobby.loveActivity}</td>
          </tr>
          <tr>
            <td colspan="5">喜欢的人物：${hobby.loveFigure}</td>
          </tr>
          <tr>
            <td colspan="5">性格的优势：${hobby.characterAdvantage}</td>
          </tr>
          <tr>
            <td colspan="5">能力和特长：${hobby.shtick}</td>
          </tr>
          <tr>
            <td colspan="5">其他：${hobby.other}</td>
          </tr>
          <tr>
            <td colspan="5">不喜欢的物品：${hobby.unLoveArticle}</td>
          </tr>
          <tr>
            <td colspan="5">不喜欢的活动：${hobby.unLoveActivity}</td>
          </tr>
          <tr>
            <td colspan="5">不喜欢的人物：${hobby.unLoveFigure}</td>
          </tr>
          <tr>
            <td colspan="5">其他因素：${hobby.otherFactors
              .split(".")[0]
              .replace("[", "")
              .replace("]", "")}</td>
          </tr>
          <tr>
            <td colspan="5">说明：${hobby.explain_}</td>
          </tr>
          <tr>
            <th class="bold-text" colspan="2">长期目标</th>
            <th class="bold-text" colspan="3">短期目标</th>
            <th class="bold-text" colspan="2">是否通过</th>
          </tr>
          ${str.value}
        </tbody>
      </table>

      
    </div>
   

  </div>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <div id="export-content6">
      <h1 style="text-align: center; margin-top: 10px">（二）、课程计划</h1>
      <div style="display: flex; justify-content: center; margin-top: 20px">
        <table style="border-collapse: collapse; width: 100%">
          <tbody id="les">
              ${lessionStr.value}
            </tbody>
        </table>
      </div>
    </div>

    <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  
 
    <div id="export-content2">
      <h1 style="text-align: center; margin-top: 10px">
        （三）、 ${specialObj.value.startYear}—${
    specialObj.value.lastYear
  }学年度第${specialObj.value.semester}学期特殊课程期末综合评估
      </h1>
      <div style="margin-left: 3px"></div>
      <p>
        学生姓名：${
          specialObj.value.studentName
        } &nbsp;&nbsp;&nbsp; 教师姓名：${specialObj.value.teacherName}
      </p>
      <div style="display: flex; justify-content: center; margin-top: 20px">
        <table style="border-collapse: collapse; width: 100%">
          <tbody>
            <tr>
              <td style="width: 30%" colspan="2">基本情况分析</td>
              <td style="width: 70%; height: 100px">${
                specialObj.value.basicArea
              }</td>
            </tr>
            <tr>
              <td style="width: 30%" colspan="2">优势与弱势分析</td>
              <td style="width: 20%; height: 100px">${
                specialObj.value.gbArea
              }</td>
            </tr>
            <tr>
              <td style="width: 10%" rowspan="4">学期特殊课程类别目标</td>
              <td style="width: 20%">身体及体能（课程名称及目标）</td>
              <td style="width: 70%; height: 100px">${
                specialObj.value.targetArea
              }</td>
            </tr>
            <tr>
              <!-- <td style="width: 10%;" >左</td> -->
              <td style="width: 20%">个性心理发展（课程名称及目标）</td>
              <td style="width: 70%; height: 100px">${
                specialObj.value.psychologyArea
              }</td>
            </tr>
            <tr>
              <!-- <td style="width: 10%;" >左</td> -->
              <td style="width: 20%">优势特长发展（课程名称及目标）</td>
              <td style="width: 70%; height: 100px">${
                specialObj.value.advantageArea
              }</td>
            </tr>
            <tr>
              <!-- <td style="width: 10%;" >左</td> -->
              <td style="width: 20%">缺陷补偿康复矫治（课程名称及目标）</td>
              <td style="width: 70%; height: 100px">${
                specialObj.value.defectArea
              }</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

    <br/>

 
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>


    <div id="export-content1">
      <h1 style="text-align: center; margin-top: 10px">
        （四）、 ${planObj.value.startYear}—${planObj.value.lastYear}学年度第${
    planObj.value.semester
  }学期特殊课程期末综合评估
      </h1>
      <div style="margin-left: 3px"></div>
      <div style="display: flex; justify-content: center; margin-top: 20px">
        <table style="border-collapse: collapse; width: 100%">
          <tbody>
            <tr>
              <td style="width: 12%" rowspan="2">身高</td>
              <td style="width: 12%" rowspan="2">体重</td>
              <td style="width: 12%" colspan="2">视力</td>
              <!-- <td style="width: 12%;"></td> -->
              <td style="width: 12%" colspan="4">体质健康标准</td>
              <!-- <td style="width: 12%;"></td>
                          <td style="width: 12%;"></td>
                          <td style="width: 12%;"></td> -->
            </tr>
            <tr>
              <td style="width: 12%">左</td>
              <td style="width: 12%">右</td>
              <td style="width: 12%">优</td>
              <td style="width: 12%">良</td>
              <td style="width: 12%">及格</td>
              <td style="width: 12%">不及格</td>
            </tr>
            <tr>
              <td style="width: 12%">${planObj.value.height}</td>
              <td style="width: 12%">${planObj.value.weight}</td>
              <td style="width: 12%">${planObj.value.leftEyes}</td>
              <td style="width: 12%">${planObj.value.rightEyes}</td>
              ${planStr.value}
            </tr>
            <tr>
              <td style="width: 12%" colspan="2">感知觉</td>
              <td style="width: 12%" colspan="6">${
                planObj.value.perception
              }</td>
            </tr>
            <tr>
              <td style="width: 12%" colspan="2">粗大动作,精细动作</td>
              <td style="width: 12%" colspan="6">${planObj.value.action}</td>
            </tr>
            <tr>
              <td style="width: 12%" colspan="2">语言与沟通</td>
              <td style="width: 12%" colspan="6">${planObj.value.language}</td>
            </tr>
            <tr>
              <td style="width: 12%" colspan="2">认 知</td>
              <td style="width: 12%" colspan="6">${planObj.value.cognition}</td>
            </tr>
            <tr>
              <td style="width: 12%" colspan="2">社会交往</td>
              <td style="width: 12%" colspan="6">${planObj.value.socialize}</td>
            </tr>
            <tr>
              <td style="width: 12%" colspan="2">生活自理</td>
              <td style="width: 12%" colspan="6">${planObj.value.life}</td>
            </tr>
            <tr>
              <td style="width: 12%" colspan="2">情绪与行为</td>
              <td style="width: 12%" colspan="6">${planObj.value.emotion}</td>
            </tr>
            <tr>
              <td style="width: 12%; height: 150px" colspan="1">
                优势的发展状况
              </td>
              <td style="width: 12%" colspan="7">${planObj.value.advantage}</td>
            </tr>
            <tr>
              <td style="width: 12%; height: 150px" colspan="1">
                缺陷障碍的矫治与康复状况
              </td>
              <td style="width: 12%" colspan="7">${planObj.value.defect}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>


    <br/>
 
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
 

  <div id="export-content3">
      <h1 style="text-align: center; margin-top: 10px">
        （五）、 ${homeObj.value.startYear}—${homeObj.value.lastYear}学年度第${
    homeObj.value.semester
  }学期家校联系卡
      </h1>
      <div style="margin-left: 3px">
        <span
          >学生姓名：${homeObj.value.studentName} 资源教师姓名：${
    homeObj.value.teacherName
  }
        </span>
      </div>
      <div style="display: flex; justify-content: center; margin-top: 20px">
        <table style="border-collapse: collapse; width: 100%">
          <tbody>
            <tr>
              <td style="width: 30%; height: 400px" rowspan="2">教 师</td>
              <td style="width: 70%; height: 200px">
                出现的情况：${homeObj.value.situation}
              </td>
            </tr>

            <tr>
              <td style="width: 70%; height: 200px">
                需要协助的事项：${homeObj.value.assist}
              </td>
            </tr>
            <tr>
              <td style="width: 30%; height: 200px">家长反馈</td>
              <td style="width: 70%">${homeObj.value.feedback}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>

  <div id="export-content4">
      <h1 style="text-align: center; margin-top: 10px">
        （六）、 ${reflectObj.value.startYear}—${
    reflectObj.value.lastYear
  }学年度第${reflectObj.value.semester}学期教育教学的反思
      </h1>
      <div style="margin-left: 3px">
        <span
          >学生姓名： ${reflectObj.value.studentName} 资源教师姓名：
          ${reflectObj.value.teacherName}
        </span>
      </div>
      <div style="display: flex; justify-content: center; margin-top: 20px">
        <table style="border-collapse: collapse; width: 100%">
          <tbody>
            <tr>
              <td style="width: 30%; height: 200px">成功之处 及 原因</td>
              <td style="width: 70%">${reflectObj.value.success}</td>
            </tr>
            <tr>
              <td style="width: 30%; height: 200px">存在的问题 与 困惑</td>
              <td style="width: 70%">${reflectObj.value.problem}</td>
            </tr>
            <tr>
              <td style="width: 30%; height: 200px">改进措施 及 建议</td>
              <td style="width: 70%">${reflectObj.value.improve}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>

  <div id="export-content5">
      <h1 style="text-align: center; margin-top: 10px">（七）、支持服务</h1>
      <div style="display: flex; justify-content: center; margin-top: 20px">
        <table style="border-collapse: collapse; width: 100%">
          <tbody id="sup">
              ${supportStr.value}
            </tbody>
        </table>
      </div>
    </div>


    <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/><br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>

    <div style="display: flex; justify-content: center; margin-top: 20px">
      <table style="border-collapse: collapse">
        <tbody>
          <tr>
            <th class="bold-text" colspan="7">同意签名盖章</th>
          </tr>
          <tr>
            <th class="bold-text" colspan="7">我已经详阅以上所列之教育计划，并且同意此修改后个别教育计划之执行。（请在下列方格中签名）</th>
          </tr>
          <tr>
            <td class="bold-text">行政人员</td>
            <td style="width:100px;"></td>
            <td class="bold-text">班主任</td>
            <td style="width:100px;"></td>
            <td class="bold-text">家长/监护人</td>
            <td style="width:100px;"></td>
          </tr>
          <tr>
            <td class="bold-text">巡回指导教师</td>
            <td></td>
            <td class="bold-text">资源教师</td>
            <td></td>
            <td class="bold-text">康复师</td>
            <td></td>
          </tr>
        </tbody>
      </table>
      </div>
</body>
</html>`;
  const fileData = asBlob(htmlString).then((data) => {
    saveAs(data, "file.docx");
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
  <div style="width: 100%; display: flex; justify-content: center">
    <div style="width: 96%; background-color: #fff">
      <el-button
        type="primary"
        style="margin-left: 20px; margin-bottom: 20px; margin-top: 10px"
        @click="exportWordTpl()"
        >导出word</el-button
      >
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
          <span style="color: #8c8c8c">出生日期：</span
          >{{ steTime(new Date(studentB.birthday), "-") }}
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
          <span style="color: #8c8c8c">身份证号：</span>{{ studentB.cardId }}
        </p>
        <p style="width: 24%; height: 20px; color: #000; font-size: 14px">
          <span style="color: #8c8c8c">学籍号：</span
          >{{ studentB.studentStatus }}
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
          >{{
            special.healthProblem
              .split(".")[0]
              .replace("[", "")
              .replace("]", "")
          }}
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
          >{{
            special.speakAssist.split(".")[0].replace("[", "").replace("]", "")
          }}
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
          <span style="color: #8c8c8c">其他因素：</span
          >{{
            hobby.otherFactors.split(".")[0].replace("[", "").replace("]", "")
          }}
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
      <!-- <el-table
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
      </el-table> -->

      <!-- <h3 style="margin-left: 20px; margin-top: 30px">特殊儿童评估干预</h3>
      <div style="margin-top: 10px; color: #8c8c8c; margin-bottom: 20px">
        <p style="margin-left: 20px">无</p>
      </div> -->
      <h3 style="margin-left: 20px; margin-top: 30px; margin-bottom: 20px">
        志培学校国家课程标准评估
      </h3>
      <div class="demo-collapse">
        <el-collapse
          v-model="activeNames"
          @change="handleChange"
          style="border: 1px solid #ccc; border-radius: 10px"
        >
          <div v-for="(item, index) in his" :key="index">
            <el-collapse-item
              :title="item.title"
              :name="index + 1"
              style="
                padding-left: 20px;
                font-weight: bold;
                border-bottom: 1px solid #f8f8f8;
              "
              v-if="!item.pass"
            >
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
                  <template #default="scope">
                    <p v-if="scope.row.isPass == '否'">
                      {{ scope.row.qyestionContent }}
                    </p>
                  </template>
                </el-table-column>
                <el-table-column label="短期目标" width="auto" min-width="70%">
                  <template #default="scope">
                    <div v-if="scope.row.isPass == '否'">
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
                    </div>
                  </template>
                </el-table-column>
                <el-table-column label="是否通过" width="auto" min-width="15%">
                  <template #default="scope"
                    ><p v-if="scope.row.isPass == '否'">
                      {{ scope.row.isPass }}
                    </p></template
                  >
                </el-table-column>
              </el-table>
            </el-collapse-item>
          </div>
        </el-collapse>
      </div>
      <!-- <h3 style="margin-left: 20px; margin-top: 30px; margin-bottom: 20px">
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
      </div> -->
    </div>
  </div>
</template>

<style scoped></style>
