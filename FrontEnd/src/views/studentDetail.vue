<script setup>
import { House } from "@element-plus/icons-vue";
import {
  ref,
  reactive,
  onMounted,
  onBeforeUnmount,
  shallowRef,
  watch,
} from "vue";
import Axios from "../request/index";
import { ElMessage, ElMessageBox } from "element-plus";
import { useRouter } from "vue-router";
import myEditor from "../components/editor/myEditor.vue";

const showEditor = ref(false);
const showSecond = ref(false);
const showThird = ref(false);

const activeName = ref("first");
const route = useRouter();
if (route.currentRoute.value.query.id == "2") {
  activeName.value = "second";
} else if (route.currentRoute.value.query.id == "3") {
  activeName.value = "third";
} else if (route.currentRoute.value.query.id == "4") {
  activeName.value = "fourth";
} else if (route.currentRoute.value.query.id == "5") {
  activeName.value = "fifth";
}
console.log(route.currentRoute.value.query.id);

const isShow = ref(false);
const isTrue = ref(false);
const form = reactive({});
const form1 = reactive({});

const options2 = ref([]);
const options4 = ref([]);
const options5 = ref([]);
Axios.get("/obstacle/getAll").then((res) => {
  options2.value = res.data;
  options4.value = res.data;
  options5.value = res.data;
});

const form2 = reactive({});
const load4 = async () => {
  const { data } = await Axios.get(
    `/familyBasic/get?studentId=${
      JSON.parse(localStorage.getItem("sq")).studentId
    }`
  );
  for (let key of Object.keys(data)) {
    form2[key] = data[key];
  }
  if (data.livingResources) {
    form2.livingResources = JSON.parse(data.livingResources);
  }
  if (data.familyResourceAdvantages) {
    form2.familyResourceAdvantages = JSON.parse(data.familyResourceAdvantages);
  }
  if (data.leisureResources) {
    form2.leisureResources = JSON.parse(data.leisureResources);
  }
  if (data.employmentResources) {
    form2.employmentResources = JSON.parse(data.employmentResources);
  }
};
load4();

const preserve3 = () => {
  if (form2.livingResources) {
    form2.livingResources = JSON.stringify(form2.livingResources);
  }
  if (form2.familyResourceAdvantages) {
    form2.familyResourceAdvantages = JSON.stringify(
      form2.familyResourceAdvantages
    );
  }
  if (form2.leisureResources) {
    form2.leisureResources = JSON.stringify(form2.leisureResources);
  }
  if (form2.employmentResources) {
    form2.employmentResources = JSON.stringify(form2.employmentResources);
  }

  Axios.post("/familyBasic/update", form2).then((res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });
      load4();

      console.log(form4);
    } else if (res.success == false) {
      ElMessage({
        showClose: true,
        message: res.message,
        type: "error",
      });
    }
  });
};

const form3 = reactive({});

const showStu = () => {
  console.log(form1);
};

const load3 = async () => {
  const { data } = await Axios.get(
    `/growUp/get?studentId=${JSON.parse(localStorage.getItem("sq")).studentId}`
  );
  for (let key of Object.keys(data)) {
    form3[key] = data[key];
  }
  if (data.industrialChemicalFactor) {
    form3.industrialChemicalFactor = JSON.parse(data.industrialChemicalFactor);
  }
  if (data.physicalFactor) {
    form3.physicalFactor = JSON.parse(data.physicalFactor);
  }
  if (data.biologicalFactor) {
    form3.biologicalFactor = JSON.parse(data.biologicalFactor);
  }
  if (data.nutritionalFactor) {
    form3.nutritionalFactor = JSON.parse(data.nutritionalFactor);
  }
  if (data.badHabit) {
    form3.badHabit = JSON.parse(data.badHabit);
  }
  if (data.predelivery) {
    form3.predelivery = JSON.parse(data.predelivery);
  }
  if (data.atChildbirth) {
    form3.atChildbirth = JSON.parse(data.atChildbirth);
  }

  form3.isSmokeOrDrink = eval(data.isSmokeOrDrink.toLowerCase());

  form3.isTakeMedicine = eval(data.isTakeMedicine.toLowerCase());

  form3.isTimeDifference = eval(data.isTimeDifference.toLowerCase());
};
load3();

const preserve2 = () => {
  if (form3.industrialChemicalFactor) {
    form3.industrialChemicalFactor = JSON.stringify(
      form3.industrialChemicalFactor
    );
  }
  if (form3.physicalFactor) {
    form3.physicalFactor = JSON.stringify(form3.physicalFactor);
  }
  if (form3.biologicalFactor) {
    form3.biologicalFactor = JSON.stringify(form3.biologicalFactor);
  }
  if (form3.nutritionalFactor) {
    form3.nutritionalFactor = JSON.stringify(form3.nutritionalFactor);
  }
  if (form3.badHabit) {
    form3.badHabit = JSON.stringify(form3.badHabit);
  }
  if (form3.predelivery) {
    form3.predelivery = JSON.stringify(form3.predelivery);
  }
  if (form3.atChildbirth) {
    form3.atChildbirth = JSON.stringify(form3.atChildbirth);
  }

  Axios.post("/growUp/update", form3).then((res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });
      load3();
      console.log(form4);
    } else if (res.success == false) {
      ElMessage({
        showClose: true,
        message: res.message,
        type: "error",
      });
    }
  });
};

const form4 = reactive({});

const load2 = async () => {
  const { data } = await Axios.get(
    `/physiology/get?studentId=${
      JSON.parse(localStorage.getItem("sq")).studentId
    }`
  );
  for (let key of Object.keys(data)) {
    form4[key] = data[key];
  }
  if (data.healthProblem) {
    form4.healthProblem = JSON.parse(data.healthProblem);
  }
  if (data.speakAssist) {
    form4.speakAssist = JSON.parse(data.speakAssist);
  }
};
load2();
const preserve = () => {
  if (form4.healthProblem) {
    form4.healthProblem = JSON.stringify(form4.healthProblem);
  }
  if (form4.speakAssist) {
    form4.speakAssist = JSON.stringify(form4.speakAssist);
  }
  Axios.post("/physiology/update", form4).then((res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });
      load2();

      console.log(form4);
    } else if (res.success == false) {
      ElMessage({
        showClose: true,
        message: res.message,
        type: "error",
      });
    }
  });
};

const form5 = reactive({});

const load = async () => {
  const { data } = await Axios.get(
    `/love/get?studentId=${JSON.parse(localStorage.getItem("sq")).studentId}`
  );
  for (let key of Object.keys(data)) {
    form5[key] = data[key];
  }

  if (data.otherFactors) {
    form5.otherFactors = JSON.parse(data.otherFactors);
  }
};
load();

const interest = () => {
  if (form5.otherFactors) {
    form5.otherFactors = JSON.stringify(form5.otherFactors);
  }
  Axios.post("/love/update", form5).then((res) => {
    console.log(res);
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });
      load();
    } else if (res.success == false) {
      ElMessage({
        showClose: true,
        message: res.message,
        type: "error",
      });
    }
  });
};

const data = [
  {
    value: "经济水平",
    label: "经济水平",
  },
  {
    value: "人力资源",
    label: "人力资源",
  },
  {
    value: "环境资源",
    label: "环境资源",
  },
  {
    value: "就业资源",
    label: "就业资源",
  },
];

