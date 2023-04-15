<template>
  <vue-office-excel :src="excel" @rendered="rendered" />
</template>

<script>
//引入VueOfficeExcel组件
import VueOfficeExcel from "@vue-office/excel";
//引入相干款式
import "@vue-office/excel/lib/index.css";

export default {
  props: ["path"],
  components: {
    VueOfficeExcel,
  },
  data() {
    return {
      excel:
        "/file/download?filename=application-vnd.ms-excel-1681279952460out (7).xls", //设置文档地址
    };
  },
  methods: {
    rendered() {
      console.log(props);
    },
  },
};
</script>
