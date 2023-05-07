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
    <script type="text/javascript" src="${c }/static/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="${c }/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
    <link href="${c }/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${c}/static/js/vue.js"></script>
    <script src="${c}/static/element-ui/lib/index.js"></script>
    <link rel="stylesheet" href="${c}/static/element-ui/lib/theme-chalk/index.css">
    <script src="${c}/static/js/axios-0.18.0.js"></script>
    <link rel="shortcut icon" href="${c }/img/图标.jpg" />
    <style>
        .el-table .warning-row {
            background: oldlace;
        }

        .el-table .success-row {
            background: #f0f9eb;
        }
         #ul{
             list-style-type: none;
             margin: 0;
             padding: 0;
             width: 200px;
             margin-top: 8%;
         }
        #ul li{
            height: 40px;
            background-color: #f1f1f1;
            border-radius:15px;
        }
        #ul li a {
            display: block;
            color: #000;
            padding: 8px 16px;
            text-decoration: none;
            margin: 2px;
        }
        .spanli {
            display: block;
            color: #000;
            padding: 8px 16px;
            text-decoration: none;
            margin: 2px;
            background-color: #f1f1f1;
            border-radius:15px;
        }

        /* 鼠标移动到选项上修改背景颜色 */

        h2{
            margin-bottom: 35px;
        }
        #h3{
            margin-bottom: 35px;
            text-align: center;
        }
        .dj{
            margin-left: 20px;
            margin-bottom: 35px;
        }
        #img{
            margin-left: 35px;
            border-radius: 8px;
        }
        #bs{
            border-radius:10px;
        }
        select {
            border: none;
            border-radius: 4px;
            background-color: #f1f1f1;
        }
        .th{
            width: 500px;
        }
        #tdiv{
            width: 1120px;height:520px;overflow: auto;margin-top: 10px;
        }
        #tdiv1{
            width: 180px;height:430px;overflow: auto;margin-top: 10px;
        }
        #sc{
            background-color: #DC143C;
        }
        #sc:hover{
            background-color: #A52A2A;
        }
        #butjia{
            height: 31px;
        }
        #butjian{
            height: 31px;
        }
        #butjia1{
            height: 31px;
        }
        #butjian1{
            height: 31px;
        }
        b{
            font-size: 16px;
        }
        .divjs{
            float: left;position:fixed;margin-top: 150px;margin-left: 1350px;width: 175px;height:600px;background-color: #f2f2f2;border-radius:25px;
        }
        #dnameid{
            width: 160px;
        }
        #priceid{
            width: 90px;
        }
        .dnameid{
            width: 160px;
        }
        .priceid{
            width: 90px;
        }
        #vt{
            height:125px;
        }
        .in1{
            width: 95px;border:1px solid #F5F5F5;background-color:#f1f1f1;
        }
        .btn-warning{
            border-radius:10px;
        }
        .btn-danger{
            border-radius:10px;
        }
        .btn-primary{
            border-radius:10px;
        }
        .btn-success{
            border-radius:10px;
        }
        .btn-info{
            border-radius:10px;
        }
    </style>

</head>
<body>

    <!--搜索表单-->

    <div id="app">
        <div style="height: 70px;position:fixed;background-color:#9BCD9B;width: 100%;">
            <div style="float: left;margin-top: 10px;margin-left: 90px;margin-right: 30px;">
                <img style="border-radius: 50%;width: 50px;height: 50px;" alt="" src="${c }/img/图标.jpg">
            </div>
            <div style="font-size: 35px;margin-top: 10px;">小 伙 计 餐 厅 欢 迎 您</div>
        </div>
        <div style="position:fixed;margin-top: 70px;width: 1535px;background-color:#C0C0C0;height: 50px;">
            <div style="float: left;margin-top: 13px;margin-left: 20px;width: 200px;">
                <button class="btn-info" onclick="ding()">订单详情</button><button class="btn-primary" style="height: 30px;margin-left: 10px;" onclick="index1()">
                <span class="glyphicon glyphicon-user"></span> 用户信息</button>
            </div>
            <div class="btn-group" style="float: right;margin-top: 8px;margin-right: 40px;">


                <button type="button" class="btn btn-primary"  onclick="guanlilogin()"><span class="glyphicon glyphicon-user"></span>
                    {{adminname}}</button>
                <button type="button" class="btn btn-primary dropdown-toggle"
                        data-toggle="dropdown">
                    <span class="caret" style="height: 20px;"></span>
                    <span class="sr-only">切换下拉菜单</span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="${c }/ds/guanli">切换账号</a></li>
                    <li><a href="${c }/ds/dishes" @click="gltuichu()">退出登录</a></li>
                </ul>
            </div>
