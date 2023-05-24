import { defineStore } from 'pinia';

/**
 * 单个视频
 */


export const useVideoStore = defineStore('video', {
    state: () => {
        return {
            videos: []
        }
    },

    getters: {

    },

    actions: {
        /**
         * 通过请求初始化视频列表
         */
        loadVideos(){
            this.videos = [
                {id:0, title: "七维软件产品概览", video: "https://qiwi.oss-cn-shanghai.aliyuncs.com/opoc/systemVideo/0%E4%B8%83%E7%BB%B4%E8%BD%AF%E4%BB%B6%E4%BA%A7%E5%93%81%E6%A6%82%E8%A7%88.mp4"},
                {id:1, title: "一人一案生涯发展平台简介", video: "https://qiwi.oss-cn-shanghai.aliyuncs.com/opoc/systemVideo/1%E4%B8%80%E4%BA%BA%E4%B8%80%E6%A1%88%E7%94%9F%E6%B6%AF%E5%8F%91%E5%B1%95%E5%B9%B3%E5%8F%B0%E7%AE%80%E4%BB%8B.mp4"},
                {id:2, title: "一人一案生涯发展平台使用介绍", video: "https://qiwi.oss-cn-shanghai.aliyuncs.com/opoc/systemVideo/2%E4%B8%80%E4%BA%BA%E4%B8%80%E6%A1%88%E7%94%9F%E6%B6%AF%E5%8F%91%E5%B1%95%E5%B9%B3%E5%8F%B0%E4%BD%BF%E7%94%A8%E4%BB%8B%E7%BB%8D.mp4"},
                {id:3, title: "特殊儿童评估干预系统", video: "https://qiwi.oss-cn-shanghai.aliyuncs.com/opoc/systemVideo/3%E7%89%B9%E6%AE%8A%E5%84%BF%E7%AB%A5%E8%AF%84%E4%BC%B0%E5%B9%B2%E9%A2%84%E7%B3%BB%E7%BB%9F.mp4"},
                {id:4, title: "儿童感觉统合评估系统介绍", video: "https://qiwi.oss-cn-shanghai.aliyuncs.com/opoc/systemVideo/4%E5%84%BF%E7%AB%A5%E6%84%9F%E8%A7%89%E7%BB%9F%E5%90%88%E8%AF%84%E4%BC%B0%E7%B3%BB%E7%BB%9F%E4%BB%8B%E7%BB%8D.mp4"},
                {id:5, title: "特殊儿童职业能力评估系统", video: "https://qiwi.oss-cn-shanghai.aliyuncs.com/opoc/systemVideo/5%E7%89%B9%E6%AE%8A%E5%84%BF%E7%AB%A5%E8%81%8C%E4%B8%9A%E8%83%BD%E5%8A%9B%E8%AF%84%E4%BC%B0%E7%B3%BB%E7%BB%9F.mp4"},
                {id:6, title: "七维感觉统合评估系统使用方法", video: "https://qiwi.oss-cn-shanghai.aliyuncs.com/opoc/systemVideo/6%E4%B8%83%E7%BB%B4%E6%84%9F%E8%A7%89%E7%BB%9F%E5%90%88%E8%AF%84%E4%BC%B0%E7%B3%BB%E7%BB%9F%E4%BD%BF%E7%94%A8%E6%96%B9%E6%B3%95.mp4"},
                {id:7, title: "特殊儿童职业能力评估系统使用说明-教师账号", video: "https://qiwi.oss-cn-shanghai.aliyuncs.com/opoc/systemVideo/%E7%89%B9%E6%AE%8A%E5%84%BF%E7%AB%A5%E8%81%8C%E4%B8%9A%E8%83%BD%E5%8A%9B%E8%AF%84%E4%BC%B0%E7%B3%BB%E7%BB%9F%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E-%E6%95%99%E5%B8%88%E8%B4%A6%E5%8F%B7.mp4"},
                {id:8, title: "特殊儿童职业能力评估系统使用说明-学校管理员", video: "https://qiwi.oss-cn-shanghai.aliyuncs.com/opoc/systemVideo/%E7%89%B9%E6%AE%8A%E5%84%BF%E7%AB%A5%E8%81%8C%E4%B8%9A%E8%83%BD%E5%8A%9B%E8%AF%84%E4%BC%B0%E7%B3%BB%E7%BB%9F%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E-%E5%AD%A6%E6%A0%A1%E7%AE%A1%E7%90%86%E5%91%98.mp4"},
                {id:9, title: "通用 登陆操作", video: "https://qiwi.oss-cn-shanghai.aliyuncs.com/opoc/systemVideo/%E9%80%9A%E7%94%A8%20%E7%99%BB%E9%99%86%E6%93%8D%E4%BD%9C.mp4"},
                {id:10, title: "学校管理员-1新建班级", video: "https://qiwi.oss-cn-shanghai.aliyuncs.com/opoc/systemVideo/%E5%AD%A6%E6%A0%A1%E7%AE%A1%E7%90%86%E5%91%98-1%E6%96%B0%E5%BB%BA%E7%8F%AD%E7%BA%A7.mp4"},
                {id:11, title: "学校管理员-2新建教师", video: "https://qiwi.oss-cn-shanghai.aliyuncs.com/opoc/systemVideo/%E5%AD%A6%E6%A0%A1%E7%AE%A1%E7%90%86%E5%91%98-2%E6%96%B0%E5%BB%BA%E6%95%99%E5%B8%88.mp4"},
                {id:12, title: "学校管理员-3录入学生信息", video: "https://qiwi.oss-cn-shanghai.aliyuncs.com/opoc/systemVideo/%E5%AD%A6%E6%A0%A1%E7%AE%A1%E7%90%86%E5%91%98-3%E5%BD%95%E5%85%A5%E5%AD%A6%E7%94%9F%E4%BF%A1%E6%81%AF.mp4"},
                {id:13, title: "学校管理员-4批量导入学生", video: "https://qiwi.oss-cn-shanghai.aliyuncs.com/opoc/systemVideo/%E5%AD%A6%E6%A0%A1%E7%AE%A1%E7%90%86%E5%91%98-4%E6%89%B9%E9%87%8F%E5%AF%BC%E5%85%A5%E5%AD%A6%E7%94%9F.mp4"},
            ]
        }
    }
})