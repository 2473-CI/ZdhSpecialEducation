<template>
  <div v-show="false">
    <div id="export-content1">
      <h1 style="text-align: center; margin-top: 10px">
        {{ wordForm.startYear }}—{{ wordForm.lastYear }}学年度第{{
          wordForm.semester
        }}学期特殊课程期末综合评估
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
              <td style="width: 12%">{{ wordForm.height }}</td>
              <td style="width: 12%">{{ wordForm.weight }}</td>
              <td style="width: 12%">{{ wordForm.leftEyes }}</td>
              <td style="width: 12%">{{ wordForm.rightEyes }}</td>
              <td style="width: 12%" v-show="t1">Y</td>
              <td style="width: 12%" v-show="t2">Y</td>
              <td style="width: 12%" v-show="t3">Y</td>
              <td style="width: 12%" v-show="t4">Y</td>
            </tr>
            <tr>
              <td style="width: 12%" colspan="2">感知觉</td>
              <td style="width: 12%" colspan="6">{{ wordForm.perception }}</td>
            </tr>
            <tr>
              <td style="width: 12%" colspan="2">粗大动作,精细动作</td>
              <td style="width: 12%" colspan="6">{{ wordForm.action }}</td>
            </tr>
            <tr>
              <td style="width: 12%" colspan="2">语言与沟通</td>
              <td style="width: 12%" colspan="6">{{ wordForm.language }}</td>
            </tr>
            <tr>
              <td style="width: 12%" colspan="2">认 知</td>
              <td style="width: 12%" colspan="6">{{ wordForm.cognition }}</td>
            </tr>
            <tr>
              <td style="width: 12%" colspan="2">社会交往</td>
              <td style="width: 12%" colspan="6">{{ wordForm.socialize }}</td>
            </tr>
            <tr>
              <td style="width: 12%" colspan="2">生活自理</td>
              <td style="width: 12%" colspan="6">{{ wordForm.life }}</td>
            </tr>
            <tr>
              <td style="width: 12%" colspan="2">情绪与行为</td>
              <td style="width: 12%" colspan="6">{{ wordForm.emotion }}</td>
            </tr>
            <tr>
              <td style="width: 12%; height: 150px" colspan="1">
                优势的发展状况
              </td>
              <td style="width: 12%" colspan="7">{{ wordForm.advantage }}</td>
            </tr>
            <tr>
              <td style="width: 12%; height: 150px" colspan="1">
                缺陷障碍的矫治与康复状况
              </td>
              <td style="width: 12%" colspan="7">{{ wordForm.defect }}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
    <button @click="planExportWordTpl()">导出 Word 文档</button>

    <div id="export-content2">
      <h1 style="text-align: center; margin-top: 10px">
        {{ w2.startYear }}—{{ w2.lastYear }}学年度第{{
          w2.semester
        }}学期特殊课程期末综合评估
      </h1>
      <div style="margin-left: 3px"></div>
      <p>
        学生姓名：{{ w2.studentName }} &nbsp;&nbsp;&nbsp; 教师姓名：{{
          w2.teacherName
        }}
      </p>
      <div style="display: flex; justify-content: center; margin-top: 20px">
        <table style="border-collapse: collapse; width: 100%">
          <tbody>
            <tr>
              <td style="width: 30%" colspan="2">基本情况分析</td>
              <td style="width: 70%; height: 100px">{{ w2.basicArea }}</td>
            </tr>
            <tr>
              <td style="width: 30%" colspan="2">优势与弱势分析</td>
              <td style="width: 20%; height: 100px">{{ w2.gbArea }}</td>
            </tr>
            <tr>
              <td style="width: 10%" rowspan="4">学期特殊课程类别目标</td>
              <td style="width: 20%">身体及体能（课程名称及目标）</td>
              <td style="width: 70%; height: 100px">{{ w2.targetArea }}</td>
            </tr>
            <tr>
              <!-- <td style="width: 10%;" >左</td> -->
              <td style="width: 20%">个性心理发展（课程名称及目标）</td>
              <td style="width: 70%; height: 100px">{{ w2.psychologyArea }}</td>
            </tr>
            <tr>
              <!-- <td style="width: 10%;" >左</td> -->
              <td style="width: 20%">优势特长发展（课程名称及目标）</td>
              <td style="width: 70%; height: 100px">{{ w2.advantageArea }}</td>
            </tr>
            <tr>
              <!-- <td style="width: 10%;" >左</td> -->
              <td style="width: 20%">缺陷补偿康复矫治（课程名称及目标）</td>
              <td style="width: 70%; height: 100px">{{ w2.defectArea }}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
    <button @click="firstExportWordTpl()">导出 Word 文档</button>

    <div id="export-content3">
      <h1 style="text-align: center; margin-top: 10px">
        {{ w3.startYear }}—{{ w3.lastYear }}学年度第{{
          w3.semester
        }}学期家校联系卡
      </h1>
      <div style="margin-left: 3px">
        <span
          >学生姓名：{{ w3.studentName }} 资源教师姓名：{{ w3.teacherName }}
        </span>
      </div>
      <div style="display: flex; justify-content: center; margin-top: 20px">
        <table style="border-collapse: collapse; width: 100%">
          <tbody>
            <tr>
              <td style="width: 30%; height: 400px" rowspan="2">教 师</td>
              <td style="width: 70%; height: 200px">
                出现的情况：{{ w3.situation }}
              </td>
            </tr>

            <tr>
              <!-- <td style="width: 30%;height: 200px;">存在的问题 与 困惑</td> -->
              <td style="width: 70%; height: 200px">
                需要协助的事项：{{ w3.assist }}
              </td>
            </tr>
            <tr>
              <td style="width: 30%; height: 200px">家长反馈</td>
              <td style="width: 70%">{{ w3.feedback }}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
    <button @click="connectExportWordTpl()">导出 Word 文档</button>

    <div id="export-content4">
      <h1 style="text-align: center; margin-top: 10px">
        {{ w4.startYear }}—{{ w4.lastYear }}学年度第{{
          w4.semester
        }}学期教育教学的反思
      </h1>
      <div style="margin-left: 3px">
        <span
          >学生姓名： {{ w4.studentName }} 资源教师姓名：
          {{ w4.teacherName }}
        </span>
      </div>
      <div style="display: flex; justify-content: center; margin-top: 20px">
        <table style="border-collapse: collapse; width: 100%">
          <tbody>
            <tr>
              <td style="width: 30%; height: 200px">成功之处 及 原因</td>
              <td style="width: 70%">{{ w4.success }}</td>
            </tr>
            <tr>
              <td style="width: 30%; height: 200px">存在的问题 与 困惑</td>
              <td style="width: 70%">{{ w4.problem }}</td>
            </tr>
            <tr>
              <td style="width: 30%; height: 200px">改进措施 及 建议</td>
              <td style="width: 70%">{{ w4.improve }}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
    <button @click="lastExportWordTpl()">导出 Word 文档</button>

    <div id="export-content5">
      <h1 style="text-align: center; margin-top: 10px">支持服务</h1>
      <div style="display: flex; justify-content: center; margin-top: 20px">
        <table style="border-collapse: collapse; width: 100%">
          <tbody id="sup"></tbody>
        </table>
      </div>
    </div>
    <button @click="supexportWordTpl2()">导出 Word 文档</button>

    <div id="export-content6">
      <h1 style="text-align: center; margin-top: 10px">课程计划</h1>
      <div style="display: flex; justify-content: center; margin-top: 20px">
        <table style="border-collapse: collapse; width: 100%">
          <tbody id="les"></tbody>
        </table>
      </div>
    </div>
    <button @click="lessionexportWordTpl2()">导出 Word 文档</button>
  </div>
