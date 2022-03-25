<template>
    <div class="header">
        <div class="slogan">
            <p>MQ,王贺,啊峥的书店!</p>
        </div>
        <div class="nav">
            <ul class="left-part">
                <li class="logo">
                    <router-link to="/">
                        <img src="../assets/img/logo.jpg" alt="" style="height: 40px;width: 100px;">
                    </router-link>
                </li>

            </ul>
        <form class="search">
            <div class="tips" v-if="is_search_tip">
                <span @click="search_action('活着')">活着</span>
                <span @click="search_action('刘慈欣')">刘慈欣</span>
            </div>
            <input
                    type="text"
                    :placeholder="search_placeholder"
                    @focus="on_search"
                    @blur="off_search"
                    v-model="search_word"
            />
            <button
                    type="button"
                    class="glyphicon glyphicon-search"
                    @click="search_action(search_word)"
            ></button>
        </form>


            <div class="right-part">
                <div v-if="!username">

                    <span @click="Login">登录</span>
                    <span class="line">|</span>
                    <span @click="Register">注册</span>
                    <login @close="if_login_close" @go="go_RR" @reload="re_load" v-if="if_login"></login>
                    <register @close="if_register_close" @go="go_LL" @reload="re_load" v-if="if_register"></register>
                </div>
                <div v-else-if="is_superuser == 'true'">

                    <span>{{username}}</span>
                    <span class="line">|</span>
                    <span @click="logout">注销</span>
                     <span class="line">|</span>
                                        <router-link to="/Oldbook" :underline="false">个人中心</router-link>
                    <span class="line">|</span>

                    <span><el-link :underline="false" href="http://127.0.0.1:8000/admin" target="_blank" >后台管理</el-link></span>
                </div>
                <div v-else>
                    <span>{{username}}</span>
                    <span class="line">|</span>
                    <span @click="logout">注销</span>
                                        <span class="line">|</span>

                                        <router-link to="/Oldbook" :underline="false">个人中心</router-link>


                </div>
            </div>
        </div>


    </div>

</template>

<script>
    import login from "./login";
    // import register from "./register";
    import Register from "./register";

    export default {
        name: "Header",
        data() {
            return {
                url_path: sessionStorage.url_path || '/',
                if_login: false,
                if_register: false,
                username: '',
                is_superuser:'',
                token: '',
                is_search_tip: true,
                search_placeholder: '',
                search_word: '',
                filter: {
                    page_size: 10,
                    page: 1,
                    search: '',
                }
            }
        },

        methods: {
            goPage(url_path) {
                // 已经是当前路由就没有必要重新跳转
                if (this.url_path !== url_path) {
                    this.$router.push(url_path);
                }
                sessionStorage.url_path = url_path;
            },
            Login() {
                this.if_login = true;
            },
            Register() {
                this.if_register = true;
            },
            go_LL() {
                this.if_login = true;
                this.if_register = false;
            },
            go_RR() {
                this.if_login = false;
                this.if_register = true;
            },
            if_login_close() {
                this.if_login = false;

            },
            if_register_close() {
                this.if_register = false;
            },
            logout() {
                this.$cookies.remove('username');
                this.$cookies.remove('token');
                this.$cookies.remove('is_superuser');
                this.username = '';
                this.token = '';
            },
            // 登陆成功
            re_load() {
                // this.window.reload();
                this.username = this.$cookies.get('username');
                this.is_superuser = this.$cookies.get('is_superuser');
                console.log(this.is_superuser)
            },
            search_action(search_word) {
                if (!search_word) {
                    this.$message('请输入要搜索的内容');
                    return
                }
                else{
                    this.$emit('search_book', search_word)
                }



                this.search_word = '';
            },
            on_search() {
                this.search_placeholder = '请输入想搜索的课程';
                this.is_search_tip = false;
            },
            off_search() {
                this.search_placeholder = '';
                this.is_search_tip = true;
            },
        },
        created() {

            sessionStorage.url_path = this.$route.path;
            this.url_path = this.$route.path;
            this.username = this.$cookies.get('username');
            this.token = this.$cookies.get('token');
            this.is_superuser = this.$cookies.get('is_superuser');

        },
        components: {
            Register,
            login,
        }

    }

</script>
<style scoped>
    .header {
        background-color: white;
        box-shadow: 0 0 5px 0 #aaa;
    }

    .header:after {
        content: "";
        display: block;
        clear: both;
    }

    .slogan {
        background-color: #eee;
        height: 40px;
    }

    .slogan p {
        width: 1200px;
        margin: 0 auto;
        color: #aaa;
        font-size: 13px;
        line-height: 40px;
    }

    .nav {
        background-color: white;
        user-select: none;
        width: 1200px;
        margin: 0 auto;

    }

    .nav ul {
        padding: 15px 0;
        float: left;
    }

    .nav ul:after {
        clear: both;
        content: '';
        display: block;
    }

    .nav ul li {
        float: left;
    }

    .logo {
        margin-right: 20px;
    }

    .ele {
        margin: 0 20px;
    }

    .ele span {
        display: block;
        font: 15px/36px '微软雅黑';
        border-bottom: 2px solid transparent;
        cursor: pointer;
    }

    .ele span:hover {
        border-bottom-color: orange;
    }

    .ele span.active {
        color: orange;
        border-bottom-color: orange;
    }

    .right-part {
        float: right;
    }

    .right-part .line {
        margin: 0 10px;
    }

    .right-part span {
        line-height: 68px;
        cursor: pointer;
    }

    .search {
        float: right;
        position: relative;
        margin-top: 22px;
        margin-right: 10px;
    }

    .search input, .search button {
        border: none;
        outline: none;
        background-color: white;
    }

    .search input {
        border-bottom: 1px solid #eeeeee;
    }

    .search input:focus {
        border-bottom-color: orange;
    }

    .search input:focus + button {
        color: orange;
    }

    .search .tips {
        position: absolute;
        bottom: 3px;
        left: 0;
    }

    .search .tips span {
        border-radius: 11px;
        background-color: #eee;
        line-height: 22px;
        display: inline-block;
        padding: 0 7px;
        margin-right: 3px;
        cursor: pointer;
        color: #aaa;
        font-size: 14px;

    }

    .search .tips span:hover {
        color: orange;
    }

</style>

