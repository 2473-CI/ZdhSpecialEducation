<script setup lang="ts">
import Search from '../components/clsList/search.vue'
import Table from '../components/clsList/table.vue'
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
