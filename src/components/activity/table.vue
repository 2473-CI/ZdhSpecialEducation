<script setup lang="ts">
import { useSchoolStore } from '../../store/school';
import { useClsStore } from '../../store/cls'
import { useActiveStore } from '../../store/activity';
const ActiveStore = useActiveStore()
const SchoolStore = useSchoolStore()
const ClsStore = useClsStore()
ActiveStore.loadActive()

// 切换每页显示多少条
const handleSizeChange = (val: number) => {
    ClsStore.searchClsImp.pageSize = val
    ClsStore.search()
}

// 切换页码
const handleCurrentChange = (val: number) => {
    ClsStore.searchClsImp.pageNo = val
    ClsStore.search()
}



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
        <el-table :data="ActiveStore.activeList" :cell-style="{ textAlign: 'center' }"
            :header-cell-style="{ 'text-align': 'center' }">
            <!-- <el-table-column fixed prop="schoolId" label="学校" width="150" /> -->
            <el-table-column prop="_id" label="编号" width="120" />
            <el-table-column prop="title" label="标题" width="120" />
            <el-table-column prop="prepare" label="说明" width="100" />

            <el-table-column label="操作">
                <template #default="scope">
                    <el-button type="danger" @click="" text>查看</el-button>
                </template>
            </el-table-column>
        </el-table>
        <div class="page-split">

            <el-pagination :current-page="ClsStore.searchClsImp.pageNo" :page-size="10" :page-sizes="[10, 20, 50, 100]"
                :disabled="false" :background="true" layout="total, prev, pager, next, sizes" :total="ClsStore.Total"
                @size-change="handleSizeChange" @current-change="handleCurrentChange" />
        </div>
    </el-card>
                                                                                                                                                                                                                                                                                                                                                                                     
</template>

<style scoped>
.page-split {
    display: flex;
    height: 60px;
    justify-content: center;
}

.card-header {
    text-align: right;
}
</style>