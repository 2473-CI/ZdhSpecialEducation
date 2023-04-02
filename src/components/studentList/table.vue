<script setup lang="ts">
import { storeToRefs } from "pinia";
import { ElMessage, ElMessageBox } from "element-plus";
import { ref, reactive } from "vue";
import { useStudentStore } from "../../store/student";

import Axios from "../../request/index";

const { studentList } = storeToRefs(useStudentStore());
const StudentStore = useStudentStore();
const { search } = useStudentStore();

const handleSizeChange = (size: number) => {
  StudentStore.size = size;
  console.log("切换每页数量：", StudentStore.size);
  search();
};

const handleCurrentChange = (page: number) => {
  StudentStore.page = page;
  console.log("切换页码：", StudentStore.page);
  search();
};

const addX = (
  name: string,
  studentHead: string,
  schoolName: string,
  clazzName: string,
  studentGender: string,
  obstacleName: string,
  studentId: string
) => {
  StudentStore.studentQuery.name = name;
  StudentStore.studentQuery.headUrl = studentHead;
  StudentStore.studentQuery.schoolName = schoolName;
  StudentStore.studentQuery.className = clazzName;
  StudentStore.studentQuery.sex = studentGender;
  StudentStore.studentQuery.obstacle = obstacleName;
  StudentStore.studentQuery.studentId = studentId;
  console.log(StudentStore.studentQuery);
  StudentStore.getStorage();
};

const dialogFormVisible = ref(false);

// const studentList = ref([]);
// const getAllList = () => {
//   Axios.get("/student/getAll").then((res) => {
//     studentList.value = res.data;
//   });
// };

const form = reactive({
  school: "",
  class: "",
  name: "",
  head: "",
  sex: "",
  pro: "",
  avge: "",
});

search();

console.log(studentList);
// getAllList();
// StudentStore.load();

const dialogVisible = ref(false);

const del = (stuId: string) => {
  ElMessageBox.confirm("确定要删除嘛？", "警告", {
    confirmButtonText: "确认",
    cancelButtonText: "取消",
    type: "warning",
  })
    .then(() => {
      Axios.delete(`/student/delete?studentId=${stuId}`).then(async (res) => {
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
    })
    .catch(() => {
      ElMessage({
        type: "info",
        message: "删除失败",
      });
    });
};

const change = () => {
  if (form.sex == "男") {
    form.head = "https://static.yirenyian.com/opoc/sysImg/avatar-boy.png";
  } else if (form.sex == "女") {
    form.head = "https://static.yirenyian.com/opoc/sysImg/avatar-girl.png";
  }
};

const options = ref([]);
Axios.get("/school/getAll").then((res) => {
  options.value = res.data;
});

const options2 = ref([]);
Axios.get("/clazz/getAll").then((res) => {
  options2.value = res.data;
});

const options3 = ref([]);
Axios.get("/obstacle/getAll").then((res) => {
  options3.value = res.data;
});

const options4 = ref([]);
Axios.get("/arrange/getAll").then((res) => {
  options4.value = res.data;
});

const newItem = () => {
  Axios.post("/student/add", {
    schoolId: form.school,
    clazzId: form.class,
    studentName: form.name,
    studentHead: form.head,
    studentGender: form.sex,
    obstacleId: form.pro,
    arrangeId: form.avge,
  }).then(async (res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });
      await search();
      form.school = "";
      form.class = "";
      form.name = "";
      form.head = "";
      form.sex = "";
      form.pro = "";
      form.avge = "";
    } else if (res.success == false) {
      ElMessage({
        showClose: true,
        message: res.message,
        type: "error",
      });
      form.school = "";
      form.class = "";
      form.name = "";
      form.head = "";
      form.sex = "";
      form.pro = "";
      form.avge = "";
    }
  });
};
const dialogrevFormVisible = ref(false);
const reviseForm = reactive({
  schoolName: "",
  clazzId: "",
  studentName: "",
  studentHead: "",
  studentGender: "",
  obstacleId: "",
  arrangeId: "",
  studentId: "",
});

const stuId = ref("");
const giveInfo = (
  id: string,
  schoolName: string,
  className: string,
  studentName: string,
  gender: string,
  ob: string,
  arrange: string
) => {
  stuId.value = id;
  reviseForm.schoolName = schoolName;
  reviseForm.clazzId = className;
  reviseForm.studentName = studentName;
  reviseForm.studentGender = gender;
  reviseForm.obstacleId = ob;
  reviseForm.arrangeId = arrange;
  console.log(ob, arrange);
};

