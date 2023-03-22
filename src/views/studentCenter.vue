<script setup lang="ts">
import { ref } from "vue";
const scLsit = ref([{}, {}, {}, {}, {}]);
</script>
<template>
  <div id="all">
    <div id="left_box">
      <div id="left_box_top">
        <p class="font_first">基本信息</p>
        <div class="name_box shaDow">
          <div class="det_box">
            <img src="" class="det_box_image" />
            <div class="det_box_name">
              <p class="top_font">
                <span>XXX &nbsp;</span>
                <span>男 &nbsp;</span>
                1个月
              </p>
              <p class="bot_font">肢体障碍</p>
            </div>
          </div>
        </div>
      </div>
      <div id="left_box_bottom">
        <p class="font_first">教育评估</p>
        <div id="bottom_box">
          <div v-for="(item, index) in scLsit" class="sc_box shaDow">
            <img src="" class="sc_iamge" />
            <p class="sc_title">培智学校国家课标评估</p>
            <span style="position: absolute; right: 10px">></span>
          </div>
        </div>
      </div>
    </div>
    <div id="center_box">
      <div id="center_box_ch">
        <p class="font_first">人口统计学信息</p>
        <div
          style="height: 130px; display: flex; justify-content: space-between"
        >
          <div class="home_info shaDow">
            <img src="" class="inner_image" />
            <p style="margin-left: 10px">家庭信息</p>
          </div>
          <div class="long_info shaDow">
            <img src="" class="inner_image" />
            <p style="margin-left: 10px">成长信息</p>
          </div>
        </div>
      </div>
      <div id="center_box_ch">
        <p class="font_first">IEP</p>
        <div
          style="height: 130px; display: flex; justify-content: space-between"
        >
          <div class="home_info shaDow">
            <img src="" class="inner_image" />
            <p style="margin-left: 10px">IEP首页</p>
          </div>
          <div class="long_info shaDow">
            <img src="" class="inner_image" />
            <p style="margin-left: 10px">IEP报告</p>
          </div>
        </div>
      </div>
      <div id="center_box_ch">
        <p class="font_first">转衔与安置</p>
        <div
          style="height: 130px; display: flex; justify-content: space-between"
        >
          <div class="home_info shaDow">
            <img src="" class="inner_image" />
            <p style="margin-left: 10px">转衔记录</p>
          </div>
          <div class="long_info shaDow">
            <img src="" class="inner_image" />
            <p style="margin-left: 10px">安置记录</p>
          </div>
        </div>
      </div>
    </div>
    <div id="right_box">
      <div id="right_box_ch">
        <p class="font_first">健康档案</p>
        <div
          style="height: 130px; display: flex; justify-content: space-between"
        >
          <div class="home_info shaDow">
            <img src="" class="inner_image" />
            <p style="margin-left: 10px">生理特殊情况</p>
          </div>
          <div class="long_info shaDow">
            <img src="" class="inner_image" />
            <p style="margin-left: 10px">兴趣偏好</p>
          </div>
        </div>
      </div>
      <div id="right_box_ch">
        <p class="font_first">走在成长路上</p>
        <div
          style="height: 130px; display: flex; justify-content: space-between"
        >
          <div class="road shaDow">
            <p class="no_wrap">成长之路</p>
          </div>
        </div>
      </div>
      <div id="right_box_ch">
        <p class="font_first">医学服务</p>
        <div
          style="height: 130px; display: flex; justify-content: space-between"
        >
          <div class="ser_box shaDow">
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
  width: 32%;
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
}
#center_box {
  width: 32%;
  height: 100%;

  display: flex;
  flex-direction: column;
  justify-content: space-evenly;
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
  justify-content: space-evenly;
}
#right_box_ch {
  height: 28%;
  width: 100%;

  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
#left_box_top {
  height: 30%;
  width: 100%;
  display: flex;
  flex-direction: column;
  justify-content: space-evenly;
}
#left_box_bottom {
  height: 55%;
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
  height: 60px;
  width: 100%;
  margin-top: 15px;
  display: flex;
  align-items: center;
  position: relative;
}
#bottom_box {
  height: 310px;
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
  }
}

@media screen and (max-width: 610px) {
  #left_box {
    width: 100%;
  }
  #center_box {
    width: 100%;
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
</style>
