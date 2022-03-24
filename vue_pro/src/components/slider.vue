<template>
                  <div style="margin-top: 20px">
                      <el-menu :default-active="activeIndex"  @select="handleSelect">
                         <el-menu-item index="1">
                        <i class="el-icon-location"></i>
                        <span slot="title">交易大厅</span>
                    </el-menu-item>

                    <el-menu-item index="2">
                        <i class="el-icon-menu"></i>
                        <span slot="title">我要发布</span>
                    </el-menu-item>
                    <el-menu-item index="3">
                        <i class="el-icon-setting"></i>
                        <span slot="title">个人管理</span>
                    </el-menu-item>
                </el-menu>
                  </div>
</template>

<script>
    export default {
        name: "slider",
        data(){
                      return {
                activeIndex: '1',
            };
        },
        methods: {
            handleSelect(key, keyPath) {
                this.$emit('change', key)
            },
        }

    }
</script>

<style scoped>

</style>