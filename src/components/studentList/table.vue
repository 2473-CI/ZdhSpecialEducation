<script setup lang="ts">
import { useStudentStore } from "../../store/student";
import { useSchoolStore } from '../../store/school'
const StudentStore = useStudentStore()
const SchoolStore = useSchoolStore()
// StudentStore.load()


console.log(StudentStore.Students)
</script>

<template>
    <el-card class="box-card">
        <template #header>
            <div class="card-header">
                <!-- <span>Card name</span> -->
                <el-button class="button" text>新建</el-button>
                <el-button class="button" text>导入</el-button>
                <el-button class="button" text>下载模板</el-button>
            </div>
        </template>
        <el-table :data="StudentStore.Students"  :cell-style="{ textAlign: 'center' }"
            :header-cell-style="{ 'text-align': 'center' }">
            <!-- <el-table-column fixed prop="schoolId" label="学校" width="150" /> -->
            <el-table-column label="学校" width="220">
                <template #default="scope">
                    <div style="display: flex; align-items: center">
                        <span style="margin-left: 10px">{{
                            SchoolStore.schoolList.find(o => o.schoolId == scope.row.schoolId)?.schoolName }}</span>
                    </div>
                </template>
            </el-table-column>
            <el-table-column prop="clsName" label="班级" width="120" />
            <el-table-column prop="name" label="姓名" width="70" />
            <el-table-column  label="头像" width="80" >
                <template #default="scope">
                    <!-- <div style="display: flex; align-items: center"> -->
                        <el-image style="width: 50px; height: 50px" :src="scope.row.avatar" fit="fill" />
                    <!-- </div> -->
                </template>
            </el-table-column>
            <el-table-column label="性别" width="80">
                <template #default="scope">
                    <!-- <div style="display: flex; align-items: center"> -->
                        <span >{{ StudentStore.Sex.find(o => o.value == scope.row.sex)?.name
                        }}</span>
                    <!-- </div> -->
                </template>
            </el-table-column>
            <el-table-column prop="obstacleType" label="障碍类型" width="150" />
            <el-table-column prop="placement" label="安置方式" width="150" />
            <el-table-column label="操作">
                <template #default="scope">
                    <el-button type="primary" text>进入主页</el-button>
                    <el-button type="primary" text>修改</el-button>
                    <el-button type="danger" text>删除</el-button>
                </template>
            </el-table-column>
        </el-table>
    </el-card>
</template>

<style scoped></style>