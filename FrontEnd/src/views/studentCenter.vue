<script setup>
import { ref } from "vue";
import { useRouter } from "vue-router";
import { useStudentStore } from "../store/student";
import Axios from "../request/index.js";

const StudentStore = useStudentStore();
const ob = JSON.parse(localStorage.getItem("sq"));
const scLsit = ref([]);

const getAllType = () => {
  // Axios.post("/scaleClassify/search", {
  //   // id: ,
  //   classify1: "",
  //   classify2: "",
  //   classify3: "",
  // }).then((res) => {
  //   console.log(res);
  //   scLsit.value = res.data.map((k) => {
  //     return {
  //       classify1: k.classify1,
  //     };
  //   });
  // });
  Axios.get("/scaleClassify/getAll").then((res) => {
    scLsit.value = [...new Set(res.data.map((k) => k["classify1"]))];
    scLsit.value = scLsit.value.map((k) => {
      return {
        classify1: k,
      };
    });
    console.log(scLsit.value);
  });
};
getAllType();
console.log(scLsit);
</script>
<template>
  <div id="all">
    <div id="left_box">
      <div id="left_box_top">
        <p class="font_first">基本信息</p>
        <div
          class="name_box shaDow"
          @click="$router.push('/management/studentDetail')"
        >
          <div class="det_box">
            <img :src="ob.headUrl" class="det_box_image" />
            <div class="det_box_name">
              <p class="top_font">
                <span>{{ ob.name }} &nbsp;</span>
                <span>{{ ob.sex }} &nbsp;</span>
                <!-- 1个月 -->
              </p>
              <p class="bot_font">
                {{ ob.obstacle }}
              </p>
            </div>
          </div>
        </div>
      </div>
      <div id="left_box_bottom" style="">
        <p class="font_first">教育评估</p>
        <div id="bottom_box">
          <!-- <div
            class="sc_box shaDow icon"
            @click="
              $router.push({
                path: '/management/scaleList',
                query: {
                  classify1: '学业水平',
                },
              })
            "
          >
            <svg
              style="margin-left: 10px"
              t="1679842260816"
              class="icon"
              viewBox="0 0 1024 1024"
              version="1.1"
              xmlns="http://www.w3.org/2000/svg"
              p-id="1085"
              width="30"
              height="30"
            >
              <path
                class="icon1"
                d="M885.76 135.68H148.992c-50.944 0-92.16 41.216-92.16 92.16v499.968c0 50.944 41.216 92.16 92.16 92.16h247.04l44.288 75.52c15.616 26.624 43.52 42.752 74.24 43.008h1.024c30.464 0 58.112-15.36 74.24-41.472l47.616-77.056h248.32c50.944 0 92.16-41.216 92.16-92.16V227.84c0-50.688-41.472-92.16-92.16-92.16zM306.688 514.048c-28.16 0-51.2-23.04-51.2-51.2s23.04-51.2 51.2-51.2 51.2 23.04 51.2 51.2c0 28.416-22.784 51.2-51.2 51.2z m211.456 0c-28.16 0-51.2-23.04-51.2-51.2s23.04-51.2 51.2-51.2 51.2 23.04 51.2 51.2c0 28.416-22.784 51.2-51.2 51.2z m211.456 0c-28.16 0-51.2-23.04-51.2-51.2s23.04-51.2 51.2-51.2 51.2 23.04 51.2 51.2c0 28.416-22.784 51.2-51.2 51.2z"
                fill="#1296db"
                p-id="1086"
              ></path>
            </svg> -->
          <!-- <p class="sc_title">学业水平</p> -->
          <!-- <el-popover
              placement="top-start"
              title=""
              :width="200"
              trigger="hover"
              content=""
            >
              <template #reference>
                
              </template>
              <el-button style="display: block; width: 150px; margin: auto"
                >开始评估</el-button
              >
              <el-button style="display: block; width: 150px; margin: auto"
                >查看报告</el-button
              >
              <el-button style="display: block; width: 150px; margin: auto"
                >对比报告</el-button
              >
            </el-popover> -->

          <!-- <span style="position: absolute; right: 10px">></span>
          </div> -->
          <div
            v-for="(item, index) in scLsit"
            class="sc_box shaDow icon"
            @click="
              $router.push({
                path: '/management/scaleList',
                query: {
                  classify1: item.classify1,
                },
              })
            "
          >
            <svg
              t="1679842260816"
              class="icon"
              viewBox="0 0 1024 1024"
              version="1.1"
              xmlns="http://www.w3.org/2000/svg"
              p-id="1085"
              width="30"
              height="30"
              style="margin-left: 10px"
            >
              <path
                class="icon1"
                d="M885.76 135.68H148.992c-50.944 0-92.16 41.216-92.16 92.16v499.968c0 50.944 41.216 92.16 92.16 92.16h247.04l44.288 75.52c15.616 26.624 43.52 42.752 74.24 43.008h1.024c30.464 0 58.112-15.36 74.24-41.472l47.616-77.056h248.32c50.944 0 92.16-41.216 92.16-92.16V227.84c0-50.688-41.472-92.16-92.16-92.16zM306.688 514.048c-28.16 0-51.2-23.04-51.2-51.2s23.04-51.2 51.2-51.2 51.2 23.04 51.2 51.2c0 28.416-22.784 51.2-51.2 51.2z m211.456 0c-28.16 0-51.2-23.04-51.2-51.2s23.04-51.2 51.2-51.2 51.2 23.04 51.2 51.2c0 28.416-22.784 51.2-51.2 51.2z m211.456 0c-28.16 0-51.2-23.04-51.2-51.2s23.04-51.2 51.2-51.2 51.2 23.04 51.2 51.2c0 28.416-22.784 51.2-51.2 51.2z"
                fill="#1296db"
                p-id="1086"
              ></path>
            </svg>
            <p class="sc_title">{{ item.classify1 }}</p>
            <!-- <el-popover
              placement="top-start"
              title=""
              :width="200"
              trigger="hover"
              content=""
            >
              <template #reference>
               
              </template>
              <el-button style="display: block; width: 150px; margin: auto"
                >开始评估</el-button
              >
              <el-button style="display: block; width: 150px; margin: auto"
                >查看报告</el-button
              >
              <el-button style="display: block; width: 150px; margin: auto"
                >对比报告</el-button
              >
            </el-popover> -->

            <span style="position: absolute; right: 10px">></span>
          </div>
        </div>
      </div>
    </div>
    <div id="center_box">
      <div id="">
        <p class="font_first">人口统计学信息</p>
        <div style="display: flex; justify-content: space-between">
          <div
            class="home_info shaDow icon"
            @click="
              $router.push({
                path: '/management/studentDetail',
                query: {
                  id: 2,
                },
              })
            "
          >
            <svg
              t="1679841639256"
              class="icon"
              viewBox="0 0 1101 1024"
              version="1.1"
              xmlns="http://www.w3.org/2000/svg"
              p-id="893"
              width="30"
              height="30"
            >
              <path
                class="icon1"
                d="M288.436015 255.139932A253.768211 253.768211 0 0 1 369.367499 68.586003 229.07725 229.07725 0 0 0 459.901023 510.279863a211.24489 211.24489 0 0 0 41.837462-4.11516A254.454071 254.454071 0 0 1 288.436015 255.139932zM33.296083 960.204043a513.709163 513.709163 0 0 1 468.442402-447.8666H459.901023A461.583801 461.583801 0 0 0 0.374802 912.879701a50.067782 50.067782 0 0 0 33.607141 53.497083 47.324342 47.324342 0 0 1-0.68586-6.172741z"
                fill="#1296db"
                p-id="894"
              ></path>
              <path
                class="icon1"
                d="M587.470988 510.279863A512.337443 512.337443 0 0 0 77.191125 960.204043a57.612243 57.612243 0 0 0 56.926383 63.784983h906.021101A56.926383 56.926383 0 0 0 1097.750851 960.204043a512.337443 512.337443 0 0 0-510.279863-449.92418z"
                fill="#1296db"
                p-id="895"
              ></path>
              <path
                class="icon1"
                d="M587.470988 0a255.139932 255.139932 0 1 0 255.139932 255.139932A255.139932 255.139932 0 0 0 587.470988 0z m11.659621 411.516019a85.732504 85.732504 0 0 1-86.418364-87.104224H686.234833A85.732504 85.732504 0 0 1 599.130609 411.516019z"
                fill="#1296db"
                p-id="896"
              ></path>
            </svg>
            <p style="margin-left: 10px">家庭信息</p>
          </div>
          <div
            class="long_info shaDow icon"
            @click="
              $router.push({
                path: '/management/studentDetail',
                query: {
                  id: 3,
                },
              })
            "
          >
            <svg
              t="1679841738646"
              class="icon"
              viewBox="0 0 1024 1024"
              version="1.1"
              xmlns="http://www.w3.org/2000/svg"
              p-id="1351"
              width="30"
              height="30"
            >
              <path
                class="icon1"
                d="M902.4 0H121.6a64 64 0 0 0-64 64v896a64 64 0 0 0 64 64h780.8a64 64 0 0 0 64-64V64a64 64 0 0 0-64-64zM369.28 276.48a32 32 0 0 1 44.8 0l64 60.16 128-131.84a32 32 0 0 1 45.44 0 31.36 31.36 0 0 1 0 44.8L503.04 401.92a30.08 30.08 0 0 1-22.4 9.6 33.92 33.92 0 0 1-21.76-8.32L370.56 320a32 32 0 0 1-1.28-43.52z m298.88 532.48H355.84a32 32 0 0 1-32-32 32 32 0 0 1 32-32h312.32a32 32 0 0 1 32 32 32 32 0 0 1-32 32z m0-206.72H355.84a32 32 0 0 1-32-32 32 32 0 0 1 32-32h312.32a32 32 0 0 1 32 32 32 32 0 0 1-32 32z"
                fill="#1296db"
                p-id="1352"
              ></path>
            </svg>
            <p style="margin-left: 10px">成长信息</p>
          </div>
        </div>
      </div>
      <div id="">
        <p class="font_first">IEP</p>
        <div
          style="height: 130px; display: flex; justify-content: space-between"
        >
          <div
            class="home_info shaDow icon"
            @click="$router.push('/management/iepIndex')"
          >
            <svg
              t="1679841935368"
              class="icon"
              viewBox="0 0 1024 1024"
              version="1.1"
              xmlns="http://www.w3.org/2000/svg"
              p-id="1373"
              width="30"
              height="30"
            >
              <path
                class="icon1"
                d="M39.424 529.92v356.352c0 57.088 46.336 103.424 103.424 103.424h553.216c57.088 0 103.424-46.336 103.424-103.424V529.92H39.424zM696.064 211.2H142.848c-57.088 0-103.424 46.336-103.424 103.424V468.48h759.808v-153.856c0.256-57.088-46.336-103.424-103.168-103.424zM215.04 407.552c-18.688 0-33.792-15.104-33.792-33.792 0-18.688 15.104-33.792 33.792-33.792s33.792 15.104 33.792 33.792c0 18.432-15.104 33.792-33.792 33.792z m430.08-8.192H319.232c-15.616 0-28.16-12.544-28.16-28.16s12.544-28.16 28.16-28.16H645.12c15.616 0 28.16 12.544 28.16 28.16s-12.544 28.16-28.16 28.16z"
                fill="#1296db"
                p-id="1374"
              ></path>
              <path
                class="icon1"
                d="M874.752 897.024h-30.72V262.912c0-50.432-40.96-91.392-91.392-91.392H178.432v-16.64c0-57.088 46.08-103.168 103.168-103.168h578.56c63.232 0 114.432 51.2 114.432 114.432v630.784c0 55.296-44.8 100.096-99.84 100.096z"
                fill="#1296db"
                p-id="1375"
              ></path>
            </svg>
            <p style="margin-left: 10px">IEP首页</p>
          </div>
          <div
            class="long_info shaDow icon"
            @click="$router.push('/management/report')"
          >
            <svg
              t="1679842020004"
              class="icon"
              viewBox="0 0 1024 1024"
              version="1.1"
              xmlns="http://www.w3.org/2000/svg"
              p-id="1560"
              width="30"
              height="30"
            >
              <path
                class="icon1"
                d="M765.952 250.368h166.912c-24.064-23.296-72.192-68.096-118.784-111.616-32-29.696-62.464-58.368-79.616-74.496v154.624c0 17.664 14.08 31.488 31.488 31.488z"
                fill="#1296db"
                p-id="1561"
              ></path>
              <path
                class="icon1"
                d="M765.952 311.808c-51.2 0-92.928-41.728-92.928-92.928v-174.08H172.288C120.32 44.8 77.824 87.04 77.824 139.264v742.912c0 51.968 42.24 94.464 94.464 94.464h683.264c51.968 0 94.464-42.24 94.464-94.464V311.808h-184.064z m-96 498.688H363.52c-16.896 0-30.72-13.824-30.72-30.72s13.824-30.72 30.72-30.72h306.432c16.896 0 30.72 13.824 30.72 30.72s-13.568 30.72-30.72 30.72z m40.96-397.568l-78.592 76.8 18.432 108.032c2.048 11.52-2.816 23.296-12.288 29.952-9.472 6.912-22.016 7.68-32.256 2.304l-97.024-50.944-97.024 50.944c-4.608 2.304-9.472 3.584-14.336 3.584-6.4 0-12.8-2.048-18.176-5.888-9.472-6.912-14.08-18.432-12.288-29.952l18.432-108.032-78.592-76.544c-8.448-8.192-11.264-20.48-7.68-31.488 3.584-11.008 13.312-19.2 24.832-20.992l108.544-15.872 48.64-98.304c5.12-10.496 15.872-17.152 27.648-17.152 11.776 0 22.272 6.656 27.648 17.152l48.64 98.304 108.544 15.872c11.52 1.792 21.248 9.728 24.832 20.992 3.328 11.008 0.512 23.04-7.936 31.232z"
                fill="#1296db"
                p-id="1562"
              ></path>
              <path
                class="icon1"
                d="M537.344 386.56l-28.16-57.088-28.16 57.088c-4.352 8.96-13.056 15.36-23.04 16.896l-62.976 9.216 45.568 44.288c7.168 7.168 10.496 17.152 8.96 27.136l-10.752 62.72 56.32-29.696c8.96-4.608 19.712-4.608 28.672 0l56.32 29.696-10.752-62.72c-1.792-9.984 1.536-20.224 8.96-27.136l45.568-44.288-62.976-9.216c-10.496-1.536-19.2-7.936-23.552-16.896z"
                fill="#1296db"
                p-id="1563"
              ></path>
            </svg>
            <p style="margin-left: 10px">IEP报告</p>
          </div>
        </div>
      </div>
      <div id="">
        <p class="font_first">转衔与安置</p>
        <div
          style="height: 130px; display: flex; justify-content: space-between"
        >
          <div
            class="home_info shaDow icon"
            @click="$router.push('/management/record')"
          >
            <svg
              t="1679842077237"
              class="icon"
              viewBox="0 0 1024 1024"
              version="1.1"
              xmlns="http://www.w3.org/2000/svg"
              p-id="998"
              width="30"
              height="30"
            >
              <path
                class="icon1"
                d="M332.256 162.432a31.87 31.87 0 0 0-34.88 6.944l-192 192c-12.512 12.512-12.512 32.736 0 45.248s32.736 12.512 45.248 0L288 269.248V800c0 17.696 14.336 32 32 32s32-14.304 32-32V192c0-12.928-7.808-24.608-19.744-29.568zM918.624 617.376c-12.512-12.512-32.736-12.512-45.248 0L768 722.752V192c0-17.664-14.304-32-32-32s-32 14.336-32 32v608c0 12.928 7.776 24.64 19.744 29.568C727.712 831.232 731.872 832 736 832a32.01 32.01 0 0 0 22.624-9.376l160-160c12.512-12.512 12.512-32.736 0-45.248z"
                p-id="999"
                fill="#1296db"
              ></path>
            </svg>
            <p style="margin-left: 10px">转衔记录</p>
          </div>
          <div
            class="long_info shaDow icon"
            @click="$router.push('/management/resettle')"
          >
            <svg
              t="1679842122000"
              class="icon"
              viewBox="0 0 1024 1024"
              version="1.1"
              xmlns="http://www.w3.org/2000/svg"
              p-id="1196"
              width="30"
              height="30"
            >
              <path
                class="icon1"
                d="M771.2 384c0-160-128-288-288-288s-288 128-288 288c0 108.8 57.6 201.6 147.2 249.6-121.6 48-214.4 153.6-240 288-3.2 16 6.4 35.2 25.6 38.4h6.4c16 0 28.8-9.6 32-25.6C195.2 784 326.4 675.2 480 672h6.4c153.6 0 284.8-131.2 284.8-288z m-512 0c0-124.8 99.2-224 224-224s224 99.2 224 224c0 121.6-99.2 220.8-220.8 224h-9.6c-121.6-6.4-217.6-105.6-217.6-224zM704 672c0 19.2 12.8 32 32 32h160c19.2 0 32-12.8 32-32s-12.8-32-32-32H736c-16 0-32 12.8-32 32z m192 92.8H640c-19.2 0-32 12.8-32 32s12.8 32 32 32h256c19.2 0 32-12.8 32-32s-12.8-32-32-32z m0 128H643.2c-19.2 0-32 12.8-32 32s12.8 32 32 32H896c19.2 0 32-12.8 32-32s-16-32-32-32z"
                p-id="1197"
                fill="#1296db"
              ></path>
            </svg>
            <p style="margin-left: 10px">安置记录</p>
          </div>
        </div>
      </div>
    </div>
    <div id="right_box">
      <div id="">
        <p class="font_first">健康档案</p>
        <div
          style="height: 130px; display: flex; justify-content: space-between"
        >
          <div
            class="home_info shaDow icon"
            @click="
              $router.push({
                path: '/management/studentDetail',
                query: {
                  id: 4,
                },
              })
            "
          >
            <svg
              t="1679841895461"
              class="icon"
              viewBox="0 0 1024 1024"
              version="1.1"
              xmlns="http://www.w3.org/2000/svg"
              p-id="1187"
              width="30"
              height="30"
            >
              <path
                class="icon1"
                d="M509.696 495.104c-124.672 0-226.048-101.376-226.048-226.048s101.376-226.048 226.048-226.048 226.048 101.376 226.048 226.048-101.632 226.048-226.048 226.048zM837.888 632.32c-92.672-56.32-208.128-87.04-325.12-87.04s-232.448 30.976-325.12 87.04c-89.088 54.016-142.08 123.648-142.08 186.112 0 63.488 50.688 108.544 150.528 133.376 73.728 18.432 177.408 27.392 316.672 27.392 139.264 0 242.944-8.96 316.672-27.392 99.84-24.832 150.528-69.632 150.528-133.376 0.256-62.72-52.992-132.096-142.08-186.112z m-48.128 133.376c-5.888 8.192-15.36 12.544-24.832 12.544-6.4 0-12.544-2.048-18.176-5.888-40.192-29.44-107.264-51.968-179.456-60.16-16.896-1.792-28.928-17.152-27.136-34.048 1.792-16.896 17.152-28.928 34.048-27.136 82.176 9.216 160.256 36.096 208.64 71.424 13.824 10.24 16.896 29.44 6.912 43.264z"
                fill="#1296db"
                p-id="1188"
              ></path>
            </svg>
            <p style="margin-left: 10px">生理特殊情况</p>
          </div>
          <div
            class="long_info shaDow icon"
            @click="
              $router.push({
                path: '/management/studentDetail',
                query: {
                  id: 5,
                },
              })
            "
          >
            <svg
              t="1679842195953"
              class="icon"
              viewBox="0 0 1024 1024"
              version="1.1"
              xmlns="http://www.w3.org/2000/svg"
              p-id="899"
              width="30"
              height="30"
            >
              <path
                class="icon1"
                d="M929.536 484.096c26.112-25.6 35.328-62.976 24.064-97.792-11.264-34.56-40.96-59.392-77.056-64.768l-188.416-27.392c-3.84-0.512-6.912-3.072-8.704-6.4l-84.224-170.752c-16.128-32.768-48.896-53.248-85.504-53.248s-69.376 20.48-85.504 53.248l-84.224 170.752c-1.536 3.584-4.864 5.888-8.704 6.4l-188.416 27.392c-36.352 5.12-65.792 29.952-77.056 64.768-11.264 34.816-2.048 72.192 24.064 97.792L226.048 616.96c2.816 2.56 4.096 6.4 3.328 10.24L197.12 814.848c-6.144 35.84 8.192 71.68 37.888 93.184 16.896 12.288 36.352 18.432 56.064 18.432 15.104 0 30.464-3.584 44.544-11.008l168.448-88.576c3.328-1.792 7.424-1.792 10.752 0l169.216 88.32c32.256 17.152 70.656 14.336 100.352-7.168 29.44-21.504 44.032-57.088 37.888-93.184L790.016 627.2c-0.768-3.84 0.512-7.68 3.328-10.24l136.192-132.864z m-417.536 104.96c-30.976 0-66.304-11.264-94.208-29.952-35.84-24.064-55.552-57.344-55.552-94.208 0-16.896 13.824-30.72 30.72-30.72s30.72 13.824 30.72 30.72c0 36.352 52.736 62.464 88.064 62.464 30.208 0 88.064-24.32 88.064-62.464 0-16.896 13.824-30.72 30.72-30.72s30.72 13.824 30.72 30.72c0.256 77.056-86.784 124.16-149.248 124.16z"
                fill="#1296db"
                p-id="900"
              ></path>
            </svg>
            <p style="margin-left: 10px">兴趣偏好</p>
          </div>
        </div>
      </div>
      <div id="">
        <p class="font_first">训练活动</p>
        <div
          style="height: 130px; display: flex; justify-content: space-between"
          @click="$router.push('/management/exercise')"
        >
          <div class="road shaDow">
            <p class="no_wrap">训练活动</p>
          </div>
        </div>
      </div>
      <div id="">
        <p class="font_first">医学服务</p>
        <div
          style="height: 130px; display: flex; justify-content: space-between"
        >
          <div
            class="ser_box shaDow"
            @click="$router.push('/management/Medical')"
          >
            <p class="no_wrap">医学评估、康复及咨询记录</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.shaDow:hover {
  box-shadow: 0px 5px 10px rgba(125, 125, 125, 0.5);
}
.shaDow {
  transition: 0.2s;
}
#all {
  width: 95%;
  height: 90%;
  margin: 1% auto;
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
}
#left_box {
  width: 33%;
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
#center_box {
  width: 33%;
  height: 100%;

  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

