<template>
    <div>

        <div class="course" v-if="length!=0">
    <div class="main">
             <div class="course-list transition-box" name="el-zoom-in-top">
                <div class="course-item" v-for="book in book_list" :key="book.name" >
                    <div class="course-image">
                        <img :src="book.image" alt="">
                    </div>
                    <div class="course-info">
                        <h3>
                            <router-link :to="'/book/detail/'+book.id">{{book.name}}</router-link>
                        </h3>
                        <p>作者:{{book.author}}</p>
                        <span class="teather-info" v-for="category in category_list">
                            <p v-show="book.category == category.id">
                                分类:{{category.class_name}}
                            </p>
                        </span>
<!--                        <span style="width: 50%;">出版社:{{book.publisher}}</span>-->
                        <p><span style="width: 50%;">发布时间:{{book.create_time}}</span></p>


                        <div class="pay-box">
                            <div>
<!--                                <span class="discount-price">数量:{{book.number}}</span>-->

                            </div>
                            <span class="discount-price"></span>
                            <el-button type="primary" plain style="float: right" @click="delete_it(book)">删除</el-button>
                        </div>
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
                book_list: [],
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
                    this.book_list = response.data.results;
                    this.length = response.data.count;
                    console.log(response.data.length == 0);
                }).catch(error => {
                });
            },

            delete_it(book) {
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
                        url: this.$settings.base_url + '/book/book/' + book.id + '/',
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
    .course {
        background: #f6f6f6;
    }

    .course .main {
        width: 1200px;
        margin: 20px auto 0;
    }

    .course .condition {
        margin-bottom: 35px;
        padding: 25px 30px 25px 20px;
        background: #fff;
        border-radius: 4px;
        box-shadow: 0 2px 4px 0 #f0f0f0;
    }

    .course .cate-list {
        border-bottom: 1px solid #333;
        border-bottom-color: rgba(51, 51, 51, .05);
        padding-bottom: 18px;
        margin-bottom: 17px;
    }

    .course .cate-list::after {
        content: "";
        display: block;
        clear: both;
    }

    .course .cate-list li {
        float: left;
        font-size: 16px;
        padding: 6px 15px;
        line-height: 16px;
        margin-left: 14px;
        position: relative;
        transition: all .3s ease;
        cursor: pointer;
        color: #4a4a4a;
        border: 1px solid transparent; /* transparent 透明 */
    }

    .course .cate-list .title {
        color: #888;
        margin-left: 0;
        letter-spacing: .36px;
        padding: 0;
        line-height: 28px;
    }

    .course .cate-list .this {
        color: #ffc210;
        border: 1px solid #ffc210 !important;
        border-radius: 30px;
    }

    .course .ordering::after {
        content: "";
        display: block;
        clear: both;
    }

    .course .ordering ul {
        float: left;
    }

    .course .ordering ul::after {
        content: "";
        display: block;
        clear: both;
    }

    .course .ordering .condition-result {
        float: right;
        font-size: 14px;
        color: #9b9b9b;
        line-height: 28px;
    }

    .course .ordering ul li {
        float: left;
        padding: 6px 15px;
        line-height: 16px;
        margin-left: 14px;
        position: relative;
        transition: all .3s ease;
        cursor: pointer;
        color: #4a4a4a;
    }

    .course .ordering .title {
        font-size: 16px;
        color: #888;
        letter-spacing: .36px;
        margin-left: 0;
        padding: 0;
        line-height: 28px;
    }

    .course .ordering .this {
        color: #ffc210;
    }

    .course .ordering .price {
        position: relative;
    }

    .course .ordering .price::before,
    .course .ordering .price::after {
        cursor: pointer;
        content: "";
        display: block;
        width: 0px;
        height: 0px;
        border: 5px solid transparent;
        position: absolute;
        right: 0;
    }

    .course .ordering .price::before {
        border-bottom: 5px solid #aaa;
        margin-bottom: 2px;
        top: 2px;
    }

    .course .ordering .price::after {
        border-top: 5px solid #aaa;
        bottom: 2px;
    }

    .course .ordering .price_up::before {
        border-bottom-color: #ffc210;
    }

    .course .ordering .price_down::after {
        border-top-color: #ffc210;
    }

    .course .course-item:hover {
        box-shadow: 4px 6px 16px rgba(0, 0, 0, .5);
    }

    .course .course-item {
        width: 1100px;
        background: #fff;
        padding: 20px 30px 20px 20px;
        margin-bottom: 35px;
        border-radius: 2px;
        cursor: pointer;
        box-shadow: 2px 3px 16px rgba(0, 0, 0, .1);
        /* css3.0 过渡动画 hover 事件操作 */
        transition: all .2s ease;
    }

    .course .course-item::after {
        content: "";
        display: block;
        clear: both;
    }

    /* 顶级元素 父级元素  当前元素{} */
    .course .course-item .course-image {
        float: left;
        width: 423px;
        height: 210px;
        margin-right: 30px;
    }

    .course .course-item .course-image img {
        max-width: 100%;
        max-height: 210px;
    }

    .course .course-item .course-info {
        float: left;
        width: 596px;
    }

    .course-item .course-info h3 a {
        font-size: 26px;
        color: #333;
        font-weight: normal;
        margin-bottom: 8px;
    }

    .course-item .course-info h3 span {
        font-size: 14px;
        color: #9b9b9b;
        float: right;
        margin-top: 14px;
    }

    .course-item .course-info h3 span img {
        width: 11px;
        height: auto;
        margin-right: 7px;
    }

    .course-item .course-info .teather-info {
        font-size: 14px;
        color: #9b9b9b;
        margin-bottom: 14px;
        padding-bottom: 14px;
        border-bottom: 1px solid #333;
        border-bottom-color: rgba(51, 51, 51, .05);
    }

    .course-item .course-info .teather-info span {
        float: right;
    }

    .course-item .section-list::after {
        content: "";
        display: block;
        clear: both;
    }

    .course-item .section-list li {
        float: left;
        width: 44%;
        font-size: 14px;
        color: #666;
        padding-left: 22px;
        /* background: url("路径") 是否平铺 x轴位置 y轴位置 */
        background: url("/src/assets/img/play-icon-gray.svg") no-repeat left 4px;
        margin-bottom: 15px;
    }

    .course-item .section-list li .section-title {
        /* 以下3句，文本内容过多，会自动隐藏，并显示省略符号 */
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
        display: inline-block;
        max-width: 200px;
    }

    .course-item .section-list li:hover {
        background-image: url("/src/assets/img/play-icon-yellow.svg");
        color: #ffc210;
    }

    .course-item .section-list li .free {
        width: 34px;
        height: 20px;
        color: #fd7b4d;
        vertical-align: super;
        margin-left: 10px;
        border: 1px solid #fd7b4d;
        border-radius: 2px;
        text-align: center;
        font-size: 13px;
        white-space: nowrap;
    }

    .course-item .section-list li:hover .free {
        color: #ffc210;
        border-color: #ffc210;
    }

    .course-item {
        position: relative;
    }

    .course-item .pay-box {
        position: absolute;
        bottom: 20px;
        width: 600px;
    }

    .course-item .pay-box::after {
        content: "";
        display: block;
        clear: both;
    }

    .course-item .pay-box .discount-type {
        padding: 6px 10px;
        font-size: 16px;
        color: #fff;
        text-align: center;
        margin-right: 8px;
        background: #fa6240;
        border: 1px solid #fa6240;
        border-radius: 10px 0 10px 0;
        float: left;
    }

    .course-item .pay-box .discount-price {
        font-size: 24px;
        color: #fa6240;
        float: left;
    }

    .course-item .pay-box .original-price {
        text-decoration: line-through;
        font-size: 14px;
        color: #9b9b9b;
        margin-left: 10px;
        float: left;
        margin-top: 10px;
    }

    .course-item .pay-box .buy-now {
        width: 120px;
        height: 38px;
        background: transparent;
        color: #fa6240;
        font-size: 16px;
        border: 1px solid #fd7b4d;
        border-radius: 3px;
        transition: all .2s ease-in-out;
        float: right;
        text-align: center;
        line-height: 38px;
        position: absolute;
        right: 0;
        bottom: 5px;
    }

    .course-item .pay-box .buy-now:hover {
        color: #fff;
        background: #ffc210;
        border: 1px solid #ffc210;
    }

    .course .course_pagination {
        margin-bottom: 60px;
        text-align: center;
    }
</style>