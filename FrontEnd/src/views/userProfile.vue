<script setup >
import { useUserStore } from '../store/user';
const userStore = useUserStore()
userStore.loadUserInfo()

</script>

<template>
    <div class="box">
        <el-card shadow="always">

            <el-form ref="ruleFormRef" :model="userStore.userUpdateFrom"  label-width="120px" status-icon>
                <el-form-item label="账号"  prop="account">
                    <el-input  disabled  v-model="userStore.userUpdateFrom.account"/>
                </el-form-item>
                <el-form-item label="姓名" prop="name">
                    <el-input v-model="userStore.userUpdateFrom.name"/>
                </el-form-item>
                <el-form-item label="头像" prop="avatar">
                </el-form-item>
                <el-form-item label="性别" prop="sex">
                    <el-select placeholder="请选择" v-model="userStore.userUpdateFrom.sex">
                        <el-option label="男" value="1" />
                        <el-option label="女" value="2" />
                    </el-select>

                </el-form-item>
                <el-form-item label="手机号码" prop="phone">
                    <el-input v-model="userStore.userUpdateFrom.phone"/>
                </el-form-item>
                <el-form-item label="邮箱">
                    <el-input />
                </el-form-item>
                <el-form-item label="描述">
                    <el-input  :rows="2" type="textarea" placeholder="描述"  v-model="userStore.userUpdateFrom.phone"/>
                </el-form-item>

                <el-form-item>
                    <el-button type="primary" @click=" ">
                        更新基本信息
                    </el-button>
                </el-form-item>
            </el-form>




        </el-card>
    </div>
</template>

<style scoped>
.box {
    padding: 48px 32px;
    box-sizing: border-box;
}
</style>
