<script setup lang="ts">
import { reactive, ref } from 'Vue';
import { useSchoolStore } from '../../store/school'
import { useClsStore } from '../../store/cls'
import { useStudentStore } from '../../store/student'
const SchoolStore = useSchoolStore()
const ClsStore = useClsStore()
const StudentStore = useStudentStore()

ClsStore.loadClsList(SchoolStore.schoolList[0].schoolId)

console.log(ClsStore.clsList)

const searchBody = reactive({
    schoolId: "",
    clsId: "",
    userName: "",
}) 

const isExpansion = ref(false)

const onSubmit = () => {
    console.log(ClsStore.clsList)
}
</script>

<template>
    <el-card class="box-card">
        <el-form :inline="true" :model="StudentStore.searchStuImp" class="all-form">
            <el-form-item label="学校">
                <el-select v-model="StudentStore.searchStuImp.schoolId" placeholder="请选择">
                    <el-option :label="school.schoolName" :value="school.schoolId" v-for="school in SchoolStore.schoolList"/>
                </el-select>
            </el-form-item>
            <el-form-item label="班级">
                <el-select v-model="StudentStore.searchStuImp.clsId" placeholder="请选择">
                    <el-option :label="cls.gradeName+cls.name" :value="cls._id" :key="cls._id" v-for="cls in ClsStore.clsList"/>
                </el-select>
            </el-form-item>
            <el-form-item label="姓名" v-show="isExpansion">
                <el-input v-model="StudentStore.searchStuImp.name" placeholder="请输入" />
            </el-form-item>
            <el-form-item label="性别" v-show="isExpansion">
                <el-select v-model="StudentStore.searchStuImp.sex" placeholder="请选择">
                    <el-option label="男" value="1" />
                    <el-option label="女" value="2" />
                </el-select>
            </el-form-item>
            <el-form-item label="障碍类型" v-show="isExpansion">
                <el-select v-model="StudentStore.searchStuImp.obstacleType" placeholder="请选择">
                    <el-option label="智力障碍" value="智力障碍" />
                    <el-option label="自闭谱系障碍" value="自闭谱系障碍" />
                    <el-option label="脑瘫" value="脑瘫" />
                    <el-option label="视力障碍" value="视力障碍" />
                    <el-option label="听力障碍" value="听力障碍" />
                    <el-option label="言语与语言障碍" value="言语与语言障碍" />
                    <el-option label="情绪与行为障碍" value="情绪与行为障碍" />
                    <el-option label="肢体障碍" value="肢体障碍" />
                </el-select>
            </el-form-item>

            <el-form-item label="安置方式" v-show="isExpansion">
                <el-select v-model="StudentStore.searchStuImp.placement" placeholder="请选择">
                    <el-option label="特殊学校" value="特殊学校" />
                    <el-option label="随班就读" value="随班就读" />
                    <el-option label="普校特教班" value="普校特教班" />
                    <el-option label="送教上门" value="送教上门" />
                    <el-option label="机构" value="机构" />
                    <el-option label="待安置" value="待安置" />
                </el-select>
            </el-form-item>
            <el-form-item class="right-bottom">
                <el-button @click="StudentStore.clear()">重置</el-button>
                <el-button type="primary" @click="StudentStore.search()">查询</el-button>
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