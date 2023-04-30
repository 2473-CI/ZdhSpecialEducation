<script setup>
import { ref, reactive, watch } from "vue";
import { ElMessage, ElMessageBox } from "element-plus";
import Axios from "../request/index";

const isExpansion = ref(false);
const dialogFormVisible = ref(false);
const dialogrevFormVisible = ref(false);
const options = ref("");
const getSch = () => {
  Axios.get("/school/getAll").then((res) => {
    options.value = res.data;
  });
};
getSch();
const form = reactive({
  school: "",
  province: "",
  city: "",
  region: "",
});
const ob = reactive({});
const dic = reactive({});

const options2 = ref("");
const addOb = reactive({ province: [], city: [], region: [] });
Axios.get("/region/getAll").then((res) => {
  options2.value = res.data;
  for (let item of res.data) {
    ob[item["provinceCode"]] = item["provinceName"];
    ob[item["cityCode"]] = item["cityName"];
    ob[item["regionCode"]] = item["regionName"];
  }
  addOb.province = Object.keys(ob)
    .filter((name) => name.slice(2, 6) == "0000")
    .map((name) => {
      return { value: name, name: ob[name] };
    });
  console.log(addOb.province);
});
const changeProvince = (val) => {
  addOb.city = Object.keys(ob)
    .filter(
      (name) =>
        name.slice(2, 6) != "0000" &&
        name.slice(4, 6) == "00" &&
        name.slice(0, 2) == val.toString().slice(0, 2)
    )
    .map((name) => {
      return { value: name, name: ob[name] };
    });
};
const changeCity = (val) => {
  addOb.region = Object.keys(ob)
    .filter(
      (name) =>
        name.slice(4, 6) != "00" &&
        name.slice(0, 4) == val.toString().slice(0, 4)
    )
    .map((name) => {
      return { value: name, name: ob[name] };
    });
  console.log(addOb.region);
};
const newItem = () => {
  Axios.post("/school/add", {
    schoolName: form.school,
    provinceCode: form.province,
    cityCode: form.city,
    regionCode: form.region,
  }).then(async (res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });
      await getSch();
      form.school = "";
      form.province = "";
      form.city = "";
      form.region = "";
    } else if (res.success == false) {
      ElMessage({
        showClose: true,
        message: res.message,
        type: "error",
      });
    }
  });
};
const del = (schoolId) => {
  Axios.delete(`/school/delete?schoolId=${schoolId}`).then(async (res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });
      await getSch();
    } else if (res.success == false) {
      ElMessage({
        showClose: true,
        message: res.message,
        type: "error",
      });
    }
  });
};

const handleClose = (schoolId) => {
  ElMessageBox.confirm("确认要删除该学校吗?")
    .then(async (a) => {
      if (a == "confirm") {
        await del(schoolId);
        close();
      } else {
        close();
      }
    })
    .catch(() => {
      // catch error
    });
};

const revform = reactive({
  school: "",
  province: "",
  city: "",
  region: "",
});

const revise = (id, name, province, city, region) => {
  console.log(id, name, province, city, region);
  revform.school = name;
  revform.province = ob[province];
  revform.city = ob[city];
  revform.region = ob[region];
};

