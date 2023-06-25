<script setup>
import { ref, reactive, getCurrentInstance, toRefs, defineProps } from "vue";
import { House } from "@element-plus/icons-vue";

import Axios from "../request/index.js";
import { asBlob } from "html-docx-js-typescript";
import { saveAs } from "file-saver";
import allWord from "../components/exer/allWord.vue";
import stAction from "../components/stAction.vue";
import myEditor from "../components/editor/myEditor.vue";
import { ElMessage, ElMessageBox } from "element-plus";

const showBtn = ref(true);
Axios.get("/user/getRole").then((res) => {
  console.log(res);
  if (res.data == "学生") {
    showBtn.value = false;
  }
});

const showEditor = ref(false);
const showSecond = ref(false);
const activeName = ref("second");
const specialLession = reactive({
  startYear: "",
  lastYear: "",
  semester: "",
  studentName: JSON.parse(localStorage.getItem("sq")).name,
  teacherName: "",
  basicArea: "",
  gbArea: "",
  targetArea: "",
  psychologyArea: "",
  advantageArea: "",
  defectArea: "",
});
const planForm = reactive({
  height: "",
  weight: "",
  leftEyes: "",
  rightEyes: "",
  radio: "",
  perception: "",
  action: "",
  language: "",
  cognition: "",
  socialize: "",
  life: "",
  emotion: "",
  advantage: "",
  defect: "",
  startYear: "",
  lastYear: "",
  semester: "",
});
const schoolHome = reactive({
  startYear: "",
  lastYear: "",
  semester: "",
  studentName: JSON.parse(localStorage.getItem("sq")).name,
  teacherName: "",
  situation: "",
  assist: "",
  feedback: "",
});

const reflectForm = reactive({
  startYear: "",
  lastYear: "",
  semester: "",
  studentName: JSON.parse(localStorage.getItem("sq")).name,
  teacherName: "",
  success: "",
  problem: "",
  improve: "",
});

const cxt = getCurrentInstance();
const bus = cxt.appContext.config.globalProperties.$bus;

const firstExportWordTpl = () => {
  bus.emit("firstMessage", specialLession);
};

const firstExportWordTpl2 = () => {
  bus.emit("firstMessage", specialObj);
};

const planExportWordTpl = () => {
  bus.emit("printMessage", planForm);
};

const planExportWordTpl2 = () => {
  bus.emit("printMessage", planObj);
};

const connectExportWordTpl = () => {
  bus.emit("homeMessage", schoolHome);
};

const connectExportWordTpl2 = () => {
  bus.emit("homeMessage", homeObj);
};

const lastExportWordTpl = () => {
  bus.emit("reflectMessage", reflectForm);
};

const lastExportWordTpl2 = () => {
  bus.emit("reflectMessage", reflectObj);
};

const handleClick = (tab, event) => {
  console.log(tab, event);
};

const getFileList = ref([{}, {}]);
const getAllFile = () => {
  // Axios.get(
  //   `/studentDevelopment/getAll?studentId=${
  //     JSON.parse(localStorage.getItem("sq")).studentId
  //   }`
  // ).then((res) => {
  //   getFileList.value = res.data;
  //   console.log(getFileList.value);
  // });
};

const testcomRef = ref();
const getSonHander = () => {
  showEditor.value = false;
  // Axios.post("/studentDevelopment/add", {
  //   studentId: JSON.parse(localStorage.getItem("sq")).studentId,
  //   richText: testcomRef.value.valueHtml,
  // }).then(async (res) => {
  //   if (res.success == true) {
  //     ElMessage({
  //       showClose: true,
  //       message: res.data,
  //       type: "success",
  //     });
  //     await getAllFile();
  //   } else if (res.success == false) {
  //     ElMessage({
  //       showClose: true,
  //       message: res.message,
  //       type: "error",
  //     });
  //   }
  // });
};

const parentVal = ref("");
const todetail = (content) => {
  parentVal.value = "";
  parentVal.value = content;
  console.log(parentVal.value);
};

const saveSpecial = () => {
  let obj = {
    ...specialLession,
    studentId: JSON.parse(localStorage.getItem("sq")).studentId,
  };
  Axios.post(`/special/insert`, obj).then(async (res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });
      await Axios.post(`/special/selectByStudentId`, {
        studentId: JSON.parse(localStorage.getItem("sq")).studentId,
      }).then((res) => {
        console.log(res);
        specialList.value = res.data;
      });
      specialLession.advantageArea = "";
      specialLession.basicArea = "";
      specialLession.defectArea = "";
      specialLession.gbArea = "";
      specialLession.lastYear = "";
      specialLession.psychologyArea = "";
      specialLession.semester = "";
      specialLession.startYear = "";
      specialLession.targetArea = "";
      specialLession.teacherName = "";
    } else {
      ElMessage({
        showClose: true,
        message: res.message,
        type: "error",
      });
    }
  });
};

//特殊课程评估查询列表
const specialList = ref([]);
Axios.post(`/special/selectByStudentId`, {
  studentId: JSON.parse(localStorage.getItem("sq")).studentId,
}).then((res) => {
  console.log(res);
  specialList.value = res.data;
});

let specialObj = ref("");
const showSpecialHis = ref(false);
const specialHistory = (id) => {
  showSpecialHis.value = true;
  console.log(specialList.value, id);
  for (let item of specialList.value) {
    if (item.id == id) {
      specialObj = item;
    }
  }
  console.log(specialObj);
};

