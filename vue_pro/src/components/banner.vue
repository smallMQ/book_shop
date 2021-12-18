<template>
    <div class="banner">
        <el-carousel height="400px">
            <el-carousel-item v-for="item in banner_list" :key="item">
<!--                <router-link :to="item.link">-->
                <img :src="item.image" alt="" >
<!--                    </router-link>-->
            </el-carousel-item>
        </el-carousel>
    </div>
</template>

<script>
    import settings from "../assets/js/settings";

    export default {
        name: "Banner",
        data() {
            return {
                banner_list:[],
            };
        },
        created() {
            this.$axios.get(settings.base_url + "/home/banner/").then(response => {
                // console.log(response.data);
                this.banner_list = response.data;
                console.log(this.banner_list);
            }).catch(error => {
            });
        },
    }
</script>

<style scoped>
    .el-carousel__item {
        height: 400px;
        min-width: 1200px;
    }

    .el-carousel__item img {
        height: 400px;
        margin-left: calc(50% - 1920px / 2);
    }
</style>