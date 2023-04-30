<template>
  <div id="export-content">
    <h1 style="text-align: center; margin-top: 10px">个别化教育计划</h1>
    <div style="display: flex; justify-content: center">
      <span>（ 2023 年 02 月 —— 2023 年 09 月）</span>
    </div>
    <div style="display: flex; justify-content: center; margin-top: 20px">
      <table style="border-collapse: collapse">
        <tbody>
          <tr>
            <td class="bold-text">姓名</td>
            <td>张三</td>
            <td class="bold-text">昵称</td>
            <td>小三</td>
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
                    男
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
                    O型
                  </td>
                </tbody>
              </table>
            </td>
          </tr>
          <tr>
            <td class="bold-text">出生日期</td>
            <td>2023-02-16</td>
            <td class="bold-text">年龄</td>
            <td>2个月</td>
            <td class="bold-text">班级</td>
            <td>六年级启智8班</td>
          </tr>

          <tr>
            <td class="bold-text">民族</td>
            <td>汉</td>
            <td class="bold-text">户籍地</td>
            <td>江苏</td>
            <td class="bold-text">成长地</td>
            <td>浙江</td>
          </tr>

          <tr>
            <td class="bold-text">障碍类型</td>
            <td>智力障碍</td>
            <td class="bold-text">障碍程度</td>
            <td>中级</td>
            <td class="bold-text">伴随障碍类型</td>
            <td>脑瘫</td>
          </tr>

          <tr>
            <td class="bold-text" rowspan="10">生长史</td>
            <td rowspan="2">语言发展</td>
            <td colspan="4">首个词汇出现时间：</td>
          </tr>

          <tr>
            <td colspan="4">首个句子出现时间：</td>
          </tr>
          <tr>
            <td rowspan="4">动作发展</td>
            <td colspan="4">抬头时间：</td>
          </tr>
          <tr>
            <td colspan="4">独立坐时间：</td>
          </tr>
          <tr>
            <td colspan="4">独立站时间：</td>
          </tr>

          <tr>
            <td colspan="4">独立走时间：</td>
          </tr>
          <tr>
            <td rowspan="4">自理能力发展</td>
            <td colspan="4">学会表达小便需求的时间：</td>
          </tr>
          <tr>
            <td colspan="4">独立小便时间：</td>
          </tr>
          <tr>
            <td colspan="4">会表达大便需求的时间：</td>
          </tr>
          <tr>
            <td colspan="4">独立大便时间：</td>
          </tr>
          <tr>
            <td class="bold-text" rowspan="2">医疗史</td>
            <td colspan="5">遗传病史：</td>
          </tr>
          <tr>
            <td colspan="5">重大疾病史：</td>
          </tr>
          <tr>
            <td class="bold-text">教育史</td>
            <td colspan="5"></td>
          </tr>
          <tr>
            <td class="bold-text" rowspan="4">生理特殊情况</td>
            <td colspan="5">过敏情况：</td>
          </tr>
          <tr>
            <td colspan="5">存在健康问题：</td>
          </tr>
          <tr>
            <td colspan="5">用药/矫正器具：</td>
          </tr>
          <tr>
            <td colspan="5">沟通辅具：</td>
          </tr>
          <tr>
            <td class="bold-text" rowspan="11">兴趣偏好</td>
            <td colspan="5">喜欢的物品：</td>
          </tr>
          <tr>
            <td colspan="5">喜欢的活动：</td>
          </tr>
          <tr>
            <td colspan="5">喜欢的人物：</td>
          </tr>
          <tr>
            <td colspan="5">性格的优势：</td>
          </tr>
          <tr>
            <td colspan="5">能力和特长：</td>
          </tr>
          <tr>
            <td colspan="5">其他：</td>
          </tr>
          <tr>
            <td colspan="5">不喜欢的物品：</td>
          </tr>
          <tr>
            <td colspan="5">不喜欢的活动：</td>
          </tr>
          <tr>
            <td colspan="5">不喜欢的人物：</td>
          </tr>
          <tr>
            <td colspan="5">其他因素：</td>
          </tr>
          <tr>
            <td colspan="5">说明：</td>
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
import { getCurrentInstance } from "vue";
const cxt = getCurrentInstance(); //相当于Vue2中的this
const bus = cxt.appContext.config.globalProperties.$bus;

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