const data2 = [
  {
    value: "超市",
    label: "超市",
  },
  {
    value: "餐馆",
    label: "餐馆",
  },
  {
    value: "美发店",
    label: "美发店",
  },
  {
    value: "银行",
    label: "银行",
  },
  {
    value: "邮局",
    label: "邮局",
  },
  {
    value: "医院",
    label: "医院",
  },
  {
    value: "车站",
    label: "车站",
  },
];

const options = [
  {
    value: "男",
    label: "男",
  },
  {
    value: "女",
    label: "女",
  },
];

const options3 = [
  {
    value: "疑似",
    label: "疑似",
  },
  {
    value: "轻度",
    label: "轻度",
  },
  {
    value: "轻中度",
    label: "轻中度",
  },
  {
    value: "中度",
    label: "中度",
  },
  {
    value: "中重度",
    label: "中重度",
  },
  {
    value: "重度",
    label: "重度",
  },
];
const optionsClass = ref("");
Axios.get("/clazz/getAll").then((res) => {
  optionsClass.value = res.data;
});
const optionsBlood = [
  {
    value: "A型",
    label: "A型",
  },
  {
    value: "B型",
    label: "B型",
  },
  {
    value: "AB型",
    label: "AB型",
  },
  {
    value: "O型",
    label: "O型",
  },
];
const optionsStudent = [
  {
    value: "在校生",
    label: "在校生",
  },
  {
    value: "休学",
    label: "休学",
  },
  {
    value: "出国",
    label: "出国",
  },
  {
    value: "其他离校",
    label: "其他离校",
  },
  {
    value: "退学",
    label: "退学",
  },
  {
    value: "开除",
    label: "开除",
  },
];

const ob = reactive({});

