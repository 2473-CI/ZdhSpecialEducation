<script setup>
import { ref, reactive } from "vue";
import { ElMessage, ElMessageBox } from "element-plus";
import Axios from "../request/index";

const dialogFormVisible = ref(false);
const dialogrevFormVisible = ref(false);
const options = ref([]);
const schoolList = ref([]);
const province = ref("");
const city = ref("");
const province2 = ref("");
const city2 = ref("");
const provinceList = ref([]);
const cityList = ref([]);
const regionList = ref([]);

const form = reactive({
  regionId: "",
  committeeName: "",
  committeeAddress: "",
  committeeResponsible: "",
  committeePhone: "",
  committeeCreateTime: "",
  introduction: "",
  subordinateCenter: "",
});

const form2 = reactive({
  regionId: "",
  committeeName: "",
  committeeAddress: "",
  committeeResponsible: "",
  committeePhone: "",
  committeeCreateTime: "",
  introduction: "",
  subordinateCenter: "",
});

Axios.get("/region/select?").then((res) => {
  console.log(res);
  provinceList.value = JSON.parse(JSON.stringify(res.data));
});

const changePro = () => {
  if (province.value) {
    Axios.get(`/region/select?provinceCode=${province.value}`).then((res) => {
      cityList.value = JSON.parse(JSON.stringify(res.data));
    });
  } else if (province2.value) {
    Axios.get(`/region/select?provinceCode=${province2.value}`).then((res) => {
      cityList.value = JSON.parse(JSON.stringify(res.data));
    });
  }
};

const changeCity = () => {
  if (city.value) {
    Axios.get(`/region/select?cityCode=${city.value}`).then((res) => {
      regionList.value = JSON.parse(JSON.stringify(res.data));
    });
  } else if (city2.value) {
    Axios.get(`/region/select?cityCode=${city2.value}`).then((res) => {
      regionList.value = JSON.parse(JSON.stringify(res.data));
    });
  }
};

Axios.get("/committee/").then((res) => {
  options.value = res.data;
  options.value.forEach((item, index) => {
    Axios.get(`/region/getOneMess?regionCode=${item.regionId}`).then((r) => {
      options.value[index] = { ...item, ...r.data };
    });
  });
  console.log(options.value);
});

const dic = reactive({});
Axios.get("/school/getAll").then((res) => {
  console.log(res);
  schoolList.value = res.data;
  for (let item of res.data) {
    dic[item["schoolId"]] = item["schoolName"];
  }
});

const newItem = () => {
  Axios.post("/committee/add", form).then(async (res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });
      await Axios.get("/committee/").then((res) => {
        options.value = res.data;
        options.value.forEach((item, index) => {
          Axios.get(`/region/getOneMess?regionCode=${item.regionId}`).then(
            (r) => {
              options.value[index] = { ...item, ...r.data };
            }
          );
        });
        console.log(options.value);
      });

      form.regionId = "";
      form.committeeName = "";
      form.committeeAddress = "";
      form.committeeResponsible = "";
      form.committeePhone = "";
      form.committeeCreateTime = "";
      form.introduction = "";
      form.subordinateCenter = "";
      province.value = "";
      city.value = "";
    } else if (res.success == false) {
      ElMessage({
        showClose: true,
        message: res.message,
        type: "error",
      });
    }
  });
};

const rName = ref("");
const revise = (index) => {
  Axios.get("/committee/").then((res) => {
    for (let item of Object.keys(res.data[index])) {
      form2[item] = res.data[index][item];
    }
    form2["provinceCode"] = (form2["regionId"] / 10000).toFixed(0) * 10000;
    form2["cityCode"] = (form2["regionId"] / 100).toFixed(0) * 100;
    Axios.get(`/region/select?provinceCode=${form2["provinceCode"]}`).then(
      (res) => {
        cityList.value = JSON.parse(JSON.stringify(res.data));
      }
    );
    form2["regionId"] = form2["regionId"] + "";
    form2["provinceCode"] = form2["provinceCode"] + "";
    form2["cityCode"] = form2["cityCode"] + "";

    rName.value = form2.regionId;
    Axios.get(`/region/select?cityCode=${form2["cityCode"]}`).then((res) => {
      regionList.value = JSON.parse(JSON.stringify(res.data));
      for (let item of regionList.value) {
        console.log(item);
        if (form2.regionId == item.regionCode) {
          form2.regionId = item.regionName;
        }
      }
    });
    changeCity();
    console.log(form2);
    console.log(rName.value);
  });
};

