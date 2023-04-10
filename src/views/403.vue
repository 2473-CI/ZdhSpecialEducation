<script setup>
import { ref } from "vue";
import * as XLSX from "xlsx";
// const list = [
//   { nama: "A", id: 1 },
//   { nama: "B", id: 2 },
//   { nama: "C", id: 3 },
//   { nama: "D", id: 4 },
//   { nama: "E", id: 5 },
//   { nama: "F", id: 6 },
// ];
// const m = ref("D");

const tableData = [
  {
    date: "2016-05-03",
    name: "Tom",
    address: "No. 189, Grove St, Los Angeles",
  },
  {
    date: "2016-05-02",
    name: "Tom",
    address: "No. 189, Grove St, Los Angeles",
  },
  {
    date: "2016-05-04",
    name: "Tom",
    address: "No. 189, Grove St, Los Angeles",
  },
  {
    date: "2016-05-01",
    name: "Tom",
    address: "No. 189, Grove St, Los Angeles",
  },
];

function exportExcel() {
  let arrAll = [
    [1, 2, 3],
    [3, 3, 3],
  ];
  let header = [...document.querySelectorAll(".el-table__header th .cell")].map(
    (th) => th.textContent
  );

  const workbook = XLSX.utils.book_new();

  const worksheetName = "SheetJS";
  const worksheetData = [header, arrAll];
  const worksheet = XLSX.utils.aoa_to_sheet(worksheetData);

  XLSX.utils.book_append_sheet(workbook, worksheet, worksheetName);
  XLSX.writeFile(workbook, "out.xls");
}
</script>

<template>
  <div class="box">
    <el-table :data="tableData" border style="width: 100%">
      <el-table-column prop="date" label="Date" width="180" />
      <el-table-column prop="name" label="Name" width="180" />
      <el-table-column prop="address" label="Address" />
    </el-table>
  </div>
  <button @click="exportExcel">1222</button>
</template>

<style scoped>
/* .box {
  padding: 48px 32px;
  box-sizing: border-box;
} */
</style>
