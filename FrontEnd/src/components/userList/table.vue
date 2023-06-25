<script setup>
import { clamp, kebabCase } from "lodash";
import { ref, reactive } from "vue";
import Axios from "../../request";
import { useUserStore } from "../../store/user";
import { ElMessage } from "element-plus";
import { ElMessageBox } from "element-plus";
const dialogFormVisible = ref(false);
const dialogrevFormVisible = ref(false);
const form = reactive({
  school: "",
  name: "",
  account: "",
  sex: "",
  phone: "",
  address: "",
  type: "",
  password: "",
  head: "",
});

const revForm = reactive({
  school: "",
  name: "",
  account: "",
  sex: "",
  phone: "",
  address: "",
  password: "",
  head: "",
  teacherId: "",
  type: "",
});

const ob = reactive({});
const options = ref("");
const del = async (Id) => {
  await Axios.delete(`/teacher/delete`, {
    data: {
      teacherId: Id,
    },
  }).then(async (res) => {
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
  if (revForm.sex == "男") {
    revForm.head = "https://static.yirenyian.com/opoc/sysImg/avatar-boy.png";
  } else if (revForm.sex == "女") {
    revForm.head = "https://static.yirenyian.com/opoc/sysImg/avatar-girl.png";
  }
};

Axios.get("/school/getAll").then((res) => {
  let arr = [];
  Axios.post("/user/getRole").then((res2) => {
    if (res2.data.role == "学校管理员") {
      console.log(res);
      arr = res.data.filter((k) => k.schoolId == res2.data.schoolId);
      options.value = arr;
    } else {
      options.value = res.data;
    }
  });
  for (let item of res.data) {
    ob[item["schoolId"].toString()] = item["schoolName"];
  }
  console.log(ob);
});

const changeUser = (
  schoolId,
  userAccount,
  userName,
  passWord,
  userHead,
  userGender,
  userPhone,
  userMail,
  teacherId,
  schoolAdmin
) => {
  revForm.school = schoolId;
  revForm.name = userName;
  revForm.account = userAccount;
  revForm.sex = userGender;
  revForm.phone = userPhone;
  revForm.address = userMail;
  revForm.password = passWord;
  revForm.head = userHead;
  revForm.teacherId = teacherId;
  revForm.type = schoolAdmin;
};

const revItem = () => {
  Axios.put("/teacher/update", {
    teacherId: revForm.teacherId,
    schoolId: revForm.school,
    account: revForm.account,
    userName: revForm.name,
    passWord: revForm.password,
    userHead: revForm.head,
    userGender: revForm.sex,
    userPhone: revForm.phone,
    userMail: revForm.address,
    schoolAdmin: revForm.type,
  }).then(async (res) => {
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
  Axios.post("/teacher/add", {
    account: form.account,
    userMail: form.address,
    passWord: form.password,
    userName: form.name,
    schoolId: form.school,
    userPhone: form.phone,
    userHead: form.head,
    userGender: form.sex,
    schoolAdmin: form.type,
  }).then(async (res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: "新增成功",
        type: "success",
      });

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
const handleSizeChange = (size) => {
  console.log("切换每页数量：", size);
  UserStore.searchUser.size = size;
  UserStore.search();
};

const handleCurrentChange = (page) => {
  console.log("切换页码：", page);
  UserStore.searchUser.page = page;
  UserStore.search();
};

const handleClose = (teacherId) => {
  ElMessageBox.confirm("确认要删除改用户吗?")
    .then(async (a) => {
      if (a == "confirm") {
        await del(teacherId);
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
              <el-radio-group v-model="form.type" class="ml-4">
                <el-radio label="否" size="large">否</el-radio>
                <el-radio label="是" size="large">是</el-radio>
              </el-radio-group>
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
        <!-- 
        <el-button class="button" text>导入</el-button>
        <el-button class="button" text type="primary">下载模板</el-button> -->
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
      <el-table-column label="学校" width="auto" min-width="10%">
        <template #default="scope">
          <div
            style="
              display: -webkit-box;
              -webkit-box-orient: vertical;
              -webkit-line-clamp: 2;
              overflow: hidden;
              text-overflow: ellipsis;
            "
          >
            <span>{{ ob[scope.row.schoolId] }}</span>
          </div>
        </template>
      </el-table-column>
      <el-table-column label="账号" width="auto" min-width="5%">
        <template #default="scope">
          <div
            style="
              display: -webkit-box;
              -webkit-box-orient: vertical;
              -webkit-line-clamp: 2;
              overflow: hidden;
              text-overflow: ellipsis;
            "
          >
            {{ scope.row.account }}
          </div>
        </template>
      </el-table-column>
      <el-table-column label="密码" width="auto" min-width="7%">
        <template #default="scope">
          <div
            style="
              display: -webkit-box;
              -webkit-box-orient: vertical;
              -webkit-line-clamp: 2;
              overflow: hidden;
              text-overflow: ellipsis;
            "
          >
            {{ scope.row.passWord }}
          </div>
        </template>
      </el-table-column>
      <el-table-column label="姓名" width="auto" min-width="7%">
        <template #default="scope">
          <div
            style="
              display: -webkit-box;
              -webkit-box-orient: vertical;
              -webkit-line-clamp: 1;
              overflow: hidden;
              text-overflow: ellipsis;
            "
          >
            {{ scope.row.userName }}
          </div>
        </template>
      </el-table-column>
      <el-table-column label="学校管理员" width="auto" min-width="9%">
        <template #default="scope">
          <div
            style="
              display: -webkit-box;
              -webkit-box-orient: vertical;
              -webkit-line-clamp: 1;
              overflow: hidden;
              text-overflow: ellipsis;
            "
          >
            {{ scope.row.schoolAdmin }}
          </div>
        </template>
      </el-table-column>
      <el-table-column label="头像" width="auto" min-width="6%">
        <template #default="scope">
          <!-- <div style="display: flex; align-items: center"> -->
          <el-image
            style="width: 70%; height: 70%"
            :src="scope.row.userHead"
            fit="fill"
          />
          <!-- </div> -->
        </template>
      </el-table-column>
      <el-table-column label="性别" width="auto" min-width="5%">
        <template #default="scope">
          {{ scope.row.userGender }}
        </template>
      </el-table-column>
      <el-table-column label="手机号码" width="auto" min-width="10%">
        <template #default="scope">
          <div
            style="
              display: -webkit-box;
              -webkit-box-orient: vertical;
              -webkit-line-clamp: 2;
              overflow: hidden;
              text-overflow: ellipsis;
            "
          >
            {{ scope.row.userPhone }}
          </div>
        </template>
      </el-table-column>
      <el-table-column label="邮箱" width="auto" min-width="9%">
        <template #default="scope">
          <div
            style="
              display: -webkit-box;
              -webkit-box-orient: vertical;
              -webkit-line-clamp: 2;
              overflow: hidden;
              text-overflow: ellipsis;
            "
          >
            {{ scope.row.userMail }}
          </div>
        </template>
      </el-table-column>
      <!-- <el-table-column label="授权" width="auto" min-width="8%">
        <template #default="scope">
          <div
            style="
              display: -webkit-box;
              -webkit-box-orient: vertical;
              -webkit-line-clamp: 2;
              overflow: hidden;
              text-overflow: ellipsis;
            "
          >
            {{ scope.row.authorization }}
          </div>
        </template>
      </el-table-column> -->
      <el-table-column label="操作" width="auto" min-width="18%">
        <template #default="scope">
          <div style="display: flex; flex-wrap: nowrap">
            <el-button
              type="primary"
              text
              style="width: 33%; margin-left: -15px"
              @click="
                dialogrevFormVisible = true;
                changeUser(
                  scope.row.schoolId,
                  scope.row.account,
                  scope.row.userName,
                  scope.row.passWord,
                  scope.row.userHead,
                  scope.row.userGender,
                  scope.row.userPhone,
                  scope.row.userMail,
                  scope.row.teacherId,
                  scope.row.schoolAdmin
                );
              "
              >修改</el-button
            >
            <el-button
              style="width: 33%"
              type="danger"
              @click="handleClose(scope.row.teacherId)"
              text
              >删除</el-button
            >
          </div>
        </template>
      </el-table-column>
    </el-table>
    <el-dialog
      v-model="dialogrevFormVisible"
      title="修改用户"
      style="
        width: 500px;
        height: 630px;
        border-radius: 10px;
        text-align: center;
      "
    >
      <el-form :model="revForm" style="margin-left: 20px">
        <el-form-item>
          <span slot="label" style="">
            <span class="redLogo">*</span> 学校名称：
          </span>
          <el-select
            v-model="revForm.school"
            placeholder="请选择学校"
            style="width: 300px"
            disabled
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
            v-model="revForm.account"
            placeholder="请输入账号"
            style="width: 300px"
          />
        </el-form-item>

        <el-form-item>
          <span slot="label">
            <span class="redLogo" style="margin-left: 32px">*</span>密码：
          </span>
          <el-input
            disabled
            v-model="revForm.password"
            placeholder="请设置密码"
            style="width: 300px"
          />
        </el-form-item>
        <el-form-item>
          <span slot="label">
            <span class="redLogo" style="margin-left: 27px">*</span>
            管理员：
          </span>
          <el-radio-group v-model="revForm.type">
            <el-radio label="否" size="large">否</el-radio>
            <el-radio label="是" size="large">是</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item>
          <span slot="label">
            <span class="redLogo" style="margin-left: 32px">*</span>姓名：
          </span>
          <el-input
            v-model="revForm.name"
            placeholder="请输入姓名"
            style="width: 300px"
          />
        </el-form-item>
        <el-form-item>
          <span slot="label" style="margin-left: 37px">头像： </span>
          <img
            :src="revForm.head"
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
          <el-radio-group v-model="revForm.sex" class="ml-4" :change="change()">
            <el-radio label="男" size="large">男</el-radio>
            <el-radio label="女" size="large">女</el-radio>
          </el-radio-group>
        </el-form-item>

        <el-form-item>
          <span slot="label" style="margin-left: 35px"> 电话： </span>
          <el-input
            v-model="revForm.phone"
            placeholder="请输入电话"
            style="width: 300px"
          />
        </el-form-item>

        <el-form-item>
          <span slot="label" style="margin-left: 30px">
            <span class="redLogo">*</span>邮箱：
          </span>
          <el-input
            v-model="revForm.address"
            placeholder="请输入邮箱"
            style="width: 300px"
          />
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer" style="position: relative; bottom: 40px">
          <el-button @click="dialogrevFormVisible = false">取消</el-button>
          <el-button
            type="primary"
            @click="(dialogrevFormVisible = false), revItem()"
          >
            确定
          </el-button>
        </span>
      </template>
    </el-dialog>

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