const del = (id) => {
  Axios.delete("/committee/delete", { data: { regionId: id } }).then((res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });
      Axios.get("/committee/").then((res) => {
        options.value = res.data;
        options.value.forEach((item, index) => {
          Axios.get(`/region/getOneMess?regionCode=${item.regionId}`).then(
            (r) => {
              options.value[index] = { ...item, ...r.data };
            }
          );
        });
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
  ElMessageBox.confirm("确认要删除吗?")
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

const revItem = () => {
  form2.regionId = rName.value;
  Axios.put("/committee/update", form2).then(async (res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });
      await Axios.get("/committee/").then((res) => {
        options.value = res.data;
        options.value.forEach((item, index) => {
          Axios.get(`/region/getOneMess?regionCode=${item.regionId}`).then(
            (r) => {
              options.value[index] = { ...item, ...r.data };
            }
          );
        });
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
            title="添加委员会"
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
                <span style="margin-left: 55px">省：</span>
                <el-select
                  v-model="province"
                  placeholder="请选择省"
                  style="width: 300px"
                  @change="changePro()"
                >
                  <el-option
                    v-for="item in provinceList"
                    :key="item.provinceCode"
                    :label="item.provinceName"
                    :value="item.provinceCode"
                  />
                </el-select>
              </el-form-item>
              <el-form-item>
                <span style="margin-left: 55px">市：</span>
                <el-select
                  v-model="city"
                  placeholder="请选择市"
                  style="width: 300px"
                  @change="changeCity()"
                >
                  <el-option
                    v-for="item in cityList"
                    :key="item.cityCode"
                    :label="item.cityName"
                    :value="item.cityCode"
                  />
                </el-select>
              </el-form-item>
              <el-form-item>
                <span style="margin-left: 55px">区：</span>
                <el-select
                  v-model="form.regionId"
                  placeholder="请选择区"
                  style="width: 300px"
                >
                  <el-option
                    v-for="item in regionList"
                    :key="item.regionCode"
                    :label="item.regionName"
                    :value="item.regionCode"
                  />
                </el-select>
              </el-form-item>
              <el-form-item>
                <span style="margin-left: 0px">委员会名称：</span>
                <el-input
                  style="width: 300px"
                  v-model="form.committeeName"
                  placeholder="请填写名称"
                />
              </el-form-item>
              <el-form-item>
                <span style="margin-left: 43px">地址：</span>
                <el-input
                  style="width: 300px"
                  v-model="form.committeeAddress"
                  placeholder="请填写地址"
                />
              </el-form-item>
              <el-form-item>
                <span style="margin-left: 29px">负责人：</span>
                <el-input
                  style="width: 300px"
                  v-model="form.committeeResponsible"
                  placeholder="请填写负责人"
                />
              </el-form-item>
              <el-form-item>
                <span style="margin-left: 15px">联系方式：</span>
                <el-input
                  style="width: 300px"
                  v-model="form.committeePhone"
                  placeholder="请填写联系方式"
                />
              </el-form-item>
              <el-form-item>
                <span style="margin-left: 15px">创建时间：</span>
                <el-date-picker
                  style="width: 300px"
                  v-model="form.committeeCreateTime"
                  type="date"
                  placeholder="请选择日期"
                  :size="size"
                />
              </el-form-item>
              <el-form-item>
                <span style="margin-left: 42px">简介：</span>
                <el-input
                  style="width: 300px"
                  v-model="form.introduction"
                  :rows="2"
                  type="textarea"
                  placeholder="请输入简介"
                  resize="none"
                />
              </el-form-item>
              <el-form-item>
                <span style="margin-left: 15px">特教中心：</span>
                <el-select
                  v-model="form.subordinateCenter"
                  placeholder="请选择下属特教中心"
                  style="width: 300px"
                >
                  <el-option
                    v-for="item in schoolList"
                    :key="item.schoolId"
                    :label="item.schoolName"
                    :value="item.schoolId"
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
        <el-table-column label="委员会名称" width="auto" min-width="12%">
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
              {{ scope.row.committeeName }}
            </p>
          </template>
        </el-table-column>
        <el-table-column label="地区" width="auto" min-width="11%">
          <template #default="scope">
            <p
              style="
                display: -webkit-box;
                -webkit-box-orient: vertical;
                -webkit-line-clamp: 2;
                overflow: hidden;
                text-overflow: ellipsis;
              "
              v-show="scope.row.provinceName"
            >
              {{ scope.row.provinceName }}/{{ scope.row.cityName }}/{{
                scope.row.regionName
              }}
            </p>
          </template>
        </el-table-column>
        <el-table-column label="委员会地址" width="auto" min-width="11%">
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
              {{ scope.row.committeeAddress }}
            </p>
          </template>
        </el-table-column>
        <el-table-column label="委员会负责人" width="auto" min-width="10%">
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
              {{ scope.row.committeeResponsible }}
            </p>
          </template>
        </el-table-column>
        <el-table-column label="委员会联系方式" width="auto" min-width="11%">
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
              {{ scope.row.committeePhone }}
            </p>
          </template>
        </el-table-column>
        <el-table-column label="创建时间" width="auto" min-width="10%">
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
              {{ scope.row.committeeCreateTime }}
            </p>
          </template>
        </el-table-column>
        <el-table-column label="简介" width="auto" min-width="11%">
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
              {{ scope.row.introduction }}
            </p>
          </template>
        </el-table-column>
        <el-table-column label="下属特教中心" width="auto" min-width="11%">
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
              {{ dic[scope.row.subordinateCenter] }}
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
                dialogrevFormVisible = true;
                revise(scope.$index);
              "
              >修改</el-button
            >

            <el-button
              type="danger"
              text
              style="margin-left: -15px"
              @click="handleClose(scope.row.regionId)"
              >删除</el-button
            >
          </template>
        </el-table-column>
      </el-table>
    </el-card>
    <el-dialog
      v-model="dialogrevFormVisible"
      title="添加委员会"
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
          <span style="margin-left: 55px">省：</span>
          <el-select
            v-model="form2.provinceCode"
            placeholder="请选择省"
            style="width: 300px"
            @change="changePro()"
            disabled
          >
            <el-option
              v-for="item in provinceList"
              :key="item.provinceCode"
              :label="item.provinceName"
              :value="item.provinceCode"
            />
          </el-select>
        </el-form-item>
        <el-form-item>
          <span style="margin-left: 55px">市：</span>
          <el-select
            disabled
            v-model="form2.cityCode"
            placeholder="请选择市"
            style="width: 300px"
            @change="changeCity()"
          >
            <el-option
              v-for="item in cityList"
              :key="item.cityCode"
              :label="item.cityName"
              :value="item.cityCode"
            />
          </el-select>
        </el-form-item>
        <el-form-item>
          <span style="margin-left: 55px">区：</span>
          <el-select
            disabled
            v-model="form2.regionId"
            placeholder="请选择区"
            style="width: 300px"
          >
            <el-option
              v-for="item in regionList"
              :key="item.regionCode"
              :label="item.regionName"
              :value="item.regionCode"
            />
          </el-select>
        </el-form-item>
        <el-form-item>
          <span style="margin-left: 42px">名称：</span>
          <el-input
            style="width: 300px"
            v-model="form2.committeeName"
            placeholder="请填写名称"
          />
        </el-form-item>
        <el-form-item>
          <span style="margin-left: 43px">地址：</span>
          <el-input
            style="width: 300px"
            v-model="form2.committeeAddress"
            placeholder="请填写地址"
          />
        </el-form-item>
        <el-form-item>
          <span style="margin-left: 29px">负责人：</span>
          <el-input
            style="width: 300px"
            v-model="form2.committeeResponsible"
            placeholder="请填写负责人"
          />
        </el-form-item>
        <el-form-item>
          <span style="margin-left: 15px">联系方式：</span>
          <el-input
            style="width: 300px"
            v-model="form2.committeePhone"
            placeholder="请填写联系方式"
          />
        </el-form-item>
        <el-form-item>
          <span style="margin-left: 15px">创建时间：</span>
          <el-date-picker
            style="width: 300px"
            v-model="form2.committeeCreateTime"
            type="date"
            placeholder="请选择日期"
            :size="size"
          />
        </el-form-item>
        <el-form-item>
          <span style="margin-left: 42px">简介：</span>
          <el-input
            style="width: 300px"
            v-model="form2.introduction"
            :rows="2"
            type="textarea"
            placeholder="请输入简介"
            resize="none"
          />
        </el-form-item>
        <el-form-item>
          <span style="margin-left: 15px">特教中心：</span>
          <el-select
            v-model="form2.subordinateCenter"
            placeholder="请选择下属特教中心"
            style="width: 300px"
          >
            <el-option
              v-for="item in schoolList"
              :key="item.schoolId"
              :label="item.schoolName"
              :value="item.schoolId"
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

<style scoped></style>
