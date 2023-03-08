<script setup lang="ts">

import { ref } from 'vue'
import { useSchoolStore } from '../../store/school'
import { useClsStore } from '../../store/cls'
const SchoolStore = useSchoolStore()
const ClsStore = useClsStore()

const isExpansion = ref(false)
ClsStore.search()

</script>

<template>
    <el-card class="box-card">
        <el-form :inline="true" :model="ClsStore.searchClsImp" class="all-form">
            <el-form-item label="学校" >
                <el-select v-model="ClsStore.searchClsImp.schoolId" placeholder="请选择">
                    <el-option :label="school.schoolName" :value="school.schoolId" :key="school.schoolId" v-for="school in SchoolStore.schoolList"/>
                </el-select>
            </el-form-item>
            <el-form-item label="年级">
                <el-select v-model="ClsStore.searchClsImp.gradeCode" placeholder="请选择">
                    <el-option :label="grade.name" :value="grade.gradeCode" :key="grade.index" v-for="grade in ClsStore.gradeCodes"/>
                </el-select>
            </el-form-item>
            <el-form-item label="班级名" v-show="isExpansion">
                <el-input v-model="ClsStore.searchClsImp.name" placeholder="请输入" />
            </el-form-item>
          
            <el-form-item class="right-bottom">
                <el-button @click="ClsStore.clear()">重置</el-button>
                <el-button type="primary" @click="ClsStore.search()">查询</el-button>
                <el-button @click="isExpansion=!isExpansion">
                    <span v-show="isExpansion">收起</span>
                    <span v-show="!isExpansion">展开</span>
                </el-button>
            </el-form-item>
        </el-form>
    </el-card>
</template>

<style scoped>
.all-form{
    position:relative;
}
.right-bottom{
    position:absolute;
    right:0px;
}

</style>