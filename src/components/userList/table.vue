<script setup lang="ts">
import { kebabCase } from "lodash";
import { ref, reactive } from "vue";
import Axios from "../../request";
import { useUserStore } from "../../store/user";
import { ElMessage } from "element-plus";
import { ElMessageBox } from "element-plus";
const dialogFormVisible = ref(false);
const form = reactive({
  school: "",
  name: "",
  account: "",
  sex: "",
  role: "",
  phone: "",
  address: "",
  type: "",
  password: "",
  head: "",
});

const ob = reactive({});
const options = ref("");
const del = async (userId) => {
  await Axios.delete(`/user/delete?userId=${userId}`).then((res) => {
    if ((res.success = true)) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });
    } else if (res.success == false) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "error",
      });
    }
  });
};

const change = () => {
  console.log(form.sex);
  if (form.sex == "男") {
    form.head = "https://static.yirenyian.com/opoc/sysImg/avatar-boy.png";
  } else if (form.sex == "女") {
    form.head = "https://static.yirenyian.com/opoc/sysImg/avatar-girl.png";
  }
};

Axios.get("/school/getAll").then((res) => {
  options.value = res.data;
  for (let item of res.data) {
    ob[item["schoolId"].toString()] = item["schoolName"];
  }
  console.log(ob);
});

const options2 = [
  {
    userRole: "系统管理员",
  },
  {
    userRole: "学校管理员",
  },
  {
    userRole: "教师",
  },
];
const newItem = () => {
  Axios.post("/user/register", {
    userAccount: form.account,
    userMail: form.address,
    passWord: form.password,
    userName: form.name,
    schoolId: form.school,
    userPhone: form.phone,
    userHead: form.head,
    userGender: form.sex,
    userRole: form.type,
  }).then(async (res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: "新增成功",
        type: "success",
      });
      await useUserStore().search();
      form.account = "";
      form.address = "";
      form.password = "";
      form.name = "";
      form.school = "";
      form.phone = "";
      form.head = "";
      form.sex = "";
      form.type = "";
    } else {
      ElMessage({
        showClose: true,
        message: "新增失败",
        type: "error",
      });
    }
  });
};

const UserStore = useUserStore();
UserStore.search();
const handleSizeChange = (size: number) => {
  console.log("切换每页数量：", size);
  UserStore.searchUser.size = size;
  UserStore.search();
};

const handleCurrentChange = (page: number) => {
  console.log("切换页码：", page);
  UserStore.searchUser.page = page;
  UserStore.search();
};

const handleClose = (userId) => {
  ElMessageBox.confirm("确认要删除改用户吗?")
    .then(async (a) => {
      if (a == "confirm") {
        await del(userId);
        close();
      } else {
        close();
      }
      await UserStore.search();
    })
    .catch(() => {
      // catch error
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
                <el-option
                  v-for="item in options"
                  :key="item.schoolId"
                  :label="item.schoolName"
                  :value="item.schoolId"
                />
              </el-select>
            </el-form-item>
            <el-form-item>
              <span slot="label">
                <span class="redLogo" style="margin-left: 32px">*</span>账号：
              </span>
              <el-input
                v-model="form.account"
                placeholder="请输入账号"
                style="width: 300px"
              />
            </el-form-item>

            <el-form-item>
              <span slot="label">
                <span class="redLogo" style="margin-left: 32px">*</span>密码：
              </span>
              <el-input
                v-model="form.password"
                placeholder="请设置密码"
                style="width: 300px"
              />
            </el-form-item>
            <el-form-item>
              <span slot="label">
                <span class="redLogo" style="margin-left: 27px">*</span>
                类型：
              </span>
              <el-select
                v-model="form.type"
                placeholder="请选择类型"
                style="width: 300px"
              >
                <el-option
                  v-for="item in options2"
                  :key="item.userRole"
                  :label="item.userRole"
                  :value="item.userRole"
                />
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
                :src="form.head"
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
              <el-radio-group
                v-model="form.sex"
                class="ml-4"
                :change="change()"
              >
                <el-radio label="男" size="large">男</el-radio>
                <el-radio label="女" size="large">女</el-radio>
              </el-radio-group>
            </el-form-item>

            <el-form-item>
              <span slot="label" style="margin-left: 35px"> 电话： </span>
              <el-input
                v-model="form.phone"
                placeholder="请输入电话"
                style="width: 300px"
              />
            </el-form-item>

            <el-form-item>
              <span slot="label" style="margin-left: 30px">
                <span class="redLogo">*</span>邮箱：
              </span>
              <el-input
                v-model="form.address"
                placeholder="请输入邮箱"
                style="width: 300px"
              />
            </el-form-item>
          </el-form>
          <template #footer>
            <span
              class="dialog-footer"
              style="position: relative; bottom: 40px"
            >
              <el-button @click="dialogFormVisible = false">取消</el-button>
              <el-button
                type="primary"
                @click="
                  dialogFormVisible = false;
                  newItem();
                "
              >
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
      <el-table-column label="学校" width="180">
        <template #default="scope">
          <div style="display: flex">
            <span>{{ ob[scope.row.schoolId] }}</span>
          </div>
        </template>
      </el-table-column>
      <el-table-column prop="userAccount" label="账号" width="70" />
      <el-table-column prop="passWord" label="密码" width="80" />
      <el-table-column prop="userName" label="姓名" width="70" />
      <el-table-column prop="userRole" label="类型" width="90" />
      <el-table-column label="头像" width="60">
        <template #default="scope">
          <!-- <div style="display: flex; align-items: center"> -->
          <el-image
            style="width: 30px; height: 30px"
            :src="scope.row.userHead"
            fit="fill"
          />
          <!-- </div> -->
        </template>
      </el-table-column>
      <el-table-column prop="userGender" label="性别" width="70" />
      <el-table-column prop="userPhone" label="手机号码" width="120" />
      <el-table-column prop="userMail" label="邮箱" width="100" />
      <el-table-column prop="loginTime" label="最近访问时间" width="120" />
      <el-table-column prop="userExperience" label="经验值" width="80" />
      <el-table-column label="操作">
        <template #default="scope">
          <el-button type="primary" text style="margin-left: -15px"
            >修改</el-button
          >
          <el-button type="danger" @click="" text>重置密码</el-button>
          <el-button type="danger" @click="handleClose(scope.row.userId)" text
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>
    <div class="page-split">
      <el-pagination
        :current-page="UserStore.searchUser.page"
        :page-size="UserStore.searchUser.size"
        :disabled="false"
        :background="true"
        layout="total, prev, pager, next, sizes"
        :total="UserStore.total"
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