const delSpecial = (id) => {
  ElMessageBox.confirm("确定要删除嘛？", "警告", {
    confirmButtonText: "确认",
    cancelButtonText: "取消",
    type: "warning",
  })
    .then(() => {
      Axios.post("/special/deleteById", {
        id: id,
      }).then(async (res) => {
        if (res.success == true) {
          ElMessage({
            showClose: true,
            message: res.data,
            type: "success",
          });
          await Axios.post(`/special/selectByStudentId`, {
            studentId: JSON.parse(localStorage.getItem("sq")).studentId,
          }).then((res) => {
            console.log(res);
            specialList.value = res.data;
          });
        } else {
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

const his = ref(false);
const seeHistory = () => {
  his.value = true;
  console.log("查看历史");
};

//特殊课程计划
const savePlan = () => {
  let obj = {
    ...planForm,
    studentId: JSON.parse(localStorage.getItem("sq")).studentId,
  };
  Axios.post("/plan/insert", obj).then(async (res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });
      await Axios.post(`/plan/selectByStudentId`, {
        studentId: JSON.parse(localStorage.getItem("sq")).studentId,
      }).then((res) => {
        console.log(res);
        planList.value = res.data;
      });
      planForm.height = "";
      planForm.weight = "";
      planForm.leftEyes = "";
      planForm.rightEyes = "";
      planForm.radio = "";
      planForm.perception = "";
      planForm.action = "";
      planForm.language = "";
      planForm.cognition = "";
      planForm.socialize = "";
      planForm.life = "";
      planForm.emotion = "";
      planForm.advantage = "";
      planForm.defect = "";
      planForm.startYear = "";
      planForm.lastYear = "";
      planForm.semester = "";
    } else {
      ElMessage({
        showClose: true,
        message: res.message,
        type: "error",
      });
    }
  });
};

const showPlanHis = ref(false);
const seePlanHis = () => {
  showPlanHis.value = true;
};
const planList = ref([]);
Axios.post(`/plan/selectByStudentId`, {
  studentId: JSON.parse(localStorage.getItem("sq")).studentId,
}).then((res) => {
  console.log(res);
  planList.value = res.data;
});

let planObj = ref("");
const planShow = ref(false);
const planHistory = (id) => {
  planShow.value = true;
  for (let item of planList.value) {
    if (item.id == id) {
      planObj = item;
    }
  }
};

const delPlan = (id) => {
  ElMessageBox.confirm("确定要删除嘛？", "警告", {
    confirmButtonText: "确认",
    cancelButtonText: "取消",
    type: "warning",
  })
    .then(() => {
      Axios.post("/plan/deleteById", {
        id: id,
      }).then(async (res) => {
        if (res.success == true) {
          ElMessage({
            showClose: true,
            message: res.data,
            type: "success",
          });
          await Axios.post(`/plan/selectByStudentId`, {
            studentId: JSON.parse(localStorage.getItem("sq")).studentId,
          }).then((res) => {
            console.log(res);
            planList.value = res.data;
          });
        } else {
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

//家校

const showHome = ref(false);
const showItemHome = ref(false);

const seeHomeHis = () => {
  showHome.value = true;
};

const homeList = ref([]);
Axios.post("/schoolHome/selectByStudentId", {
  studentId: JSON.parse(localStorage.getItem("sq")).studentId,
}).then((res) => {
  homeList.value = res.data;
});

const saveHome = () => {
  let obj = {
    ...schoolHome,
    studentId: JSON.parse(localStorage.getItem("sq")).studentId,
  };
  Axios.post("/schoolHome/insert", obj).then(async (res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });
      await Axios.post("/schoolHome/selectByStudentId", {
        studentId: JSON.parse(localStorage.getItem("sq")).studentId,
      }).then((res) => {
        homeList.value = res.data;
      });
    } else {
      ElMessage({
        showClose: true,
        message: res.message,
        type: "error",
      });
    }
  });
};

const delHome = (id) => {
  ElMessageBox.confirm("确定要删除嘛？", "警告", {
    confirmButtonText: "确认",
    cancelButtonText: "取消",
    type: "warning",
  })
    .then(() => {
      Axios.post("/schoolHome/deleteById", {
        id: id,
      }).then(async (res) => {
        if (res.success == true) {
          ElMessage({
            showClose: true,
            message: res.data,
            type: "success",
          });
          await Axios.post(`/schoolHome/selectByStudentId`, {
            studentId: JSON.parse(localStorage.getItem("sq")).studentId,
          }).then((res) => {
            console.log(res);
            homeList.value = res.data;
          });
        } else {
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

let homeObj = ref("");
const homeHistory = (id) => {
  console.log(id, homeList.value);
  showItemHome.value = true;
  for (let item of homeList.value) {
    if (item.id == id) {
      homeObj = item;
    }
  }
};

//教育教学反思

const showReflect = ref(false);
const showItemReflect = ref(false);

const seeReflectHis = () => {
  showReflect.value = true;
};

const reflectList = ref([]);
Axios.post("/reflect/selectByStudentId", {
  studentId: JSON.parse(localStorage.getItem("sq")).studentId,
}).then((res) => {
  reflectList.value = res.data;
});

const saveReflect = () => {
  let obj = {
    ...reflectForm,
    studentId: JSON.parse(localStorage.getItem("sq")).studentId,
  };
  Axios.post("/reflect/insert", obj).then(async (res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });
      await Axios.post("/reflect/selectByStudentId", {
        studentId: JSON.parse(localStorage.getItem("sq")).studentId,
      }).then((res) => {
        reflectList.value = res.data;
      });
    } else {
      ElMessage({
        showClose: true,
        message: res.message,
        type: "error",
      });
    }
  });
};

const delReflect = (id) => {
  ElMessageBox.confirm("确定要删除嘛？", "警告", {
    confirmButtonText: "确认",
    cancelButtonText: "取消",
    type: "warning",
  })
    .then(() => {
      Axios.post("/reflect/deleteById", {
        id: id,
      }).then(async (res) => {
        if (res.success == true) {
          ElMessage({
            showClose: true,
            message: res.data,
            type: "success",
          });
          await Axios.post(`/reflect/selectByStudentId`, {
            studentId: JSON.parse(localStorage.getItem("sq")).studentId,
          }).then((res) => {
            console.log(res);
            reflectList.value = res.data;
          });
        } else {
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

let reflectObj = ref("");
const reflectHistory = (id) => {
  showItemReflect.value = true;
  for (let item of reflectList.value) {
    if (item.id == id) {
      reflectObj = item;
    }
  }
};

const supList = ref([
  {
    content: "",
    describe: "",
    unit: "",
  },
]);

const showSupport = ref(false);
const showItemSupport = ref(false);
const saveSupport = () => {
  Axios.post("/serve/add", {
    studentId: JSON.parse(localStorage.getItem("sq")).studentId,
    content: JSON.stringify(supList.value),
    description: "",
    head: "",
  }).then((res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });
    } else {
      ElMessage({
        showClose: true,
        message: res.message,
        type: "error",
      });
    }
  });
};

const allSupportList = ref([]);
const seeSupportHis = () => {
  showSupport.value = true;
  Axios.post("/serve/selectByStudentId", {
    studentId: JSON.parse(localStorage.getItem("sq")).studentId,
  }).then((res) => {
    allSupportList.value = res.data;
  });
};
let supportObj = ref([]);
const supSelf = (id) => {
  showItemSupport.value = true;
  for (let item of allSupportList.value) {
    if (id == item.id) {
      supportObj.value = JSON.parse(item.content);
    }
  }
};

const delSupport = (id) => {
  ElMessageBox.confirm("确定要删除嘛？", "警告", {
    confirmButtonText: "确认",
    cancelButtonText: "取消",
    type: "warning",
  })
    .then((res) => {
      Axios.post("/serve/delete", {
        id: id,
      }).then(async (res) => {
        if (res.success == true) {
          ElMessage({
            showClose: true,
            message: res.data,
            type: "success",
          });
          await seeSupportHis();
        } else {
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

const addRow = () => {
  supList.value.push({
    content: "",
    describe: "",
    unit: "",
  });
};

const clearRow = () => {
  supList.value = [
    {
      content: "",
      describe: "",
      unit: "",
    },
  ];
};

const supExportWordTpl = () => {
  // console.log(supList);
  bus.emit("supMessage", supList);
};

const supExportWordTpl2 = () => {
  bus.emit("supMessage", supportObj);
};

const datelist = reactive([
  {
    id: "1",
    // date: "2022-03-21",
    week: "星期一",
  },
  {
    id: "2",
    // date: "2022-03-22",
    week: "星期二",
  },
  {
    id: "3",
    // date: "2022-03-23",
    week: "星期三",
  },
  {
    id: "4",
    // date: "2022-03-24",
    week: "星期四",
  },
  {
    id: "5",
    // date: "2022-03-25",
    week: "星期五",
  },
]);

const lessionTitle = ref("");
const dayList = ref([
  {
    startTime: "",
    endTime: "",
  },
  {
    startTime: "",
    endTime: "",
  },
  {
    startTime: "",
    endTime: "",
  },
  {
    startTime: "",
    endTime: "",
  },
  {
    startTime: "",
    endTime: "",
  },
  {
    startTime: "",
    endTime: "",
  },
  {
    startTime: "",
    endTime: "",
  },
]);
const dataList = ref([
  {
    oneLessionName: "",
    oneTeacherName: "",
    twoLessionName: "",
    twoTeacherName: "",
    threeLessionName: "",
    threeTeacherName: "",
    fourLessionName: "",
    fourTeacherName: "",
    fiveLessionName: "",
    fiveTeacherName: "",
    sixLessionName: "",
    sixTeacherName: "",
    sevenLessionName: "",
    sevenTeacherName: "",
  },
  {
    oneLessionName: "",
    oneTeacherName: "",
    twoLessionName: "",
    twoTeacherName: "",
    threeLessionName: "",
    threeTeacherName: "",
    fourLessionName: "",
    fourTeacherName: "",
    fiveLessionName: "",
    fiveTeacherName: "",
    sixLessionName: "",
    sixTeacherName: "",
    sevenLessionName: "",
    sevenTeacherName: "",
  },
  {
    oneLessionName: "",
    oneTeacherName: "",
    twoLessionName: "",
    twoTeacherName: "",
    threeLessionName: "",
    threeTeacherName: "",
    fourLessionName: "",
    fourTeacherName: "",
    fiveLessionName: "",
    fiveTeacherName: "",
    sixLessionName: "",
    sixTeacherName: "",
    sevenLessionName: "",
    sevenTeacherName: "",
  },
  {
    oneLessionName: "",
    oneTeacherName: "",
    twoLessionName: "",
    twoTeacherName: "",
    threeLessionName: "",
    threeTeacherName: "",
    fourLessionName: "",
    fourTeacherName: "",
    fiveLessionName: "",
    fiveTeacherName: "",
    sixLessionName: "",
    sixTeacherName: "",
    sevenLessionName: "",
    sevenTeacherName: "",
  },
  {
    oneLessionName: "",
    oneTeacherName: "",
    twoLessionName: "",
    twoTeacherName: "",
    threeLessionName: "",
    threeTeacherName: "",
    fourLessionName: "",
    fourTeacherName: "",
    fiveLessionName: "",
    fiveTeacherName: "",
    sixLessionName: "",
    sixTeacherName: "",
    sevenLessionName: "",
    sevenTeacherName: "",
  },
]);

const save = () => {
  console.log(dataList.value);
  Axios.post("/schedule/add", {
    studentId: JSON.parse(localStorage.getItem("sq")).studentId,
    schedule: JSON.stringify(dataList.value),
    title: lessionTitle.value,
    time: JSON.stringify(dayList.value),
  }).then(async (res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });
      await Axios.post("/schedule/selectById", {
        studentId: JSON.parse(localStorage.getItem("sq")).studentId,
      }).then((res) => {
        console.log(res);
        hisList.value = JSON.parse(JSON.stringify(res.data));
      });
    } else {
      ElMessage({
        showClose: true,
        message: res.message,
        type: "error",
      });
    }
  });
};

const clId = ref("");
const hisClassList = ref([]);
Axios.get("/clazz/getAll").then(async (res) => {
  console.log(res);
  for (let item of res.data) {
    if (
      item.clazzName == JSON.parse(localStorage.getItem("sq")).className &&
      item.schoolName == JSON.parse(localStorage.getItem("sq")).schoolName
    ) {
      clId.value = item.clazzId;
    }
  }

  await Axios.post("/schedule/selectById", {
    classId: clId.value,
  }).then((res) => {
    console.log(res);
    hisClassList.value = JSON.parse(JSON.stringify(res.data));
  });
});

const saveClass = () => {
  clId.value = "";
  Axios.get("/clazz/getAll").then(async (res) => {
    console.log(res);
    for (let item of res.data) {
      if (
        item.clazzName == JSON.parse(localStorage.getItem("sq")).className &&
        item.schoolName == JSON.parse(localStorage.getItem("sq")).schoolName
      ) {
        clId.value = item.clazzId;
      }
    }

    await Axios.post("/schedule/add", {
      classId: clId.value,
      schedule: JSON.stringify(dataList.value),
      title: lessionTitle.value,
      time: JSON.stringify(dayList.value),
    }).then(async (res) => {
      if (res.success == true) {
        ElMessage({
          showClose: true,
          message: res.data,
          type: "success",
        });
        await Axios.post("/schedule/selectById", {
          classId: clId.value,
        }).then((res) => {
          console.log(res);
          hisClassList.value = JSON.parse(JSON.stringify(res.data));
          console.log(hisClassList);
        });
      } else {
        ElMessage({
          showClose: true,
          message: res.message,
          type: "error",
        });
      }
    });
  });
};

const hisList = ref([]);
Axios.post("/schedule/selectById", {
  studentId: JSON.parse(localStorage.getItem("sq")).studentId,
}).then((res) => {
  console.log(res);
  hisList.value = JSON.parse(JSON.stringify(res.data));
});

const showHis = ref(false);
const nowLession = ref([]);
const toHistory = (id, num) => {
  nowLession.value = [];
  showHis.value = true;
  console.log(id);
  console.log(nowLession.value);
  console.log(id, num);
  if (num == 1) {
    for (let item of hisList.value) {
      console.log(id == item.id);
      if (id == item.id) {
        nowLession.value.push(item);
      }
    }
  } else if (num == 2) {
    for (let item of hisClassList.value) {
      console.log(id == item.id);
      if (id == item.id) {
        nowLession.value.push(item);
      }
    }
  }
  console.log(nowLession.value[0]);
};

const delLession = (id) => {
  ElMessageBox.confirm("确定要删除嘛？", "警告", {
    confirmButtonText: "确认",
    cancelButtonText: "取消",
    type: "warning",
  })
    .then(() => {
      Axios.post("/schedule/deleteById", {
        id: id,
      }).then(async (res) => {
        if (res.success == true) {
          ElMessage({
            showClose: true,
            message: res.data,
            type: "success",
          });
          await Axios.post("/schedule/selectById", {
            studentId: JSON.parse(localStorage.getItem("sq")).studentId,
          }).then((res) => {
            console.log(res);
            hisList.value = JSON.parse(JSON.stringify(res.data));
          });

          await Axios.get("/clazz/getAll").then(async (res) => {
            console.log(res);
            for (let item of res.data) {
              if (
                item.clazzName ==
                  JSON.parse(localStorage.getItem("sq")).className &&
                item.schoolName ==
                  JSON.parse(localStorage.getItem("sq")).schoolName
              ) {
                clId.value = item.clazzId;
              }
            }

            await Axios.post("/schedule/selectById", {
              classId: clId.value,
            }).then((res) => {
              console.log(res);
              hisClassList.value = JSON.parse(JSON.stringify(res.data));
            });
          });
        } else {
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

const lessionExportWordTpl = () => {
  bus.emit("lessionMessage", nowLession.value);
};
</script>

<template>
  <p
    style="
      color: #1677ff;
      font-size: 14px;
      margin-left: 30px;
      display: flex;
      align-items: center;
      margin-top: 10px;
      width: 100px;
    "
    @click="$router.push('/management/studentCenter')"
  >
    <el-icon><House /></el-icon>返回学生主页
  </p>
  <div>
    <allWord></allWord>
  </div>
  <el-tabs
    v-model="activeName"
    type="card"
    class="demo-tabs"
    @tab-click="handleClick"
    style="background-color: #fff; padding-left: 20px"
  >
    <el-tab-pane label="课程计划" name="first">
      <div
        class="tabel-container"
        style="display: flex; justify-content: center"
        v-if="showHis"
      >
        <table style="width: 80%; border-collapse: collapse" border="1">
          <thead style="border: 1px solid #ccc; height: 60px">
            <tr>
              <th width="48" class="fw" style="text-align: center">
                <el-input
                  v-if="nowLession[0].title"
                  v-model="nowLession[0].title"
                  placeholder="请输入课表名称"
                  style="width: 80%"
                ></el-input>
              </th>
              <th class="fw" v-for="(item, index) in datelist" :key="index">
                <p style="text-align: center">{{ item.week }}</p>
                <!-- <el-input v-model="item.week"> </el-input> -->
              </th>
            </tr>
          </thead>
          <tbody style="border: 1px solid #ccc">
            <tr
              v-if="nowLession[0].time"
              v-for="(i, index) in JSON.parse(nowLession[0].time)"
              class="tr"
            >
              <td
                class="td"
                style="text-align: center; width: 200px; height: 100px"
              >
                <p>
                  第{{ index + 1 }}节课{{ index <= 3 ? "(上午)" : "(下午)" }}
                </p>

                <el-input v-model="i.startTime" style="width: 80px"></el-input>
                ~<el-input v-model="i.endTime" style="width: 80px"></el-input>
              </td>

              <td
                v-if="nowLession[0].schedule"
                v-for="(item, ind) in JSON.parse(nowLession[0].schedule)"
                :key="ind"
                class="td"
                style="width: 150px; height: 100px; text-align: center"
              >
                <el-input
                  v-model="item.oneLessionName"
                  v-if="index == 0"
                  placeholder="输入课程名称"
                  style="width: 80%"
                ></el-input>
                <el-input
                  v-model="item.oneTeacherName"
                  v-if="index == 0"
                  placeholder="输入教师名"
                  style="width: 80%"
                ></el-input>
                <el-input
                  v-model="item.twoLessionName"
                  v-if="index == 1"
                  placeholder="输入课程名称"
                  style="width: 80%"
                ></el-input>
                <el-input
                  v-model="item.twoTeacherName"
                  v-if="index == 1"
                  placeholder="输入教师名"
                  style="width: 80%"
                ></el-input>
                <el-input
                  v-model="item.threeLessionName"
                  v-if="index == 2"
                  placeholder="输入课程名称"
                  style="width: 80%"
                ></el-input>
                <el-input
                  v-model="item.threeTeacherName"
                  v-if="index == 2"
                  placeholder="输入教师名"
                  style="width: 80%"
                ></el-input>
                <el-input
                  v-model="item.fourLessionName"
                  v-if="index == 3"
                  placeholder="输入课程名称"
                  style="width: 80%"
                ></el-input>
                <el-input
                  v-model="item.fourTeacherName"
                  v-if="index == 3"
                  placeholder="输入教师名"
                  style="width: 80%"
                ></el-input>
                <el-input
                  v-model="item.fiveLessionName"
                  v-if="index == 4"
                  placeholder="输入课程名称"
                  style="width: 80%"
                ></el-input>
                <el-input
                  v-model="item.fiveTeacherName"
                  v-if="index == 4"
                  placeholder="输入教师名"
                  style="width: 80%"
                ></el-input>
                <el-input
                  v-model="item.sixLessionName"
                  v-if="index == 5"
                  placeholder="输入课程名称"
                  style="width: 80%"
                ></el-input>
                <el-input
                  v-model="item.sixTeacherName"
                  v-if="index == 5"
                  placeholder="输入教师名"
                  style="width: 80%"
                ></el-input>
                <el-input
                  v-model="item.sevenLessionName"
                  v-if="index == 6"
                  placeholder="输入课程名称"
                  style="width: 80%"
                ></el-input>
                <el-input
                  v-model="item.sevenTeacherName"
                  v-if="index == 6"
                  placeholder="输入教师名"
                  style="width: 80%"
                ></el-input>
              </td>
            </tr>
          </tbody>
        </table>
        <div style="display: flex; flex-direction: column">
          <el-button
            type="primary"
            style="margin-left: 30px"
            @click="showHis = false"
            >返回</el-button
          >
          <el-button
            @click.once="lessionExportWordTpl"
            style="margin-top: 10px; margin-left: 30px"
            >导出word</el-button
          >
        </div>
      </div>

      <div class="app-container" v-show="!showHis">
        <div classs="content">
          <!-- <div></div> -->
          <div class="class-table">
            <div class="table-wrapper">
              <div
                class="tabel-container"
                style="display: flex; justify-content: center"
                v-if="showBtn"
              >
                <table style="width: 80%; border-collapse: collapse" border="1">
                  <thead style="border: 1px solid #ccc; height: 60px">
                    <tr>
                      <th width="48" class="fw" style="text-align: center">
                        <el-input
                          v-model="lessionTitle"
                          placeholder="请输入课表名称"
                          style="width: 80%"
                        ></el-input>
                      </th>
                      <th
                        class="fw"
                        v-for="(item, index) in datelist"
                        :key="index"
                      >
                        <p style="text-align: center">{{ item.week }}</p>
                        <!-- <el-input v-model="item.week"> </el-input> -->
                      </th>
                    </tr>
                  </thead>
                  <tbody style="border: 1px solid #ccc">
                    <tr v-for="(i, index) in dayList" class="tr">
                      <td
                        class="td"
                        style="text-align: center; width: 200px; height: 100px"
                      >
                        <p>
                          第{{ index + 1 }}节课{{
                            index <= 3 ? "(上午)" : "(下午)"
                          }}
                        </p>

                        <el-input
                          v-model="i.startTime"
                          style="width: 80px"
                        ></el-input>
                        ~<el-input
                          v-model="i.endTime"
                          style="width: 80px"
                        ></el-input>
                      </td>

                      <td
                        v-for="(item, ind) in dataList"
                        :key="ind"
                        class="td"
                        style="width: 150px; height: 100px; text-align: center"
                      >
                        <el-input
                          v-model="item.oneLessionName"
                          v-if="index == 0"
                          placeholder="输入课程名称"
                          style="width: 80%"
                        ></el-input>
                        <el-input
                          v-model="item.oneTeacherName"
                          v-if="index == 0"
                          placeholder="输入教师名"
                          style="width: 80%"
                        ></el-input>
                        <el-input
                          v-model="item.twoLessionName"
                          v-if="index == 1"
                          placeholder="输入课程名称"
                          style="width: 80%"
                        ></el-input>
                        <el-input
                          v-model="item.twoTeacherName"
                          v-if="index == 1"
                          placeholder="输入教师名"
                          style="width: 80%"
                        ></el-input>
                        <el-input
                          v-model="item.threeLessionName"
                          v-if="index == 2"
                          placeholder="输入课程名称"
                          style="width: 80%"
                        ></el-input>
                        <el-input
                          v-model="item.threeTeacherName"
                          v-if="index == 2"
                          placeholder="输入教师名"
                          style="width: 80%"
                        ></el-input>
                        <el-input
                          v-model="item.fourLessionName"
                          v-if="index == 3"
                          placeholder="输入课程名称"
                          style="width: 80%"
                        ></el-input>
                        <el-input
                          v-model="item.fourTeacherName"
                          v-if="index == 3"
                          placeholder="输入教师名"
                          style="width: 80%"
                        ></el-input>
                        <el-input
                          v-model="item.fiveLessionName"
                          v-if="index == 4"
                          placeholder="输入课程名称"
                          style="width: 80%"
                        ></el-input>
                        <el-input
                          v-model="item.fiveTeacherName"
                          v-if="index == 4"
                          placeholder="输入教师名"
                          style="width: 80%"
                        ></el-input>
                        <el-input
                          v-model="item.sixLessionName"
                          v-if="index == 5"
                          placeholder="输入课程名称"
                          style="width: 80%"
                        ></el-input>
                        <el-input
                          v-model="item.sixTeacherName"
                          v-if="index == 5"
                          placeholder="输入教师名"
                          style="width: 80%"
                        ></el-input>
                        <el-input
                          v-model="item.sevenLessionName"
                          v-if="index == 6"
                          placeholder="输入课程名称"
                          style="width: 80%"
                        ></el-input>
                        <el-input
                          v-model="item.sevenTeacherName"
                          v-if="index == 6"
                          placeholder="输入教师名"
                          style="width: 80%"
                        ></el-input>
                      </td>
                    </tr>
                  </tbody>
                </table>
                <div style="display: flex; flex-direction: column">
                  <el-button
                    type="primary"
                    style="margin-left: 30px"
                    @click="save()"
                    v-if="showBtn"
                    >保存为个人课程表</el-button
                  >
                  <el-button
                    @click="saveClass()"
                    style="margin-top: 10px; margin-left: 30px"
                    >保存为班级课表</el-button
                  >
                </div>
              </div>

              <el-divider />
              <div>
                <h3>个人课表</h3>
                <div style="display: flex; flex-direction: column">
                  <el-card
                    shadow="hover"
                    v-for="(item, index) in hisList"
                    :key="index"
                    style="
                      width: 90%;
                      height: 50px;
                      background: #6cf;
                      margin-top: 20px;
                      margin-left: 30px;
                      display: flex;
                      align-items: center;
                      position: relative;
                      color: #fff;
                    "
                    @click="toHistory(item.id, 1)"
                  >
                    <p v-if="item.title" style="display: inline-block">
                      {{ item.title }}
                    </p>
                    <p v-if="!item.title" style="display: inline-block">
                      课表({{ index + 1 }})
                    </p>
                    <el-button
                      type="danger"
                      style="position: absolute; right: 50px; bottom: 8px"
                      @click.stop="delLession(item.id)"
                      >删除</el-button
                    >
                    <span style="position: absolute; right: 10px">></span>
                  </el-card>
                </div>
              </div>

              <el-divider />
              <div>
                <h3>班级课表</h3>
                <div style="display: flex; flex-direction: column">
                  <el-card
                    shadow="hover"
                    v-for="(item, index) in hisClassList"
                    :key="index"
                    style="
                      width: 90%;
                      height: 50px;
                      background: #6cf;
                      margin-top: 20px;
                      margin-left: 30px;
                      display: flex;
                      align-items: center;
                      position: relative;
                      color: #fff;
                    "
                    @click="toHistory(item.id, 2)"
                  >
                    <p v-if="item.title" style="display: inline-block">
                      {{ item.title }}
                    </p>
                    <p v-if="!item.title" style="display: inline-block">
                      课表({{ index + 1 }})
                    </p>
                    <el-button
                      type="danger"
                      style="position: absolute; right: 50px; bottom: 8px"
                      @click.stop="delLession(item.id)"
                      >删除</el-button
                    >
                    <span style="position: absolute; right: 10px">></span>
                  </el-card>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </el-tab-pane>
    <el-tab-pane label="学生特殊课程评估" name="second">
      <el-button @click="his = false" v-show="his && !showSpecialHis"
        >返回</el-button
      >
      <div v-show="his" style="display: flex; flex-wrap: wrap; width: 80%">
        <el-button @click="showSpecialHis = false" v-show="showSpecialHis"
          >返回</el-button
        >
        <el-card
          shadow="hover"
          style="
            margin-top: 10px;
            margin-left: 10px;
            height: 200px;
            width: 45%;
            background: #c0c4cc;
            position: relative;
          "
          v-show="!showSpecialHis"
          v-for="(item, index) in specialList"
          :key="index"
          @click="specialHistory(item.id)"
        >
          <h3>特殊课程评估表</h3>
          <div
            style="
              display: flex;
              flex-direction: column;
              margin-top: 10px;
              justify-content: space-around;
              height: 150px;
            "
          >
            <p>学生姓名:{{ item.studentName }}</p>
            <p>资源教师：{{ item.teacherName }}</p>
            <p>年度：{{ item.startYear }} ~ {{ item.lastYear }}</p>
            <p>学期:{{ item.semester }}</p>
          </div>
          <el-button
            style="position: absolute; right: 10px; top: 10px"
            type="danger"
            @click.stop="delSpecial(item.id)"
            >删除</el-button
          >
        </el-card>

        <div v-show="showSpecialHis">
          <div style="display: flex; margin-top: 20px; flex-wrap: wrap">
            <p>
              <span>学生姓名：</span>
              <el-input
                v-model="specialObj.studentName"
                placeholder="请填写学生姓名"
                style="width: 300px"
              />
            </p>
            <p style="margin-left: 40px">
              <span>资源教师姓名：</span>
              <el-input
                v-model="specialObj.teacherName"
                placeholder="请填写资源教师姓名"
                style="width: 300px"
              />
            </p>
            <p style="margin-left: 40px">
              <span>年度：</span>
              <el-input
                v-model="specialObj.startYear"
                placeholder=""
                style="width: 100px"
              />&nbsp;--
              <el-input
                v-model="specialObj.lastYear"
                placeholder=""
                style="width: 100px"
              />
            </p>
            <p style="margin-left: 40px">
              <span>学期：</span>
              <el-input
                v-model="specialObj.semester"
                placeholder="请填写学期"
                style="width: 100px"
              />
            </p>
          </div>
          <div style="display: flex; align-items: center; margin-top: 30px">
            <div style="display: flex; align-items: center">
              <span style="width: 130px">基本情况分析：</span>
              <el-input
                v-model="specialObj.basicArea"
                :autosize="{ minRows: 4, maxRows: 4 }"
                type="textarea"
                placeholder="请输入基本情况分析"
                style="width: 500px"
                resize="none"
              />
            </div>
            <div style="display: flex; align-items: center; margin-left: 20px">
              <span style="width: 130px">优势与弱势分析：</span>
              <el-input
                v-model="specialObj.gbArea"
                :autosize="{ minRows: 4, maxRows: 4 }"
                type="textarea"
                placeholder="请输入优势与弱势分析"
                style="width: 500px"
                resize="none"
              />
            </div>
          </div>

          <div style="display: flex; margin-top: 20px; flex-wrap: wrap">
            <div style="display: flex; align-items: center">
              <span style="width: 130px">身体及体能（课程名称及目标）：</span>
              <el-input
                v-model="specialObj.targetArea"
                :autosize="{ minRows: 4, maxRows: 4 }"
                type="textarea"
                placeholder="请输入课程名称及目标"
                style="width: 500px"
                resize="none"
              />
            </div>
            <div style="display: flex; align-items: center; margin-left: 20px">
              <span style="width: 130px">个性心理发展(课程名称及目标)：</span>
              <el-input
                v-model="specialObj.psychologyArea"
                :autosize="{ minRows: 4, maxRows: 4 }"
                type="textarea"
                placeholder="请输入课程名称及目标"
                style="width: 500px"
                resize="none"
              />
            </div>
            <div style="display: flex; align-items: center; margin-top: 20px">
              <span style="width: 130px">优势特长发展(课程名称及目标)：</span>
              <el-input
                v-model="specialObj.advantageArea"
                :autosize="{ minRows: 4, maxRows: 4 }"
                type="textarea"
                placeholder="请输入课程名称及目标"
                style="width: 500px"
                resize="none"
              />
            </div>
            <div
              style="
                display: flex;
                align-items: center;
                margin-top: 20px;
                margin-left: 20px;
              "
            >
              <span style="width: 130px"
                >缺陷补偿康复矫治(课程名称及目标)：</span
              >
              <el-input
                v-model="specialObj.defectArea"
                :autosize="{ minRows: 4, maxRows: 4 }"
                type="textarea"
                placeholder="请输入课程名称及目标"
                style="width: 500px"
                resize="none"
              />
            </div>
          </div>
          <el-button @click="firstExportWordTpl2" style="margin-top: 20px"
            >导出word</el-button
          >
        </div>
      </div>
      <div v-show="!his">
        <h3 v-show="!showPlanHis">特殊课程评估</h3>
        <div
          style="display: flex; margin-top: 20px; flex-wrap: wrap"
          v-show="!showPlanHis"
        >
          <p>
            <span>学生姓名：</span>
            <el-input
              v-model="specialLession.studentName"
              placeholder="请填写学生姓名"
              style="width: 300px"
            />
          </p>
          <p style="margin-left: 40px">
            <span>资源教师姓名：</span>
            <el-input
              v-model="specialLession.teacherName"
              placeholder="请填写资源教师姓名"
              style="width: 300px"
            />
          </p>
          <p style="margin-left: 40px">
            <span>年度：</span>
            <el-input
              v-model="specialLession.startYear"
              placeholder=""
              style="width: 100px"
            />&nbsp;--
            <el-input
              v-model="specialLession.lastYear"
              placeholder=""
              style="width: 100px"
            />
          </p>
          <p style="margin-left: 40px">
            <span>学期：</span>
            <el-input
              v-model="specialLession.semester"
              placeholder="请填写学期"
              style="width: 100px"
            />
          </p>
        </div>
        <div
          style="display: flex; align-items: center; margin-top: 30px"
          v-show="!showPlanHis"
        >
          <div style="display: flex; align-items: center">
            <span style="width: 130px">基本情况分析：</span>
            <el-input
              v-model="specialLession.basicArea"
              :autosize="{ minRows: 4, maxRows: 4 }"
              type="textarea"
              placeholder="请输入基本情况分析"
              style="width: 500px"
              resize="none"
            />
          </div>
          <div style="display: flex; align-items: center; margin-left: 20px">
            <span style="width: 130px">优势与弱势分析：</span>
            <el-input
              v-model="specialLession.gbArea"
              :autosize="{ minRows: 4, maxRows: 4 }"
              type="textarea"
              placeholder="请输入优势与弱势分析"
              style="width: 500px"
              resize="none"
            />
          </div>
        </div>

        <div
          style="display: flex; margin-top: 20px; flex-wrap: wrap"
          v-show="!showPlanHis"
        >
          <div style="display: flex; align-items: center">
            <span style="width: 130px">身体及体能（课程名称及目标）：</span>
            <el-input
              v-model="specialLession.targetArea"
              :autosize="{ minRows: 4, maxRows: 4 }"
              type="textarea"
              placeholder="请输入课程名称及目标"
              style="width: 500px"
              resize="none"
            />
          </div>
          <div style="display: flex; align-items: center; margin-left: 20px">
            <span style="width: 130px">个性心理发展(课程名称及目标)：</span>
            <el-input
              v-model="specialLession.psychologyArea"
              :autosize="{ minRows: 4, maxRows: 4 }"
              type="textarea"
              placeholder="请输入课程名称及目标"
              style="width: 500px"
              resize="none"
            />
          </div>
          <div style="display: flex; align-items: center; margin-top: 20px">
            <span style="width: 130px">优势特长发展(课程名称及目标)：</span>
            <el-input
              v-model="specialLession.advantageArea"
              :autosize="{ minRows: 4, maxRows: 4 }"
              type="textarea"
              placeholder="请输入课程名称及目标"
              style="width: 500px"
              resize="none"
            />
          </div>
          <div
            style="
              display: flex;
              align-items: center;
              margin-top: 20px;
              margin-left: 20px;
            "
          >
            <span style="width: 130px">缺陷补偿康复矫治(课程名称及目标)：</span>
            <el-input
              v-model="specialLession.defectArea"
              :autosize="{ minRows: 4, maxRows: 4 }"
              type="textarea"
              placeholder="请输入课程名称及目标"
              style="width: 500px"
              resize="none"
            />
          </div>
        </div>
        <div v-show="!showPlanHis">
          <el-button @click="firstExportWordTpl" style="margin-top: 20px"
            >导出word</el-button
          >
          <el-button @click="saveSpecial()" style="margin-top: 20px"
            >保存</el-button
          >
          <el-button
            @click="seeHistory(), (his = true)"
            style="margin-top: 20px"
            >查看历史</el-button
          >
        </div>
        <el-divider v-show="!showPlanHis" />
        <h3 style="margin-top: 20px" v-show="!showPlanHis">特殊课程计划</h3>
        <el-button
          v-show="showPlanHis && !planShow"
          @click="showPlanHis = false"
          >返回</el-button
        >
        <el-button v-show="planShow" @click="planShow = false">返回</el-button>
        <div
          v-show="showPlanHis"
          style="display: flex; flex-wrap: wrap; width: 85%"
        >
          <el-card
            shadow="hover"
            style="
              margin-top: 10px;
              margin-left: 10px;
              height: 200px;
              width: 45%;
              background: #c0c4cc;
              position: relative;
            "
            v-for="(item, index) in planList"
            :key="index"
            @click="planHistory(item.id)"
            v-show="!planShow"
          >
            <h3>特殊课程计划</h3>
            <div
              style="
                display: flex;
                flex-direction: column;
                margin-top: 10px;
                justify-content: space-around;
                height: 150px;
              "
            >
              <p>身高:{{ item.height }}</p>
              <p>体重:{{ item.weight }}</p>
              <p>左边视力:{{ item.leftEyes }}</p>
              <p>右边视力:{{ item.rightEyes }}</p>
            </div>
            <el-button
              style="position: absolute; right: 10px; top: 10px"
              type="danger"
              @click.stop="delPlan(item.id)"
              >删除</el-button
            >
          </el-card>

          <div v-show="planShow">
            <div style="display: flex; flex-wrap: wrap; margin-top: 20px">
              <div style="width: 30%; display: flex; align-items: center">
                <span style="width: 20%">身高：</span>
                <el-input
                  v-model="planObj.height"
                  placeholder=""
                  style="width: 80%"
                />
              </div>
              <div
                style="
                  width: 30%;
                  display: flex;
                  align-items: center;
                  margin-left: 20px;
                "
              >
                <span style="width: 20%">体重：</span>
                <el-input
                  v-model="planObj.weight"
                  placeholder=""
                  style="width: 80%"
                />
              </div>
              <div
                style="
                  width: 30%;
                  display: flex;
                  align-items: center;
                  margin-left: 20px;
                "
              >
                <span style="width: 20%">左边视力：</span>
                <el-input
                  v-model="planObj.leftEyes"
                  placeholder=""
                  style="width: 80%"
                />
              </div>
              <div
                style="
                  width: 30%;
                  display: flex;
                  align-items: center;
                  margin-top: 20px;
                "
              >
                <span style="width: 20%">右边视力：</span>
                <el-input
                  v-model="planObj.rightEyes"
                  placeholder=""
                  style="width: 80%"
                />
              </div>
              <div
                style="
                  width: 30%;
                  display: flex;
                  align-items: center;
                  margin-top: 20px;
                  margin-left: 20px;
                "
              >
                <span style="width: 20%">体质健康标准：</span>
                <el-radio-group v-model="planObj.radio">
                  <el-radio label="优" size="small" border>优</el-radio>
                  <el-radio label="良" size="small" border>良</el-radio>
                  <el-radio label="及格" size="small" border>及格</el-radio>
                  <el-radio label="不及格" size="small" border>不及格</el-radio>
                </el-radio-group>
              </div>
              <div
                style="
                  width: 30%;
                  display: flex;
                  align-items: center;
                  margin-top: 20px;
                  margin-left: 20px;
                "
              >
                <span style="width: 20%">感知觉：</span>
                <el-input
                  v-model="planObj.perception"
                  placeholder=""
                  style="width: 80%"
                />
              </div>

              <div
                style="
                  width: 30%;
                  display: flex;
                  align-items: center;
                  margin-top: 20px;
                "
              >
                <span style="width: 20%">社会交往：</span>
                <el-input
                  v-model="planObj.socialize"
                  placeholder=""
                  style="width: 80%"
                />
              </div>
              <div
                style="
                  width: 30%;
                  display: flex;
                  align-items: center;
                  margin-top: 20px;
                  margin-left: 20px;
                "
              >
                <span style="width: 20%">生活自理：</span>
                <el-input
                  v-model="planObj.life"
                  placeholder=""
                  style="width: 80%"
                />
              </div>
              <div
                style="
                  width: 30%;
                  display: flex;
                  align-items: center;
                  margin-top: 20px;
                  margin-left: 20px;
                "
              >
                <span style="width: 20%">认知：</span>
                <el-input
                  v-model="planObj.cognition"
                  placeholder=""
                  style="width: 80%"
                />
              </div>

              <div
                style="
                  width: 30%;
                  display: flex;
                  align-items: center;
                  margin-top: 20px;
                "
              >
                <span style="width: 20%">粗大动作，精细动作：</span>
                <el-input
                  v-model="planObj.action"
                  placeholder=""
                  style="width: 80%"
                />
              </div>
              <div
                style="
                  width: 30%;
                  display: flex;
                  align-items: center;
                  margin-top: 20px;
                  margin-left: 20px;
                "
              >
                <span style="width: 20%">语言与言语沟通：</span>
                <el-input
                  v-model="planObj.language"
                  placeholder=""
                  style="width: 80%"
                />
              </div>

              <div
                style="
                  width: 30%;
                  display: flex;
                  align-items: center;
                  margin-top: 20px;
                  margin-left: 20px;
                "
              >
                <span style="width: 20%">情绪与行为：</span>
                <el-input
                  v-model="planObj.emotion"
                  placeholder=""
                  style="width: 80%"
                />
              </div>
              <div
                style="
                  width: 51%;
                  display: flex;
                  align-items: center;
                  margin-top: 20px;
                "
              >
                <span style="width: 20%">优势的发展状况：</span>
                <el-input
                  v-model="planObj.advantage"
                  :autosize="{ minRows: 4, maxRows: 4 }"
                  type="textarea"
                  placeholder="请输入优势的发展状况"
                  style="width: 500px"
                  resize="none"
                />
              </div>
              <div
                style="
                  width: 51%;
                  display: flex;
                  align-items: center;
                  margin-top: 20px;
                "
              >
                <span style="width: 20%">缺陷障碍的矫治与康复状况：</span>
                <el-input
                  v-model="planObj.defect"
                  :autosize="{ minRows: 4, maxRows: 4 }"
                  type="textarea"
                  placeholder="请输入缺陷障碍的矫治与康复状况"
                  style="width: 500px"
                  resize="none"
                />
              </div>
              <p style="margin-left: 40px">
                <span>年度：</span>
                <el-input
                  v-model="planObj.startYear"
                  placeholder=""
                  style="width: 100px"
                />&nbsp;--
                <el-input
                  v-model="planObj.lastYear"
                  placeholder=""
                  style="width: 100px"
                />
              </p>
              <p style="margin-left: 40px">
                <span>学期：</span>
                <el-input
                  v-model="planObj.semester"
                  placeholder="请填写学期"
                  style="width: 100px"
                />
              </p>

              <el-divider />
            </div>
            <div>
              <el-button @click="planExportWordTpl2" style="margin-top: 20px"
                >导出word</el-button
              >
            </div>
          </div>
        </div>

        <div
          style="display: flex; flex-wrap: wrap; margin-top: 20px"
          v-show="!showPlanHis"
        >
          <div style="width: 30%; display: flex; align-items: center">
            <span style="width: 20%">身高：</span>
            <el-input
              v-model="planForm.height"
              placeholder=""
              style="width: 80%"
            />
          </div>
          <div
            style="
              width: 30%;
              display: flex;
              align-items: center;
              margin-left: 20px;
            "
          >
            <span style="width: 20%">体重：</span>
            <el-input
              v-model="planForm.weight"
              placeholder=""
              style="width: 80%"
            />
          </div>
          <div
            style="
              width: 30%;
              display: flex;
              align-items: center;
              margin-left: 20px;
            "
          >
            <span style="width: 20%">左边视力：</span>
            <el-input
              v-model="planForm.leftEyes"
              placeholder=""
              style="width: 80%"
            />
          </div>
          <div
            style="
              width: 30%;
              display: flex;
              align-items: center;
              margin-top: 20px;
            "
          >
            <span style="width: 20%">右边视力：</span>
            <el-input
              v-model="planForm.rightEyes"
              placeholder=""
              style="width: 80%"
            />
          </div>
          <div
            style="
              width: 30%;
              display: flex;
              align-items: center;
              margin-top: 20px;
              margin-left: 20px;
            "
          >
            <span style="width: 20%">体质健康标准：</span>
            <el-radio-group v-model="planForm.radio">
              <el-radio label="优" size="small" border>优</el-radio>
              <el-radio label="良" size="small" border>良</el-radio>
              <el-radio label="及格" size="small" border>及格</el-radio>
              <el-radio label="不及格" size="small" border>不及格</el-radio>
            </el-radio-group>
          </div>
          <div
            style="
              width: 30%;
              display: flex;
              align-items: center;
              margin-top: 20px;
              margin-left: 20px;
            "
          >
            <span style="width: 20%">感知觉：</span>
            <el-input
              v-model="planForm.perception"
              placeholder=""
              style="width: 80%"
            />
          </div>

          <div
            style="
              width: 30%;
              display: flex;
              align-items: center;
              margin-top: 20px;
            "
          >
            <span style="width: 20%">社会交往：</span>
            <el-input
              v-model="planForm.socialize"
              placeholder=""
              style="width: 80%"
            />
          </div>
          <div
            style="
              width: 30%;
              display: flex;
              align-items: center;
              margin-top: 20px;
              margin-left: 20px;
            "
          >
            <span style="width: 20%">生活自理：</span>
            <el-input
              v-model="planForm.life"
              placeholder=""
              style="width: 80%"
            />
          </div>
          <div
            style="
              width: 30%;
              display: flex;
              align-items: center;
              margin-top: 20px;
              margin-left: 20px;
            "
          >
            <span style="width: 20%">认知：</span>
            <el-input
              v-model="planForm.cognition"
              placeholder=""
              style="width: 80%"
            />
          </div>

          <div
            style="
              width: 30%;
              display: flex;
              align-items: center;
              margin-top: 20px;
            "
          >
            <span style="width: 20%">粗大动作，精细动作：</span>
            <el-input
              v-model="planForm.action"
              placeholder=""
              style="width: 80%"
            />
          </div>
          <div
            style="
              width: 30%;
              display: flex;
              align-items: center;
              margin-top: 20px;
              margin-left: 20px;
            "
          >
            <span style="width: 20%">语言与言语沟通：</span>
            <el-input
              v-model="planForm.language"
              placeholder=""
              style="width: 80%"
            />
          </div>

          <div
            style="
              width: 30%;
              display: flex;
              align-items: center;
              margin-top: 20px;
              margin-left: 20px;
            "
          >
            <span style="width: 20%">情绪与行为：</span>
            <el-input
              v-model="planForm.emotion"
              placeholder=""
              style="width: 80%"
            />
          </div>
          <div
            style="
              width: 51%;
              display: flex;
              align-items: center;
              margin-top: 20px;
            "
          >
            <span style="width: 20%">优势的发展状况：</span>
            <el-input
              v-model="planForm.advantage"
              :autosize="{ minRows: 4, maxRows: 4 }"
              type="textarea"
              placeholder="请输入优势的发展状况"
              style="width: 500px"
              resize="none"
            />
          </div>
          <div
            style="
              width: 51%;
              display: flex;
              align-items: center;
              margin-top: 20px;
            "
          >
            <span style="width: 20%">缺陷障碍的矫治与康复状况：</span>
            <el-input
              v-model="planForm.defect"
              :autosize="{ minRows: 4, maxRows: 4 }"
              type="textarea"
              placeholder="请输入缺陷障碍的矫治与康复状况"
              style="width: 500px"
              resize="none"
            />
          </div>
          <p style="margin-left: 40px">
            <span>年度：</span>
            <el-input
              v-model="planForm.startYear"
              placeholder=""
              style="width: 100px"
            />&nbsp;--
            <el-input
              v-model="planForm.lastYear"
              placeholder=""
              style="width: 100px"
            />
          </p>
          <p style="margin-left: 40px">
            <span>学期：</span>
            <el-input
              v-model="planForm.semester"
              placeholder="请填写学期"
              style="width: 100px"
            />
          </p>
          <el-divider style="border: 1px solid #fff" />
          <div>
            <el-button @click="planExportWordTpl">导出word</el-button>
            <el-button @click="savePlan()">保存</el-button>
            <el-button @click="seePlanHis()">查看历史</el-button>
          </div>
          <el-divider />
        </div>
      </div>
    </el-tab-pane>
    <el-tab-pane label="特教支持服务" name="fifth">
      <div v-if="showSupport">
        <el-button @click="showSupport = false" v-show="!showItemSupport"
          >返回</el-button
        >
        <el-button @click="showItemSupport = false" v-show="showItemSupport"
          >返回</el-button
        >
        <div style="display: flex; width: 85%; flex-wrap: wrap">
          <el-card
            shadow="hover"
            style="
              margin-top: 10px;
              margin-left: 10px;
              height: 200px;
              width: 45%;
              background: #c0c4cc;
              position: relative;
              display: flex;
            "
            v-show="!showItemSupport"
            v-for="(item, index) in allSupportList"
            @click="supSelf(item.id)"
          >
            <h3>支持服务({{ index + 1 }})</h3>
            <div
              style="
                display: flex;
                justify-content: space-around;
                flex-direction: column;
                height: 75%;
              "
            >
              <p v-if="item.content">
                服务内容：{{ JSON.parse(item.content)[0].content }}
              </p>
              <p v-if="item.content">
                服务内容描述：{{ JSON.parse(item.content)[0].describe }}
              </p>
              <p v-if="item.content">
                负责单位（人）：{{ JSON.parse(item.content)[0].unit }}
              </p>
            </div>
            <el-button
              type="danger"
              style="position: absolute; right: 10px; top: 10px"
              @click.stop="delSupport(item.id)"
              >删除</el-button
            >
          </el-card>

          <div
            style="
              display: flex;
              justify-content: center;
              margin-top: 20px;
              width: 98%;
            "
            v-show="showItemSupport"
          >
            <table style="border-collapse: collapse; width: 100%">
              <tbody>
                <tr style="border: 1px solid black">
                  <th class="bold-text rowCenter" colspan="3">服务内容</th>
                  <th class="bold-text rowCenter" colspan="3">服务内容描述</th>
                  <th class="bold-text rowCenter" colspan="3">
                    负责单位（人）
                  </th>
                </tr>
                <tr v-for="(item, index) in supportObj" :key="index">
                  <td colspan="3">
                    <el-input v-model="item.content"></el-input>
                  </td>
                  <td colspan="3">
                    <el-input v-model="item.describe"></el-input>
                  </td>
                  <td colspan="3">
                    <el-input v-model="item.unit"></el-input>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <el-button
            @click="supExportWordTpl2"
            style="margin-top: 20px"
            v-show="showItemSupport"
            >导出word</el-button
          >
        </div>
      </div>

      <h3 v-if="!showSupport">支持服务</h3>
      <el-button
        type="primary"
        style="position: absolute; right: 150px; top: 0px"
        @click="clearRow()"
        v-if="!showSupport"
        >重置</el-button
      >
      <el-button
        type="primary"
        style="position: absolute; right: 20px; top: 0px"
        @click="addRow()"
        v-if="!showSupport"
        >新增（行）</el-button
      >
      <div
        style="
          display: flex;
          justify-content: center;
          margin-top: 20px;
          width: 98%;
        "
        v-if="!showSupport"
      >
        <table style="border-collapse: collapse; width: 100%">
          <tbody>
            <tr style="border: 1px solid black">
              <th class="bold-text rowCenter" colspan="3">服务内容</th>
              <th class="bold-text rowCenter" colspan="3">服务内容描述</th>
              <th class="bold-text rowCenter" colspan="3">负责单位（人）</th>
            </tr>
            <tr v-for="(item, index) in supList" :key="index">
              <td colspan="3">
                <el-input v-model="item.content"></el-input>
              </td>
              <td colspan="3">
                <el-input v-model="item.describe"></el-input>
              </td>
              <td colspan="3">
                <el-input v-model="item.unit"></el-input>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <el-button
        @click="supExportWordTpl"
        style="margin-top: 20px"
        v-if="!showSupport"
        >导出word</el-button
      >
      <el-button
        style="margin-top: 20px"
        @click="saveSupport()"
        v-if="!showSupport"
        >保存</el-button
      >
      <el-button
        style="margin-top: 20px"
        @click="seeSupportHis()"
        v-if="!showSupport"
        >查看历史</el-button
      >
      <el-divider />
    </el-tab-pane>
    <el-tab-pane label="问题、反思和家长联系" name="third">
      <div v-show="!showReflect">
        <h3 v-show="!showHome">家校联系卡</h3>

        <el-button v-show="showHome && !showItemHome" @click="showHome = false"
          >返回</el-button
        >
        <el-button v-show="showItemHome" @click="showItemHome = false"
          >返回</el-button
        >
        <div
          v-show="showHome"
          style="display: flex; flex-direction: column; width: 85%"
        >
          <div style="display: flex">
            <el-card
              shadow="hover"
              style="
                margin-top: 10px;
                margin-left: 10px;
                height: 200px;
                width: 45%;
                background: #c0c4cc;
                position: relative;
              "
              v-for="(item, index) in homeList"
              :key="index"
              @click="homeHistory(item.id)"
              v-show="!showItemHome"
            >
              <h3>家校联系卡</h3>
              <div
                style="
                  display: flex;
                  flex-direction: column;
                  margin-top: 10px;
                  justify-content: space-around;
                  height: 150px;
                "
              >
                <p>学生姓名:{{ item.studentName }}</p>
                <p>资源教师：{{ item.teacherName }}</p>
                <p>年度：{{ item.startYear }} ~ {{ item.lastYear }}</p>
                <p>学期:{{ item.semester }}</p>
              </div>
              <el-button
                style="position: absolute; right: 10px; top: 10px"
                type="danger"
                @click.stop="delHome(item.id)"
                >删除</el-button
              >
            </el-card>
          </div>
          <div
            style="display: flex; margin-top: 20px; flex-wrap: wrap"
            v-show="showItemHome"
          >
            <p>
              <span>学生姓名：</span>
              <el-input
                v-model="homeObj.studentName"
                placeholder="请填写学生姓名"
                style="width: 300px"
              />
            </p>
            <p style="margin-left: 40px">
              <span>资源教师姓名：</span>
              <el-input
                v-model="homeObj.teacherName"
                placeholder="请填写资源教师姓名"
                style="width: 300px"
              />
            </p>
            <p style="margin-left: 40px">
              <span>年度：</span>
              <el-input
                v-model="homeObj.startYear"
                placeholder=""
                style="width: 100px"
              />&nbsp;--
              <el-input
                v-model="homeObj.lastYear"
                placeholder=""
                style="width: 100px"
              />
            </p>
            <p style="margin-left: 40px">
              <span>学期：</span>
              <el-input
                v-model="homeObj.semester"
                placeholder="请填写学期"
                style="width: 100px"
              />
            </p>
          </div>
          <div
            style="
              display: flex;
              align-items: center;
              margin-top: 30px;
              flex-wrap: wrap;
            "
            v-show="showItemHome"
          >
            <div style="display: flex; align-items: center">
              <span style="width: 130px">出现的情况：</span>
              <el-input
                v-model="homeObj.situation"
                :autosize="{ minRows: 4, maxRows: 4 }"
                type="textarea"
                placeholder="请输入出现的情况"
                style="width: 500px"
                resize="none"
              />
            </div>
            <div style="display: flex; align-items: center; margin-left: 20px">
              <span style="width: 130px">需要协助的事项：</span>
              <el-input
                v-model="homeObj.assist"
                :autosize="{ minRows: 4, maxRows: 4 }"
                type="textarea"
                placeholder="请输入需要协助的事项"
                style="width: 500px"
                resize="none"
              />
            </div>
            <div style="display: flex; align-items: center; margin-top: 20px">
              <span style="width: 130px">家长反馈：</span>
              <el-input
                v-model="homeObj.feedback"
                :autosize="{ minRows: 4, maxRows: 4 }"
                type="textarea"
                placeholder="请输入家长反馈"
                style="width: 500px"
                resize="none"
              />
            </div>
          </div>
          <div>
            <el-button
              @click="connectExportWordTpl2"
              style="margin-top: 20px"
              v-show="showItemHome"
              >导出word</el-button
            >
          </div>
        </div>

        <div
          style="display: flex; margin-top: 20px; flex-wrap: wrap"
          v-show="!showHome"
        >
          <p>
            <span>学生姓名：</span>
            <el-input
              v-model="schoolHome.studentName"
              placeholder="请填写学生姓名"
              style="width: 300px"
            />
          </p>
          <p style="margin-left: 40px">
            <span>资源教师姓名：</span>
            <el-input
              v-model="schoolHome.teacherName"
              placeholder="请填写资源教师姓名"
              style="width: 300px"
            />
          </p>
          <p style="margin-left: 40px">
            <span>年度：</span>
            <el-input
              v-model="schoolHome.startYear"
              placeholder=""
              style="width: 100px"
            />&nbsp;--
            <el-input
              v-model="schoolHome.lastYear"
              placeholder=""
              style="width: 100px"
            />
          </p>
          <p style="margin-left: 40px">
            <span>学期：</span>
            <el-input
              v-model="schoolHome.semester"
              placeholder="请填写学期"
              style="width: 100px"
            />
          </p>
        </div>
        <div
          style="
            display: flex;
            align-items: center;
            margin-top: 30px;
            flex-wrap: wrap;
          "
          v-show="!showHome"
        >
          <div style="display: flex; align-items: center">
            <span style="width: 130px">出现的情况：</span>
            <el-input
              v-model="schoolHome.situation"
              :autosize="{ minRows: 4, maxRows: 4 }"
              type="textarea"
              placeholder="请输入出现的情况"
              style="width: 500px"
              resize="none"
            />
          </div>
          <div style="display: flex; align-items: center; margin-left: 20px">
            <span style="width: 130px">需要协助的事项：</span>
            <el-input
              v-model="schoolHome.assist"
              :autosize="{ minRows: 4, maxRows: 4 }"
              type="textarea"
              placeholder="请输入需要协助的事项"
              style="width: 500px"
              resize="none"
            />
          </div>
          <div style="display: flex; align-items: center; margin-top: 20px">
            <span style="width: 130px">家长反馈：</span>
            <el-input
              v-model="schoolHome.feedback"
              :autosize="{ minRows: 4, maxRows: 4 }"
              type="textarea"
              placeholder="请输入家长反馈"
              style="width: 500px"
              resize="none"
            />
          </div>
        </div>

        <el-button
          @click="connectExportWordTpl"
          style="margin-top: 20px"
          v-show="!showHome"
          >导出word</el-button
        >
        <el-button @click="saveHome" style="margin-top: 20px" v-show="!showHome"
          >保存</el-button
        >
        <el-button
          @click="seeHomeHis"
          style="margin-top: 20px"
          v-show="!showHome"
          >查看历史</el-button
        >
        <el-divider v-show="!showHome" />
        <h3 v-show="!showHome">教育教学的反思</h3>
        <div
          style="display: flex; margin-top: 20px; flex-wrap: wrap"
          v-show="!showHome"
        >
          <p>
            <span>学生姓名：</span>
            <el-input
              v-model="reflectForm.studentName"
              placeholder="请填写学生姓名"
              style="width: 300px"
            />
          </p>
          <p style="margin-left: 40px">
            <span>资源教师姓名：</span>
            <el-input
              v-model="reflectForm.teacherName"
              placeholder="请填写资源教师姓名"
              style="width: 300px"
            />
          </p>
          <p style="margin-left: 40px">
            <span>年度：</span>
            <el-input
              v-model="reflectForm.startYear"
              placeholder=""
              style="width: 100px"
            />&nbsp;--
            <el-input
              v-model="reflectForm.lastYear"
              placeholder=""
              style="width: 100px"
            />
          </p>
          <p style="margin-left: 40px">
            <span>学期：</span>
            <el-input
              v-model="reflectForm.semester"
              placeholder="请填写学期"
              style="width: 100px"
            />
          </p>
        </div>
        <div
          style="
            display: flex;
            align-items: center;
            margin-top: 30px;
            flex-wrap: wrap;
          "
          v-show="!showHome"
        >
          <div style="display: flex; align-items: center; margin-top: 20px">
            <span style="width: 200px">成功之处及原因：</span>
            <el-input
              v-model="reflectForm.success"
              :autosize="{ minRows: 4, maxRows: 4 }"
              type="textarea"
              placeholder="请输入成功之处及原因"
              style="width: 600px"
              resize="none"
            />
          </div>
          <div style="display: flex; align-items: center; margin-top: 20px">
            <span style="width: 200px">存在的问题与困惑：</span>
            <el-input
              v-model="reflectForm.problem"
              :autosize="{ minRows: 4, maxRows: 4 }"
              type="textarea"
              placeholder="请输入存在的问题与困惑："
              style="width: 600px"
              resize="none"
            />
          </div>
          <div style="display: flex; align-items: center; margin-top: 20px">
            <span style="width: 200px">改进措施及建议：</span>
            <el-input
              v-model="reflectForm.improve"
              :autosize="{ minRows: 4, maxRows: 4 }"
              type="textarea"
              placeholder="请输入改进措施及建议："
              style="width: 600px"
              resize="none"
            />
          </div>
        </div>
        <el-button
          @click="lastExportWordTpl"
          style="margin-top: 20px"
          v-show="!showHome"
          >导出word</el-button
        >
        <el-button
          @click="saveReflect"
          style="margin-top: 20px"
          v-show="!showHome"
          >保存</el-button
        >
        <el-button
          @click="seeReflectHis"
          style="margin-top: 20px"
          v-show="!showHome"
          >查看历史</el-button
        >
        <el-divider v-show="!showHome" />
      </div>

      <div v-show="showReflect">
        <el-button
          v-show="showReflect && !showItemReflect"
          @click="showReflect = false"
          >返回</el-button
        >
        <el-button v-show="showItemReflect" @click="showItemReflect = false"
          >返回</el-button
        >

        <div v-show="showItemReflect">
          <div style="display: flex; margin-top: 20px; flex-wrap: wrap">
            <p>
              <span>学生姓名：</span>
              <el-input
                v-model="reflectObj.studentName"
                placeholder="请填写学生姓名"
                style="width: 300px"
              />
            </p>
            <p style="margin-left: 40px">
              <span>资源教师姓名：</span>
              <el-input
                v-model="reflectObj.teacherName"
                placeholder="请填写资源教师姓名"
                style="width: 300px"
              />
            </p>
            <p style="margin-left: 40px">
              <span>年度：</span>
              <el-input
                v-model="reflectObj.startYear"
                placeholder=""
                style="width: 100px"
              />&nbsp;--
              <el-input
                v-model="reflectObj.lastYear"
                placeholder=""
                style="width: 100px"
              />
            </p>
            <p style="margin-left: 40px">
              <span>学期：</span>
              <el-input
                v-model="reflectObj.semester"
                placeholder="请填写学期"
                style="width: 100px"
              />
            </p>
          </div>
          <div
            style="
              display: flex;
              align-items: center;
              margin-top: 30px;
              flex-wrap: wrap;
            "
          >
            <div style="display: flex; align-items: center; margin-top: 20px">
              <span style="width: 200px">成功之处及原因：</span>
              <el-input
                v-model="reflectObj.success"
                :autosize="{ minRows: 4, maxRows: 4 }"
                type="textarea"
                placeholder="请输入成功之处及原因"
                style="width: 600px"
                resize="none"
              />
            </div>
            <div style="display: flex; align-items: center; margin-top: 20px">
              <span style="width: 200px">存在的问题与困惑：</span>
              <el-input
                v-model="reflectObj.problem"
                :autosize="{ minRows: 4, maxRows: 4 }"
                type="textarea"
                placeholder="请输入存在的问题与困惑："
                style="width: 600px"
                resize="none"
              />
            </div>
            <div style="display: flex; align-items: center; margin-top: 20px">
              <span style="width: 200px">改进措施及建议：</span>
              <el-input
                v-model="reflectObj.improve"
                :autosize="{ minRows: 4, maxRows: 4 }"
                type="textarea"
                placeholder="请输入改进措施及建议："
                style="width: 600px"
                resize="none"
              />
            </div>
          </div>
          <el-button @click="lastExportWordTpl2" style="margin-top: 20px"
            >导出word</el-button
          >
        </div>

        <div style="display: flex; width: 85%">
          <el-card
            shadow="hover"
            style="
              margin-top: 10px;
              margin-left: 10px;
              height: 200px;
              width: 45%;
              background: #c0c4cc;
              position: relative;
            "
            v-for="(item, index) in reflectList"
            :key="index"
            @click="reflectHistory(item.id)"
            v-show="!showItemReflect"
          >
            <h3>教育教学的反思</h3>
            <div
              style="
                display: flex;
                flex-direction: column;
                margin-top: 10px;
                justify-content: space-around;
                height: 150px;
              "
            >
              <p>学生姓名:{{ item.studentName }}</p>
              <p>资源教师：{{ item.teacherName }}</p>
              <p>年度：{{ item.startYear }} ~ {{ item.lastYear }}</p>
              <p>学期:{{ item.semester }}</p>
            </div>
            <el-button
              style="position: absolute; right: 10px; top: 10px"
              type="danger"
              @click.stop="delReflect(item.id)"
              >删除</el-button
            >
          </el-card>
        </div>
      </div>
    </el-tab-pane>
    <el-tab-pane label="学习行为" name="fourth">
      <stAction></stAction>
    </el-tab-pane>
  </el-tabs>
</template>

<style scoped>
.demo-tabs > .el-tabs__content {
  padding: 32px;
  color: #6b778c;
  font-size: 32px;
  font-weight: 600;
}

.rowCenter {
  text-align: center;
  border: 1px solid #ccc;
}
</style>
