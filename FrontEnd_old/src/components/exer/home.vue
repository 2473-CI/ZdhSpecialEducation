<template>
  <div id="export-content">
    <h1 style="text-align: center; margin-top: 10px">
      {{ wordForm2.startYear }}—{{ wordForm2.lastYear }}学年度第{{
        wordForm2.semester
      }}学期家校联系卡
    </h1>
    <div style="margin-left: 3px">
      <span
        >学生姓名：{{ wordForm2.studentName }} 资源教师姓名：{{
          wordForm2.teacherName
        }}
      </span>
    </div>
    <div style="display: flex; justify-content: center; margin-top: 20px">
      <table style="border-collapse: collapse; width: 100%">
        <tbody>
          <tr>
            <td style="width: 30%; height: 400px" rowspan="2">教 师</td>
            <td style="width: 70%; height: 200px">
              出现的情况：{{ wordForm2.situation }}
            </td>
          </tr>

          <tr>
            <!-- <td style="width: 30%;height: 200px;">存在的问题 与 困惑</td> -->
            <td style="width: 70%; height: 200px">
              需要协助的事项：{{ wordForm2.assist }}
            </td>
          </tr>
          <tr>
            <td style="width: 30%; height: 200px">家长反馈</td>
            <td style="width: 70%">{{ wordForm2.feedback }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
  <button @click="exportWordTpl2()">导出 Word 文档</button>
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
const wordForm2 = reactive({});
onMounted(() => {
  bus.on("homeMessage", (form) => {
    for (let item of Object.keys(form)) {
      wordForm2[item] = form[item];
    }
    nextTick(() => {
      exportWordTpl2();
    });
  });
});

onBeforeUnmount(() => {
  bus.off("homeMessage");
});

const exportWordTpl2 = () => {
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
