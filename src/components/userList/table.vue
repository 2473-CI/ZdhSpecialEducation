<script setup lang="ts">
import { ref } from "vue";
import { useUserStore } from "../../store/user";
import { useSchoolStore } from "../../store/school";
import { useStudentStore } from "../../store/student";
import Axios from "../../request/index";
import { size } from "lodash";
const UserStore = useUserStore();
const SchoolStore = useSchoolStore();
const StudentStore = useStudentStore();
const dialogFormVisible = ref(false);
const total = ref("");
const size1 = ref(10);
const page = ref(1);

// const form = ref({
//   school: "",
//   name: "",
//   region: "",
//   sex: "",
//   date1: "",
//   cardId: "",
//   pro: "",
//   home: "",
// });
// UserStore.searchUserInfo();

const handleSizeChange = (val: number) => {
  //   size1.value = val;
  //   // seachList()
  //   UserStore.searchUserImp.pageSize = val
  //   UserStore.searchUserInfo();
};
const handleCurrentChange = (val: number) => {
  //   page.value = val;
  //   UserStore.searchUserImp.pageNo = val.toString();
  //   // seachList()
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
          style="background-color: #1677ff; color: #fff"
          @click="dialogFormVisible = true"
          >+新建</el-button
        >

        <el-dialog
          v-model="dialogFormVisible"
          title="新增用户"
          style="
            width: 500px;
            height: 630px;
            border-radius: 10px;
            text-align: center;
          "
        >
          <el-form :model="form" style="margin-left: 20px">
            <el-form-item>
              <span slot="label" style="">
                <span class="redLogo">*</span> 学校名称：
              </span>
              <el-select
                v-model="form.school"
                placeholder="请选择学校"
                style="width: 300px"
              >
                <el-option label="Zone No.1" value="shanghai" />
              </el-select>
            </el-form-item>
            <el-form-item>
              <span slot="label">
                <span class="redLogo" style="margin-left: 32px">*</span>班级：
              </span>
              <el-select
                v-model="form.region"
                placeholder="请选择班级"
                style="width: 300px"
              >
                <el-option label="Zone No.1" value="shanghai" />
                <el-option label="Zone No.2" value="beijing" />
              </el-select>
            </el-form-item>
            <el-form-item>
              <span slot="label">
                <span class="redLogo" style="margin-left: 32px">*</span>姓名：
              </span>
              <el-input
                v-model="form.name"
                placeholder="请输入姓名"
                style="width: 300px"
              />
            </el-form-item>
            <el-form-item>
              <span slot="label" style="margin-left: 37px">头像： </span>
              <img
                src=""
                style="
                  height: 30px;
                  width: 30px;
                  border-radius: 50px;
                  margin-right: 10px;
                "
              />
            </el-form-item>
            <el-form-item>
              <span slot="label">
                <span class="redLogo" style="margin-left: 28px">*</span>性别：
              </span>
              <el-radio-group v-model="form.sex" class="ml-4">
                <el-radio label="男" size="large">男</el-radio>
                <el-radio label="女" size="large">女</el-radio>
              </el-radio-group>
            </el-form-item>

            <el-form-item>
              <span slot="label">
                <span class="redLogo">*</span>出生日期：
              </span>
              <el-date-picker
                v-model="form.date1"
                type="date"
                label=""
                placeholder="请选择出生日期"
                style="width: 300px"
              />
            </el-form-item>

            <el-form-item>
              <span slot="label" style="margin-left: 20px"> 身份证： </span>
              <el-input
                v-model="form.cardId"
                placeholder="请输入身份证"
                style="width: 300px"
              />
            </el-form-item>

            <el-form-item>
              <span slot="label">
                <span class="redLogo">*</span>障碍类型：
              </span>
              <el-select
                v-model="form.pro"
                placeholder="请选择障碍类型"
                style="width: 300px"
              >
                <el-option label="Zone No.1" value="shanghai" />
                <el-option label="Zone No.2" value="beijing" />
              </el-select>
            </el-form-item>

            <el-form-item>
              <span slot="label">
                <span class="redLogo">*</span>安置方式：
              </span>
              <el-select
                v-model="form.home"
                placeholder="请选择安置方式"
                style="width: 300px"
              >
                <el-option label="Zone No.1" value="shanghai" />
                <el-option label="Zone No.2" value="beijing" />
              </el-select>
            </el-form-item>
          </el-form>
          <template #footer>
            <span class="dialog-footer">
              <el-button @click="dialogFormVisible = false">取消</el-button>
              <el-button type="primary" @click="dialogFormVisible = false">
                确定
              </el-button>
            </span>
          </template>
        </el-dialog>

        <el-button class="button" text>导入</el-button>
        <el-button class="button" text type="primary">下载模板</el-button>
      </div>
    </template>
    <el-table
      :data="UserStore.userList"
      :cell-style="{
        textAlign: 'left',
        marginLeft: '0px',
        marginRight: '0px',
        fontSize: '12px',
      }"
      :header-cell-style="{
        'text-align': 'left',
        color: 'black',
        fontWeight: 'bolder',
      }"
    >
      <!-- <el-table-column fixed prop="schoolId" label="学校" width="150" /> -->
      <el-table-column label="学校" width="180">
        <template #default="scope">
          <div style="display: flex">
            <span>{{
              SchoolStore.schoolList.find(
                (o) => o.schoolId == scope.row.schoolId
              )?.schoolName
            }}</span>
          </div>
        </template>
      </el-table-column>
      <el-table-column prop="account" label="账号" width="110" />
      <el-table-column prop="name" label="姓名" width="70" />
      <el-table-column prop="role" label="类型" width="100" />
      <el-table-column label="头像" width="60">
        <template #default="scope">
          <!-- <div style="display: flex; align-items: center"> -->
          <el-image
            style="width: 30px; height: 30px"
            :src="scope.row.avatar"
            fit="fill"
          />
          <!-- </div> -->
        </template>
      </el-table-column>
      <el-table-column label="性别" width="55">
        <template #default="scope">
          <!-- <div style="display: flex; align-items: center"> -->
          <span style="font-size: 12px">{{
            StudentStore.Sex.find((o) => o.value == scope.row.sex)?.name
          }}</span>
          <!-- </div> -->
        </template>
      </el-table-column>
      <el-table-column prop="phone" label="手机号码" width="120" />
      <el-table-column prop="_id" label="邮箱" width="100" />
      <el-table-column prop="lastVisitDate" label="最近访问时间" width="150" />
      <el-table-column prop="totalVisitCount" label="经验值" width="80" />
      <el-table-column label="操作">
        <template #default="scope">
          <el-button type="primary" text style="margin-left: -15px"
            >修改</el-button
          >
          <el-button type="danger" @click="" text>重置密码</el-button>
          <el-button type="danger" @click="" text>删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <div class="page-split">
      <el-pagination
        :current-page="page"
        :page-size="size1"
        :disabled="false"
        :background="true"
        layout="total, prev, pager, next, sizes"
        :total="total"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
      />
    </div>
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
.redLogo {
  color: red;
}
</style>
