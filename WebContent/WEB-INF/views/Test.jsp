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
        #ul{
            list-style-type: none;
            margin: 0;
            padding: 0;
            width: 200px;
            margin-top: 8%;
        }

        #ul li a {
            display: block;
            color: #000;
            padding: 8px 16px;
            text-decoration: none;
            margin: 2px;
            background-color: #f1f1f1;
            border-radius:15px;
        }

        /* 鼠标移动到选项上修改背景颜色 */
        #ul li a:hover {
            background-color: #A8A8A8;
            color: white;
        }
        h2{
            margin-bottom: 35px;
        }
        #h3{
            margin-bottom: 35px;
            text-align: center;
        }
        #dj{
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
        #guanliform{
            border: 2px solid #D0D0D0;width: 300px;height: 200px;border-radius: 25px;margin-top: 35px;
        }
        #guanliform input{
            height: 34px;margin: 8px;border-radius: 11px;border: 2px solid #D0D0D0;
        }
        #guanlidenglu{
            width:100px;height:35px;margin-top:15px;
        }
        #tbgw1{
            margin-left: 90px;background-color:#E0FFFF;width: 980px;height: 60px;border-radius:25px;
        }
        .btn-info{
            border-radius:10px;
        }
        .btn-primary{
            border-radius:10px;
        }
        #zhifu{
            position:fixed;background-color: rgba(0,0,0,0.5);z-index:200;width: 2000px;height: 1200px;
        }
        #jiazai{
            position:fixed;
            margin-top: 120px;
            margin-left: 92px;
            width: 40px;
            height: 40px;
        }
        .erweima{
            position:fixed;background-color: rgba(0,0,0,0.4);z-index:200;width: 200px;height: 200px;margin-left: 500px;margin-top: 500px;;
        }


    </style>
</head>
<body>
<div id="t1">
    <div>
        <div id="zhifu" style="display: none;">
            <div style="position:fixed;margin-left: 640px;margin-top: 200px;">
                <div>

                    <img id="jiazai" alt="" src="${c }/img/加载.gif" style="display: none;">
                </div>
                <%--		<div id="yuan" style="position:fixed;width: 222px;margin-top: 205px;">--%>

                <%--		</div>--%>
                <br>
                <div class="tanchu" style="background-color: #f9f9f9;height: 240px;width: 330px;">
                    <div>
                        <input v-model="pwd1" type="password" class="form-control" style="margin-top: 10px;margin-left: 10px;position: relative;top: 50px;left: 20px;width: 230px;" placeholder="请输入密码">
                    </div>
                    <div style="margin-top: 100px;">
                        <button class="btn btn-default" style="margin-left: 60px;margin-right: 60px;border-radius:10px;" onclick="wei()">
                            取 消</button>
                        <button class="btn btn-primary" style="border-radius:10px;" @click="tijiao()">提 交</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
<div style="height: 70px;position:fixed;background-color:#9BCD9B;width: 100%;">
    <div style="float: left;margin-top: 10px;margin-left: 90px;margin-right: 30px;">
        <img style="border-radius: 50%;width: 50px;height: 50px;" alt="" src="${c }/img/图标.jpg">
    </div>
    <div style="font-size: 35px;margin-top: 10px;">小 伙 计 餐 厅 欢 迎 您</div>
