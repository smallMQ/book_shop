<template>

    <el-row class="">
        <div class="el-col-24">
            <Header @search_book="get_search_oldbook"></Header>
            <div class="el-col-18">
<div v-if="index==1"><oldbooklist :search="search"></oldbooklist></div>
<div v-else-if="index==2"><sellbook></sellbook></div>
<div v-else>
                <changemsg></changemsg></div>


            </div>
            <div class="el-col-6">
            <slider @change="changekey"></slider>
            </div>
        </div>
    </el-row>
</template>

<script>
    import Header from "../components/header";
    import slider from "../components/slider";
    import oldbooklist from "../components/oldbooklist";
    import sellbook from "../components/sellbook";
    import changemsg from "../components/changemsg";

    export default {
        name: "Oldbook",
        components: {
            Header,
            slider,
            oldbooklist,
            sellbook,
            changemsg,
        },
        data(){
            return{
                index:1,
                search:'',
            }
        },
        methods:{
            changekey(key){
                this.index = key;
            },
            get_search_oldbook(val){
                this.search = val;

            }
        }
    }
</script>

<style scoped>

</style>