<script setup lang="ts">
import { useSchoolStore } from "../../store/school";
import { useActiveStore } from "../../store/activity";
const ActiveStore = useActiveStore();
const SchoolStore = useSchoolStore();
ActiveStore.loadActive();
</script>

<template>
  <el-card class="box-card">
    <template #header>
      <div class="card-header">
        <!-- <span>Card name</span> -->
        <el-button class="button" text>新建</el-button>
        <el-button class="button" text>导入</el-button>
        <el-button class="button" text>下载模板</el-button>
      </div>
    </template>
    <el-table
      :data="ActiveStore.activeList"
      :cell-style="{ textAlign: 'center' }"
      :header-cell-style="{ 'text-align': 'center' }"
    >
      <!-- <el-table-column fixed prop="schoolId" label="学校" width="150" /> -->
      <el-table-column prop="no" label="编号" width="120" />
      <el-table-column prop="title" label="标题" width="120" />
      <el-table-column prop="tip" label="说明" width="500" />

      <el-table-column label="操作">
        <template #default="scope">
          <el-button
            type="danger"
            @click="
              $router.push('/management/activityDetail?_id=' + scope.row._id)
            "
            text
            >查看</el-button
          >
        </template>
      </el-table-column>
    </el-table>
    <div class="page-split"></div>
  </el-card>
</template>

<style scoped>
.page-split {
  display: flex;
  height: 60px;
  justify-content: center;
}

.card-header {
  text-align: right;
}
</style>
