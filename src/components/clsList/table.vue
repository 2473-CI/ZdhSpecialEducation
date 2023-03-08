<script setup lang="ts">
import { ref, reactive } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { useSchoolStore } from '../../store/school';
import { useClsStore } from '../../store/cls'
import { Cls } from '../../store/cls'

const SchoolStore = useSchoolStore()
const ClsStore = useClsStore()

const dialogVisible = ref(false)
let stuTmp: Cls = reactive({_id: "", gradeCode: "", name: "", gradeName: ""})

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

const modify = (cls: Cls) => {
    dialogVisible.value = true
    stuTmp = {
        ...cls
    }
    console.log(stuTmp)
}
const del = (clsId: string) => {
    ElMessageBox.confirm(
        '确定要删除嘛？',
        '警告',
        {
            confirmButtonText: '确认',
            cancelButtonText: '取消',
            type: 'warning',
        }
    )
        .then(() => {
            ClsStore.delCls(clsId)
        })
        .catch(() => {
            ElMessage({
                type: 'info',
                message: '删除失败',
            })
        })
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
        <el-table :data="ClsStore.clsList" :cell-style="{ textAlign: 'center' }"
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
            <el-table-column prop="gradeName" label="年级" width="120" />
            <el-table-column prop="name" label="班级名" width="100" />
            <el-table-column label="描述" width="80">
                <template #default="scope">
                    --
                </template>
            </el-table-column>
            <el-table-column prop="createdAt" label="创建时间" width="200"> </el-table-column>
            <el-table-column label="操作">
                <template #default="scope">
                    <el-button type="primary" @click="modify(scope.row)" text>修改</el-button>
                    <el-button type="danger" @click="del(scope.row._id)" text>删除</el-button>
            </template>
        </el-table-column>
    </el-table>
    <div class="page-split">

        <el-pagination :current-page="ClsStore.searchClsImp.pageNo" :page-size="10" :page-sizes="[10, 20, 50, 100]"
            :disabled="false" :background="true" layout="total, prev, pager, next, sizes" :total="ClsStore.Total"
            @size-change="handleSizeChange" @current-change="handleCurrentChange" />
    </div>
</el-card>

<el-dialog v-model="dialogVisible" title="更新班级" width="30%" draggable>
    <el-form ref="ruleFormRef" v-model="stuTmp" label-width="120px" class="demo-ruleForm" status-icon>

        <el-form-item label="所属学校" prop="region">
            <el-select v-model="stuTmp.school" placeholder="所属学校">
                <el-option :key="school.id" v-for="school in SchoolStore.schoolList" :label="school.schoolName" :value="school.schoolId" />
            </el-select>
        </el-form-item>
        <el-form-item label="年级" prop="region">
            <el-select v-model="stuTmp.gradeCode" placeholder="年级">
                <el-option :key="cls._id" v-for="cls in ClsStore.clsList" :label="cls.gradeName" :value="cls.gradeCode" />
            </el-select>
        </el-form-item>
        <el-form-item label="班级名称" prop="region">
            <el-select v-model="stuTmp.gradeCode" placeholder="班级名称">
                <el-option :key="cls._id" v-for="cls in ClsStore.clsList" :label="cls.name" :value="cls.name" />
            </el-select>
        </el-form-item>
        <el-form-item label="描述" prop="region">
            <el-input :rows="2" type="textarea" placeholder="Please input" />
        </el-form-item>
    </el-form>
    <template #footer>
            <span class="dialog-footer">
                <el-button @click="dialogVisible = false">取消</el-button>
                <el-button type="primary" @click="dialogVisible = false">
                    确定
                </el-button>
            </span>
        </template>
</el-dialog>
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