#center_box_ch {
  height: 28%;
  width: 100%;

  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

#right_box {
  width: 32%;
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
#right_box_ch {
  height: 30%;
  width: 100%;

  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
#left_box_top {
  height: 35%;
  width: 100%;
  display: flex;
  flex-direction: column;
}
#left_box_bottom {
  height: 65%;
  width: 100%;
}

.font_first {
  color: #6e96b5;
  font-size: 18px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  font-weight: bolder;
}
.name_box {
  height: 130px;
  width: 100%;
  background-color: #fff;
  display: flex;
  align-items: center;
}
.det_box {
  height: 100px;
  width: 280px;
  margin-left: 30px;
  display: flex;
  align-items: center;
}
.det_box_image {
  height: 78.4px;
  width: 78.4px;
  border-radius: 50px;
}
.det_box_name {
  height: 70px;
  width: 120px;
  display: flex;
  flex-direction: column;
  justify-content: space-evenly;
  margin-left: 20px;
}
.top_font {
  white-space: nowrap;
  font-weight: 700;
  font-size: 16px;
}
.bot_font {
  color: #909090;
  font-size: 16px;
}
.sc_box {
  background-color: #fff;
  height: 55px;
  width: 100%;
  margin-top: 15px;
  display: flex;
  align-items: center;
  position: relative;
}
#bottom_box {
  height: 100%;
  width: 100%;
  overflow: auto;
}
.sc_iamge {
  height: 40px;
  width: 40px;
  border-radius: 50px;
}
.sc_title {
  font-size: 16px;
  margin-left: 24px;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 1;
  overflow: hidden;
  text-overflow: ellipsis;
}
.home_info {
  height: 130px;
  width: 48%;
  background-color: #fff;
  display: flex;
  align-items: center;
  justify-content: center;
}
.long_info {
  height: 130px;
  width: 48%;
  background-color: #fff;
  display: flex;
  align-items: center;
  justify-content: center;
}

