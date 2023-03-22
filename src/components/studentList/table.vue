<script setup lang="ts">
import { ElMessage, ElMessageBox } from "element-plus";
import { ref, reactive } from "vue";
import { useStudentStore, Student } from "../../store/student";
import { useSchoolStore } from "../../store/school";
import StudentCenter from "../../views/studentCenter.vue";
const StudentStore = useStudentStore();
const SchoolStore = useSchoolStore();

// StudentStore.load()

// 切换每页显示多少条
const handleSizeChange = (val: number) => {
  StudentStore.searchStuImp.pageSize = val;
  StudentStore.search();
};

// 切换页码
const handleCurrentChange = (val: number) => {
  StudentStore.searchStuImp.pageNo = val;
  StudentStore.search();
};
console.log(StudentStore.Students);

const dialogVisible = ref(false);

const del = (stuId: string) => {
  ElMessageBox.confirm("确定要删除嘛？", "警告", {
    confirmButtonText: "确认",
    cancelButtonText: "取消",
    type: "warning",
  })
    .then(() => {
      StudentStore.delStu(stuId);
    })
    .catch(() => {
      ElMessage({
        type: "info",
        message: "删除失败",
      });
    });
};

let stuTmp: Student = reactive({
  _id: "",
  clsId: "",
  clsName: "",
  name: "",
  avatar: "",
  sex: "",
  birthday: "",
  obstacleType: "",
  placement: "",
  schoolId: "",
});

const modify = (stu: Student) => {
  dialogVisible.value = true;
  stuTmp = {
    ...stu,
  };
  console.log(stuTmp);
};
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
      :data="StudentStore.Students"
      :cell-style="{ textAlign: 'center' }"
      :header-cell-style="{ 'text-align': 'center' }"
    >
      <!-- <el-table-column fixed prop="schoolId" label="学校" width="150" /> -->
      <el-table-column label="学校" width="220">
        <template #default="scope">
          <div style="display: flex; align-items: center">
            <span style="margin-left: 10px">{{
              SchoolStore.schoolList.find(
                (o) => o.schoolId == scope.row.schoolId
              )?.schoolName
            }}</span>
          </div>
        </template>
      </el-table-column>
      <el-table-column prop="clsName" label="班级" width="120" />
      <el-table-column prop="name" label="姓名" width="70" />
      <el-table-column label="头像" width="80">
        <template #default="scope">
          <!-- <div style="display: flex; align-items: center"> -->
          <el-image
            style="width: 50px; height: 50px"
            :src="scope.row.avatar"
            fit="fill"
          />
          <!-- </div> -->
        </template>
      </el-table-column>
      <el-table-column label="性别" width="80">
        <template #default="scope">
          <!-- <div style="display: flex; align-items: center"> -->
          <span>{{
            StudentStore.Sex.find((o) => o.value == scope.row.sex)?.name
          }}</span>
          <!-- </div> -->
        </template>
      </el-table-column>
      <el-table-column prop="obstacleType" label="障碍类型" width="150" />
      <el-table-column prop="placement" label="安置方式" width="150" />
      <el-table-column label="操作">
        <template #default="scope">
          <el-button type="primary" text @click="$router.push('StudentCenter')"
            >进入主页</el-button
          >
          <el-button type="primary" @click="modify(scope.row)" text
            >修改</el-button
          >
          <el-button type="danger" @click="del(scope.row._id)" text
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>
    <div class="page-split">
      <el-pagination
        :current-page="StudentStore.searchStuImp.pageNo"
        :page-size="10"
        :page-sizes="[10, 20, 50, 100]"
        :disabled="false"
        :background="true"
        layout="total, prev, pager, next, sizes"
        :total="StudentStore.Total"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
      />
    </div>
  </el-card>

  <el-dialog v-model="dialogVisible" title="更新学生" width="30%" draggable>
    <el-form
      ref="ruleFormRef"
      label-width="120px"
      class="demo-ruleForm"
      status-icon
    >
      <el-form-item label="所属学校" prop="region">
        <el-select placeholder="所属学校">
          <el-option
            label="苏州市相城区特殊教育学校"
            value="苏州市相城区特殊教育学校"
          />
          <el-option
            label="苏州信息职业技术学院"
            value="苏州信息职业技术学院"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="班级" prop="region">
        <el-select placeholder="班级">
          <el-option label="六年级" value="六年级" />
          <el-option label="五年级" value="五年级" />
        </el-select>
      </el-form-item>
      <el-form-item label="性别" prop="region">
        <el-select placeholder="性别">
          <el-option label="男" value="女" />
          <el-option label="男" value="女" />
        </el-select>
      </el-form-item>
      <el-form-item label="Activity time" required>
        <el-col :span="11">
          <el-form-item prop="date1">
            <el-date-picker
              type="date"
              label="Pick a date"
              placeholder="Pick a date"
              style="width: 100%"
            />
          </el-form-item>
        </el-col>
      </el-form-item>

      <el-form-item label=" " prop="region">
        <el-select placeholder="性别">
          <el-option label="男" value="女" />
          <el-option label="男" value="女" />
        </el-select>
      </el-form-item>
    </el-form>
    <template #footer>
      <span class="dialog-footer">
        <el-button @click="dialogVisible = false">Cancel</el-button>
        <el-button type="primary" @click="dialogVisible = false">
          Confirm
        </el-button>
      </span>
    </template>
  </el-dialog>
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
