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
});
onBeforeUnmount(() => {
  bus.off("printMessage");
  bus.off("firstMessage");
  bus.off("homeMessage");
  bus.off("reflectMessage");
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
