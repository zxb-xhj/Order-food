<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>小伙计餐厅</title>
    <%
        pageContext.setAttribute("c", request.getContextPath());
    %>
<%--    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>--%>
<%--    <script src="https://unpkg.com/element-ui/lib/index.js"></script>--%>

    <script src="${c}/static/js/vue.js"></script>
    <script src="${c}/static/element-ui/lib/index.js"></script>
    <link rel="stylesheet" href="${c}/static/element-ui/lib/theme-chalk/index.css">
    <script src="${c}/static/js/axios-0.18.0.js"></script>


    <style>
        #guanliform1 {
            border: 2px solid #D0D0D0;
            width: 430%;
            height: 565px;
            border-radius: 25px;
            margin-top: 130px;
        }

        #guanlidenglu1 {
            width: 100px;
            height: 35px;
            margin-top: 15px;
        }

        #guanliform input1 {
            height: 34px;
            margin: 8px;
            border-radius: 11px;
            border: 1px solid #D0D0D0;
        }


        #guanliform {
            border: 2px solid #D0D0D0;
            width: 300px;
            height: 565px;
            border-radius: 25px;
            margin-top: 35px;
        }

        #guanliform input {
            height: 34px;
            margin: 8px;
            border-radius: 11px;
            border: 1px solid #D0D0D0;
        }

        #guanliform input:hover {
            border: 1px solid #33FFCC;
        }

        #guanlidenglu {
            width: 100px;
            height: 35px;
            margin-top: 15px;
        }


        .addBg {
            margin-left: 6%;
            margin-top: 2%;
            width: 100px;
            height: 100px;
            background-color: #ebebeb;
            border-radius: 100px;
            -webkit-border-radius: 100px;
            position: absolute;
        }

        <!--
        VUE

        -->


    </style>
</head>
<body>
<div style="height: 70px;position:fixed;background-color:#9BCD9B;width: 100%;">
    <div style="float: left;margin-top: 10px;margin-left: 90px;margin-right: 30px;">
        <img style="border-radius: 50%;width: 50px;height: 50px;" alt="" src="/Order/img/图标.jpg">
    </div>
    <div style="font-size: 35px;margin-top: 10px;">小 伙 计 餐 厅 欢 迎 您</div>
</div>
<div style="position:fixed;margin-top: 70px;width: 100%;background-color:#C0C0C0;height: 50px;">


</div>
<div id="app">
<div style="margin-left: 1%;float: left;">
    <div style="border-radius: 5px;margin-top: 19%;height: 500px">
        <div>
            <div>
                <div> <el-avatar> user </el-avatar> </div>
                <form id="guanliform" action="${c}/gl/userlogin" method="post">
                    <div class="addBg scaleAm">
                        <h1 style="margin-left: 40px;margin-top: 30px;">{{user.name.charAt(0)}}</h1>
                    </div>
                    <div style="margin:25px;margin-top: 160px;">
                        <h2>id：{{user.id}}</h2>
                        <h2>用户名：{{user.name}}</h2>
                        <h2>余额：{{user.balance}}</h2>

                        <el-row>
                            <el-button type="primary" plain @click="dialogVisible = true">修改密码</el-button>
                        </el-row>
                            <a href="${c}/ds/dishes">返回</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <el-dialog
            title="修改密码"
            :visible.sync="dialogVisible"
            width="30%"
    >

        <el-form ref="form" :model="user" label-width="80px">

            <el-form-item label="旧密码">
                <el-input type="password" v-model="userpwd"></el-input>

            </el-form-item>

            <el-form-item label="新密码">
                <el-input type="password" v-model="pwd"></el-input>
            </el-form-item>

            <el-form-item label="确认密码">
                <el-input type="password" v-model="pwd1"></el-input>
            </el-form-item>


            <el-form-item>
                <el-button type="primary" @click.native ="xiigaimima">提交</el-button>
                <el-button @click="dialogVisible = false">取消</el-button>
            </el-form-item>
        </el-form>
    </el-dialog>
</div>

