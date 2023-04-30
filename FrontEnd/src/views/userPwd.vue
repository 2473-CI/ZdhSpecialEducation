<script setup lang="ts">
import { useUserStore } from '../store/user';
const userStore = useUserStore()
userStore.loadUserInfo()



</script>

<template>
    <div class="box">
        <el-card shadow="always">

            <el-form ref="ruleFormRef" :model="userStore.password" label-width="120px" status-icon>
                <el-form-item label="原密码" prop="account">
                    <el-input type="password" v-model="userStore.password.OriginalPassword" placeholder="请输入原来的密码" show-password />
                </el-form-item>
                <el-form-item label="新密码" prop="account">
                    <el-input type="password"  v-model="userStore.password.NewPassword" placeholder="请输入新的的密码" show-password />
                </el-form-item>
                <el-form-item label="确认密码" prop="account">
                    <el-input type="password"  v-model="userStore.password.ConfirmPassword" placeholder="请再次输入新密码密码" show-password />
                </el-form-item>

                <el-form-item>
                    <el-button type="primary" @click=" ">
                        更新密码
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