<%--            <a id="gwc" class="btn btn-primary" style="margin-top: 8px" onclick="aa()">--%>
<%--                购物车 <span class="glyphicon glyphicon-shopping-cart"></span>--%>
<%--            </a>--%>
            <div  class="navbar-form navbar-left" style="margin-left: 45%;">

<%--                <div class="form-group navbar-left">--%>
<%--                    <input id="ssk" type="text" class="form-control" placeholder="请输入食物名" name="name">--%>
<%--                </div>--%>
<%--                <button onclick="suos()" type="submit" class="btn btn-default">搜索</button>--%>
            </div>

        </div>
    <!--按钮-->
    <div style="float: left;margin-top: 130px;width: 100%;">
    <el-row>

        <el-button type="danger" @click="fanhui()">返回</el-button>
<%--        <el-button type="primary" plain @click="dialogVisible = true">新增</el-button>--%>
<%----%>
    </el-row>
    <!--添加数据对话框表单-->
    <el-dialog
            title="编辑用户信息"
            :visible.sync="dialogVisible"
            width="30%"
    >

        <el-form ref="form" :model="user" label-width="80px">
            <el-form-item label="id">
                {{user.id}}
            </el-form-item>

            <el-form-item label="名称">
                <el-input v-model="user.name"></el-input>
            </el-form-item>

            <el-form-item label="密码">
                <el-input v-model="user.pwd"></el-input>
            </el-form-item>

            <el-form-item label="余额">
                <el-input v-model="user.balance"></el-input>
            </el-form-item>


            <el-form-item>
                <el-button type="primary" @click.native ="updateUser">提交</el-button>
                <el-button @click="dialogVisible = false">取消</el-button>
            </el-form-item>
        </el-form>
    </el-dialog>


    <!--表格-->
    <template>
        <el-table
                :data="tableData"
                style="width: 100%"
                :row-class-name="tableRowClassName"
                @selection-change="handleSelectionChange"
        >

            <el-table-column
                    type="index"
                    width="70"
                    align="right">
            </el-table-column>
            <el-table-column
                    prop="id"
                    label="id"
                    align="center"
            >
            </el-table-column>
            <el-table-column
                    prop="name"
                    label="名称"
                    align="center"
            >
            </el-table-column>
            <el-table-column
                    prop=""
                    align="center"
                    label="密码"
            >******
            </el-table-column>
            <el-table-column
                    prop="balance"
                    align="center"
                    label="余额">
            </el-table-column>
            <el-table-column
                    align="center"
                    label="操作">

                <template slot-scope="scope">
                <el-row>
                    <el-button type="primary" @click.native="handleEdit(scope.$index, scope.row)">修改</el-button>
                    <el-button type="danger" @click.native="handleDelete(scope.$index,scope.row)">删除</el-button>
                </el-row>

                </template>
            </el-table-column>

        </el-table>
    </template>

    </div>

</div>


<%--<script src="js/vue.js"></script>--%>
<%--<script src="element-ui/lib/index.js"></script>--%>
<%--<link rel="stylesheet" href="element-ui/lib/theme-chalk/index.css">--%>