<div style="margin-left: 1%;float: left;">
    <div style="border-radius: 5px;margin-top: 25%;height: 500px;width: 274px">
        <div>
            <form id="guanliform1" action="${c}/gl/userlogin" method="post">
                <h1 style="text-align:center;">充值界面</h1>
                <div style="margin:25px;margin-top: 40px;" style="background:#f3f3f3">
                    <table align="center">
                        <tr>
                            <tdwidth>
                                <h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;余额:{{user.balance}}</h1><br><br><br>
                            </tdwidth>
                        </tr>
                        <tr valign="top">
                            <td width="20%">
                                <el-row>
                                    <el-button  style="width: 150px;height: 80px"  @click="onSubmit1">10元</el-button>
                                </el-row>
                            </td>
                            <td width="20%">
                                <el-row>
                                    <el-button @click="onSubmit2" style="width: 150px;height: 80px">20元</el-button>
                                </el-row>
                            </td>
                            <td width="20%">
                                <el-row>
                                    <el-button @click="onSubmit3" style="width: 150px;height: 80px">50元</el-button>
                                </el-row>
                            </td>

                            <td width="20%">
                                <el-row>
                                    <el-button @click="onSubmit4" style="width: 150px;height: 80px">100元</el-button>
                                </el-row>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <el-row>
                                    <el-button @click="onSubmit5" style="width: 150px;height: 80px" t>200元</el-button>
                                </el-row>
                            </td>
                            <td width="20%">
                                <el-button @click="onSubmit6" style=" width: 150px;height: 80px">500元</el-button>
                            </td>
                            <td width="20%">
                                <el-button @click="onSubmit7" style="width: 150px;height: 80px">1000元</el-button>
                            </td>
                            <td width="20%">
                                <el-button @click="onSubmit8" style="width: 150px;height: 80px">2000元</el-button>
                            </td>
                        </tr>
                    </table>


                    <br><br>
                    <el-form :model="numberValidateForm" ref="numberValidateForm" label-width="100px"
                             class="demo-ruleForm">
                        <el-form-item
                                label="充值金额"
                                prop="age"
                                :rules="[
      { required: true, message: '金额最少充值5元'},
      { type: 'number', message: '金额必须为数字值'}
    ]"
                        >
                            <el-input v-model.number="numberValidateForm.age" autocomplete="off"></el-input>
                        </el-form-item>
                        <el-form-item>
                            <el-button @click="submitForm('numberValidateForm')">提交</el-button>
                            <el-button @click="resetForm('numberValidateForm')">重置</el-button>
                        </el-form-item>
                    </el-form>

                </div>
            </form>
        </div>
    </div>
</div>
</div>

<!-- VUE -->

<script src="js/vue.js"></script>
<script src="element-ui/lib/index.js"></script>
<link rel="stylesheet" href="element-ui/lib/theme-chalk/index.css">
<script src="js/axios-0.18.0.js"></script>
<script type="text/javascript"></script>

<script>
    new Vue({
        el: "#app",
        data() {
            return {
                usernam1: "123",
                numberValidateForm: {
                    age: ''
                },
                user:{ },
                dialogVisible:false,
                pwd:null,
                pwd1:null,
                userpwd:null,
                pwdname:null
            }
        },
        methods: {

            //充值金钱方法
            // 查询方法
            onSubmit1() {
                this.numberValidateForm.age=10;
            },
            onSubmit2() {
                this.numberValidateForm.age=20;
            },
            onSubmit3() {
                this.numberValidateForm.age=50;
            },
            onSubmit4() {
                this.numberValidateForm.age=100;
            },
            onSubmit5() {
                this.numberValidateForm.age=200;
            },
            onSubmit6() {
                this.numberValidateForm.age=500;
            },
            onSubmit7() {
                this.numberValidateForm.age=1000;
            },
            onSubmit8() {
                this.numberValidateForm.age=2000;
            },
            // 修改数据
            xiigaimima() {
                if (this.pwd == this.pwd1){

                var params = new URLSearchParams();
                params.append('id', sessionStorage.getItem("id"));
                params.append('userpwd', this.userpwd);
                params.append('pwd', this.pwd);
                //发送ajax请求，添加数据
                axios({
                    method: "post",
                    url: "http://localhost:8080/Order/xiugaimima",
                    data:params
                }).then(Response => {
                    console.log(Response.data);
                    if (Response.data == "success") {
                        //添加成功
                        //关闭窗口
                        this.dialogVisible = false;
                        //提示删除成功语句
                        this.$message({
                            message: '恭喜你，修改成功',
                            type: 'success'
                        });
                    }else{
                        this.$message({
                            message: '修改失败',
                            type: 'shibai'
                        });
                    }
                })
                }else{
                    this.$message({
                        message: '两次密码不一样',
                        type: 'shibai'
                    });
                }
            },


            //充值功能
            submitForm(formName) {
                axios({
                    method: "get",
                    url: "http://localhost:8080/Order/updatebalance?balance="+this.numberValidateForm.age+"&id="+this.user.id+"",
                }).then(Response => {
                    // 重新查询数据
                    //设置表格数据
                    if (Response.data == "success") {
                        //添加成功

                        this.selectbalance();
                        //提示删除成功语句
                        this.$message({
                            message: '恭喜你，添加成功',
                            type: 'success'
                        })
                }
                })
            },
                /*this.$refs[formName].validate((valid) => {
                    if (valid) {
                        alert('充值成功!' + this.numberValidateForm.age);
                    } else {
                        console.log('error submit!!');
                        return false;
                    }
                });*/

            resetForm(formName) {
                this.$refs[formName].resetFields();
            },
           //查看数据余额
            selectbalance() {
                var id = sessionStorage.getItem("id");
                //当页面加载完成后，发送异步请求，获取数据
                axios({
                    method: "get",
                    url: "http://localhost:8080/Order/selectuserid/"+id+"",
                }).then(Response => {
                    //设置表格数据
                    this.user = Response.data;
                    console.log(this.user);
                })
            },

        },
        mounted() {
            this.selectbalance();
        }
    })
</script>


</body>
</html>
<script>
    import LabelWrap from "./element-ui/packages/form/src/label-wrap";

    export default {
        components: {LabelWrap}
    }
</script>
<script>
    import LabelWrap from "./element-ui/packages/form/src/label-wrap";

    export default {
        components: {LabelWrap}
    }
</script>
<script>
    import Table from "./element-ui/lib/table";

    export default {
        components: {Table}
    }
</script>