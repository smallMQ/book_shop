<template>
    <div class="el-col-24">
           <div class="el-col-8">.</div>
    <div class="el-col-8"><div style="margin-top: 30px">
        <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
            <el-form-item label="新密码" prop="pass">
                <el-input type="password" v-model="ruleForm.pass" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="确认密码" prop="checkPass">
                <el-input type="password" v-model="ruleForm.checkPass" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="用户名" prop="username">
                <el-input type="text" v-model="ruleForm.username"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="submitForm('ruleForm')">提交</el-button>
                <el-button @click="resetForm('ruleForm')">重置</el-button>
            </el-form-item>
        </el-form>

    </div></div>
    <div class="el-col-8"></div>

    </div>


</template>

<script>
    import settings from "../assets/js/settings";

    export default {
        name: "changemsg",
        data() {
            var validatePass = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入密码'));
                } else {
                    if (this.ruleForm.checkPass !== '') {
                        this.$refs.ruleForm.validateField('checkPass');
                    }
                    callback();
                }
            };
            var validatePass2 = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请再次输入密码'));
                } else if (value !== this.ruleForm.pass) {
                    callback(new Error('两次输入密码不一致!'));
                } else {
                    callback();
                }
            };
            return {
                ruleForm: {
                    pass: '',
                    checkPass: '',
                    username: ''
                },
                rules: {
                    pass: [
                        {validator: validatePass, trigger: 'blur'}
                    ],
                    checkPass: [
                        {validator: validatePass2, trigger: 'blur'}
                    ],
                }
            };
        },
        methods: {
            submitForm(formName) {
                let token = this.$cookies.get('token')
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        this.$axios(
                            {
                                method: 'post',
                                url: settings.base_url + '/user/changemsg/',
                                data: {
                                    'password': this.ruleForm.pass,
                                    'check_password': this.ruleForm.checkPass,
                                    'username': this.ruleForm.username,
                                    'user': this.$cookies.get('username')
                                },
                                headers: {Authorization: 'jwt ' + token}
                            }
                        ).then(response => {
                            if (response.data.code == 0) {
                                this.$message({
                                    message: '修改信息成功,请手动重新登录!',
                                    type: 'success'
                                });
                                this.$cookies.set('username',this.ruleForm.username,'7d')
                            }else if(response.data.code == 1){
                                this.$message({
                                    message: '修改的用户名不可以再是手机号!',
                                    type: 'error'
                                });
                            }

                            else {
                                this.$message({
                                    message: '你可能没有登录吧!',
                                    type: 'error'
                                });
                            }
                        }).catch(error => {
                            this.$message({
                                message: '恭喜你，这是一条失败消息',
                                type: 'error'
                            });
                        })

                    } else {
                        console.log('error submit!!');
                        return false;
                    }
                });


            },
            resetForm(formName) {
                this.$refs[formName].resetFields();
            },

        }
    }
</script>

<style scoped>

</style>