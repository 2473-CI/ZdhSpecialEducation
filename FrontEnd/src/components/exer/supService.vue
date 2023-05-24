<template>
  <div id="export-content">
    <h1 style="text-align: center; margin-top: 10px">支持服务</h1>
    <div style="display: flex; justify-content: center; margin-top: 20px">
      <table style="border-collapse: collapse; width: 100%">
        <tbody>
          <tr>
            <th class="bold-text" colspan="3">服务内容</th>
            <th class="bold-text" colspan="3">服务内容描述</th>
            <th class="bold-text" colspan="3">负责单位（人）</th>
          </tr>
          <tr v-for="(item, index) in wordList" :key="index">
            <td colspan="3">{{ item.content }}</td>
            <td colspan="3">{{ item.describe }}</td>
            <td colspan="3">{{ item.unit }}</td>
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
