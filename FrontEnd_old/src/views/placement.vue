<script setup>
import { ref, reactive } from "vue";
import { ElMessage, ElMessageBox } from "element-plus";

import Axios from "../request/index";

const loading = ref(false);
const dialogFormVisible = ref(false);

function steTime(time, style) {
  var N = time.getFullYear(); //年
  var Y =
    time.getMonth() + 1 < 10
      ? "0" + (time.getMonth() + 1)
      : time.getMonth() + 1; //月
  var R = time.getDate() < 10 ? "0" + time.getDate() : time.getDate(); //日
  var H = time.getHours() < 10 ? "0" + time.getHours() : time.getHours(); //时
  var F = time.getMinutes() < 10 ? "0" + time.getMinutes() : time.getMinutes(); //分
  var M = time.getSeconds() < 10 ? "0" + time.getSeconds() : time.getSeconds(); //秒
  return N + style + Y + style + R + " " + H + ":" + F + ":" + M;
}

const noPassForm = reactive({
  id: "",
  other: "",
});

const page = ref(1);
const size = ref(10);
const total = ref(0);
const handleSizeChange = (size) => {
  size.value = size;
  search();
};

const handleCurrentChange = (page) => {
  page.value = page;
  search();
};

const studentList = ref([]);
const search = () => {
  Axios.post(
    `/placement/selectBySchoolId?page=${page.value}&&size=${size.value}`,
    {}
  ).then((res) => {
    studentList.value.length = 0;
    for (let item of res.data) {
      if (item.pass == "待审批") {
        studentList.value.push(item);
      }
    }
    total.value = studentList.value.length;
  });
};
search();

const noPassId = ref("");
const NP = (id) => {
  noPassId.value = id;
};

const noPass = () => {
  Axios.post("/placement/end", {
    id: noPassId.value,
    pass: "驳回",
    other: noPassForm.other,
  }).then(async (res) => {
    if (res.success == true) {
      dialogFormVisible.value = false;
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });
      await search();
    } else if (res.success == false) {
      ElMessage({
        showClose: true,
        message: res.message,
        type: "error",
      });
    }
  });
};

const pass = (id) => {
  Axios.post("/placement/end", {
    id: id,
    pass: "通过",
  }).then(async (res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });
      await search();
    } else if (res.success == false) {
      ElMessage({
        showClose: true,
        message: res.message,
        type: "error",
      });
    }
  });
};
</script>

<template>
  <div style="padding: 1%">
    <el-card class="box-card">
      <el-table
        :data="studentList"
        v-loading="loading"
        :cell-style="{ textAlign: 'left' }"
        :header-cell-style="{
          'text-align': 'left',
          fontWeight: 'bolder',
          color: 'black',
        }"
      >
        <el-table-column label="学生姓名" width="auto" min-width="12%">
          <template #default="scope">{{ scope.row.studentName }}</template>
        </el-table-column>
        <el-table-column label="学校名称" width="auto" min-width="12%">
          <template #default="scope">{{ scope.row.schoolName }} </template>
        </el-table-column>
        <el-table-column label="原安置方式" width="auto" min-width="12%">
          <template #default="scope">{{ scope.row.from }}</template>
        </el-table-column>
        <el-table-column label="转换后安置方式" width="auto" min-width="12%">
          <template #default="scope">{{ scope.row.to }}</template>
        </el-table-column>
        <el-table-column label="发起时间" width="auto" min-width="12%">
          <template #default="scope">{{ scope.row.createTime }}</template>
        </el-table-column>
        <el-table-column label="状态" width="auto" min-width="12%">
          <template #default="scope">{{ scope.row.pass }} </template>
        </el-table-column>

        <el-table-column label="操作" width="auto" min-width="13%">
          <template #default="scope">
            <el-button
              type="primary"
              text
              style="margin-left: -15px"
              @click="pass(scope.row.id)"
              >通过</el-button
            >
            <el-button
              type="danger"
              text
              style="margin-left: -15px"
              @click="
                NP(scope.row.id);
                dialogFormVisible = true;
              "
              >驳回</el-button
            >
          </template>
        </el-table-column>
      </el-table>
    </el-card>

    <el-dialog
      v-model="dialogFormVisible"
      title="驳回理由"
      style="width: 600px"
    >
      <el-form :model="form" style="width: 500px; margin: auto">
        <el-form-item>
          <el-input v-model="noPassForm.other" style="width: 300px" />
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="dialogFormVisible = false">取消</el-button>
          <el-button type="primary" @click="noPass()"> 确定 </el-button>
        </span>
      </template>
    </el-dialog>
  </div>

  <div class="page-split" style="display: flex; justify-content: center">
    <el-pagination
      :current-page="page"
      :page-size="size"
      :disabled="false"
      :background="true"
      layout="total, prev, pager, next, sizes"
      :total="total"
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
    />
  </div>
</template>

<style scoped></style>