const revItem = () => {
  reviseForm.studentId = stuId.value;
  console.log(options3.value);
  console.log(reviseForm.arrangeId);

  let res = options2.value.filter((o) => o.clazzName == reviseForm.clazzId);
  if (res.length > 0) {
    reviseForm.clazzId = res[0].clazzId;
  }

  let res1 = options4.value.filter(
    (o) => o.arrangeName == reviseForm.arrangeId
  );
  if (res1.length > 0) {
    reviseForm.arrangeId = res1[0].arrangeId;
  }

  let res2 = options3.value.filter(
    (o) => o.obstacleName == reviseForm.obstacleId
  );
  if (res2.length > 0) {
    reviseForm.obstacleId = res2[0].obstacleId;
  }

  Axios.put("/student/update", reviseForm).then(async (res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });
      await search();
      reviseForm.schoolName = "";
      reviseForm.clazzId = "";
      reviseForm.studentName = "";
      reviseForm.studentHead = "";
      reviseForm.studentGender = "";
      reviseForm.obstacleId = "";
      reviseForm.arrangeId = "";
    } else if (res.success == false) {
      ElMessage({
        showClose: true,
        message: res.message,
        type: "error",
      });
      reviseForm.schoolName = "";
      reviseForm.clazzId = "";
      reviseForm.studentName = "";
      reviseForm.studentHead = "";
      reviseForm.studentGender = "";
      reviseForm.obstacleName = "";
      reviseForm.arrangeName = "";
    }
  });
};

const change2 = () => {
  if (reviseForm.studentGender == "男") {
    reviseForm.studentHead =
      "https://static.yirenyian.com/opoc/sysImg/avatar-boy.png";
  } else if (reviseForm.studentGender == "女") {
    reviseForm.studentHead =
      "https://static.yirenyian.com/opoc/sysImg/avatar-girl.png";
  }
};
</script>

