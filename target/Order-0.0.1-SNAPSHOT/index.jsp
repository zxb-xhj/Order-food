<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%
        pageContext.setAttribute("c", request.getContextPath());
    %>
    <script type="text/javascript" src="${c }/static/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="${c }/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
    <link href="${c }/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="${c }/img/图标.jpg" />
    <script src="${c}/static/js/vue.js"></script>
    <script src="${c}/static/element-ui/lib/index.js"></script>
    <link rel="stylesheet" href="${c}/static/element-ui/lib/theme-chalk/index.css">
    <script src="${c}/static/js/axios-0.18.0.js"></script>
<title>小伙计餐厅</title>
    <style>
        .el-table .warning-row {
            background: oldlace;
        }

        .el-table .success-row {
            background: #f0f9eb;
        }

        #guanliform{
            border: 2px solid #D0D0D0;width: 300px;height: 200px;border-radius: 25px;margin-top: 35px;
        }
        #guanliform input{
            height: 34px;margin: 8px;border-radius: 11px;border: 1px solid #D0D0D0;
        }
        #guanliform input:hover{
            border: 1px solid #33FFCC;
        }
        #guanlidenglu{
            width:100px;height:35px;margin-top:15px;
        }


    </style>
<%--<jsp:forward page="/ds/dishes"></jsp:forward>--%>

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

<div style="margin-left: 42%;float: left;" id="app">
    <div style="float: left;border-radius: 5px;margin-top: 58%;">

        <div id="gldiv">
            <div style="float:left;">
                <h3 style="text-align:center;width:300px;">用户登录</h3>
                <form id="guanliform" action="/Order/ds/dishes" method="post">
                    <div style="margin:25px;">
                        名称：<input type="text" id="name" name="name" placeholder="请输入名称" v-model="name"><br>
                        密码：<input type="password" id="pwd" name="pwd" placeholder="请输入密码" v-model="pwd"><br>
                        <input @click="userlogin()" id="guanlidenglu" type="button" value="登录" class="btn-success" style="margin-left:76px;">
                        <a href="${c}/sss">注册</a>

                    </div>
                    <a href="${c}/ds/guanli1">管理员登录</a>
                </form>
            </div>
        </div>
    </div>
    <div>

    <!-- 修改桌号 -->
    <el-dialog
            title="选择桌号"
            :visible.sync="see"
            width="30%"
            :show-close="false"
            :close-on-click-modal="false"
    >

        <el-form ref="form" :model="user" label-width="80px" >

            <table style="position: relative;left: 15px;">
                <tr>
                    <td>
                        <el-button @click="onSubmitseat1" style="margin-left: 15px;">1号桌</el-button>
                    </td>
                    <td>
                        <el-button @click="onSubmitseat2" style="margin-left: 15px;">2号桌</el-button>
                    </td>
                    <td>
                        <el-button @click="onSubmitseat3" style="margin-left: 15px;">3号桌</el-button>
                    </td>
                    <td>
                        <el-button @click="onSubmitseat4" style="margin-left: 15px;">4号桌</el-button>
                    </td>


                </tr>
                <tr>
                    <td>
                        <el-button @click="onSubmitseat5" style="margin-left: 15px;margin-top: 30px;">5号桌</el-button>
                    </td>
                    <td>
                        <el-button @click="onSubmitseat6" style="margin-left: 15px;margin-top: 30px;">6号桌</el-button>
                    </td>
                    <td>
                        <el-button @click="onSubmitseat7" style="margin-left: 15px;margin-top: 30px;">7号桌</el-button>
                    </td>
                    <td>
                        <el-button @click="onSubmitseat8" style="margin-left: 15px;margin-top: 30px;">8号桌</el-button>
                    </td>
                </tr>


            </table>


            <el-form-item style="position: relative; top:20px;left: 100px;">
                <el-button type="primary" @click.native="seat">提交</el-button>
            </el-form-item>
        </el-form>

    </el-dialog>
    </div>

</div>
<script type="application/javascript">
    new Vue({
        el:"#app",
        data(){
            return{
                name:"",
                pwd:"",
                dialogVisible:false,
                xiaohuoji:{
                _seat:''
                },
                //桌号
                see: true,
            }
        },
        methods:{
            //点击选座
            onSubmitseat1(){
                this.xiaohuoji._seat=1;
            },
            onSubmitseat2(){
                this.xiaohuoji._seat=2;
            },
            onSubmitseat3(){
                this.xiaohuoji._seat=3;
            },
            onSubmitseat4(){
                this.xiaohuoji._seat=4;
            },
            onSubmitseat5(){
                this.xiaohuoji._seat=5;
            },
            onSubmitseat6(){
                this.xiaohuoji._seat=6;
            },
            onSubmitseat7(){
                this.xiaohuoji._seat=7;
            },
            onSubmitseat8(){
                this.xiaohuoji._seat=8;
            },

            //座位
            seat(){
                // alert(this.xiaohuoji._seat)
                if (this.xiaohuoji._seat != null && this.xiaohuoji._seat != ""){
                    this.see=false
                    sessionStorage.setItem("sid",this.xiaohuoji._seat)
                    // console.log(this.xiaohuoji._seat)
                    this.$message({
                        message: '选择了 '+this.xiaohuoji._seat+' 号桌',
                        type: 'success'
                    })
                }else{
                    this.$message({
                        message: '请选择几号桌',
                        type: 'success'
                    })
                }
            },
            userlogin() {
                axios({
                    method: "get",
                    url: "http://localhost:8080/Order/userlogin?name="+this.name+"&pwd="+this.pwd+"",
                }).then(Response => {
                    // 重新查询数据
                    //设置表格数据
                    if (Response.data != ""&&Response.data !=null) {
                        //提示删除成功语句
                        this.$message({
                            message: '登录成功',
                            type: 'success'
                        })
                        sessionStorage.setItem("name",this.name);
                        sessionStorage.setItem("pwd",this.pwd);
                        sessionStorage.setItem("id",Response.data.id);
                        // alert(Response.data.id);
                        document.location.href="${c}/ds/dishes"
                    }else{
                        //提示删除失败语句
                        this.$message({
                            message: '登录失败',
                            type: 'success'
                        })
                    }
                })
            }
        }
    })
</script>
</body>
</html>