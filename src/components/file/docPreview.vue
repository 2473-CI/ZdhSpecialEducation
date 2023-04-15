<template>
  <vue-office-docx :src="docx" @rendered="rendered" />
</template>

<script>
//引入VueOfficeDocx组件
import VueOfficeDocx from "@vue-office/docx";

export default {
  components: {
    VueOfficeDocx,
  },
  data() {
    return {
      docx: "http://static.shanhuxueyuan.com/test6.docx", //设置文档地址
    };
  },
  methods: {
    rendered() {
      console.log("渲染实现");
    },
  },
};
</script>
