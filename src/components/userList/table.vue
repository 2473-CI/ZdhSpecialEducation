<script setup lang="ts">
import { useUserStore } from '../../store/user';
import { useSchoolStore } from '../../store/school';
import { useStudentStore } from '../../store/student';
const UserStore = useUserStore()
const SchoolStore = useSchoolStore()
const StudentStore = useStudentStore()

UserStore.searchUserInfo()

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
        <el-table :data="UserStore.userList" :cell-style="{ textAlign: 'center' }"
            :header-cell-style="{ 'text-align': 'center' }">
            <!-- <el-table-column fixed prop="schoolId" label="学校" width="150" /> -->
            <el-table-column label="学校" width="220">
                <template #default="scope">
                    <div style="display: flex; align-items: center">
                        <span style="margin-left: 10px;display: -webkit-box;-webkit-box-orient: vertical;
                        -webkit-line-clamp: 1;overflow: hidden;text-overflow: ellipsis;">{{
                            SchoolStore.schoolList.find(o => o.schoolId == scope.row.schoolId)?.schoolName }}</span>
                    </div>
                </template>
            </el-table-column>
            <el-table-column prop="account" label="账号" width="120" />
            <el-table-column prop="name" label="姓名" width="70" />
            <el-table-column prop="role" label="类型" width="120" />
            <el-table-column label="头像" width="80">
                <template #default="scope">
                    <!-- <div style="display: flex; align-items: center"> -->
                    <el-image style="width: 50px; height: 50px" :src="scope.row.avatar" fit="fill" />
                    <!-- </div> -->
                </template>
            </el-table-column>
            <el-table-column label="性别" width="60">
                <template #default="scope">
                    <!-- <div style="display: flex; align-items: center"> -->
                    <span>{{ StudentStore.Sex.find(o => o.value == scope.row.sex)?.name
                    }}</span>
                    <!-- </div> -->
                </template>
            </el-table-column>
            <el-table-column prop="phone" label="手机号码" width="120" />
            <el-table-column prop="_id" label="邮箱" width="150" />
            <el-table-column prop="lastVisitDate" label="最近访问时间" width="150" />
            <el-table-column prop="totalVisitCount" label="经验值" width="150" />
            <el-table-column label="操作">
                <template #default="scope">
                    <el-button type="primary" text>进入主页</el-button>
                    <el-button type="primary" @click="" text>修改</el-button>
                    <el-button type="danger" @click="" text>删除</el-button>
                </template>
            </el-table-column>
        </el-table>
        <!-- <div class="page-split">

            <el-pagination :current-page="StudentStore.searchStuImp.pageNo" :page-size="10" :page-sizes="[10, 20, 50, 100]" :disabled="false"
                :background="true" layout="total, prev, pager, next, sizes" :total="StudentStore.Total" @size-change="handleSizeChange"
                @current-change="handleCurrentChange" />
        </div> -->
    </el-card>


</template>

<style scoped>
.page-split {
    display: flex;
    height: 60px;
    justify-content: center;
}
.card-header{
    text-align: right;
}
</style>