<template>
  <el-card class="box-card">
    <template #header>
      <div class="card-header">
        <!-- <span>Card name</span> -->
        <el-button
          class="button"
          style="background-color: #1677ff; color: #fff"
          text
          @click="dialogFormVisible = true"
          >+新建</el-button
        >
        <!-- 新增 -->
        <el-dialog
          v-model="dialogFormVisible"
          title="新增学生"
          style="text-align: center; height: 600px; width: 500px"
        >
          <el-form :model="form" style="margin-left: 15px">
            <el-form-item>
              <span>学校名称：</span>
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
              <span style="margin-left: 28px">班级：</span>
              <el-select
                v-model="form.class"
                placeholder="请选择班级"
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
              <span style="margin-left: 28px"> 姓名： </span>
              <el-input
                v-model="form.name"
                style="width: 300px"
                placeholder="请填写姓名"
              />
            </el-form-item>

            <el-form-item>
              <span style="margin-left: 28px"> 头像： </span>
              <img
                :src="form.head"
                style="height: 30px; width: 30px; border-radius: 50px"
              />
            </el-form-item>

            <el-form-item>
              <span slot="label" style="margin-left: 28px"> 性别： </span>
              <el-radio-group
                v-model="form.sex"
                class="ml-4"
                :change="change()"
              >
                <el-radio label="男" size="large">男</el-radio>
                <el-radio label="女" size="large">女</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-form>

          <el-form-item>
            <span style="margin-left: 15px">障碍类型：</span>
            <el-select
              v-model="form.pro"
              placeholder="请选择障碍类型"
              style="width: 300px"
            >
              <el-option
                v-for="item in options3"
                :key="item.obstacleId"
                :label="item.obstacleName"
                :value="item.obstacleId"
              />
            </el-select>
          </el-form-item>

          <el-form-item>
            <span style="margin-left: 15px">放置方式：</span>
            <el-select
              v-model="form.avge"
              placeholder="请选择放置方式"
              style="width: 300px"
            >
              <el-option
                v-for="item in options4"
                :key="item.arrangeId"
                :label="item.arrangeName"
                :value="item.arrangeId"
              />
            </el-select>
          </el-form-item>

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
      :data="studentList"
      :cell-style="{ textAlign: 'left' }"
      :header-cell-style="{
        'text-align': 'left',
        color: 'black',
        fontWeight: 'bolder',
      }"
    >
      <!-- <el-table-column fixed prop="schoolId" label="学校" width="150" /> -->
      <el-table-column
        label="学校"
        width="auto"
        min-width="20%"
        prop="schoolName"
      >
      </el-table-column>
      <el-table-column
        prop="clazzName"
        label="班级"
        width="auto"
        min-width="10%"
      />
      <el-table-column
        prop="studentName"
        label="姓名"
        width="auto"
        min-width=" 10%"
      />
      <el-table-column label="头像" width="auto" min-width="10%">
        <template #default="scope">
          <!-- <div style="display: flex; align-items: center"> -->
          <el-image
            style="width: 70%; height: 70%"
            :src="scope.row.studentHead"
            fit="fill"
          />
          <!-- </div> -->
        </template>
      </el-table-column>
      <el-table-column
        label="性别"
        width="auto"
        min-width="10%"
        prop="studentGender"
      >
      </el-table-column>
      <el-table-column
        prop="obstacleName"
        label="障碍类型"
        width="auto"
        min-width="15%"
      />
      <el-table-column
        prop="arrangeName"
        label="安置方式"
        width="auto"
        min-width="15%"
      />
      <el-table-column
        label="操作"
        width="auto"
        min-width="25%"
        style="word-wrap: nowrap"
      >
        <template #default="scope">
          <div style="display: flex; flex-wrap: nowrap">
            <el-button
              type="primary"
              text
              style="width: 30%"
              @click="
                $router.push('StudentCenter'),
                  addX(
                    scope.row.studentName,
                    scope.row.studentHead,
                    scope.row.schoolName,
                    scope.row.clazzName,
                    scope.row.studentGender,
                    scope.row.obstacleName,
                    scope.row.studentId
                  )
              "
              >进入主页</el-button
            >
            <el-button
              type="primary"
              text
              style="width: 30%"
              @click="
                (dialogrevFormVisible = true),
                  giveInfo(
                    scope.row.studentId,
                    scope.row.schoolName,
                    scope.row.clazzName,
                    scope.row.studentName,
                    scope.row.studentGender,
                    scope.row.obstacleName,
                    scope.row.arrangeName
                  )
              "
              >修改</el-button
            >

            <el-button
              type="danger"
              style="width: 30%"
              @click="del(scope.row.studentId)"
              text
              >删除</el-button
            >
          </div>
        </template>
      </el-table-column>
    </el-table>

    <el-dialog
      v-model="dialogrevFormVisible"
      title="修改学生"
      style="text-align: center; height: 600px; width: 500px"
    >
      <el-form :model="reviseForm" style="margin-left: 15px">
        <el-form-item>
          <span>学校名称：</span>
          <el-select
            v-model="reviseForm.schoolName"
            :placeholder="reviseForm.schoolName"
            style="width: 300px"
            disabled
          >
          </el-select>
        </el-form-item>

        <el-form-item>
          <span style="margin-left: 28px">班级：</span>
          <el-select
            v-model="reviseForm.clazzId"
            placeholder="请选择班级"
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
          <span style="margin-left: 28px"> 姓名： </span>
          <el-input
            v-model="reviseForm.studentName"
            style="width: 300px"
            placeholder="请填写姓名"
          />
        </el-form-item>

        <el-form-item>
          <span style="margin-left: 28px"> 头像： </span>
          <img
            :src="reviseForm.studentHead"
            style="height: 30px; width: 30px; border-radius: 50px"
          />
        </el-form-item>

        <el-form-item>
          <span slot="label" style="margin-left: 28px"> 性别： </span>
          <el-radio-group
            v-model="reviseForm.studentGender"
            class="ml-4"
            :change="change2()"
          >
            <el-radio label="男" size="large">男</el-radio>
            <el-radio label="女" size="large">女</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>

      <el-form-item>
        <span style="margin-left: 15px">障碍类型：</span>
        <el-select
          v-model="reviseForm.obstacleId"
          placeholder="请选择障碍类型"
          style="width: 300px"
        >
          <el-option
            v-for="item in options3"
            :key="item.obstacleId"
            :label="item.obstacleName"
            :value="item.obstacleId"
          />
        </el-select>
      </el-form-item>

      <el-form-item>
        <span style="margin-left: 15px">放置方式：</span>
        <el-select
          v-model="reviseForm.arrangeId"
          placeholder="请选择放置方式"
          style="width: 300px"
        >
          <el-option
            v-for="item in options4"
            :key="item.arrangeId"
            :label="item.arrangeName"
            :value="item.arrangeId"
          />
        </el-select>
      </el-form-item>

      <template #footer>
        <span class="dialog-footer">
          <el-button @click="dialogrevFormVisible = false">取消</el-button>
          <el-button
            type="primary"
            @click="
              dialogrevFormVisible = false;
              revItem();
            "
          >
            确认
          </el-button>
        </span>
      </template>
    </el-dialog>
    <div class="page-split">
      <el-pagination
        :current-page="StudentStore.page"
        :page-size="StudentStore.size"
        :disabled="false"
        :background="true"
        layout="total, prev, pager, next, sizes"
        :total="StudentStore.total"
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
</style>