</div>
<div id="t1" style="position:fixed;margin-top: 70px;width: 1535px;background-color:#C0C0C0;">
    <div style="float: left;margin-top: 13px;margin-left: 20px;width: 250px;">
        <button class="btn-info" onclick="ding()">订单详情</button><button class="btn-primary" style="height: 30px;margin-left: 10px;" onclick="index1()">
        <span class="glyphicon glyphicon-user"></span> {{name}}</button>
        <button type="button" class="btn btn-primary" @click="tuichu()">
        <span>退出登录</span>
        </button>
    </div>
    <div class="btn-group" style="float: right;margin-top: 8px;margin-right: 40px;">


        <button type="button" class="btn btn-primary"  onclick="guanlilogin()">
            <span class="glyphicon glyphicon-user"></span> 管理员登录</button>
        <button type="button" class="btn btn-primary dropdown-toggle"
                data-toggle="dropdown">
            <span class="caret" style="height: 20px;"></span>
            <span class="sr-only">切换下拉菜单</span>
        </button>

    </div>
    <a id="gwc" class="btn btn-primary" style="margin-top: 8px" onclick="aa()">
        购物车 <span class="glyphicon glyphicon-shopping-cart"></span>
    </a>
    <div  class="navbar-form navbar-left" style="margin-left: 42%;">

        <div class="form-group navbar-left">
            <input id="ssk" type="text" class="form-control" placeholder="请输入食物名" name="name">
        </div>
        <button onclick="suos()" type="submit" class="btn btn-default">搜索</button>
    </div>

</div>

<div style="height: 600px;float: left;border:2px solid #a1a1a1;padding:10px 20px; background:#dddddd;width:250px;margin-left:5px;
	border-radius:25px;position:fixed;margin-top: 143px">
    <ul id="ul">
        <li><a onclick="azy()">全部</a></li>
        <c:forEach items="${Varieties }" var="v">
            <li><a id="${v.id }" onclick="aaa(this)" na="${v.id }">${v.name }</a></li>
        </c:forEach>

    </ul>
    <div><img style="width: 200px;height: 200px;margin-top: 100px;" alt="" src="${c }/img/log.png"></div>
</div>
<div style="margin-left: 250px;float: left;">
    <div style="float: left;border-radius: 5px;margin-top: 145px;">
        <div id="gldiv"></div>
        <div  id="tbgw">
            <table id="tbgw1" style="margin-left: 90px;background-color:#E0FFFF;width: 980px;height: 60px;border-radius:25px;"><tbody><tr><th style="text-align:center;"><h3>订单详情</h3></th></tr></tbody></table>
        </div>
        <div id="tdiv">
            <table  class=" table table-hover " style="width: 1000px;margin-left: 7%;background-color: #f2f2f2;padding: 20px;border-radius:25px;" id="th1">
                <thead class="th">

                <c:forEach items="${test}" var="i">
                    <tr><th>
                        <div style="float: left;margin-top: 30px;height: 80px;">
                        <span style="float: left;margin-top: 10px;margin-right: 20px;">
                            <p style="border-radius: 100px;background: #8AC007;padding: 1px; width: 30px;height: 30px;text-align: center;padding-top:5px;">
                                <span style="margin: 10px;color: #f9f9f9;height: 20px;">${i.value[0].id}</span>
                            </p>
                        </span>
                            <c:forEach items="${i.value}" var='o'>
                    <span style="width: 285px;float: left;">
                        <p class="col-md-1" style="border-radius: 100px;background: #8AC007;padding: 1px; width: 10px;height: 10px; ">

                            </p>
                        <p class="col-md-2" style="width: 90px;">${o.dname}</p>
                        <p class="col-md-1" style="width: 90px;">${o.price}</p>
                        <p class="col-md-1" style="width: 90px;">${o.taste}</p>
                    </span>
                            </c:forEach>
                            <span style="float: right;">
                        <div>桌号：${i.value[0].sid}</div>
                        <div>${i.value[0].sj}</div>
                    </span>
                        </div>
                    </th>
                    </tr>
                </c:forEach>
                </thead>
            </table>
        </div>
    </div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    小伙计餐厅提醒你
                </h4>
            </div>
            <div class="modal-body" id="11div">
                加入购物车成功
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<div id="divh1">

