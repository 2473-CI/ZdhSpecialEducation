<template>
  <div id="export-content">
    <h1 style="text-align: center; margin-top: 10px">
      Xxxx—xxxx学年度第xx学期特殊课程期末综合评估
    </h1>
    <div style="margin-left: 3px"></div>
    <div style="display: flex; justify-content: center; margin-top: 20px">
      <table style="border-collapse: collapse; width: 100%">
        <tbody>
          <tr>
            <td style="width: 30%" colspan="2">基本情况分析</td>
            <td style="width: 70%; height: 100px"></td>
          </tr>
          <tr>
            <td style="width: 30%" colspan="2">优势与弱势分析</td>
            <td style="width: 20%; height: 100px"></td>
          </tr>
          <tr>
            <td style="width: 10%" rowspan="4">学期特殊课程类别目标</td>
            <td style="width: 20%">身体及体能（课程名称及目标）</td>
            <td style="width: 70%; height: 100px"></td>
          </tr>
          <tr>
            <!-- <td style="width: 10%;" >左</td> -->
            <td style="width: 20%">个性心理发展（课程名称及目标）</td>
            <td style="width: 70%; height: 100px"></td>
          </tr>
          <tr>
            <!-- <td style="width: 10%;" >左</td> -->
            <td style="width: 20%">优势特长发展（课程名称及目标）</td>
            <td style="width: 70%; height: 100px"></td>
          </tr>
          <tr>
            <!-- <td style="width: 10%;" >左</td> -->
            <td style="width: 20%">缺陷补偿康复矫治（课程名称及目标）</td>
            <td style="width: 70%; height: 100px"></td>
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
