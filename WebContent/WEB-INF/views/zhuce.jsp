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
<title>小伙计餐厅</title>
    <style>

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

    <script src="${c}/static/js/vue.js"></script>
    <script src="${c}/static/element-ui/lib/index.js"></script>
    <link rel="stylesheet" href="${c}/static/element-ui/lib/theme-chalk/index.css">
    <script src="${c}/static/js/axios-0.18.0.js"></script>
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
                <h3 style="text-align:center;width:300px;">用户注册</h3>
                <form id="guanliform" action="/Order/insertuser" method="post">
                    <div style="margin:25px;">
                        名称：<input type="text" id="name" name="name" placeholder="请输入名称" v-model="name"><br>
                        密码：<input type="password" id="pwd" name="pwd" placeholder="请输入密码" v-model="pwd"><br>
                        <input @click="userlogin()" id="guanlidenglu" type="button" value="注册" class="btn-success" style="margin-left:76px;"><a href="/Order/">返回</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="application/javascript">
    new Vue({
        el:"#app",
        data(){
            return{
                name:"",
                pwd:""
            }
        },
        methods:{
            userlogin() {
                var params = new URLSearchParams();
                params.append('name', this.name);
                params.append('pwd', this.pwd);
                if (this.pwd!=''&&this.name!=''){
                axios({
                    method: "post",
                    url: "http://localhost:8080/Order/insertuser",
                    data: params
                }).then(Response => {
                    if (Response.data != ""&&Response.data !=null) {
                        this.$message({
                            message: '注册成功',
                            type: 'success'
                        })
                        // alert(Response.data.id);
                        document.location.href="${c}/"
                    }else{
                        this.$message({
                            message: '注册失败',
                            type: 'success'
                        })
                    }
                })
                }else{
                    this.$message({
                        message: '注册失败',
                        type: 'success'
                    })
                }
            }
        }
    })
</script>
</body>
</html>