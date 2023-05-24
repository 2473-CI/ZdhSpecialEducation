<script setup >
import Search from '../components/studentList/search.vue'
import Table from '../components/studentList/table.vue'
</script>

<template>
    <div class="box">
        <Search />
        <div style="height: 20px"></div>
        <Table />
    </div>
</template>

<style scoped>
.box {
   padding: 2%; 
}
</style>
