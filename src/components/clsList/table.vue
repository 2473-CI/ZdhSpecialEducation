<script setup lang="ts">
import { ref } from 'vue'
import { useStudentStore } from "../../store/student";
import { useSchoolStore } from '../../store/school'
const StudentStore = useStudentStore()
const SchoolStore = useSchoolStore()
// StudentStore.load()

// 切换每页显示多少条
const handleSizeChange = (val: number) => {
    StudentStore.searchStuImp.pageSize = val
    StudentStore.search()
}

// 切换页码
const handleCurrentChange = (val: number) => {

    StudentStore.searchStuImp.pageNo = val
    StudentStore.search()
}
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
        <el-table :data="StudentStore.Students" :cell-style="{ textAlign: 'center' }"
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
            <el-table-column label="头像" width="80">
                <template #default="scope">
                    <!-- <div style="display: flex; align-items: center"> -->
                    <el-image style="width: 50px; height: 50px" :src="scope.row.avatar" fit="fill" />
                    <!-- </div> -->
                </template>
            </el-table-column>
            <el-table-column label="性别" width="80">
                <template #default="scope">
                    <!-- <div style="display: flex; align-items: center"> -->
                    <span>{{ StudentStore.Sex.find(o => o.value == scope.row.sex)?.name
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
        <div class="page-split">

            <el-pagination :current-page="StudentStore.searchStuImp.pageNo" :page-size="10" :page-sizes="[10, 20, 50, 100]" :disabled="false"
                :background="true" layout="total, prev, pager, next, sizes" :total="StudentStore.Total" @size-change="handleSizeChange"
                @current-change="handleCurrentChange" />
        </div>
    </el-card>
</template>

<style scoped>
.page-split {
    display: flex;
    height: 60px;
    justify-content: center;
}
</style>