<%--<script src="js/axios-0.18.0.js"></script>--%>
<script>
    new Vue({
        el: "#app",

        mounted() {

            //当页面加载完成后，发送异步请求，获取数据
            this.selectAll();

        },

        methods: {
            fanhui(){
                document.location.href="${c}/gl/login"
            },
            gltuichu(){
                this.$message({
                    message: '退出成功',
                    type: 'success'
                });
            },

            //删除用户功能
            handleDelete(index,row){
                let that = this;
                let id=row.id;
                var params = new URLSearchParams();
                params.append('id', row.id);
                //    发起删除请求，传递id 弹出一个对话框
                this.$confirm('此操作将永久删除该数据, 是否继续?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    //发送ajax请求，添加数据
                    axios({
                        method: "post",
                        url: "http://localhost:8080/Order/gl/deleteByIds",
                        data: params
                    }).then(Response => {
                        console.log()
                        if (Response.data == "success") {
                            //删除成功
                            // 重新查询数据
                            this.selectAll();
                            alert(_this.selectedIds);
                            //提示删除成功语句
                            this.$message({
                                message: '恭喜你，删除成功',
                                type: 'success'
                            });
                        }else{
                            this.$message({
                                message: '删除失败',
                                type: '失败'
                            });
                        }
                    })
                }).catch(() => {
                    //用户点击了取消按钮
                    this.$message({
                        type: 'info',
                        message: '已取消删除'
                    });
                });
            },

            //查询分页数据
            selectAll() {
                //当页面加载完成后，发送异步请求，获取数据
                axios({
                    method: "get",
                    url: "http://localhost:8080/Order/gl/adminSelectAllServlet",

                }).then(Response => {

                    //设置表格数据
                    this.tableData = Response.data;
                })
            },

            //查询需要修改的用户
            handleEdit(index, row) {
                //index是序号  row是数组
                this.dialogVisible =true;
                this.user={
                    id:row.id,
                    name:row.name,
                    pwd:row.pwd,
                    balance: row.balance
                };
            },



            //修改个人信息

            tableRowClassName({row, rowIndex}) {
                if (rowIndex === 1) {
                    return 'warning-row';
                } else if (rowIndex === 3) {
                    return 'success-row';
                }
                return '';
            },
            // 复选框选中后执行的方法
            handleSelectionChange(val) {
                this.multipleSelection = val;

                console.log(this.multipleSelection)
            },
            // 查询方法
            onSubmit() {
                this.selectAll();
            },
            // 修改数据
            updateUser() {
                var params = new URLSearchParams();
                params.append('name', this.name);
                params.append('pwd', this.pwd);
                let _this=this;
                console.log(this.user)
                //发送ajax请求，添加数据
                axios({
                    method: "post",
                    url: "http://localhost:8080/Order/gl/adminUpdateServlet",
                    data:_this.user
                }).then(Response => {
                    console.log(Response.data);
                    if (Response.data == "success") {
                        //添加成功
                        //关闭窗口
                        _this.dialogVisible = false;
                        // 重新查询数据
                        _this.selectAll();
                        //提示删除成功语句
                        _this.$message({
                            message: '恭喜你，修改成功',
                            type: 'success'
                        });
                    }else{
                        _this.$message({
                            message: '修改失败',
                            type: 'shibai'
                        });
                    }
                })
            },

            //分页
            handleSizeChange(val) {
                //重新设置每页显示的条数
                this.pageSize = val;
                this.selectAll();

                //console.log(`每页 ${val} 条`);
            },
            handleCurrentChange(val) {
                //重新设置当前页码
                this.currentPage = val;
                this.selectAll();
            },
            //删除多个选项
            deleteByIds(){
                //删除弹窗
                this.$confirm('此操作将永久删除该文件, 是否继续?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    //用户点击确认按钮
                    //1.创建数组 this.multipleSelection
                    for (let i = 0; i < this.multipleSelection.length; i++) {
                        let selectionElement = this.multipleSelection[i];
                        this.selectedIds[i] = selectionElement.id;
                    }

                    //2.发送Ajax请求
                    let _this = this;
                    //发送ajax请求，添加数据
                    axios({
                        method: "post",
                        url: "http://localhost:8080/Order/gl/deleteByIds",
                        data: _this.selectedIds
                    }).then(Response => {
                        console.log()
                        if (Response.data == "success") {
                            //删除成功
                            // 重新查询数据
                            _this.selectAll();
                            alert(_this.selectedIds);
                            //提示删除成功语句
                            _this.$message({
                                message: '恭喜你，删除成功',
                                type: 'success'
                            });
                        }else{
                            _this.$message({
                                message: '删除失败',
                                type: '失败'
                            });
                        }
                    })
                }).catch(() => {
                    //用户点击了取消按钮
                    this.$message({
                        type: 'info',
                        message: '已取消删除'
                    });
                });



                //console.log(this.multipleSelection);
            },
            index1(){
                document.location.href="${c}/gl/t3";
            }

        },



        data() {
            return {
                //每页显示的条数
                pageSize:5,

                //总记录数
                totalCount:100,
                // 当前页码
                currentPage: 1,
                // 添加数据对话框是否展示的标记
                dialogVisible: false,

                // 品牌模型数据
                user: {
                    id: '',
                    name: '',
                    pwd: '',
                    balance: ""
                },
                adminname:sessionStorage.getItem("adminname"),

                //被选中得id数组
                selectedIds:[],


                // 复选框选中数据集合
                multipleSelection: [],
                // 表格数据
                tableData: []
            }
        }
    })
    //订单
    function ding() {
        document.location.href="${c}/gl/gldindan"
    };

</script>

</body>
</html>