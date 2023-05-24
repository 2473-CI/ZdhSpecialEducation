<template>
  <div id="export-content">
    <div style="display: flex; justify-content: center; margin-top: 20px">
      <table style="border-collapse: collapse; width: 100%">
        <tbody>
          <tr>
            <th class="bold-text" colspan="7">课程表</th>
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
              <p>11:00~11:30</p>
            </td>
            <td>1</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td>上午</td>
            <td>2</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td>上午</td>
            <td>3</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td>上午</td>
            <td>4</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td></td>
          </tr>
          <tr>
            <td>下午</td>
            <td>5</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>

          <tr>
            <td>下午</td>
            <td>6</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td>下午</td>
            <td>7</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
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
const wordList = ref([]);
onMounted(() => {
  bus.on("supMessage", (list) => {
    wordList.value = list;
    nextTick(() => {
      exportWordTpl2();
    });
  });
});
console.log(bus);
onBeforeUnmount(() => {
  bus.off("supMessage");
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
