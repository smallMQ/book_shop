<template>
    <div style="float: left;margin-top: 30px;">
        <el-form ref="form" :model="form" label-width="80px" style="float:left;text-align: left;align-items: left">
  <el-form-item label="书名">
    <el-input v-model="form.name"></el-input>
  </el-form-item>
            <el-form-item label="数量" >
    <el-input type="text" v-model="form.num" disabled="disabled"></el-input>
  </el-form-item>
  <el-form-item label="价格">
    <el-input v-model="form.price"></el-input>
  </el-form-item>

    <el-form-item label="图片?">
    <el-switch v-model="form.delivery"></el-switch>
  </el-form-item >
  <el-form-item label="上传图片"  v-if="form.delivery">
      <h3>功能不会写,用默认的!</h3>
  </el-form-item>
  <el-form-item>
    <el-button type="primary" @click="onSubmit">立即发布</el-button>
  </el-form-item>
</el-form>
    </div>
</template>

<script>
  import settings from "../assets/js/settings";
    export default {
        name: "sellbook",
         data() {
      return {
        form: {
          price:0,
          name: '',
          delivery: false,
          num: 1,
            category:6,
          // imageUrl: ''
        }
      }
    },
    methods: {
      onSubmit() {
        this.$axios.post(settings.base_url + '/book/book/',  {
          "name": this.form.name,
          // "simple_introduce": this.form.desc,
          "author":this.$cookies.get('username'),
          "price": this.form.price,
            "number":this.form.num,
            "category": this.form.category
          // "image": this.form.imageUrl
        }).then(response => {
          console.log('ok');
          this.$message({
            message: '恭喜你，增加成功',
            type: 'success'
          });
        }).catch(er=>{
                this.$message({
            message: '抱歉,失败了呢!',
            type: 'error'
          });
        })
      },
      }

    }
</script>

<style scoped>
.avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
  }
  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 178px;
    height: 178px;
    line-height: 178px;
    text-align: center;
  }
  .avatar {
    width: 178px;
    height: 178px;
    display: block;
  }
</style>