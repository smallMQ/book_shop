<template>
    <div class="">
        <div style="width: 50%;height: 280px;margin-top: 30px;margin-bootom:30px;float: left" class="bac"
             v-for="oldbook in oldbook_list" :key="oldbook.id">
            <img :src="oldbook.image" alt="" width="180px" height="140px" style="float: left">
            <div style="float: left;text-align: left;margin-left: 10px;width: 330px">
                <h4>{{oldbook.name}}</h4>
                <hr>
                <!--                <div style="height: 100px;width: 100%">-->
                <textarea style="border:0;width: 100%;overflow: hidden;resize: none" readonly disabled rows="4">简介:[{{oldbook.simple_introduce}}]</textarea>

                <!--                </div>-->
                <p>价格:{{oldbook.price}}元</p>
                <p v-if="oldbook.is_sell==false">未出售</p>
                <p v-else>已卖出</p>
                <div class="el-col-24">
                    <div class="el-col-17">
                        发布者:{{oldbook.sell_user}}({{oldbook.create_time}}))
                    </div>
                    <div class="el-col-7">
                        <el-button type="primary" plain style="" @click="buy_now(oldbook)">立即购买</el-button>
                    </div>
                </div>
            </div>

        </div>

    </div>
</template>

<script>
    import settings from "../assets/js/settings";

    export default {
        name: "oldbooklist",
        props: [
            'search',
        ],
        data() {
            return {
                oldbook_list: [],

            }
        },
        created() {
            this.get_oldbook();
        },
        methods: {
            get_oldbook() {
                this.$axios.get(settings.base_url + "/oldbook/oldbook/").then(response => {
                    this.oldbook_list = response.data;
                    console.log(this.oldbook_list);
                }).catch(error => {
                });
            },
            buy_now(oldbook) {
                let token = this.$cookies.get('token')
                if (!token) {
                    this.$message({
                        message: "您还没有登录，请先登录",
                    })
                    return false
                }
                if(oldbook.is_sell==true){
                     this.$message({
                        message: "该商品已经被其他人买走了!",
                    })
                    return false
                }
                this.$axios({
                        method: 'post',
                        url: this.$settings.base_url + '/oldbook/pay/',
                        data: {


                            "book": oldbook.id,
                            "price": oldbook.price,
                            "name": oldbook.name,
                            // "author":book.author,
                            // "user":this.$cookies.get('user')

                        },
                        headers: {Authorization: 'jwt ' + token}
                    }
                ).then(response => {
                    console.log(response.data)
                    let pay_url = response.data
                    //前端发送get请求
                    open(pay_url, '_self')
                }).catch(error => {
                    console.log(error)
                })

            },
        },

        watch:{
            "search":function () {
                this.$axios.get(settings.base_url + "/oldbook/oldbook/",{
                    params:{
                        search:this.search
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