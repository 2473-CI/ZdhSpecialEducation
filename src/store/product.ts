import { defineStore } from 'pinia';


/**
 * 单个产品
 */
interface Product {
    id: number,
    img: string,
    title: string,
    router: string
}

/**
 * 产品列表
 */
export const useProductStore = defineStore('ProductStore', {
    state: () => {
        return {
            ProductList: [] as Product[]
        }
    },

    getters: {

    },

    actions: {
        // 初始化产品列表
        loadProductList() {
            this.ProductList = [
                { id: 0, title: "一人一案生涯发展平台", router: "/management", img: "https://qiwi.oss-cn-shanghai.aliyuncs.com/opoc/home/%E4%B8%80%E4%BA%BA%E4%B8%80%E6%A1%88%E7%94%9F%E6%B6%AF%E5%8F%91%E5%B1%95%E5%B9%B3%E5%8F%B0.jpg", },
                { id: 2, title: "特殊儿童评估干预系统", router: "/management", img: "https://qiwi.oss-cn-shanghai.aliyuncs.com/opoc/home/%E7%89%B9%E6%AE%8A%E5%84%BF%E7%AB%A5%E8%AF%84%E4%BC%B0%E5%B9%B2%E9%A2%84%E7%B3%BB%E7%BB%9F.jpg", },
                { id: 3, title: "特殊儿童评估干预系统（随班就读）", router: "/management", img: "https://qiwi.oss-cn-shanghai.aliyuncs.com/opoc/home/%E9%9A%8F%E7%8F%AD%E5%B0%B1%E8%AF%BB%E5%84%BF%E7%AB%A5%E8%AF%84%E4%BC%B0%E5%B9%B2%E9%A2%84%E7%B3%BB%E7%BB%9F.jpeg", },
                { id: 4, title: "特殊儿童评估干预系统（送教上门）", router: "", img: "https://qiwi.oss-cn-shanghai.aliyuncs.com/opoc/home/%E9%80%81%E6%95%99%E4%B8%8A%E9%97%A8%E5%84%BF%E7%AB%A5%E8%AF%84%E4%BC%B0%E5%B9%B2%E9%A2%84%E7%B3%BB%E7%BB%9F.jpg", },
                { id: 5, title: "普通学校特殊需要学生课程评估系统", router: "", img: "https://qiwi.oss-cn-shanghai.aliyuncs.com/opoc/home/%E6%99%AE%E9%80%9A%E5%AD%A6%E6%A0%A1%E7%89%B9%E6%AE%8A%E9%9C%80%E8%A6%81%E5%AD%A6%E7%94%9F%E8%AF%BE%E7%A8%8B%E8%AF%84%E4%BC%B0%E7%B3%BB%E7%BB%9F.jpg", },
                { id: 6, title: "儿童感觉统合能力评估系统", router: "", img: "https://qiwi.oss-cn-shanghai.aliyuncs.com/opoc/home/%E5%84%BF%E7%AB%A5%E6%84%9F%E8%A7%89%E7%BB%9F%E5%90%88%E8%83%BD%E5%8A%9B%E8%AF%84%E4%BC%B0%E7%B3%BB%E7%BB%9F.jpg", },
                { id: 7, title: "特殊儿童职业能力评估系统", router: "", img: "https://qiwi.oss-cn-shanghai.aliyuncs.com/opoc/home/%E7%89%B9%E6%AE%8A%E5%84%BF%E7%AB%A5%E8%87%AA%E7%AB%8B%E8%83%BD%E5%8A%9B%E8%AF%84%E4%BC%B0%E7%B3%BB%E7%BB%9F.jpg", },
                { id: 8, title: "教室资源管理系统", router: "", img: "https://qiwi.oss-cn-shanghai.aliyuncs.com/opoc/home/%E6%95%99%E5%AE%A4%E8%B5%84%E6%BA%90%E7%AE%A1%E7%90%86%E7%B3%BB%E7%BB%9F.jpg", },
                { id: 9, title: "特殊教育资源管理系统", router: "", img: "https://qiwi.oss-cn-shanghai.aliyuncs.com/opoc/home/%E6%80%9D%E5%BA%93%E6%95%99%E8%82%B2%E8%B5%84%E6%BA%90%E7%AE%A1%E7%90%86%E7%B3%BB%E7%BB%9F.jpeg", },
                { id: 10, title: "结构化教学辅助支持系统", router: "", img: "https://qiwi.oss-cn-shanghai.aliyuncs.com/opoc/home/%E7%BB%93%E6%9E%84%E5%8C%96%E6%95%99%E5%AD%A6%E8%BE%85%E5%8A%A9%E6%94%AF%E6%8C%81%E7%B3%BB%E7%BB%9F.jpg", },
                { id: 11, title: "儿童注意力评估训练系统", router: "", img: "", },
            ]
        }
    }
})