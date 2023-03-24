<script setup lang="ts">
import { ref, reactive } from "vue";
import { ElMessage, ElMessageBox } from "element-plus";
import { useSchoolStore } from "../../store/school";
import { useClasStore } from "../../store/cls";
import Axios from "../../request/index";
const SchoolStore = useSchoolStore();
const classStore = useClassStore();
const dialogFormVisible = ref(false);
const dialogVisible = ref(false);

const form = reactive({
  school: "",
  grade: "",
  class: "",
  textarea: "",
});

const options = ref("");
Axios.get("/school/getAll").then((res) => {
  options.value = res.data;
});
const options2 = ref("");
Axios.get("/clazz/getAll").then((res) => {
  options2.value = res.data;
});

const del = (clsId: string) => {
  ElMessageBox.confirm("确定要删除嘛？", "警告", {
    confirmButtonText: "确认",
    cancelButtonText: "取消",
    type: "warning",
  })
    .then(() => {})
    .catch(() => {
      ElMessage({
        type: "info",
        message: "删除失败",
      });
    });
};
</script>

<template>
  <el-card class="box-card">
    <template #header>
      <div class="card-header">
        <!-- <span>Card name</span> -->
        <el-button
          class="button"
          text
          @click="dialogFormVisible = true"
          style="background-color: #1677ff; color: #fff"
          >+新建</el-button
        >

        <el-dialog
          v-model="dialogFormVisible"
          title="新建班级"
          style="text-align: center; width: 500px; height: 600px"
        >
          <el-form :model="form">
            <el-form-item>
              <span style="margin-left: 20px">所属学校：</span>
              <el-select
                v-model="form.school"
                placeholder="请选择学校"
                style="width: 300px"
              >
                <el-option
                  v-for="item in options"
                  :key="item.schoolId"
                  :label="item.schoolName"
                  :value="item.schoolId"
                />
              </el-select>
            </el-form-item>
            <el-form-item>
              <span style="margin-left: 48px">年级：</span>
              <el-select
                v-model="form.grade"
                placeholder="请选择年级"
                style="width: 300px"
              >
                <el-option
                  v-for="item in options2"
                  :key="item.clazzId"
                  :label="item.clazzName"
                  :value="item.clazzId"
                />
              </el-select>
            </el-form-item>

            <el-form-item>
              <span style="margin-left: 34px"> 班级名： </span>
              <el-input
                v-model="form.class"
                style="width: 300px"
                placeholder="请填写班级名"
              />
            </el-form-item>

            <el-form-item>
              <span style="margin-left: 48px">描述：</span>
              <el-input
                v-model="form.textarea"
                :rows="3"
                type="textarea"
                placeholder="请输入描述"
                style="width: 300px"
              />
            </el-form-item>
          </el-form>
          <template #footer>
            <span class="dialog-footer">
              <el-button @click="dialogFormVisible = false">取消</el-button>
              <el-button type="primary" @click="dialogFormVisible = false">
                确认
              </el-button>
            </span>
          </template>
        </el-dialog>
        <el-button class="button" text>导入</el-button>
        <el-button class="button" text>下载模板</el-button>
      </div>
    </template>
    <el-table
      :data="classStore.classList"
      :cell-style="{ textAlign: 'left' }"
      :header-cell-style="{
        'text-align': 'left',
        fontWeight: 'bolder',
        color: 'black',
      }"
    >
      <!-- <el-table-column fixed prop="schoolId" label="学校" width="150" /> -->
      <el-table-column label="学校" width="300">
        <template #default="scope">
          <div style="display: flex; align-items: center">
            <span>{{
              SchoolStore.schoolList.find(
                (o) => o.schoolId == scope.row.schoolId
              )?.schoolName
            }}</span>
          </div>
        </template>
      </el-table-column>
      <el-table-column prop="gradeName" label="年级" width="130" />
      <el-table-column prop="name" label="班级名" width="130" />
      <el-table-column label="描述" width="250">
        <template #default="scope"> -- </template>
      </el-table-column>
      <el-table-column prop="createdAt" label="创建时间" width="240">
      </el-table-column>
      <el-table-column label="操作" width="150">
        <template #default="scope">
          <el-button type="primary" text style="margin-left: -15px"
            >修改</el-button
          >
          <el-button type="danger" @click="del(scope.row._id)" text
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>
  </el-card>

  <!-- <el-dialog v-model="dialogVisible" title="更新班级" width="30%" draggable>
    <el-form
      ref="ruleFormRef"
      v-model="stuTmp"
      label-width="120px"
      class="demo-ruleForm"
      status-icon
    >
      <el-form-item label="所属学校" prop="region">
        <el-select v-model="stuTmp.school" placeholder="所属学校">
          <el-option
            :key="school.id"
            v-for="school in SchoolStore.schoolList"
            :label="school.schoolName"
            :value="school.schoolId"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="年级" prop="region">
        <el-select v-model="stuTmp.gradeCode" placeholder="年级">
          <el-option
            :key="cls._id"
            v-for="cls in ClsStore.clsList"
            :label="cls.gradeName"
            :value="cls.gradeCode"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="班级名称" prop="region">
        <el-select v-model="stuTmp.gradeCode" placeholder="班级名称">
          <el-option
            :key="cls._id"
            v-for="cls in ClsStore.clsList"
            :label="cls.name"
            :value="cls.name"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="描述" prop="region">
        <el-input :rows="2" type="textarea" placeholder="Please input" />
      </el-form-item>
    </el-form>
    <template #footer>
      <span class="dialog-footer">
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="dialogVisible = false">
          确定
        </el-button>
      </span>
    </template>
  </el-dialog> -->
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