</template>

<script setup>
import { asBlob } from "html-docx-js-typescript";
import { saveAs } from "file-saver";
import {
  ref,
  getCurrentInstance,
  onMounted,
  reactive,
  toRefs,
  defineProps,
  onBeforeUnmount,
  nextTick,
} from "vue";

const cxt = getCurrentInstance();
const bus = cxt.appContext.config.globalProperties.$bus;
const wordForm = reactive({});
const w2 = reactive({});
const w3 = reactive({});
const w4 = reactive({});

const t1 = ref(false);
const t2 = ref(false);
const t3 = ref(false);
const t4 = ref(false);

onMounted(() => {
  bus.on("printMessage", (form) => {
    for (let item of Object.keys(form)) {
      wordForm[item] = form[item];
    }
    if (wordForm["radio"] == "优") {
      t1.value = true;
    } else if (wordForm["radio"] == "良") {
      t2.value = true;
    } else if (wordForm["radio"] == "及格") {
      t3.value = true;
    } else if (wordForm["radio"] == "不及格") {
      t4.value = true;
    }
    nextTick(() => {
      planExportWordTpl();
    });
    console.log(wordForm);
  });
  bus.on("firstMessage", (form2) => {
    for (let item of Object.keys(form2)) {
      w2[item] = form2[item];
    }
    nextTick(() => {
      firstExportWordTpl();
    });
  });

  bus.on("homeMessage", (form3) => {
    for (let item of Object.keys(form3)) {
      w3[item] = form3[item];
    }
    nextTick(() => {
      connectExportWordTpl();
    });
  });

  bus.on("reflectMessage", (form4) => {
    for (let item of Object.keys(form4)) {
      w4[item] = form4[item];
    }
    nextTick(() => {
      lastExportWordTpl();
    });
  });

  const wordList = ref([]);
  bus.on("supMessage", (list) => {
    wordList.value = list["_rawValue"];
    console.log(wordList.value);
    let str = `
            <tr>
              <th class="bold-text" colspan="3">服务内容</th>
              <th class="bold-text" colspan="3">服务内容描述</th>
              <th class="bold-text" colspan="3">负责单位（人）</th>
            </tr>`;
    for (let item of wordList.value) {
      str += `<tr>
              <td colspan="3">${item.content}</td>
              <td colspan="3">${item.describe}</td>
              <td colspan="3">${item.unit}</td>
            </tr>`;
    }

    document.getElementById("sup").innerHTML = str;
    nextTick(() => {
      supexportWordTpl2();
    });
  });

  const lessionList = reactive({
    schedule: "",
    time: "",
    title: "",
  });
  bus.on("lessionMessage", (list) => {
    lessionList.schedule = list[0].schedule;
    lessionList.time = list[0].time;
    lessionList.title = list[0].title;
    console.log(lessionList);

    let str = ` <tr>
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
    document.getElementById("les").innerHTML = str;
    nextTick(() => {
      lessionexportWordTpl2();
    });
  });
});
onBeforeUnmount(() => {
  bus.off("printMessage");
  bus.off("firstMessage");
  bus.off("homeMessage");
  bus.off("reflectMessage");
  bus.off("supMessage");
  bus.off("lessionManage");
});

const planExportWordTpl = () => {
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
                              ${
                                document.getElementById("export-content1")
                                  .innerHTML
                              }
                              </body>
                          </html>`;
  const fileData = asBlob(htmlString).then((data) => {
    saveAs(data, "file.docx");
  });
};

const firstExportWordTpl = () => {
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
                            ${
                              document.getElementById("export-content2")
                                .innerHTML
                            }
                            </body>
                        </html>`;
  const fileData = asBlob(htmlString).then((data) => {
    saveAs(data, "file.docx");
  });
};

const connectExportWordTpl = () => {
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
                            ${
                              document.getElementById("export-content3")
                                .innerHTML
                            }
                            </body>
                        </html>`;
  const fileData = asBlob(htmlString).then((data) => {
    saveAs(data, "file.docx");
  });
};

const lastExportWordTpl = () => {
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
                            ${
                              document.getElementById("export-content4")
                                .innerHTML
                            }
                            </body>
                        </html>`;
  const fileData = asBlob(htmlString).then((data) => {
    saveAs(data, "file.docx");
  });
};

const supexportWordTpl2 = () => {
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
                            ${
                              document.getElementById("export-content5")
                                .innerHTML
                            }
                            </body>
                        </html>`;
  const fileData = asBlob(htmlString).then((data) => {
    saveAs(data, "file.docx");
  });
};

const lessionexportWordTpl2 = () => {
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
                            ${
                              document.getElementById("export-content6")
                                .innerHTML
                            }
                            </body>
                        </html>`;
  const fileData = asBlob(htmlString).then((data) => {
    saveAs(data, "file.docx");
  });
};
</script>

<style scoped>
#export-content {
  width: 100%;
  height: 100%;
  /* background-color: aqua; */
}
th,
td {
  border: 1px solid black;
  padding: 8px;
  text-align: center;
}

.bold-text {
  font-weight: bold;
}
</style>
