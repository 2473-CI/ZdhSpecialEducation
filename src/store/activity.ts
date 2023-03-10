import { defineStore } from 'pinia';
import axios from 'axios'

// {
//     "relativeCategories": [
//         "5fda31356fe4053330b73f26",
//         "5fda31356fe4053330b73f25"
//     ],
//     "relativeCategoryNames": [
//         "设施功能",
//         "学校环境"
//     ],
//     "isDeleted": false,
//     "_id": "5fda3152dd63381b74a282bf",
//     "no": "XXSY1",
//     "title": "认识学校1",
//     "tip": "认识学校各个地点，了解其功能",
//     "targetArea": "学校适应-环境适应-学校环境",
//     "prepare": "·学校各个地点照片若干（校门 操场 所在班级教室 音乐教室 感统室  卫生间 餐厅）准备大小两套，配对准备两组名称汉字和拼音\n·用学校地点照片制作的游戏旗\n·学生教室所在楼层平面示意图，相应地点贴上照片（教室 厕所）",
//     "process": "·出示学校各个地方的照片，提问学生这些地方都是哪里？（学校）依次出示每个地点的图片，讨论具体地点和地点的功能。如果学生不会则进行相应教学。\n·匹配游戏：根据学生的能力选择进行学校各个地点照片-照片，照片-汉字，照片-拼音匹配。\n·玩游戏旗：轮流转色子，谁先到达终点谁胜利，走到相应地点需回答出正确地点名称，否则要退后一格。\n·出示学生教室所在楼层平面图，请学生指认相应具体地点。\n·真实情境，请学生带路走到相应学校地点。",
//     "createdAt": "2020-12-16T16:09:54.842Z",
//     "updatedAt": "2020-12-16T16:09:54.842Z",
//     "__v": 0
// },

interface Active {
    _id: string,
    title: string,
    tip: string,
    prepare: string,
    process:  string,
    createdAt: string
}

export const useActiveStore = defineStore('activeStore', {
    state: () => {
        return {
            activeList: [] as Active[],
            Total: 0
        }
    },

    getters: {

    },

    actions: {
        async loadActive() {
            var config = {
                method: 'post',
                maxBodyLength: Infinity,
                url: 'https://rrp.yirenyian.com/api/activity/getList',
                headers: {
                    'accessKey': '5033b7eef85f81bbdf40df0fd5c383406611393d6b8775468d19e3a01fc91a17a9523e204e8e1e39d57a1bc58fb1c3fac5d8706708375549b8209e5879461b6022d57be79ad8fa5d5073447c7bf027c070e917996fe34bae69ed1a8d4afcf824c3e59a43bf623c8806a64c95e882706d',
                    'Content-Type': 'application/json'
                },
                data: JSON.stringify({
                    "current": 1,
                    "pageSize": 10,
                    "pageNo": 1,
                    "relativeCategories": ""
                })
            };
            const { data: { data } } = await axios(config);            
            this.activeList = data.rows
            this.Total = data.total
        }
    }
})