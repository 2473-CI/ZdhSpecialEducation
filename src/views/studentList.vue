<script setup lang="ts">
import Search from '../components/studentList/search.vue'
import Table from '../components/studentList/table.vue'
</script>

<template>
    <div class="box">
        <Search />
        <Table />
    </div>
</template>

<style scoped>
.box {
    padding: 48px 32px;
    box-sizing: border-box;
}
</style>