</div>
</div>
<script type="text/javascript">

    new Vue({
        el: "#t1",
        data() {
            return {
                name: sessionStorage.getItem("name"),
                pwd: "",
            }
        },
        methods: {
            tuichu(){
                <%--document.location.href="${c}/deletegw";--%>
                document.location.href="${c}/";
                this.$message({
                    message: '退出成功',
                    type: 'success'
                });
                axios({
                    method: "get",
                    url: "${c }/deletegw",
                })
            },
            tijiao(){
                $("#jiazai").removeAttr('style');
                var params = new URLSearchParams();
                params.append('userid', this.userid);
                params.append('sid', this.sid);
                params.append('pwd', this.pwd1);
                axios({
                    method: "post",
                    url: "${c }/gw/deleteall",
                    data: params
                }).then(Response => {
                    console.log()
                    if (Response.data == "success") {
                        $("#jiazai").removeAttr('style');
                        $("#zhifu").css('display','none');
                        $("#jiazai").css('display','none');
                        //删除成功
                        //提示删除成功语句
                        this.$message({
                            message: '恭喜你，支付成功',
                            type: 'success'
                        });
                        aa();
                    }else{
                        this.$message({
                            message: '支付失败',
                            type: '失败'
                        });
                        $("#zhifu").css('display','none');
                        $("#jiazai").css('display','none');
                    }
                }).catch(() => {
                    $("#zhifu").css('display','none');
                    $("#jiazai").css('display','none');
                    //用户点击了取消按钮
                    this.$message({
                        type: 'info',
                        message: '已取消删除'
                    });
                });
            }
        }
    });

    function index1() {
        document.location.href="${c}/index1";
    }

    //购物车
    function aa() {
        $.post("${c}/gw/gowu",function(data){
            var html="";
            var html1="";
            var html2="";
            var html3="";
            var html4="";
            var html5="";
            for(var i=0;i<data.list.length;i++){
                html+="<thead><tr>"+
                    "<th class="+"col-md-2"+"><img id="+"img"+" src=${c }/img/"+data.list[i].dname+".jpeg style="+"width:110px;height:110px;"+"/></th>"+
                    "<th class="+"col-md-2"+" style="+"text-align:left;"+"><h2>"+data.list[i].dname+"</h2></th>"+
                    "<th class="+"col-md-2"+">"+
                    "<h3 style="+"margin-bottom:38px;text-align:center;margin-right:16px"+">"+data.list[i].taste+"</h3></th>"+
                    "<th class="+"col-md-2"+"><h2>"+data.list[i].price+"元*"+data.list[i].number+"</h2></th>"+
                    "<th class="+"col-md-2"+"><h2 id="+"sch"+"><button id="+"sc"+" class="+"btn"+" onclick="+"ab(this)"+" type="+"button"+" ssss="+data.list[i].dname+" sss="+data.list[i].id+">删除</button>"+
                    "</h2>"+
                    "</th>"+
                    "</tr></thead>"
                html3+="<div style="+"margin: 5px;"+">"+data.list[i].dname+"&ensp;"+data.list[i].taste+"&ensp;"+data.list[i].price+"元*"+data.list[i].number+"</div></div>"
            };
            html1+="<table id="+"tbgw1"+"><tr><td style="+"text-align:right;width:535px;"+"><div style="+"height:36px;font-size:26px;"+">购物车</div></td>"+
                "<td style="+""+">"+"<div style="+"margin-left:320px;"+"><button dd="+data.price+" class="+"btn-danger"+" onclick="+"aa1(this)"+" style="+"border-radius:10px;font-size:16px;"+">批量删除</button><div></td></tr></table>"
            html2+="<div class="+"divjs"+"><div style="+"margin:5px;"+"><div><h2 style="+"text-align:center;"+">结算</h2></div>"+
                "<div id="+"tdiv1"+"></div><div id="+"tdiv2"+"></div>"
            html4+="<div style="+"text-align:center;"+"><h4>总价格:"+data.price+"元</h4></div>"+
                "<div style="+"margin-left:35px;margin-top:10px;"+"><button dd="+data.price+" onclick="+"yi(this)"+" class="+"btn-primary"+" style="+"width:100px;height:35px;position:fixed;"+">提交订单</button></div>"+
                "</div>"
            html5+="<h4 style="+"position:fixed;text-align:center;width:222px;font-weight:bolder;"+">"+data.price+"元</h4>"
            $("#th1").html(html);
            $("#tbgw").html(html1);
            $("#divh1").html(html2);
            $("#tdiv1").html(html3);
            $("#tdiv2").html(html4);
            $("#yuan").html(html5);
        });
    };
    //批量删除
    function aa1(el){
        var price=el.getAttribute("dd");
        if(price>0){
            $.post("${c}/gw/gowu",function(data){
                var html="";
                var html1="";
                var html2="";
                var html3="";
                var html4="";
                for(var i=0;i<data.list.length;i++){
                    html+="<thead><tr>"+
                        "<th class="+"col-md-2"+"><img id="+"img"+" src=${c }/img/"+data.list[i].dname+".jpeg style="+"width:110px;height:110px;"+"/></th>"+
                        "<th class="+"col-md-2"+" style="+"text-align:left;"+"><h2>"+data.list[i].dname+"</h2></th>"+
                        "<th class="+"col-md-2"+">"+
                        "<h3 style="+"margin-bottom:38px;text-align:center;margin-right:16px"+">"+data.list[i].taste+"</h3></th>"+
                        "<th class="+"col-md-2"+"><h2>"+data.list[i].price+"元*"+data.list[i].number+"</h2></th>"+


                        "<th class="+"col-md-2"+"><h2 id="+"sch"+"><button id="+"sc"+" class="+"btn"+" onclick="+"ab(this)"+" type="+"button"+" ssss="+data.list[i].dname+" sss="+data.list[i].id+">删除</button>"+
                        "<input style="+"margin-left:40px;"+" type="+"checkbox"+" name="+"checkbox"+" value="+data.list[i].id+"></h2>"+
                        "</th>"+

                        "</tr></thead>"
                    html3+="<div style="+"margin: 5px;"+">"+data.list[i].dname+"&ensp;"+data.list[i].taste+"&ensp;"+data.list[i].price+"元*"+data.list[i].number+"</div></div>"
                };
                html1+="<table id="+"tbgw1"+"><tr><td style="+"text-align:right;width:535px;"+"><div style="+"height:36px;font-size:26px;"+">购物车</div></td>"+
                    "<td style="+""+">"+"<div style="+"margin-left:320px;"+"><button class="+"btn-danger"+" onclick="+"ab1()"+" style="+"border-radius:10px;font-size:16px;"+">删除</button>"+
                    "<button class="+"btn-danger"+" onclick="+"aa()"+" style="+"border-radius:10px;font-size:16px;"+">完成</button><div></td></tr></table>"
                html2+="<div class="+"divjs"+"><div style="+"margin:5px;"+"><div><h2 style="+"text-align:center;"+">结算</h2></div>"+
                    "<div id="+"tdiv1"+"></div><div id="+"tdiv2"+"></div>"
                html4+="<div style="+"text-align:center;"+"><h4>总价格:"+data.price+"元</h4></div>"+
                    "<div style="+"margin-left:35px;margin-top:10px;"+"><button dd="+data.price+" onclick="+"yi(this)"+" class="+"btn-primary"+" style="+"width:100px;height:35px;position:fixed;"+">提交订单</button></div>"+
                    "</div>"
                $("#th1").html(html);
                $("#tbgw").html(html1);
                $("#divh1").html(html2);
                $("#tdiv1").html(html3);
                $("#tdiv2").html(html4);
            });
        }else{
            alert("请添加菜品至购物车");
        }
    };
    //删除
    function ab1(){
        var a=$('input:checkbox[name="checkbox"]:checked').map(function(){
            return $(this).val();
        }).get().join(",");
        if(a!=""){
            if (confirm("确定删除")) {
                $.post("${c }/gw/deletelist/"+a+"",function(){
                    alert("删除成功");
                    aa();
                });
            } else {

            }
        }else{
            alert("请勾选要删除的菜品");

        }


    };
    //提交订单
    function kk(){
        $("#jiazai").removeAttr('style');
        $.post("${c }/gw/deleteall",function(){
            $("#zhifu").css('display','none');
            $("#jiazai").css('display','none');
            alert("支付成功");
            aa();
        });
    };
    //菜单删除按钮
    function ab(el){
        var a=el.getAttribute("sss");
        var a1=el.getAttribute("ssss");
        if (confirm("确定删除")) {
            $.post("${c }/gw/deleteid1/"+a+"/"+a1+"",function(){
                alert("删除成功");
                aa();
            });
        }else{

        }
    };
    //订单
    function ding() {
        var id=sessionStorage.getItem("id");
        document.location.href="${c}/gw/test/"+id+"";
    };
    //li
    function aaa(el) {
        var a1=$(el).attr("id");
        var a=$("#"+a1+"").attr("na");
        $.post("${c }/ds/signature/"+a+"",function(data){
            zhangshi(data);
        });
    };
    //li➕
    function add(el){
        var but1=el.getAttribute("did");
        var na=el.getAttribute("na");
        var country=$("#"+but1+"s").val();
        $.post("${c }/gw/insert/"+but1+"/"+country+"",function(){

        });
    };
    //li➖
    function jian(el){
        var but1=el.getAttribute("did");
        if (confirm("确定删除")) {
            $.post("${c }/gw/deleteid/"+but1+"",function(){
                alert("删除成功");
                aaa("#butjia");
            });
        }else{

        }
    };
    //首页
    function azy() {
        $.post("${c }/ds/all",function(data){
            zhangshi1(data);
        });
    };
    //首页➕
    function add1(el){butjia
        var but1=el.getAttribute("did");
        var country=$("#"+but1+"s1").val();
        $.post("${c }/gw/insert/"+but1+"/"+country+"",function(){

        });
    };
    //首页➖
    function jian1(el){
        var but1=el.getAttribute("did");
        if (confirm("确定删除")) {
            $.post("${c }/gw/deleteid/"+but1+"",function(){
                alert("删除成功");
                azy();
            });
        }else{

        }
    };
    //搜索框
    function suos() {
        var ssk=document.getElementById("ssk").value;
        if(ssk==""){
            alert("没有此菜品");
            azy();
        }else{
            $.post("${c }/ds/suos/"+ssk+"",function(data){
                zhangshi2(data);
            });
        }
    };
    //搜索框➕
    function add2(el){
        var but1=el.getAttribute("did");
        var country=$("#"+but1+"s2").val();
        alert(country);
        $.post("${c }/gw/insert/"+but1+"/"+country+"",function(){
            alert("添加成功");
            suos();
        });
    };
    //搜索框➖
    function jian2(el){
        var but1=el.getAttribute("did");
        if (confirm("确定删除")) {
            $.post("${c }/gw/deleteid/"+but1+"",function(){
                alert("删除成功");
                suos();
            });
        }else{

        }
    };

    //li方法
    function zhangshi(data) {
        var html="";
        var html1="";
        var html2="";
        for(var i=0;i<data.list.length;i++){
            html+="<thead><tr>"+
                "<th class="+"col-md-2"+"><img id="+"img"+" src=${c }/img/"+data.list[i].dname+".jpeg style="+"width:110px;height:110px;"+"/></th>"+
                "<th class="+"col-md-2"+" style="+"text-align:left;"+"><h2>"+data.list[i].dname+"</h2></th>"+
                "<th class="+"col-md-2"+">"+
                "<form method="+"post"+">"+
                "<h3  style="+"margin-left:20px;"+" id="+"h3"+">"+
                "<select id="+data.list[i].id+"s"+" name="+"country"+">"+
                "<option value="+"微辣"+">微辣</option>"+
                "<option value="+"中辣"+">中辣</option>"+
                "<option value="+"特辣"+">特辣</option>"+
                "</select></h3></form></th>"+
                "<th class="+"col-md-2"+"><h2  style="+"margin-left:50px;"+">"+data.list[i].price+"元</h2></th>"+
                "<th class="+"col-md-2"+">"+
                "<div id="+"dj"+">"+
                "<button id="+"butjia"+" class="+"btn-success"+" na="+data.list[i].vid+" did="+data.list[i].id+" onclick="+"add(this)"+" style="+"border-radius:10px;"+" data-toggle="+"modal"+" data-target="+"#myModal"+">加入购物车</button>"+
                "</div></th>"+
                "</tr></thead>"
        }
        html2+="<table id="+"tbgw1"+"><tr>"+
            "<th class="+"col-md-2"+"></th>"+
            "<th class="+"col-md-2"+"><h3 style="+"margin-top:10px;"+">菜品名称</h3></th>"+
            "<th class="+"col-md-2"+" style="+"text-align:center;"+"><h3 style="+"margin-top:10px;"+">口味</h3></th>"+
            "<th class="+"col-md-2"+" style="+"text-align:center;"+"><h3 style="+"margin-top:10px;"+">单价</h3></th>"+
            "<th class="+"col-md-2"+"><h3 style="+"margin-left:10%;margin-top:10px;"+">操作</h3></th>"+
            "</tr></table>"
        $("#th1").html(html);
        $("#divh1").html(html1);
        $("#tbgw").html(html2);
        $("#gldiv").html("");
    }
    //订单方法
    function dingdan(data) {
        var html="";
        var html1="";
        var html2="";
        for(var i=0;i<data.length;i++){
            // for (var j = 0; j < data.length; j++) {
            // 	console.log(split[j]);
            // }
            html+="<thead><tr style="+"height:128px;"+"><c:forEach items="+data+" var="o">"+

                "<th class="+"col-md-2"+">"+data[i].sid+"<img id="+"img"+" src=${c }/img/"+data[i].dname+".jpeg style="+"width:110px;height:110px;"+"/></th>"+
                "<th class="+"col-md-2"+" style="+"text-align:left;"+"><h2>"+data[i].dname+"</h2></th>"+
                "<th class="+"col-md-1"+">"+
                "<h3 id="+"h3"+">"+data[i].taste+"</h3></th>"+
                "<th class="+"col-md-2"+"><h2  style="+"margin-left:15px;"+">"+data[i].price+"元*1</h2></th>"+
                "<th class="+"col-md-3"+"><div style="+"margin-bottom:40px;"+">"+data[i].sj+"</div></th>"+
                "</c:forEach>"+
                "</tr></thead>"
        }
        html2+="<table id="+"tbgw1"+"><tr>"+
            "<th style="+"text-align:center;"+"><h3>订单详情</h3></th>"+

            "</tr></table>"
        $("#th1").html(html);
        $("#divh1").html(html1);
        $("#tbgw").html(html2);
        $("#gldiv").html("");
    }
    //首页方法
    function zhangshi1(data) {
        var html="";
        var html1="";
        var html2="";
        for(var i=0;i<data.list.length;i++){
            html+="<thead><tr>"+
                "<th class="+"col-md-2"+"><img id="+"img"+" src=${c }/img/"+data.list[i].dname+".jpeg style="+"width:110px;height:110px;"+"/></th>"+
                "<th class="+"col-md-2"+" style="+"text-align:left;"+"><h2>"+data.list[i].dname+"</h2></th>"+
                "<th class="+"col-md-2"+">"+
                "<form method="+"post"+">"+
                "<h3  style="+"margin-left:20px;"+" id="+"h3"+">"+
                "<select id="+data.list[i].id+"s1"+" name="+"country"+">"+
                "<option value="+"微辣"+">微辣</option>"+
                "<option value="+"中辣"+">中辣</option>"+
                "<option value="+"特辣"+">特辣</option>"+
                "</select></h3></form></th>"+
                "<th class="+"col-md-2"+"><h2 style="+"margin-left:50px;"+">"+data.list[i].price+"元</h2></th>"+
                "<th class="+"col-md-2"+">"+
                "<div id="+"dj"+">"+
                "<button id="+"butjia"+" class="+"btn-success"+" na="+data.list[i].vid+" did="+data.list[i].id+" onclick="+"add1(this)"+" style="+"border-radius:10px;"+" data-toggle="+"modal"+" data-target="+"#myModal"+">加入购物车</button>"+
                "</div></th>"+
                "</tr></thead>"
        }
        html2+="<table id="+"tbgw1"+"><tr>"+
            "<th class="+"col-md-2"+"></th>"+
            "<th class="+"col-md-2"+"><h3 style="+"margin-top:10px;"+">菜品名称</h3></th>"+
            "<th class="+"col-md-2"+" style="+"text-align:center;"+"><h3 style="+"margin-top:10px;"+">口味</h3></th>"+
            "<th class="+"col-md-2"+" style="+"text-align:center;"+"><h3 style="+"margin-top:10px;"+">单价</h3></th>"+
            "<th class="+"col-md-2"+"><h3 style="+"margin-left:10%;margin-top:10px;"+">操作</h3></th>"+
            "</tr></table>"
        $("#th1").html(html);
        $("#divh1").html(html1);
        $("#tbgw").html(html2);
        $("#gldiv").html("");
    }

    //搜索框方法
    function zhangshi2(data) {
        var html="";
        var html1="";
        var html2="";
        for(var i=0;i<data.list.length;i++){
            html+="<thead><tr>"+
                "<th class="+"col-md-2"+"><img id="+"img"+" src=${c }/img/"+data.list[i].dname+".jpeg style="+"width:110px;height:110px;"+"/></th>"+
                "<th class="+"col-md-2"+" style="+"text-align:left;"+"><h2>"+data.list[i].dname+"</h2></th>"+
                "<th class="+"col-md-2"+">"+
                "<form method="+"post"+">"+
                "<h3  style="+"margin-left:20px;"+" id="+"h3"+">"+
                "<select id="+data.list[i].id+"s2"+" name="+"country"+">"+
                "<option value="+"微辣"+">微辣</option>"+
                "<option value="+"中辣"+">中辣</option>"+
                "<option value="+"特辣"+">特辣</option>"+
                "</select></h3></form></th>"+
                "<th class="+"col-md-2"+"><h2 style="+"margin-left:50px;"+">"+data.list[i].price+"元</h2></th>"+
                "<th class="+"col-md-2"+">"+
                "<div id="+"dj"+">"+
                "<button id="+"butjia"+" class="+"btn-success"+" na="+data.list[i].vid+" did="+data.list[i].id+" onclick="+"add2(this)"+" style="+"border-radius:10px;"+">加入购物车</button>"+
                "</div></th>"+
                "</tr></thead>"
        }
        html2+="<table id="+"tbgw1"+"><tr>"+
            "<th class="+"col-md-2"+"></th>"+
            "<th class="+"col-md-2"+"><h3 style="+"margin-top:10px;"+">菜品名称</h3></th>"+
            "<th class="+"col-md-2"+" style="+"text-align:center;"+"><h3 style="+"margin-top:10px;"+">口味</h3></th>"+
            "<th class="+"col-md-2"+" style="+"text-align:center;"+"><h3 style="+"margin-top:10px;"+">单价</h3></th>"+
            "<th class="+"col-md-2"+"><h3 style="+"margin-left:10%;margin-top:10px;"+">操作</h3></th>"+
            "</tr></table>"
        $("#th1").html(html);
        $("#divh1").html(html1);
        $("#tbgw").html(html2);
        $("#gldiv").html("");
    }
    $(function () { $("[data-toggle='tooltip']").tooltip(); });


    function guanlilogin() {
        window.location.href="${c}/ds/guanli";
    }
    function wei() {
        $("#zhifu").css('display','none');
        $("#jiazai").css('display','none');
    }
    function yi(el) {
        var price=el.getAttribute("dd");
        if(price>0){
            $("#zhifu").removeAttr('style');
        }else{
            alert("请添加菜品至购物车");
        }
    }

</script>

</body>
</html>