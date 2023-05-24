<script setup>
import { ref, reactive } from "vue";
import { ElMessage, ElMessageBox } from "element-plus";

import Axios from "../request/index";

const pageSize = ref(10);
const total = ref(0);
const currentPage = ref(1);
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

const fromregionList = ref([]);
function getRegion(code) {
  let data;
  Axios.get(`/region/getOneMess?regionCode=${code}`).then((res) => {
    console.log(res);
    fromregionList.value.push(res.data.regionName);
  });
}

const goregionList = ref([]);
function goRegion(code) {
  let data;
  Axios.get(`/region/getOneMess?regionCode=${code}`).then((res) => {
    console.log(res);
    goregionList.value.push(res.data.regionName);
  });
}

// getRegion(321202);
const handleSizeChange = (val) => {
  pageSize.value = val;
  console.log(`${val} items per page`);
};
const handleCurrentChange = (val) => {
  currentPage.value = val;
  console.log(`current page: ${val}`);
};

const allList = ref([]);
const schoolGetAll = () => {
  loading.value = true;
  Axios.post(
    `/transfer/selectEndPadding?page=${currentPage.value}&size=${pageSize.value}`,
    {}
  ).then(async (res) => {
    console.log(res);
    allList.value = res.data;
    total.value = res.length;
    console.log(allList.value);
    for (let i = 0; i < allList.value.length; i++) {
      await getRegion(allList.value[i].fromRegionCode);
    }
    for (let i = 0; i < allList.value.length; i++) {
      await goRegion(allList.value[i].toRegionCode);
    }
    loading.value = false;
  });
};
schoolGetAll();

const idPass = ref("");
const NP = (id) => {
  idPass.value = id;
};

const noPass = () => {
  dialogFormVisible.value = false;
  noPassForm.id = idPass.value;
  Axios.post("/transfer/overrule", noPassForm).then(async (res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });

      await Axios.post(
        `/transfer/selectEndPadding?page=${currentPage.value}&size=${pageSize.value}`,
        {}
      ).then(async (res) => {
        console.log(res);
        allList.value = res.data;
        for (let i = 0; i < allList.value.length; i++) {
          await getRegion(allList.value[i].fromRegionCode);
        }
        for (let i = 0; i < allList.value.length; i++) {
          await goRegion(allList.value[i].toRegionCode);
        }
        total.value = allList.value.length;
      });

      noPassForm.other = "";
    } else {
      ElMessage({
        showClose: true,
        message: res.message,
        type: "error",
      });
    }
  });
};

const pass = (id, studentId) => {
  Axios.post("/transfer/end", {
    id: id,
    studentId: studentId,
  }).then(async (res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });

      await Axios.post(
        `/transfer/selectEndPadding?page=${currentPage.value}&size=${pageSize.value}`,
        {}
      ).then(async (res) => {
        console.log(res);
        allList.value = res.data;
        total.value = res.length;
        console.log(allList.value);
        for (let i = 0; i < allList.value.length; i++) {
          await getRegion(allList.value[i].fromRegionCode);
        }
        for (let i = 0; i < allList.value.length; i++) {
          await goRegion(allList.value[i].toRegionCode);
        }
        loading.value = false;
      });
      noPassForm.other = "";
    } else {
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
        v-loading="loading"
        :data="allList"
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
        <el-table-column label="来源学校" width="auto" min-width="12%">
          <template #default="scope"> {{ scope.row.fromSchollName }}</template>
        </el-table-column>
        <el-table-column label="来源地" width="auto" min-width="12%">
          <template #default="scope">{{
            fromregionList[scope.$index]
          }}</template>
        </el-table-column>
        <el-table-column label="接受学校" width="auto" min-width="12%">
          <template #default="scope"> {{ scope.row.toSchoolName }}</template>
        </el-table-column>
        <el-table-column label="接受地" width="auto" min-width="12%">
          <template #default="scope">
            {{ goregionList[scope.$index] }}</template
          >
        </el-table-column>
        <el-table-column label="起始时间" width="auto" min-width="15%">
          <template #default="scope"
            >{{ steTime(new Date(scope.row.startTime), "-") }}
          </template>
        </el-table-column>
        <el-table-column label="状态" width="auto" min-width="9%">
          <template #default="scope">{{ scope.row.status }} </template>
        </el-table-column>
        <el-table-column label="操作" width="auto" min-width="13%">
          <template #default="scope">
            <el-button
              type="primary"
              text
              style="margin-left: -15px"
              @click="pass(scope.row.id, scope.row.studentId)"
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
  <div class="demo-pagination-block" style="width: 400px; margin: 0 auto">
    <el-pagination
      :current-page="currentPage"
      :page-size="pageSize"
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
