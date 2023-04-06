<script setup>
import { ref, reactive } from "vue";
import { ElMessage, ElMessageBox } from "element-plus";
import Axios from "../request/index";
const dialogFormVisible = ref(false);
const dialogRevFormVisible = ref(false);
const options = ref([]);
const committeeList = ref([]);
const form = reactive({
  committeeId: "",
  account: "",
  userName: "",
  passWord: "",
  userHead: "",
  userGender: "",
  userPhone: "",
  userMail: "",
});

const form2 = reactive({
  committeeId: "",
  account: "",
  userName: "",
  passWord: "",
  userHead: "",
  userGender: "",
  userPhone: "",
  userMail: "",
});

const change = () => {
  if (form.userGender == "男") {
    form.userHead = "https://static.yirenyian.com/opoc/sysImg/avatar-boy.png";
  } else if (form.userGender == "女") {
    form.userHead = "https://static.yirenyian.com/opoc/sysImg/avatar-girl.png";
  }
};

const change2 = () => {
  if (form2.userGender == "男") {
    form2.userHead = "https://static.yirenyian.com/opoc/sysImg/avatar-boy.png";
  } else if (form2.userGender == "女") {
    form2.userHead = "https://static.yirenyian.com/opoc/sysImg/avatar-girl.png";
  }
};

Axios.get("/board/").then((res) => {
  options.value = res.data;
});
const ob = reactive({});
Axios.get("/committee/").then((res) => {
  committeeList.value = res.data;
  for (let item of res.data) {
    ob[item["id"]] = item["committeeName"];
  }
});

const newItem = () => {
  Axios.post("/board/add", form).then(async (res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });
      await Axios.get("/board/").then((res) => {
        options.value = res.data;
      });

      form.committeeId = "";
      form.account = "";
      form.userName = "";
      form.passWord = "";
      form.userHead = "";
      form.userGender = "";
      form.userPhone = "";
      form.userMail = "";
    } else if (res.success == false) {
      ElMessage({
        showClose: true,
        message: res.message,
        type: "error",
      });
    }
  });
};

const revise = (index) => {
  console.log(index);
  Axios.get("/board/").then((res) => {
    console.log(res.data);
    for (let k of Object.keys(res.data[index])) {
      form2[k] = res.data[index][k];
    }
  });
};

const revItem = () => {
  Axios.put("/board/update", form2).then(async (res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });
      await Axios.get("/board/").then((res) => {
        options.value = res.data;
      });
    } else if (res.success == false) {
      ElMessage({
        showClose: true,
        message: res.message,
        type: "error",
      });
    }
  });
};

const del = (id) => {
  console.log(id);
  Axios.delete("/board/delete", {
    data: { boardId: id },
  }).then((res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });
      Axios.get("/board/").then((res) => {
        options.value = res.data;
      });
    } else if (res.success == false) {
      ElMessage({
        showClose: true,
        message: res.message,
        type: "error",
      });
    }
  });
};

const handleClose = (id) => {
  ElMessageBox.confirm("确认要删除改用户吗?")
    .then(async (a) => {
      console.log(a);
      if (a == "confirm") {
        await del(id);
        close();
      } else {
        close();
      }
    })
    .catch(() => {
      // catch error
    });
};
</script>