.inner_image {
  height: 30px;
  width: 30px;
  border: 1px solid black;
}
.road {
  width: 100%;
  height: 100%;
  background-color: #fff;
  display: flex;
  justify-content: center;
  align-items: center;
}
.ser_box {
  width: 100%;
  height: 100%;
  background-color: #fff;
  display: flex;
  justify-content: center;
  align-items: center;
}
.no_wrap {
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 1;
  overflow: hidden;
  text-overflow: ellipsis;
}
@media screen and (max-width: 900px) {
  #left_box {
    width: 48%;
  }
  #center_box {
    width: 48%;
  }
  #right_box {
    width: 100%;
    display: block;
    margin-top: 50px;
  }
}

@media screen and (max-width: 610px) {
  #left_box {
    width: 100%;
  }
  #center_box {
    width: 100%;
    margin-top: 50px;
  }
  #right_box {
    width: 100%;
    margin-top: 0px;
  }
  #right_box_ch {
    height: 28%;
    width: 100%;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
  }
}

.icon1 {
  fill: none;
  stroke: #6e96b5;
  stroke-width: 50;
  stroke-linecap: round;
}
@keyframes move {
  0% {
    stroke-dasharray: 0, 600px;
  }

  100% {
    stroke-dasharray: 600px, 0;
  }
}

.icon:hover {
  animation: move 1.5s;
}
</style>
