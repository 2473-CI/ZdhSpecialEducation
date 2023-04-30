<template>
  <div id="export-content">
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
  <button @click="exportWordTpl()">导出 Word 文档</button>
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
      exportWordTpl();
    });
    console.log(wordForm);
  });
});
onBeforeUnmount(() => {
  bus.off("printMessage");
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
                            ${
                              document.getElementById("export-content")
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
