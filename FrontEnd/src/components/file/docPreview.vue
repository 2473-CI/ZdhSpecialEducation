<template>
  <vue-office-docx
    :src="`http://47.98.50.217:82` + path"
    @rendered="rendered"
  />
</template>

<script setup>
//引入VueOfficeDocx组件
import VueOfficeDocx from "@vue-office/docx";
import axios from "axios";
import { toRefs, defineProps, reactive } from "vue";
const props = defineProps({
  //子组件接收父组件传递过来的值
  path: String,
});
const docxFile = reactive(null);
//使用父组件传递过来的值
const { path } = toRefs(props);
path.value = path.value.replace("/file", "/file/word");
// path.value = "http://47.98.50.217:82" + path.value
console.log(props);
// path.value = "http://192.168.10.142:82/file/attachment/download?filename=app.doc";
// axios
//   .get("http://192.168.10.142:82/file/attachment/download?filename=app.doc")
//   .then((response) => {
//     console.log(response);
//     docxFile = new Blob([response.data], {
//       type: "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
//     });
//   });
// export default {
//   components: {
//     VueOfficeDocx,
//   },
//   data() {
//     return {
//       docx: "http://static.shanhuxueyuan.com/test6.docx", //设置文档地址
//     };
//   },
//   methods: {
//     rendered() {
//       console.log("渲染实现");
//     },
//   },
// };
</script>