<template>
  <div style="padding: 1%">
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
            title="增加委员会成员"
            style="
              text-align: center;
              width: 500px;
              height: 700px;
              position: relative;
              top: -50px;
            "
          >
            <el-form :model="form">
              <el-form-item>
                <span style="margin-left: 40px">委员会：</span>
                <el-select
                  v-model="form.committeeId"
                  placeholder="请选择委员会"
                  style="width: 300px"
                >
                  <el-option
                    v-for="item in committeeList"
                    :key="item.id"
                    :label="item.committeeName"
                    :value="item.id"
                  />
                </el-select>
              </el-form-item>
              <el-form-item>
                <span style="margin-left: 26px">账号名称：</span>
                <el-input
                  style="width: 300px"
                  v-model="form.account"
                  placeholder="请填写账号"
                />
              </el-form-item>
              <el-form-item>
                <span style="margin-left: 26px">用户名称：</span>
                <el-input
                  style="width: 300px"
                  v-model="form.userName"
                  placeholder="请填写用户名称"
                />
              </el-form-item>
              <el-form-item>
                <span style="margin-left: 54px">密码：</span>
                <el-input
                  style="width: 300px"
                  v-model="form.passWord"
                  placeholder="请填写密码"
                />
              </el-form-item>
              <el-form-item>
                <span style="margin-left: 54px">头像：</span>
                <img
                  :src="form.userHead"
                  alt=""
                  style="width: 30px; height: 30px; border-radius: 50px"
                />
              </el-form-item>
              <el-form-item>
                <span style="margin-left: 54px">性别：</span>
                <el-radio-group
                  v-model="form.userGender"
                  class="ml-4"
                  :change="change()"
                >
                  <el-radio label="男" size="large">男</el-radio>
                  <el-radio label="女" size="large">女</el-radio>
                </el-radio-group>
              </el-form-item>
              <el-form-item>
                <span style="margin-left: 26px">联系方式：</span>
                <el-input
                  style="width: 300px"
                  v-model="form.userPhone"
                  placeholder="请填写联系方式"
                />
              </el-form-item>

              <el-form-item>
                <span style="margin-left: 54px">邮箱：</span>
                <el-input
                  style="width: 300px"
                  v-model="form.userMail"
                  placeholder="请输入邮箱"
                  resize="none"
                />
              </el-form-item>
            </el-form>
            <template #footer>
              <span class="dialog-footer">
                <el-button @click="dialogFormVisible = false">取消</el-button>
                <el-button
                  type="primary"
                  @click="
                    dialogFormVisible = false;
                    newItem();
                  "
                >
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
        :data="options"
        :cell-style="{ textAlign: 'left' }"
        :header-cell-style="{
          'text-align': 'left',
          fontWeight: 'bolder',
          color: 'black',
        }"
      >
        <el-table-column label="委员会名称" width="auto" min-width="13%">
          <template #default="scope">
            <p
              style="
                display: -webkit-box;
                -webkit-box-orient: vertical;
                -webkit-line-clamp: 2;
                overflow: hidden;
                text-overflow: ellipsis;
              "
            >
              {{ ob[scope.row.committeeId] }}
            </p>
          </template>
        </el-table-column>

        <el-table-column label="账号" width="auto" min-width="11%">
          <template #default="scope">
            <p
              style="
                display: -webkit-box;
                -webkit-box-orient: vertical;
                -webkit-line-clamp: 2;
                overflow: hidden;
                text-overflow: ellipsis;
              "
            >
              {{ scope.row.account }}
            </p>
          </template>
        </el-table-column>
        <el-table-column label="用户名" width="auto" min-width="10%">
          <template #default="scope">
            <p
              style="
                display: -webkit-box;
                -webkit-box-orient: vertical;
                -webkit-line-clamp: 1;
                overflow: hidden;
                text-overflow: ellipsis;
              "
            >
              {{ scope.row.userName }}
            </p>
          </template>
        </el-table-column>
        <el-table-column label="密码" width="auto" min-width="11%">
          <template #default="scope">
            <p
              style="
                display: -webkit-box;
                -webkit-box-orient: vertical;
                -webkit-line-clamp: 2;
                overflow: hidden;
                text-overflow: ellipsis;
              "
            >
              {{ scope.row.passWord }}
            </p>
          </template>
        </el-table-column>
        <el-table-column label="头像" width="auto" min-width="10%">
          <template #default="scope">
            <p
              style="
                display: -webkit-box;
                -webkit-box-orient: vertical;
                -webkit-line-clamp: 2;
                overflow: hidden;
                text-overflow: ellipsis;
              "
            >
              <img
                :src="scope.row.userHead"
                alt=""
                style="height: 30px; width: 30px"
              />
            </p>
          </template>
        </el-table-column>
        <el-table-column label="性别" width="auto" min-width="10%">
          <template #default="scope">
            <p
              style="
                display: -webkit-box;
                -webkit-box-orient: vertical;
                -webkit-line-clamp: 2;
                overflow: hidden;
                text-overflow: ellipsis;
              "
            >
              {{ scope.row.userGender }}
            </p>
          </template>
        </el-table-column>
        <el-table-column label="手机号" width="auto" min-width="11%">
          <template #default="scope">
            <p
              style="
                display: -webkit-box;
                -webkit-box-orient: vertical;
                -webkit-line-clamp: 2;
                overflow: hidden;
                text-overflow: ellipsis;
              "
            >
              {{ scope.row.userPhone }}
            </p>
          </template>
        </el-table-column>
        <el-table-column label="邮箱" width="auto" min-width="11%">
          <template #default="scope">
            <p
              style="
                display: -webkit-box;
                -webkit-box-orient: vertical;
                -webkit-line-clamp: 2;
                overflow: hidden;
                text-overflow: ellipsis;
              "
            >
              {{ scope.row.userMail }}
            </p>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="auto" min-width="13%">
          <template #default="scope">
            <el-button
              type="danger"
              text
              style="margin-left: -15px"
              @click="
                dialogRevFormVisible = true;
                revise(scope.$index);
              "
              >修改</el-button
            >

            <el-button
              type="danger"
              text
              style="margin-left: -15px"
              @click="handleClose(scope.row.boardId)"
              >删除</el-button
            >
          </template>
        </el-table-column>
      </el-table>
    </el-card>
    <el-dialog
      v-model="dialogRevFormVisible"
      title="修改委员会成员"
      style="
        text-align: center;
        width: 500px;
        height: 700px;
        position: relative;
        top: -50px;
      "
    >
      <el-form :model="form2">
        <el-form-item>
          <span style="margin-left: 40px">委员会：</span>
          <el-select
            v-model="form2.committeeId"
            placeholder="请选择委员会"
            style="width: 300px"
            disabled
          >
            <el-option
              v-for="item in committeeList"
              :key="item.id"
              :label="item.committeeName"
              :value="item.id"
            />
          </el-select>
        </el-form-item>
        <el-form-item>
          <span style="margin-left: 26px">账号名称：</span>
          <el-input
            style="width: 300px"
            v-model="form2.account"
            placeholder="请填写账号"
          />
        </el-form-item>
        <el-form-item>
          <span style="margin-left: 26px">用户名称：</span>
          <el-input
            style="width: 300px"
            v-model="form2.userName"
            placeholder="请填写用户名称"
          />
        </el-form-item>
        <el-form-item>
          <span style="margin-left: 54px">密码：</span>
          <el-input
            disabled
            style="width: 300px"
            v-model="form2.passWord"
            placeholder="请填写密码"
          />
        </el-form-item>
        <el-form-item>
          <span style="margin-left: 54px">头像：</span>
          <img
            :src="form2.userHead"
            alt=""
            style="width: 30px; height: 30px; border-radius: 50px"
          />
        </el-form-item>
        <el-form-item>
          <span style="margin-left: 54px">性别：</span>
          <el-radio-group
            v-model="form2.userGender"
            class="ml-4"
            :change="change2()"
          >
            <el-radio label="男" size="large">男</el-radio>
            <el-radio label="女" size="large">女</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item>
          <span style="margin-left: 26px">联系方式：</span>
          <el-input
            style="width: 300px"
            v-model="form2.userPhone"
            placeholder="请填写联系方式"
          />
        </el-form-item>

        <el-form-item>
          <span style="margin-left: 54px">邮箱：</span>
          <el-input
            style="width: 300px"
            v-model="form2.userMail"
            placeholder="请输入邮箱"
            resize="none"
          />
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="dialogRevFormVisible = false">取消</el-button>
          <el-button
            type="primary"
            @click="
              dialogRevFormVisible = false;
              revItem();
            "
          >
            确认
          </el-button>
        </span>
      </template>
    </el-dialog>
  </div>
</template>

<style scoped></style>