const addOb = reactive({ province: [], city: [], region: [] });
Axios.get("/region/getAll").then((res) => {
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
console.log(ob);
const changeProvince = (val) => {
  isTrue.value = true;
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

const changeProvince2 = (val) => {
  isShow.value = true;
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

const obArr = Object.keys(ob).map((k) => {
  return {
    name: ob[k],
    num: k,
  };
});
console.log(addOb);
const optionsCome = [
  {
    value: "3万以下",
    label: "3万以下",
  },
  {
    value: "3-5万",
    label: "3-5万",
  },
  {
    value: "5-10万",
    label: "5-10万",
  },
  {
    value: "10-36万",
    label: "10-36万",
  },
  {
    value: "36-50万",
    label: "36-50万",
  },
  {
    value: "50-80万",
    label: "50-80万",
  },
  {
    value: "80-200万",
    label: "80-200万",
  },
  {
    value: "200万以上",
    label: "200万以上",
  },
];
const optionsLan = [
  {
    value: "普通话为主",
    label: "普通话为主",
  },
  {
    value: "方言为主",
    label: "方言为主",
  },
  {
    value: "普通话与方言交替",
    label: "普通话与方言交替",
  },
  {
    value: "英语为主",
    label: "英语为主",
  },
  {
    value: "汉英交替",
    label: "汉英交替",
  },
  {
    value: "其他",
    label: "其他",
  },
];

const optionsType = [
  {
    value: "权威型：高关爱、高控制",
    label: "权威型：高关爱、高控制",
  },
  {
    value: "专制型：低关爱、高控制",
    label: "专制型：低关爱、高控制",
  },
  {
    value: "民主型：高关爱、低控制",
    label: "民主型：高关爱、低控制",
  },
];

const dataArder = [
  {
    value: "公园",
    label: "公园",
  },
  {
    value: "影院",
    label: "影院",
  },
  {
    value: "咖啡馆",
    label: "咖啡馆",
  },
  {
    value: "唱吧",
    label: "唱吧",
  },
  {
    value: "剧院",
    label: "剧院",
  },
];

const dataJob = [
  {
    value: "工厂",
    label: "工厂",
  },
  {
    value: "作坊",
    label: "作坊",
  },
  {
    value: "工作室",
    label: "工作室",
  },
];

const optionsMood = [
  {
    value: "稳定",
    label: "稳定",
  },
  {
    value: "不稳定",
    label: "不稳定",
  },
];
const optionsSleep = [
  {
    value: "优",
    label: "优",
  },
  {
    value: "良",
    label: "良",
  },
  {
    value: "差",
    label: "差",
  },
];
const optionsIndustry = [
  {
    value: "无",
    label: "无",
  },
  {
    value: "矿工业",
    label: "矿工业",
  },
  {
    value: "农业",
    label: "农业",
  },
  {
    value: "装潢业",
    label: "装潢业",
  },
  {
    value: "电子业",
    label: "电子业",
  },
  {
    value: "科研",
    label: "科研",
  },
  {
    value: "美容美发业",
    label: "美容美发业",
  },
  {
    value: "服务业",
    label: "服务业",
  },
  {
    value: "房屋装修",
    label: "房屋装修",
  },
  {
    value: "居家周边环境污染，化工厂",
    label: "居家周边环境污染，化工厂",
  },
  {
    value: "噪音",
    label: "噪音",
  },
  {
    value: "其他",
    label: "其他",
  },
];
const optionsPhy = [
  {
    value: "无",
    label: "无",
  },
  {
    value: "电离辐射",
    label: "电离辐射",
  },
  {
    value: "视频终端",
    label: "视频终端",
  },
  {
    value: "有害气体",
    label: "有害气体",
  },
  {
    value: "高温",
    label: "高温",
  },
  {
    value: "气压改变",
    label: "气压改变",
  },
  {
    value: "机械性损伤",
    label: "机械性损伤",
  },
  {
    value: "噪音",
    label: "噪音",
  },
  {
    value: "其他",
    label: "其他",
  },
];
const optionsLiving = [
  {
    value: "无",
    label: "无",
  },
  {
    value: "风疹病毒",
    label: "风疹病毒",
  },
  {
    value: "梅毒",
    label: "梅毒",
  },
  {
    value: "艾滋病毒",
    label: "艾滋病毒",
  },
  {
    value: "巨细胞病毒",
    label: "巨细胞病毒",
  },
  {
    value: "脑炎病毒",
    label: "脑炎病毒",
  },
  {
    value: "水痘病毒",
    label: "水痘病毒",
  },
  {
    value: "腮腺炎病毒",
    label: "腮腺炎病毒",
  },
  {
    value: "肝炎",
    label: "肝炎",
  },
  {
    value: "弓形体（宠物）",
    label: "弓形体（宠物）",
  },
  {
    value: "涤虫/蛔虫",
    label: "涤虫/蛔虫",
  },
  {
    value: "疫苗反应",
    label: "疫苗反应",
  },
];

const optionsNutrition = [
  {
    value: "无",
    label: "无",
  },
  {
    value: "蛋白质（缺乏）",
    label: "蛋白质（缺乏）",
  },
  {
    value: "微量元素（缺乏）",
    label: "微量元素（缺乏）",
  },
  {
    value: "维生素（缺乏）",
    label: "维生素（缺乏）",
  },
  {
    value: "蛋白质（过剩）",
    label: "蛋白质（过剩）",
  },
  {
    value: "微量元素（过剩）",
    label: "微量元素（过剩）",
  },
  {
    value: "其他",
    label: "其他",
  },
];
const optionsBad = [
  {
    value: "无",
    label: "无",
  },
  {
    value: "挑食",
    label: "挑食",
  },
  {
    value: "厌世",
    label: "厌世",
  },
  {
    value: "贪食",
    label: "贪食",
  },
  {
    value: "尿床",
    label: "尿床",
  },
  {
    value: "咬指甲",
    label: "咬指甲",
  },
  {
    value: "吸允手指",
    label: "吸允手指",
  },
  {
    value: "性自慰",
    label: "性自慰",
  },
  {
    value: "动作刻板或僵化",
    label: "动作刻板或僵化",
  },
  {
    value: "碰撞他人或物品",
    label: "碰撞他人或物品",
  },
  {
    value: "说谎",
    label: "说谎",
  },
  {
    value: "偷东西",
    label: "偷东西",
  },
  {
    value: "说脏话",
    label: "说脏话",
  },
  {
    value: "打架",
    label: "打架",
  },
];

const optionsBefore = [
  {
    value: "正常",
    label: "正常",
  },
  {
    value: "胎盘早剥",
    label: "胎盘早剥",
  },
  {
    value: "羊水异常（少）",
    label: "羊水异常（少）",
  },
  {
    value: "羊水异常（多）",
    label: "羊水异常（多）",
  },
  {
    value: "胎盘感染",
    label: "胎盘感染",
  },
  {
    value: "胎盘位置异常",
    label: "胎盘位置异常",
  },
  {
    value: "羊水胎粪污染",
    label: "羊水胎粪污染",
  },
  {
    value: "胎儿心率不齐",
    label: "胎儿心率不齐",
  },
];

const optionsIng = [
  {
    value: "剖腹产",
    label: "剖腹产",
  },
  {
    value: "顺产",
    label: "顺产",
  },
  {
    value: "难产",
    label: "难产",
  },
  {
    value: "使用产钳或胎头吸引助产",
    label: "使用产钳或胎头吸引助产",
  },
  {
    value: "脐绕颈",
    label: "脐绕颈",
  },
  {
    value: "早产",
    label: "早产",
  },
  {
    value: "过期产(42周及以后)",
    label: "过期产(42周及以后)",
  },
  {
    value: "黄疸(发黄)",
    label: "黄疸(发黄)",
  },
  {
    value: "溶血",
    label: "溶血",
  },
  {
    value: "生产期使用麻醉剂/镇定剂",
    label: "生产期使用麻醉剂/镇定剂",
  },
];

const optionsStifle = [
  {
    value: "无",
    label: "无",
  },
  {
    value: "轻度",
    label: "轻度",
  },
  {
    value: "重度",
    label: "重度",
  },
];

const optionsFeed = [
  {
    value: "母乳",
    label: "母乳",
  },
  {
    value: "奶粉",
    label: "奶粉",
  },
  {
    value: "其他",
    label: "其他",
  },
];
const optionsHeath = [
  {
    value: "胃肠道疾病",
    label: "胃肠道疾病",
  },
  {
    value: "癫痫",
    label: "癫痫",
  },
  {
    value: "哮喘",
    label: "哮喘",
  },
  {
    value: "进食障碍",
    label: "进食障碍",
  },
  {
    value: "听视觉障碍",
    label: "听视觉障碍",
  },
];

const optionsNolangu = [
  {
    value: "实物",
    label: "实物",
  },
  {
    value: "图片",
    label: "图片",
  },
  {
    value: "沟通板",
    label: "沟通板",
  },
  {
    value: "新媒体产品",
    label: "新媒体产品",
  },
  {
    value: "尚未使用",
    label: "尚未使用",
  },
];
const optionsFactors = [
  {
    value: "声音",
    label: "声音",
  },
  {
    value: "光线",
    label: "光线",
  },
  {
    value: "气味",
    label: "气味",
  },
  {
    value: "质地",
    label: "质地",
  },
  {
    value: "人员",
    label: "人员",
  },
  {
    value: "特定场景",
    label: "特定场景",
  },
];
const addForm = reactive({
  order: "",
  name: "",
  relation: [],
  birth: "",
  education: "",
  job: "",
  phone: "",
});

const addList = ref([]);
const addP = () => {
  addList.value.push({ ...addForm });
};

const addForm2 = reactive({
  relation: [],
  mainPer: false,
  allTime: "",
});

const addList2 = ref([]);
const addcommon = () => {
  addList2.value.push({ ...addForm2 });
};

const addForm3 = reactive({
  date: "",
  sch: "",
  project: "",
});

const addedu = ref([]);
const addhistory = () => {
  addedu.value.push({ ...addForm3 });
};

const addForm4 = reactive({
  date: "",
  sch: "",
  content: "",
});
const addRecure = ref([]);
const addRecureHis = () => {
  addRecure.value.push({ ...addForm4 });
};

const optionsRelation = [
  {
    value: "父亲",
    label: "父亲",
  },
  {
    value: "母亲",
    label: "母亲",
  },
  {
    value: "爷爷",
    label: "爷爷",
  },
  {
    value: "奶奶",
    label: "奶奶",
  },
  {
    value: "姥姥",
    label: "姥姥",
  },
  {
    value: "姥爷",
    label: "姥爷",
  },
  {
    value: "哥哥",
    label: "哥哥",
  },
  {
    value: "姐姐",
    label: "姐姐",
  },
  {
    value: "弟弟",
    label: "弟弟",
  },
  {
    value: "妹妹",
    label: "妹妹",
  },
];
const del = (index) => {
  addList.value.splice(index, 1);
};
const del2 = (index) => {
  addList2.value.splice(index, 1);
};

const del3 = (index) => {
  addedu.value.splice(index, 1);
};
const del4 = (index) => {
  addRecure.value.splice(index, 1);
};

const load5 = () => {
  Axios.get(
    `/studentBasic/get?studentId=${
      JSON.parse(localStorage.getItem("sq")).studentId
    }`
  ).then((res) => {
    for (let key of Object.keys(res.data.studentBasic)) {
      form[key] = res.data.studentBasic[key];
    }
    for (let key1 of Object.keys(res.data.student)) {
      form1[key1] = res.data.student[key1];
    }

    form1.obstacleId = res.data.student.obstacleName;

    let res2 = options2.value.filter((o) => o.obstacleName == form1.obstacleId);
    if (res2.length > 0) {
      form1.obstacleId = res2[0].obstacleId;
    }

    let res3 = options5.value.filter(
      (o) => o.obstacleId == form.otherObstacleId
    );
    if (res3.length > 0) {
      form.otherObstacleName = res3[0].obstacleName;
    }

    console.log(res.data.studentBasic.registeredResidence);

    form1.clazzName = res.data.student.clazzName;

    // let prov = res.data.studentBasic.registeredResidence.slice(0, 2) + "0000";
    // let cit = res.data.studentBasic.registeredResidence.slice(0, 4) + "00";
    // let regio = res.data.studentBasic.registeredResidence;
  });
};
load5();

console.log(form1);
console.log(form);
const basic = () => {
  Axios.put("/studentBasic/update", form).then(async (res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });

      await load5();
    } else if (res.success == false) {
      ElMessage({
        showClose: true,
        message: res.message,
        type: "error",
      });
    }
  });
  form1.arrangeId = 1;
  Axios.put("/student/update", form1).then((res) => {
    if (res.success == true) {
      load5();
    }
  });
};

const getFileList = ref([{}, {}]);
const getAllFile = () => {
  Axios.get(
    `/studentDevelopment/getAll?studentId=${
      JSON.parse(localStorage.getItem("sq")).studentId
    }`
  ).then((res) => {
    getFileList.value = res.data;
    console.log(getFileList.value);
  });
};

getAllFile();

const testcomRef = ref();
const getSonHander = () => {
  showEditor.value = false;
  // console.log("获取子组件中的性别", testcomRef.value.valueHtml);
  Axios.post("/studentDevelopment/add", {
    studentId: JSON.parse(localStorage.getItem("sq")).studentId,
    richText: testcomRef.value.valueHtml,
  }).then(async (res) => {
    if (res.success == true) {
      ElMessage({
        showClose: true,
        message: res.data,
        type: "success",
      });
      await getAllFile();
    } else if (res.success == false) {
      ElMessage({
        showClose: true,
        message: res.message,
        type: "error",
      });
    }
  });
};
const parentVal = ref("");
const todetail = (content) => {
  parentVal.value = "";
  parentVal.value = content;
  console.log(parentVal.value);
};
</script>

<template>
  <div>
    <p
      style="
        color: #1677ff;
        font-size: 14px;
        margin-left: 30px;
        display: flex;
        align-items: center;
        margin-top: 10px;
      "
      @click="$router.push('/management/studentCenter')"
    >
      <el-icon><House /></el-icon>返回学生主页
    </p>

    <div
      style="
        /* width: 93%; */
        background-color: #fff;
        /* margin-left: 30px; */
        padding: 1%;
        /* margin-top: 10px; */
      "
    >
      <el-tabs v-model="activeName" class="demo-tabs" @tab-click="handleClick">
        <el-tab-pane label="基本信息" name="first">
          <div style="display: flex; flex-wrap: wrap">
            <div class="box">
              <p style="font-size: 14px">
                <span style="color: red">*</span> 姓名
              </p>
              <el-input v-model="form1.studentName" style="margin-top: 10px" />
            </div>

            <div class="box mar_box">
              <p style="font-size: 14px">昵称</p>
              <el-input
                v-model="form.nickname"
                style="margin-top: 10px"
                placeholder="请输入昵称"
              />
            </div>

            <div class="box mar_box">
              <p style="font-size: 14px">
                <span style="color: red">*</span>性别
              </p>
              <el-select
                v-model="form1.studentGender"
                style="margin-top: 10px; width: 100%"
                placeholder=" "
              >
                <el-option
                  v-for="item in options"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                />
              </el-select>
            </div>
            <div class="box mar_box">
              <p style="font-size: 14px">
                <span style="color: red">*</span>出生日期
              </p>
              <el-date-picker
                v-model="form.birthday"
                type="date"
                placeholder=""
                style="margin-top: 10px; width: 100%"
              />
            </div>
          </div>

          <div style="display: flex; flex-wrap: wrap">
            <div class="box">
              <p style="font-size: 14px">
                <span style="color: red">*</span> 障碍类型
              </p>
              <el-select
                v-model="form1.obstacleId"
                style="margin-top: 10px; width: 100%"
              >
                <el-option
                  v-for="item in options2"
                  :key="item.obstacleId"
                  :label="item.obstacleName"
                  :value="item.obstacleId"
                />
              </el-select>
            </div>

            <div class="box mar_box">
              <p style="font-size: 14px">障碍程度</p>
              <el-select
                v-model="form.obstacleDegree"
                style="margin-top: 10px; width: 100%"
                placeholder="请选择障碍程度"
              >
                <el-option
                  v-for="item in options3"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                />
              </el-select>
            </div>

            <div class="box mar_box">
              <p style="font-size: 14px">伴随障碍类型</p>
              <el-select
                v-model="form.otherObstacleName"
                style="margin-top: 10px; width: 100%"
              >
                <el-option
                  v-for="item in options5"
                  :key="item.obstacleId"
                  :label="item.obstacleName"
                  :value="item.obstacleId"
                />
              </el-select>
            </div>
            <div class="box mar_box">
              <p style="font-size: 14px">身份证</p>
              <el-input
                v-model="form.cardId"
                style="margin-top: 10px"
                placeholder="请输入身份证"
              />
            </div>
          </div>

          <!-- 三 -->
          <div style="display: flex; flex-wrap: wrap">
            <div class="box">
              <p style="font-size: 14px">残疾证号</p>
              <el-input
                v-model="form.obstacleCardId"
                style="margin-top: 10px"
                placeholder="请输入残疾证号"
              />
            </div>
            <div class="box mar_box">
              <p style="font-size: 14px">就读班级</p>
              <el-select
                v-model="form1.clazzName"
                style="margin-top: 10px; width: 100%"
              >
                <el-option
                  v-for="item in optionsClass"
                  :key="item.clazzId"
                  :label="item.clazzName"
                  :value="item.clazzId"
                />
                >
              </el-select>
            </div>

            <div class="box mar_box">
              <p style="font-size: 14px">民族</p>
              <el-input
                v-model="form.nation"
                style="margin-top: 10px"
                placeholder="请输入民族"
              />
            </div>
            <div class="box mar_box">
              <p style="font-size: 14px">血型</p>
              <el-select
                v-model="form.bloodGroup"
                style="margin-top: 10px; width: 100%"
                placeholder="请选择血型"
              >
                <el-option
                  v-for="item in optionsBlood"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                />
              </el-select>
            </div>
          </div>

          <!-- 四 -->
          <div style="display: flex; flex-wrap: wrap">
            <div class="box">
              <p style="font-size: 14px">国籍</p>
              <el-input
                v-model="form.nationality"
                style="margin-top: 10px"
                placeholder="请输入国籍"
              />
            </div>

            <div class="box mar_box">
              <p style="font-size: 14px">学籍状态</p>
              <el-select
                v-model="form.studentStatus"
                style="margin-top: 10px; width: 100%"
                placeholder="请选择学籍状态"
              >
                <el-option
                  v-for="item in optionsStudent"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                />
              </el-select>
            </div>

            <div class="box mar_box">
              <p style="font-size: 14px">学籍号</p>
              <el-input
                v-model="form.studentNo"
                style="margin-top: 10px"
                placeholder="请输入学籍号"
              />
            </div>
            <div class="box mar_box">
              <p style="font-size: 14px">宗教信仰</p>
              <el-input
                v-model="form.religiousBelief"
                style="margin-top: 10px"
                placeholder="请输入宗教信仰"
              />
            </div>
          </div>

          <!-- 五 -->
          <div style="display: flex; flex-wrap: wrap">
            <div class="box" style="padding-bottom: 50px">
              <p style="font-size: 14px">户籍地</p>
              <el-select
                v-model="form.province"
                placeholder="请选择省份"
                style="width: 100%; margin-top: 10px"
                @change="changeProvince"
              >
                <el-option
                  v-for="item in addOb.province"
                  :key="item.name"
                  :label="item.name"
                  :value="item.value"
                />
              </el-select>

              <el-select
                v-model="form.city"
                placeholder="请选择市"
                style="width: 100%"
                @change="changeCity"
                v-if="addOb.city.length != 0 && isTrue"
              >
                <el-option
                  v-for="item in addOb.city"
                  :key="item.name"
                  :label="item.name"
                  :value="item.value"
                />
              </el-select>
              <el-select
                v-model="form.region"
                placeholder="请选择区"
                style="width: 100%"
                v-if="addOb.region.length != 0 && isTrue"
              >
                <el-option
                  v-for="item in addOb.region"
                  :key="item.value"
                  :label="item.name"
                  :value="item.value"
                />
              </el-select>
            </div>
            <div class="box mar_box" style="padding-bottom: 50px">
              <p style="font-size: 14px">生长地</p>
              <el-select
                v-model="form.province2"
                placeholder="请选择省份"
                style="width: 100%; margin-top: 10px"
                @change="changeProvince2"
              >
                <el-option
                  v-for="item in addOb.province"
                  :key="item.name"
                  :label="item.name"
                  :value="item.value"
                />
              </el-select>

              <el-select
                v-model="form.city2"
                placeholder="请选择市"
                style="width: 100%"
                @change="changeCity"
                v-if="addOb.city.length != 0 && isShow"
              >
                <el-option
                  v-for="item in addOb.city"
                  :key="item.name"
                  :label="item.name"
                  :value="item.value"
                />
              </el-select>
              <el-select
                v-model="form.region2"
                placeholder="请选择区"
                style="width: 100%"
                v-if="addOb.region.length != 0 && isShow"
              >
                <el-option
                  v-for="item in addOb.region"
                  :key="item.value"
                  :label="item.name"
                  :value="item.value"
                />
              </el-select>
            </div>
          </div>
          <div style="text-align: right">
            <el-button type="primary" @click="basic()">保存</el-button>
          </div>

          <el-button
            type="info"
            v-show="!showEditor"
            plain
            @click="showEditor = true"
            >上传</el-button
          >
          <el-button
            type="info"
            v-show="showEditor"
            plain
            @click="showEditor = false"
            >取消</el-button
          >
          <myEditor v-if="showEditor" ref="testcomRef"> </myEditor>
          <el-button v-if="showEditor" @click="getSonHander">保存</el-button>
          <div style="display: flex; flex-wrap: wrap">
            <el-card
              class="box-card"
              shadow="hover"
              style="margin-top: 10px; margin-left: 10px"
              v-for="(item, index) in getFileList"
              :key="index"
              v-show="!showSecond"
              @click="
                todetail(item.richText);
                showSecond = true;
              "
            >
              <p>创建时间：</p>
              <p
                style="
                  display: -webkit-box;
                  -webkit-line-clamp: 2;
                  -webkit-box-orient: vertical;
                  text-overflow: ellipsis;
                  overflow: hidden;
                "
              >
                {{ item.createTime }}
              </p>
              <p>
                内容简略：<span
                  v-html="item.richText"
                  style="
                    display: -webkit-box;
                    -webkit-line-clamp: 2;
                    -webkit-box-orient: vertical;
                    text-overflow: ellipsis;
                    overflow: hidden;
                  "
                ></span>
              </p>
            </el-card>
          </div>
          <myEditor
            v-if="showSecond"
            :value="parentVal"
            style="margin-top: 10px"
          >
          </myEditor>
          <el-button v-if="showSecond" @click="showSecond = false"
            >取消</el-button
          >
        </el-tab-pane>

        <el-tab-pane label="家庭信息" name="second">
          <!-- 一 -->
          <div style="display: flex; flex-wrap: wrap">
            <div class="box">
              <p style="font-size: 14px">家庭人数</p>
              <el-input
                v-model="form2.numberOfFamily"
                style="margin-top: 10px"
                placeholder="请输入家庭人数"
              />
            </div>

            <div class="box mar_box">
              <p style="font-size: 14px">家庭住址</p>
              <el-input
                v-model="form2.homeAddress"
                style="margin-top: 10px"
                placeholder="请输入家庭住址"
              />
            </div>

            <div class="box mar_box">
              <p style="font-size: 14px">家庭年收入</p>
              <el-select
                v-model="form2.annualIncome"
                style="margin-top: 10px; width: 100%"
                placeholder="请选择家庭年收入"
              >
                <el-option
                  v-for="item in optionsCome"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                />
              </el-select>
            </div>
            <div class="box mar_box">
              <p style="font-size: 14px">家庭语言环境</p>
              <el-select
                v-model="form2.languageEnvironment"
                style="margin-top: 10px; width: 100%"
                placeholder="请选择家庭语言环境"
              >
                <el-option
                  v-for="item in optionsLan"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                />
              </el-select>
            </div>
          </div>
          <!-- 二 -->
          <div style="display: flex; flex-wrap: wrap">
            <div class="box">
              <p style="font-size: 14px">教养方式</p>
              <el-select
                v-model="form2.parentingStyle"
                style="margin-top: 10px; width: 100%"
                placeholder="教养方式"
              >
                <el-option
                  v-for="item in optionsType"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                />
              </el-select>
            </div>

            <div class="box mar_box">
              <p style="font-size: 14px">家庭资源优势</p>
              <el-tree-select
                v-model="form2.familyResourceAdvantages"
                :data="data"
                multiple
                :render-after-expand="false"
                style="width: 100%; margin-top: 10px"
                placeholder="家庭资源优势"
              />
            </div>
            <div class="box mar_box">
              <p style="font-size: 14px">家庭资源优势说明</p>
              <el-input
                v-model="form2.familyResourceAdvantagesMess"
                style="margin-top: 10px"
                placeholder="请输入家庭资源优势说明"
              />
            </div>
            <div class="box mar_box">
              <p style="font-size: 14px">生活资源</p>

              <el-tree-select
                v-model="form2.livingResources"
                :data="data2"
                multiple
                :render-after-expand="false"
                style="width: 100%; margin-top: 10px"
                placeholder="家庭资源优势"
              />
            </div>
          </div>

          <!-- 三 -->
          <div style="display: flex; flex-wrap: wrap">
            <div class="box">
              <p style="font-size: 14px">其他生活资源</p>
              <el-input
                v-model="form2.otherLivingResources"
                style="margin-top: 10px"
                placeholder="请输入家庭资源优势说明"
              />
            </div>

            <div class="box mar_box">
              <p style="font-size: 14px">休闲资源</p>
              <el-tree-select
                v-model="form2.leisureResources"
                :data="dataArder"
                multiple
                :render-after-expand="false"
                style="width: 100%; margin-top: 10px"
                placeholder="休闲资源"
              />
            </div>
            <div class="box mar_box">
              <p style="font-size: 14px">其他休闲资源</p>
              <el-input
                v-model="form2.otherLeisureResources"
                style="margin-top: 10px"
                placeholder="请输入其他休闲资源"
              />
            </div>
            <div class="box mar_box">
              <p style="font-size: 14px">就业资源</p>

              <el-tree-select
                v-model="form2.employmentResources"
                :data="dataJob"
                multiple
                :render-after-expand="false"
                style="width: 100%; margin-top: 10px"
                placeholder="就业资源"
              />
            </div>
          </div>
          <!-- 四 -->
          <div class="box">
            <p style="font-size: 14px">其他就业资源</p>
            <el-input
              v-model="form2.otherEmploymentResources"
              style="margin-top: 10px"
              placeholder="请输入其他就业资源"
            />
          </div>

          <p style="display: flex; justify-content: space-between; width: 90%">
            <span style="font-weight: bolder">家庭成员</span>
            <el-button type="primary" @click="addP()">+新增成员</el-button>
          </p>

          <el-table
            :data="addList"
            style="width: 90%"
            height="250"
            :cell-style="{ textAlign: 'left' }"
            :header-cell-style="{
              'text-align': 'left',
              color: 'black',
              fontWeight: 'bolder',
            }"
          >
            <el-table-column label="序号" width="auto" min-width="10%">
              <template #default="scope">
                {{ scope.$index + 1 }}
              </template>
            </el-table-column>
            <el-table-column label="姓名" width="auto" min-width="10%">
              <!-- <el-input text v-model="addList[scope.$index].order"></el-input> -->
              <template #default="scope">
                <el-input text v-model="scope.row.name"></el-input>
              </template>
            </el-table-column>
            <el-table-column label="关系" width="auto" min-width="10%">
              <template #default="scope">
                <el-select
                  v-model="scope.row.relation"
                  placeholder=" "
                  style="width: 100%"
                >
                  <el-option
                    v-for="item in optionsRelation"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value"
                  />
                </el-select>
              </template>
            </el-table-column>
            <el-table-column label="出生日期" width="auto" min-width="15%">
              <template #default="scope">
                <el-input text v-model="scope.row.birth"></el-input>
              </template>
            </el-table-column>
            <el-table-column label="受教育程度" width="auto" min-width="20%">
              <template #default="scope">
                <el-input text v-model="scope.row.education"></el-input>
              </template>
            </el-table-column>

            <el-table-column label="职业" width="auto" min-width="10%">
              <template #default="scope">
                <el-input text v-model="scope.row.job"></el-input>
              </template>
            </el-table-column>

            <el-table-column label="电话" width="auto" min-width="15%">
              <template #default="scope">
                <el-input text v-model="scope.row.phone"></el-input>
              </template>
            </el-table-column>

            <el-table-column label="操作" width="auto" min-width="10%">
              <template #default="scope">
                <el-button
                  style="color: red; border: 1px solid transparent"
                  @click="del(scope.$index)"
                  >删除</el-button
                >
              </template>
            </el-table-column>
          </el-table>

          <p
            style="
              display: flex;
              justify-content: space-between;
              margin-top: 30px;
              width: 90%;
            "
          >
            <span style="font-weight: bolder">共同生活者</span>
            <el-button type="primary" @click="addcommon()"
              >+新增共同生活者</el-button
            >
          </p>

          <el-table
            :data="addList2"
            style="width: 94%"
            height="250"
            :cell-style="{ textAlign: 'left' }"
            :header-cell-style="{
              'text-align': 'left',
              color: 'black',
              fontWeight: 'bolder',
            }"
          >
            <el-table-column label="序号" width="auto" min-width="10%">
              <template #default="scope">
                {{ scope.$index + 1 }}
              </template>
            </el-table-column>

            <el-table-column label="关系" width="auto" min-width="30%">
              <template #default="scope">
                <el-select
                  v-model="scope.row.relation"
                  placeholder=" "
                  style="width: 100%"
                >
                  <el-option
                    v-for="item in optionsRelation"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value"
                  />
                </el-select>
              </template>
            </el-table-column>

            <el-table-column label="主要照料者" width="auto" min-width="20%">
              <template #default="scope">
                <el-switch v-model="scope.row.mainPer" />
              </template>
            </el-table-column>

            <el-table-column label="共同生活时间" width="auto" min-width="30%">
              <template #default="scope">
                <el-input text v-model="scope.row.allTime"></el-input>
              </template>
            </el-table-column>

            <el-table-column label="操作" width="auto" min-width="10%">
              <template #default="scope">
                <el-button
                  style="color: red; border: 1px solid transparent"
                  @click="del2(scope.$index)"
                  >删除</el-button
                >
              </template>
            </el-table-column>
          </el-table>

          <div style="text-align: right; width: 90%">
            <el-button type="primary" @click="preserve3()">保存</el-button>
          </div>
        </el-tab-pane>

        <el-tab-pane label="成长信息" name="third">
          <p style="font-weight: bolder; font-size: 25px">成长史</p>
          <p style="font-size: 14px; font-weight: bold; margin-top: 15px">
            妊娠初期
          </p>
          <div style="display: flex; flex-wrap: wrap; margin-top: 20px">
            <div class="box">
              <p>妊娠初期体重</p>
              <el-input
                v-model="form3.trimesterWeight"
                placeholder="请输入妊娠初期体重"
                style="margin-top: 10px; width: 100%"
              >
                <template #append>kg</template>
              </el-input>
            </div>
            <div class="box mar_box">
              <p>是否服用药物</p>
              <el-switch
                v-model="form3.isTakeMedicine"
                style="margin-top: 10px"
              />
            </div>
            <div class="box mar_box">
              <p>是否抽烟酗酒</p>
              <el-switch
                v-model="form3.isSmokeOrDrink"
                style="margin-top: 10px"
              />
            </div>
          </div>

          <p style="font-size: 14px; font-weight: bold">妊娠期间</p>
          <!-- 二 -->
          <div style="display: flex; flex-wrap: wrap; margin-top: 20px">
            <div class="box">
              <p style="font-size: 14px">情绪特征</p>
              <el-select
                v-model="form3.emotionalCharacteristics"
                style="margin-top: 10px; width: 100%"
                placeholder="请选择情绪特征"
              >
                <el-option
                  v-for="item in optionsMood"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                />
              </el-select>
            </div>

            <div class="box mar_box">
              <p style="font-size: 14px">异常生理反应</p>
              <el-input
                v-model="form3.physiologicalReaction"
                style="margin-top: 10px"
                placeholder="异常生理反应"
              />
            </div>
            <div class="box mar_box">
              <p style="font-size: 14px">睡眠质量</p>
              <el-select
                v-model="form3.sleepQuality"
                style="margin-top: 10px; width: 100%"
                placeholder="请选择睡眠质量"
              >
                <el-option
                  v-for="item in optionsSleep"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                />
              </el-select>
            </div>
            <div class="box mar_box">
              <p style="font-size: 14px">是否倒时差</p>
              <el-switch
                v-model="form3.isTimeDifference"
                style="margin-top: 10px"
              />
            </div>
          </div>
          <!-- 三 -->
          <div style="display: flex; flex-wrap: wrap; margin-top: 20px">
            <div class="box">
              <p style="font-size: 14px">工业化学因素</p>

              <el-tree-select
                v-model="form3.industrialChemicalFactor"
                :data="optionsIndustry"
                multiple
                :render-after-expand="false"
                style="width: 100%; margin-top: 10px"
                placeholder="请选择工业化学因素"
              />
            </div>

            <div class="box mar_box">
              <p style="font-size: 14px">物理因素</p>

              <el-tree-select
                v-model="form3.physicalFactor"
                :data="optionsPhy"
                multiple
                :render-after-expand="false"
                style="width: 100%; margin-top: 10px"
                placeholder="请选择物理因素"
              />
            </div>
            <div class="box mar_box">
              <p style="font-size: 14px">生物因素</p>
              <el-tree-select
                v-model="form3.biologicalFactor"
                :data="optionsLiving"
                multiple
                :render-after-expand="false"
                style="width: 100%; margin-top: 10px"
                placeholder="请选择生物因素"
              />
            </div>
            <div class="box mar_box">
              <p style="font-size: 14px">营养因素</p>

              <el-tree-select
                v-model="form3.nutritionalFactor"
                :data="optionsNutrition"
                multiple
                :render-after-expand="false"
                style="width: 100%; margin-top: 10px"
                placeholder="请选择营养因素"
              />
            </div>
          </div>
          <div style="display: flex; flex-wrap: wrap; margin-top: 20px">
            <div class="box">
              <p style="font-size: 14px">不良习惯</p>

              <el-tree-select
                v-model="form3.badHabit"
                :data="optionsBad"
                multiple
                :render-after-expand="false"
                style="margin-top: 10px; width: 100%"
                placeholder="请选择工业化学因素"
              />
            </div>
          </div>

          <p style="font-size: 14px; font-weight: bold; margin-top: 10px">
            分娩过程
          </p>
          <div style="display: flex; margin-top: 10px; flex-wrap: wrap">
            <div class="box">
              <p style="font-size: 14px">分娩前</p>

              <el-tree-select
                v-model="form3.predelivery"
                :data="optionsBefore"
                multiple
                :render-after-expand="false"
                style="width: 100%; margin-top: 10px"
                placeholder="请选择"
              />
            </div>

            <div class="box mar_box">
              <p style="font-size: 14px">分娩时</p>

              <el-tree-select
                v-model="form3.atChildbirth"
                :data="optionsIng"
                multiple
                :render-after-expand="false"
                style="width: 100%; margin-top: 10px"
                placeholder="请选择"
              />
            </div>
          </div>
          <p style="font-size: 14px; font-weight: bold; margin-top: 10px">
            新生儿特征
          </p>
          <div style="display: flex; flex-wrap: wrap; margin-top: 20px">
            <div class="box">
              <p>体重</p>
              <el-input
                v-model="form3.weight"
                placeholder="请输入体重"
                style="margin-top: 10px; width: 100%"
              >
                <template #append>kg</template>
              </el-input>
            </div>
            <div class="box mar_box">
              <p>体长</p>
              <el-input
                v-model="form3.length"
                placeholder="请输入体长"
                style="margin-top: 10px; width: 100%"
              >
                <template #append>cm</template>
              </el-input>
            </div>

            <div class="box mar_box">
              <p>头围</p>
              <el-input
                v-model="form3.headCircumference"
                placeholder="请输入头围"
                style="margin-top: 10px; width: 100%"
              >
                <template #append>cm</template>
              </el-input>
            </div>

            <div class="box mar_box">
              <p>窒息</p>
              <el-select
                v-model="form3.suffocation"
                style="margin-top: 10px; width: 100%"
                placeholder="请选择"
              >
                <el-option
                  v-for="item in optionsStifle"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                />
              </el-select>
            </div>
          </div>

          <div style="display: flex; margin-top: 20px; flex-wrap: wrap">
            <div class="box">
              <p>主要喂养方式</p>
              <el-select
                v-model="form3.feedingPattern"
                style="margin-top: 10px; width: 100%"
                placeholder="请选择"
              >
                <el-option
                  v-for="item in optionsFeed"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                />
              </el-select>
            </div>
          </div>
          <p style="font-size: 14px; font-weight: bold; margin-top: 10px">
            语言发展
          </p>
          <div style="display: flex; flex-wrap: wrap; margin-top: 20px">
            <div class="box">
              <p style="font-size: 14px">首个词汇出现时间</p>
              <el-input
                v-model="form3.firstWordAppears"
                style="margin-top: 10px"
                placeholder="如6岁6个月"
              />
            </div>
            <div class="box mar_box">
              <p style="font-size: 14px">首个句子出现时间</p>
              <el-input
                v-model="form3.firstSentence"
                style="margin-top: 10px"
                placeholder="如6岁6个月"
              />
            </div>
          </div>

          <p style="font-size: 14px; font-weight: bold; margin-top: 10px">
            动作发展
          </p>
          <div style="display: flex; flex-wrap: wrap; margin-top: 20px">
            <div class="box">
              <p style="font-size: 14px">抬头时间</p>
              <el-input
                v-model="form3.headUpTime"
                style="margin-top: 10px"
                placeholder="如6岁6个月"
              />
            </div>
            <div class="box mar_box">
              <p style="font-size: 14px">独立坐时间</p>
              <el-input
                v-model="form3.independentSittingTime"
                style="margin-top: 10px"
                placeholder="如6岁6个月"
              />
            </div>
            <div class="box mar_box">
              <p style="font-size: 14px">独立站时间</p>
              <el-input
                v-model="form3.independentStationTime"
                style="margin-top: 10px"
                placeholder="如6岁6个月"
              />
            </div>
            <div class="box mar_box">
              <p style="font-size: 14px">独立走时间</p>
              <el-input
                v-model="form3.independentTravelTime"
                style="margin-top: 10px"
                placeholder="如6岁6个月"
              />
            </div>
          </div>

          <p style="font-size: 14px; font-weight: bold; margin-top: 10px">
            自理能力发展
          </p>
          <div style="display: flex; flex-wrap: wrap; margin-top: 20px">
            <div class="box">
              <p style="font-size: 14px">表达小便时间</p>
              <el-input
                v-model="form3.urinationTime"
                style="margin-top: 10px"
                placeholder="如6岁6个月"
              />
            </div>
            <div class="box mar_box">
              <p style="font-size: 14px">表达大便时间</p>
              <el-input
                v-model="form3.stoolTime"
                style="margin-top: 10px"
                placeholder="如6岁6个月"
              />
            </div>
            <div class="box mar_box">
              <p style="font-size: 14px">独立小便时间</p>
              <el-input
                v-model="form3.independentUrinationTime"
                style="margin-top: 10px"
                placeholder="如6岁6个月"
              />
            </div>
            <div class="box mar_box">
              <p style="font-size: 14px">独立大便时间</p>
              <el-input
                v-model="form3.independentStoolTime"
                style="margin-top: 10px"
                placeholder="如6岁6个月"
              />
            </div>
          </div>
          <!-- heredity -->
          <p style="font-size: 20px; margin-top: 10px">医疗史</p>
          <div style="display: flex; flex-wrap: wrap; margin-top: 20px">
            <div class="box">
              <p style="font-size: 14px">遗传病史</p>
              <el-input
                v-model="form3.geneticHistory"
                style="margin-top: 10px"
                placeholder="请输入遗传病史"
              />
            </div>
            <div class="box mar_box">
              <p style="font-size: 14px">重大疾病史</p>
              <el-input
                v-model="form3.majorDiseases"
                style="margin-top: 10px"
                placeholder="请输入重大疾病史"
              />
            </div>
          </div>

          <p style="display: flex; justify-content: space-between; width: 90%">
            <span style="font-weight: bolder; font-size: 20px">教育史</span>
            <el-button type="primary" @click="addhistory()"
              >+新增教育经历</el-button
            >
          </p>

          <el-table
            :data="addedu"
            style="width: 94%"
            height="250"
            :cell-style="{ textAlign: 'left' }"
            :header-cell-style="{
              'text-align': 'left',
              color: 'black',
              fontWeight: 'bolder',
            }"
          >
            <el-table-column label="序号" width="auto" min-width="10%">
              <template #default="scope">
                {{ scope.$index + 1 }}
              </template>
            </el-table-column>
            <el-table-column label="日期" width="auto" min-width="25%">
              <!-- <el-input text v-model="addList[scope.$index].order"></el-input> -->
              <template #default="scope">
                <!-- <el-input text v-model="scope.row.date"></el-input> -->
                <el-date-picker
                  v-model="scope.row.date"
                  type="date"
                  placeholder="请选择日期"
                  :size="size"
                />
              </template>
            </el-table-column>

            <el-table-column label="学校/机构" width="auto" min-width="25%">
              <template #default="scope">
                <el-input text v-model="scope.row.sch"></el-input>
              </template>
            </el-table-column>
            <el-table-column label="学习课程" width="auto" min-width="25%">
              <template #default="scope">
                <el-input text v-model="scope.row.project"></el-input>
              </template>
            </el-table-column>

            <el-table-column label="操作" width="auto" min-width="15%">
              <template #default="scope">
                <el-button
                  style="color: red; border: 1px solid transparent"
                  @click="del3(scope.$index)"
                  >删除</el-button
                >
              </template>
            </el-table-column>
          </el-table>

          <p style="display: flex; justify-content: space-between; width: 90%">
            <span style="font-weight: bolder; font-size: 20px">康复训练史</span>
            <el-button type="primary" @click="addRecureHis()"
              >+新增康复训练经历</el-button
            >
          </p>

          <el-table
            :data="addRecure"
            style="width: 94%"
            height="250"
            :cell-style="{ textAlign: 'left' }"
            :header-cell-style="{
              'text-align': 'left',
              color: 'black',
              fontWeight: 'bolder',
            }"
          >
            <el-table-column label="序号" width="auto" min-width="10%">
              <template #default="scope">
                {{ scope.$index + 1 }}
              </template>
            </el-table-column>
            <el-table-column label="日期" width="auto" min-width="25%">
              <!-- <el-input text v-model="addList[scope.$index].order"></el-input> -->
              <template #default="scope">
                <!-- <el-input text v-model="scope.row.date"></el-input> -->
                <el-date-picker
                  v-model="scope.row.date"
                  type="date"
                  placeholder="请选择日期"
                  :size="size"
                />
              </template>
            </el-table-column>

            <el-table-column label="学校机构" width="auto" min-width="25%">
              <template #default="scope">
                <el-input text v-model="scope.row.sch"></el-input>
              </template>
            </el-table-column>
            <el-table-column label="康复内容" width="auto" min-width="25%">
              <template #default="scope">
                <el-input text v-model="scope.row.content"></el-input>
              </template>
            </el-table-column>

            <el-table-column label="操作" width="auto" min-width="15%">
              <template #default="scope">
                <el-button
                  style="color: red; border: 1px solid transparent"
                  @click="del4(scope.$index)"
                  >删除</el-button
                >
              </template>
            </el-table-column>
          </el-table>

          <div style="text-align: right; width: 90%">
            <el-button type="primary" @click="preserve2()">保存</el-button>
          </div>
        </el-tab-pane>
        <el-tab-pane label="生理特殊情况" name="fourth">
          <div style="display: flex; flex-wrap: wrap; margin-top: 10px">
            <div class="box">
              <p>过敏情况</p>
              <el-input
                v-model="form4.irritability"
                style="margin-top: 10px"
                placeholder="请输入过敏情况"
              />
            </div>
            <div class="box mar_box">
              <p>存在健康问题</p>
              <el-tree-select
                v-model="form4.healthProblem"
                :data="optionsHeath"
                multiple
                :render-after-expand="false"
                style="width: 100%; margin-top: 10px"
                placeholder="请选择健康问题"
              />
            </div>
            <div class="box mar_box">
              <p>其他健康问题</p>
              <el-input
                v-model="form4.otherHealthProblem"
                style="margin-top: 10px"
                placeholder="请输入其他健康问题"
              />
            </div>
            <div class="box mar_box">
              <p>正在用药/矫正器具为</p>
              <el-input
                v-model="form4.pharmacy"
                style="margin-top: 10px"
                placeholder="请输入正在用药/矫正器具"
              />
            </div>
          </div>
          <div style="display: flex; flex-wrap: wrap; margin-top: 10px">
            <div class="box">
              <p>无语言需要沟通辅具</p>
              <el-tree-select
                v-model="form4.speakAssist"
                :data="optionsNolangu"
                multiple
                :render-after-expand="false"
                style="width: 100%; margin-top: 10px"
                placeholder="请选择无语言需要沟通辅具"
              />
            </div>
            <div class="box mar_box">
              <p>其他沟通辅具</p>
              <el-input
                v-model="form4.otherAssist"
                style="margin-top: 10px"
                placeholder="请输入其他沟通辅具"
              />
            </div>
          </div>
          <div style="text-align: right">
            <el-button type="primary" @click="preserve()">保存</el-button>
          </div>
        </el-tab-pane>
        <el-tab-pane label="兴趣偏好" name="fifth">
          <p style="font-size: 14px; font-weight: bold; margin-top: 10px">
            积极因素
          </p>
          <div style="display: flex; flex-wrap: wrap; margin-top: 10px">
            <div class="box">
              <p>喜欢的物品</p>
              <el-input
                v-model="form5.loveArticle"
                style="margin-top: 10px"
                placeholder="请输入喜欢的物品"
              />
            </div>
            <div class="box mar_box">
              <p>喜欢的活动</p>
              <el-input
                v-model="form5.loveActivity"
                style="margin-top: 10px"
                placeholder="请输入喜欢的活动"
              />
            </div>
            <div class="box mar_box">
              <p>喜欢的人物</p>
              <el-input
                v-model="form5.loveFigure"
                style="margin-top: 10px"
                placeholder="请输入喜欢的人物"
              />
            </div>
            <div class="box mar_box">
              <p>性格的优势</p>
              <el-input
                v-model="form5.characterAdvantage"
                style="margin-top: 10px"
                placeholder="请输入性格的优势"
              />
            </div>
          </div>

          <div style="display: flex; flex-wrap: wrap; margin-top: 10px">
            <div class="box">
              <p>能力和特长</p>
              <el-input
                v-model="form5.shtick"
                style="margin-top: 10px"
                placeholder="请输入能力和特长"
              />
            </div>
            <div class="box mar_box">
              <p>其他</p>
              <el-input
                v-model="form5.other"
                style="margin-top: 10px"
                placeholder="请输入其他"
              />
            </div>
          </div>
          <p style="font-size: 14px; font-weight: bold; margin-top: 10px">
            敏感因素
          </p>
          <div style="display: flex; flex-wrap: wrap; margin-top: 10px">
            <div class="box">
              <p>不喜欢的物品</p>
              <el-input
                v-model="form5.unLoveArticle"
                style="margin-top: 10px"
                placeholder="请输入不喜欢的物品"
              />
            </div>
            <div class="box mar_box">
              <p>不喜欢的活动</p>
              <el-input
                v-model="form5.unLoveActivity"
                style="margin-top: 10px"
                placeholder="请输入不喜欢的活动"
              />
            </div>
            <div class="box mar_box">
              <p>不喜欢的人物</p>
              <el-input
                v-model="form5.unLoveFigure"
                style="margin-top: 10px"
                placeholder="请输入不喜欢的人物"
              />
            </div>
            <div class="box mar_box">
              <p>其他因素</p>
              <el-tree-select
                v-model="form5.otherFactors"
                :data="optionsFactors"
                multiple
                :render-after-expand="false"
                style="width: 100%; margin-top: 10px"
                placeholder="请选择其他因素"
              />
            </div>
          </div>
          <div style="display: flex; flex-wrap: wrap; margin-top: 10px">
            <div class="box">
              <p>说明</p>
              <el-input
                v-model="form5.explain_"
                style="margin-top: 10px"
                placeholder="请输入说明"
              />
            </div>
          </div>
          <div style="text-align: right">
            <el-button type="primary" @click="interest()">保存</el-button>
          </div>
        </el-tab-pane>
      </el-tabs>
    </div>
  </div>
</template>

<style scoped>
.demo-tabs > .el-tabs__content {
  padding: 32px;
  color: #6b778c;
  font-size: 32px;
  font-weight: 600;
}
.box {
  height: 87px;
  width: 20%;
}
.mar_box {
  margin-left: 30px;
}

@media screen and (max-width: 1000px) {
  .box {
    width: 50%;
  }
  .mar_box {
    margin-left: 0px;
  }
}

@media screen and (max-width: 700px) {
  .box {
    width: 300px;
  }
  .mar_box {
    margin-left: 0px;
  }
}

.text {
  font-size: 14px;
}

.item {
  padding: 18px 0;
}

.box-card {
  width: 270px;
  height: 150px;
}
</style>
