<script setup lang="ts">
import { ref, reactive } from "vue";
import { ElMessage, ElMessageBox } from "element-plus";
import { useSchoolStore } from "../../store/school";
import { useClassStore } from "../../store/cls";
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
const form2 = reactive({
  gradeId: "",
  className: "",
  des: "",
  classId: "",
  gradeName: "",
  schoolName: "",
});

const options3 = ref("");
const ob = reactive({});
Axios.get("/grade/getAll").then((res) => {
  options3.value = res.data;
  for (let item of res.data) {
    ob[item.gradeName] = item.gradeId;
  }
  console.log(ob);
});

const handleSizeChange = (size: number) => {
  classStore.size = size;
  console.log("切换每页数量：", classStore.size);
  classStore.search();
};

const handleCurrentChange = (page: number) => {
  classStore.page = page;
  console.log("切换页码：", classStore.page);
  classStore.search();
};

const del = (clazzId: string) => {
  ElMessageBox.confirm("确定要删除嘛？", "警告", {
    confirmButtonText: "确认",
    cancelButtonText: "取消",
    type: "warning",
  })
    .then(() => {
      Axios.delete(`/clazz/delete?clazzId=${clazzId}`).then(async (res) => {
        if (res.success == true) {
          ElMessage({
            showClose: true,
            message: res.data,
            type: "success",
          });
          await classStore.search();
        } else if (res.success == false) {
          ElMessage({
            showClose: true,
            message: res.message,
            type: "error",
          });
        }
      });
    })
    .catch(() => {
      ElMessage({
        type: "info",
        message: "删除失败",
      });
    });
};

classStore.search();
const newItem = () => {
  Axios.post("/clazz/add", {
    schoolId: form.school,
    gradeId: form.grade,
    clazzName: form.class,
    description: form.textarea,
  }).then(async (res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });
      await classStore.search();
      form.school = "";
      form.grade = "";
      form.class = "";
      form.textarea = "";
    } else if (res.success == false) {
      ElMessage({
        showClose: true,
        message: res.message,
        type: "error",
      });
    }
  });
};

const xiugai = (clazzId, clazzName, schoolName, gradeName) => {
  console.log(clazzId, clazzName, schoolName, gradeName);
  form2.className = clazzName;
  form2.classId = clazzId;
  form2.schoolName = schoolName;
  form2.gradeName = gradeName;
  console.log(form2.className);
};

const revise = () => {
  console.log(form2);
  if (form2.gradeId == undefined || form2.gradeId == "") {
    form2.gradeId = ob[form2.gradeName];
  }
  Axios.put("/clazz/update", {
    clazzId: form2.classId,
    gradeId: form2.gradeId,
    clazzName: form2.className,
    description: form2.des,
  }).then(async (res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });
      await classStore.search();
      form2.className = "";
      form2.des = "";
      form2.gradeId = "";
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
                  v-for="item in options3"
                  :key="item.gradeId"
                  :label="item.gradeName"
                  :value="item.gradeId"
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
      :data="classStore.classList"
      :cell-style="{ textAlign: 'left' }"
      :header-cell-style="{
        'text-align': 'left',
        fontWeight: 'bolder',
        color: 'black',
      }"
    >
      <!-- <el-table-column fixed prop="schoolId" label="学校" width="150" /> -->
      <el-table-column label="学校" width="auto" min-width="30%">
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
            {{ scope.row.schoolName }}
          </p>
        </template>
      </el-table-column>
      <el-table-column label="年级" width="auto" min-width="15%">
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
            {{ scope.row.gradeName }}
          </p>
        </template>
      </el-table-column>

      <el-table-column label="班级名" width="auto" min-width="15%">
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
            {{ scope.row.clazzName }}
          </p>
        </template>
      </el-table-column>
      <el-table-column label="描述" width="auto" min-width="20%">
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
            {{ scope.row.description }}
          </p>
        </template>
      </el-table-column>
      <!-- <el-table-column prop="createdAt" label="创建时间" width="240">
      </el-table-column> -->
      <el-table-column label="操作" width="auto" min-width="20%">
        <template #default="scope">
          <div style="display: flex; flex-wrap: nowrap">
            <el-button
              type="primary"
              text
              style="margin-left: -15px"
              @click="
                xiugai(
                  scope.row.clazzId,
                  scope.row.clazzName,
                  scope.row.schoolName,
                  scope.row.gradeName
                );
                dialogVisible = true;
              "
              >修改</el-button
            >

            <el-button type="danger" text @click="del(scope.row.clazzId)"
              >删除</el-button
            >
          </div>
        </template>
      </el-table-column>
    </el-table>

    <div class="page-split">
      <el-pagination
        :current-page="classStore.page"
        :page-size="classStore.size"
        :disabled="false"
        :background="true"
        layout="total, prev, pager, next, sizes"
        :total="classStore.total"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
      />
    </div>

    <el-dialog
      v-model="dialogVisible"
      title="新建班级"
      style="text-align: center; width: 500px; height: 600px"
    >
      <el-form :model="form2">
        <el-form-item>
          <span style="margin-left: 20px">所属学校：</span>
          <el-select
            v-model="form2.schoolName"
            :placeholder="form2.schoolName"
            style="width: 300px"
            disabled
          />
        </el-form-item>

        <el-form-item>
          <span style="margin-left: 48px">年级：</span>
          <el-select
            v-model="form2.gradeId"
            :placeholder="form2.gradeName"
            style="width: 300px"
          >
            <el-option
              v-for="item in options3"
              :key="item.gradeId"
              :label="item.gradeName"
              :value="item.gradeId"
            />
          </el-select>
        </el-form-item>

        <el-form-item>
          <span style="margin-left: 34px">班级名：</span>
          <el-input
            type="text"
            v-model="form2.className"
            :value="form2.className"
            style="width: 300px"
          />
        </el-form-item>

        <el-form-item>
          <span style="margin-left: 48px">描述：</span>
          <el-input
            v-model="form2.des"
            :rows="3"
            type="textarea"
            placeholder="请输入描述"
            style="width: 300px"
          />
        </el-form-item>
      </el-form>
      <template #footer #default="scope">
        <span class="dialog-footer">
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button
            type="primary"
            @click="
              dialogVisible = false;
              revise();
            "
          >
            确认
          </el-button>
        </span>
      </template>
    </el-dialog>
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
