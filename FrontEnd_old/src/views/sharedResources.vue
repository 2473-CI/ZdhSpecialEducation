<script setup>
import { ref, reactive } from "vue";
import { useClassStore } from "../store/cls";
import { ElMessage, ElMessageBox } from "element-plus";
import Axios from "../request/index";

const dialogFormVisible = ref(false);
const showInput = ref(false);
const detailOptions = ref([]);
const formSeach = reactive({
  fileType: "",
  fileTitle: "",
  filSubtitle: "",
  contextType: "",
  publiced: "",
});
</script>

<template>
  <el-tabs
    v-model="activeName"
    style="background-color: #fff"
    tab-position="center"
  >
    <div style="padding: 1%">
      <el-card class="box-card">
        <el-form :inline="true" class="all-form">
          <el-form-item label="文件分类">
            <el-select v-model="formSeach.fileType" placeholder="请选择">
              <el-option />
            </el-select>
          </el-form-item>
          <el-form-item label="文件名称">
            <el-input
              placeholder="请输入文件名称"
              v-model="formSeach.fileTitle"
              style="width: 300px"
            />
          </el-form-item>
          <el-form-item label="文件副标题">
            <el-input
              placeholder="请输入文件副标题"
              v-model="formSeach.filSubtitle"
              style="width: 300px"
            />
          </el-form-item>
          <el-form-item label="文件内容标签">
            <el-input
              placeholder="请输入文件内容标签"
              v-model="formSeach.contextType"
              style="width: 300px"
            />
          </el-form-item>

          <el-form-item class="right-bottom">
            <el-button>重置</el-button>
            <el-button type="primary" @click="seach">查询</el-button>
          </el-form-item>
        </el-form>
      </el-card>
    </div>
    <div style="height: 20px"></div>

    <div style="padding: 1%">
      <el-card class="box-card">
        <el-table
          :data="detailOptions"
          :cell-style="{ textAlign: 'left' }"
          :header-cell-style="{
            'text-align': 'left',
            fontWeight: 'bolder',
            color: 'black',
          }"
        >
          <el-table-column label="文件类型" width="auto" min-width="10%">
            <template #default="scope"> </template>
          </el-table-column>
          <el-table-column label="文件内容标签" width="auto" min-width="10%">
            <template #default="scope"> </template>
          </el-table-column>
          <el-table-column label="文件名称" width="auto" min-width="10%">
            <template #default="scope"> </template>
          </el-table-column>
          <el-table-column label="文件副标题" width="auto" min-width="10%">
            <template #default="scope"> </template>
          </el-table-column>
          <el-table-column label="是否公开" width="auto" min-width="10%">
            <template #default="scope"> </template>
          </el-table-column>

          <el-table-column label="操作" width="auto" min-width="10%">
            <template #default="scope">
              <el-button
                type="danger"
                text
                style="margin-left: -15px"
                @click="handleClose(scope.row.scaleId)"
                >删除</el-button
              >
              <el-button
                type="danger"
                text
                style=""
                @click="
                  showDetail = true;
                  toDetail(scope.row.scaleId);
                "
                >查看</el-button
              >
            </template>
          </el-table-column>
        </el-table>
      </el-card>
    </div>
  </el-tabs>
</template>

<style scoped></style>