const revItem = () => {
  let arr = Object.keys(ob).map((k) => {
    return {
      name: ob[k],
      num: k,
    };
  });
  console.log(arr);
  let res = arr.filter((o) => o.name == revform.province);

  if (res.length > 0) {
    revform.province = res[0].num;
  }
  let res2 = arr.filter((o) => o.name == revform.city);
  if (res2.length > 0) {
    revform.city = res2[0].num;
  }
  let res3 = arr.filter((o) => o.name == revform.region);
  if (res3.length > 0) {
    revform.region = res3[0].num;
  }

  console.log(arr);
  console.log(revform);
};
</script>
<template>
  <div style="padding: 1%">
    <!-- <el-card class="box-card">
      <el-form :inline="true" class="all-form">
        <el-form-item label="学校">
          <el-select placeholder="请选择">
            <el-option
              :label="school.schoolName"
              :value="school.schoolId"
              :key="school.schoolId"
              v-for="school in options"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="年级">
          <el-select placeholder="请选择">
            <el-option
              :label="grade.gradeName"
              :value="grade.gradeId"
              :key="grade.gradeId"
              v-for="grade in options2"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="班级名" v-show="isExpansion">
          <el-input placeholder="请输入" />
        </el-form-item>

        <el-form-item class="right-bottom">
          <el-button>重置</el-button>
          <el-button type="primary">查询</el-button>
          <el-button @click="isExpansion = !isExpansion">
            <span v-show="isExpansion">收起</span>
            <span v-show="!isExpansion">展开</span>
          </el-button>
        </el-form-item>
      </el-form>
    </el-card> -->

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
            title="添加学校"
            style="text-align: center; width: 500px; height: 600px"
          >
            <el-form :model="form">
              <el-form-item>
                <span style="margin-left: 40px">学校：</span>
                <el-input
                  v-model="form.school"
                  style="width: 300px"
                  placeholder="请填写学校"
                />
              </el-form-item>

              <el-form-item>
                <span style="margin-left: 40px">省份：</span>
                <el-select
                  v-model="form.province"
                  placeholder="请选择省份"
                  style="width: 300px"
                  @change="changeProvince"
                >
                  <el-option
                    v-for="item in addOb.province"
                    :key="item.name"
                    :label="item.name"
                    :value="item.value"
                  />
                </el-select>
              </el-form-item>

              <el-form-item v-if="addOb.city.length != 0">
                <span style="margin-left: 54px">市：</span>
                <el-select
                  v-model="form.city"
                  placeholder="请选择市"
                  style="width: 300px"
                  @change="changeCity"
                >
                  <el-option
                    v-for="item in addOb.city"
                    :key="item.name"
                    :label="item.name"
                    :value="item.value"
                  />
                </el-select>
              </el-form-item>

              <el-form-item v-if="addOb.region.length != 0">
                <span style="margin-left: 54px">区：</span>
                <el-select
                  v-model="form.region"
                  placeholder="请选择区"
                  style="width: 300px"
                >
                  <el-option
                    v-for="item in addOb.region"
                    :key="item.value"
                    :label="item.name"
                    :value="item.value"
                  />
                </el-select>
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

          <!-- <el-button class="button" text>导入</el-button>
          <el-button class="button" text>下载模板</el-button> -->
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
        <el-table-column label="学校名称" width="auto" min-width="30%">
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
              {{ scope.row.schoolName }}
            </p>
          </template>
        </el-table-column>
        <el-table-column label="省份" width="auto" min-width="20%">
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
              {{ ob[scope.row.provinceCode] }}
            </p>
          </template>
        </el-table-column>
        <el-table-column label="市" width="auto" min-width="20%">
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
              {{ ob[scope.row.cityCode] }}
            </p>
          </template>
        </el-table-column>
        <el-table-column label="区" width="auto" min-width="20%">
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
              {{ ob[scope.row.regionCode] }}
            </p>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="auto" min-width="10%">
          <template #default="scope">
            <el-button
              type="danger"
              text
              style="margin-left: -15px"
              @click="
                dialogrevFormVisible = true;
                revise(
                  scope.row.schoolId,
                  scope.row.schoolName,
                  scope.row.provinceCode,
                  scope.row.cityCode,
                  scope.row.regionCode
                );
              "
              >修改</el-button
            >

            <el-button
              type="danger"
              text
              style="margin-left: -15px"
              @click="handleClose(scope.row.schoolId)"
              >删除</el-button
            >
          </template>
        </el-table-column>
      </el-table>
    </el-card>
    <el-dialog
      v-model="dialogrevFormVisible"
      title="修改学校"
      style="text-align: center; width: 500px; height: 600px"
    >
      <el-form :model="revform">
        <el-form-item>
          <span style="margin-left: 40px">学校：</span>
          <el-input
            v-model="revform.school"
            style="width: 300px"
            :placeholder="revform.school"
          />
        </el-form-item>

        <el-form-item>
          <span style="margin-left: 40px">省份：</span>
          <el-select
            v-model="revform.province"
            placeholder="请选择省份"
            style="width: 300px"
            @change="changeProvince"
          >
            <el-option
              v-for="item in addOb.province"
              :key="item.name"
              :label="item.name"
              :value="item.value"
            />
          </el-select>
        </el-form-item>

        <el-form-item>
          <span style="margin-left: 54px">市：</span>
          <el-select
            v-model="revform.city"
            placeholder="请选择市"
            style="width: 300px"
            @change="changeCity"
          >
            <el-option
              v-for="item in addOb.city"
              :key="item.name"
              :label="item.name"
              :value="item.value"
            />
          </el-select>
        </el-form-item>

        <el-form-item>
          <span style="margin-left: 54px">区：</span>
          <el-select
            v-model="revform.region"
            placeholder="请选择区"
            style="width: 300px"
          >
            <el-option
              v-for="item in addOb.region"
              :key="item.value"
              :label="item.name"
              :value="item.value"
            />
          </el-select>
        </el-form-item>
      </el-form>
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
  </div>
</template>

<style>
.all-form {
  position: relative;
}
.right-bottom {
  position: absolute;
  right: 0px;
}
</style>
