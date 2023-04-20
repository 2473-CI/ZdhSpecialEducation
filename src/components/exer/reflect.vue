<template>
  <div id="export-content">
    <h1 style="text-align: center; margin-top: 10px">
      {{ wordForm.startYear }}—{{ wordForm.lastYear }}学年度第{{
        wordForm.semester
      }}学期教育教学的反思
    </h1>
    <div style="margin-left: 3px">
      <span
        >学生姓名： {{ wordForm.studentName }} 资源教师姓名：
        {{ wordForm.teacherName }}
      </span>
    </div>
    <div style="display: flex; justify-content: center; margin-top: 20px">
      <table style="border-collapse: collapse; width: 100%">
        <tbody>
          <tr>
            <td style="width: 30%; height: 200px">成功之处 及 原因</td>
            <td style="width: 70%">{{ wordForm.success }}</td>
          </tr>
          <tr>
            <td style="width: 30%; height: 200px">存在的问题 与 困惑</td>
            <td style="width: 70%">{{ wordForm.problem }}</td>
          </tr>
          <tr>
            <td style="width: 30%; height: 200px">改进措施 及 建议</td>
            <td style="width: 70%">{{ wordForm.improve }}</td>
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

onMounted(() => {
  bus.on("reflectMessage", (form) => {
    for (let item of Object.keys(form)) {
      wordForm[item] = form[item];
    }
    nextTick(() => {
      exportWordTpl();
    });
  });
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
