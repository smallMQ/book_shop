<template>
    <div class="">
        <div v-if="length != 0">
            <div style="width: 50%;height: 280px;margin-top: 30px;margin-bootom:30px;float: left" class="bac"
                 v-for="oldbook in oldbook_list" :key="oldbook.id">
                <img :src="oldbook.image" alt="" width="180px" height="140px" style="float: left">
                <div style="float: left;text-align: left;margin-left: 10px;width: 330px">
                    <h4>{{oldbook.name}}</h4>
                    <hr>
                    <!--                <div style="height: 100px;width: 100%">-->
<!--                    <textarea style="border:0;width: 100%;overflow: hidden;resize: none" readonly disabled rows="4">简介:[{{oldbook.simple_introduce}}]</textarea>-->

                    <!--                </div>-->
                    <p>价格:{{oldbook.price}}元</p>
                    <p v-if="oldbook.is_sell==false">未出售</p>
                    <p v-else>已卖出</p>
                    <div class="el-col-24">
                        <div class="el-col-17">
                            发布者:{{oldbook.sell_user}}({{oldbook.create_time}}))
                        </div>
                        <div class="el-col-7">
                            <el-button type="primary" plain style="" @click="delete_it(oldbook)">删除</el-button>
                        </div>
                    </div>
                </div>

            </div>

        </div>
        <div v-else>
            <el-empty description="这里太干净了"></el-empty>
        </div>
    </div>
</template>

<script>
    import settings from "../assets/js/settings";

    export default {
        name: "person_oldbooklist",
        props: [
            'search',
        ],
        data() {
            return {
                oldbook_list: [],
                length: 0
            }
        },
        created() {
            this.get_oldbook();
        },
        methods: {
            get_oldbook() {
                this.$axios.get(settings.base_url + "/book/book/", {
                    params: {
                        "author": this.$cookies.get("username")
                    }
                }).then(response => {
                    this.oldbook_list = response.data.results;
                    this.length = response.data.count;
                    console.log(response.data.length == 0);
                }).catch(error => {
                });
            },

            delete_it(oldbook) {
                let token = this.$cookies.get('token')
                if (!token) {
                    this.$message({
                        message: "您还没有登录，请先登录",
                    })
                    return false
                }
                this.$confirm('该操作是不可逆操作,确定吗?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {

                this.$axios({
                        method: 'delete',
                        url: this.$settings.base_url + '/book/book/' + oldbook.id + '/',
                        headers: {Authorization: 'jwt ' + token}
                    }
                ).then(response => {
                    this.get_oldbook();
                     this.$message({
                        type: 'success',
                        message: '删除成功!'
                    });
                }).catch(error => {
                    console.log(error)
                })
                }).catch(() => {
                    this.$message({
                        type: 'info',
                        message: '已取消删除'
                    });
                });


            }
        },

        watch: {
            "search": function () {
                this.$axios.get(settings.base_url + "/oldbook/oldbook/", {
                    params: {
                        search: this.search
                    }
                }).then(response => {
                    this.oldbook_list = response.data;
                    console.log(this.oldbook_list);
                }).catch(error => {
                });
            }
        }
    }
</script>

<style scoped>
    .bac {
        box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04);
        background-color: floralwhite;
        opacity: 80%;

    }


</style>