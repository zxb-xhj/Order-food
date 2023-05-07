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
<link rel="shortcut icon" href="${c }/img/图标.jpg" />
	<script src="${c}/static/js/vue.js"></script>
	<script src="${c}/static/element-ui/lib/index.js"></script>
	<link rel="stylesheet" href="${c}/static/element-ui/lib/theme-chalk/index.css">
	<script src="${c}/static/js/axios-0.18.0.js"></script>
<style>
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
	<div id="login">
	<div style="height: 70px;position:fixed;background-color:#9BCD9B;width: 100%;">
		<div style="float: left;margin-top: 10px;margin-left: 90px;margin-right: 30px;">
		<img style="border-radius: 50%;width: 50px;height: 50px;" alt="" src="${c }/img/图标.jpg">
		</div>
		<div style="font-size: 35px;margin-top: 10px;">小 伙 计 餐 厅 欢 迎 您</div>
	</div>
	<div style="position:fixed;margin-top: 70px;width: 1535px;background-color:#C0C0C0;height: 50px;">
		<div style="float: left;margin-top: 13px;margin-left: 20px;width: 200px;">
			<button class="btn-info" onclick="ding()">订单详情</button><button class="btn-primary" style="height: 30px;margin-left: 10px;" @click="yonghu()">
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
				<li><a href="${c }//ds/dishes" @click="gltuichu()">退出登录</a></li>
			</ul>
		</div>
<%--		<a id="gwc" class="btn btn-primary" style="margin-top: 8px" onclick="aa()">--%>
<%--			购物车 <span class="glyphicon glyphicon-shopping-cart"></span>--%>
<%--		</a>--%>
		<div  class="navbar-form navbar-left" style="margin-left: 45%;">

<%--			<div class="form-group navbar-left">--%>
<%--				<input id="ssk" type="text" class="form-control" placeholder="请输入食物名" name="name">--%>
<%--			</div>--%>
<%--			<button onclick="suos()" type="submit" class="btn btn-default">搜索</button>--%>
		</div>
			      
		</div>
		<div style="height: 600px;float: left;border:2px solid #a1a1a1;padding:10px 20px; background:#dddddd;width:250px;margin-left:5px;
	border-radius:25px;position:fixed;margin-top: 143px">
	
			<ul id="ul">
			<div id="syli"><li><a onclick="azy()">全部</a></li></div>
			<div id="divli">
		<c:forEach items="${Varieties }" var="v">
			<li><span class="spanli" id="${v.id }li" onclick="aaa(this)" na="${v.id }"><span id="${v.id }na">${v.name }</span>
			<span style="float: right;" id="${v.id }spanbut"><button onclick="quxiaov(this)" did="${v.name }" id="${v.id }" class="btn-warning">🖊</button>
			</span></span></li>
		</c:forEach>
		
		</div><li><input id="vnid" style="margin-top:8px;margin-left:5px;width: 140px;margin-right:10px;"><button class="btn-success" onclick="vnamejia()">✔</button></li>
			</ul>
			<div><img style="width: 200px;height: 200px;margin-top: 80px;margin-left: 5px;" alt="" src="${c }/img/log.png"></div>
		</div>
		<div style="margin-left: 250px;float: left;">
		<div style="float: left;border-radius: 5px;margin-top: 145px;">
			<table id="tbgw" style="margin-left: 90px;background-color:#E0FFFF;width: 980px;height: 60px;border-radius:25px;">
				<tr>
					<th class="col-md-2"></th>
					<th class="col-md-2"><h3 style="margin-top: 10px;">菜品名称</h3></th>
					<th class="col-md-2" style="text-align: center;"><h3 style="margin-top: 10px;">类别</h3></th>
					<th class="col-md-2" style="text-align: center;"><h3 style="margin-top: 10px;">单价</h3></th>
					<th class="col-md-2"><h3 style="margin-top: 10px;margin-left:10%;">操作</h3></th>
				</tr>
			</table>
			<div id="tdiv">
			
				<table  class=" table table-hover " style="width: 1000px;margin-left: 7%;background-color: #f2f2f2;padding: 20px;border-radius:25px;" id="th1">
			
		<thead id="vt">
		
		<tr style="height: 128px;">
			<th class="col-md-2"> 
			<form method="post" enctype="multipart/form-data">
				<input id="file" type="file" name="file" style="width:160px;margin-bottom:35px;">
			</form>
			</th>
			<th class="col-md-2" style="text-align:left;"><h2 id="dn" style="margin-bottom:30px;">
			<input name="dname1" id="dname" style="width: 150px;"></h2>
			</th>
			
			
			<th class="col-md-2">
				<h3 id="h3" style="margin-left: 8px;">
					<select id="s1" name="select">
					<c:forEach items="${Varieties }" var="vt" >
				 <option value="${vt.id }">${vt.name }</option>
				 </c:forEach>
				    </select>
				</h3>
			</th>
			<th class="col-md-2"><h2 style="margin-left:50px;margin-bottom:30px;" id="dp"><input name="price" id="price" style="width: 90px;" value="88.00">元</h2></th>
			<th class="col-md-2">
				<div class="dj">
					<button id="butjia" class="btn-warning" onclick="xinzen()" style="border-radius:10px;width: 80px">新增</button>&nbsp;
					</div>
					
			</th>
		</tr>
		</thead>
					<c:forEach items="${list }" var="di" >
			<form>
			<thead id="the">
			
		<tr style="height: 128px;">
			<th class="col-md-2" id="img${di.id }"> 
			
				<img id="img" src="${c }/img/${di.dname }.jpeg" style="width: 110px;height: 110px;" data-toggle="tooltip" data-placement="right" title="${di.dname }" />
			</th>
			<th class="col-md-2" style="text-align:left;"><h2 id="${di.id }dn" name="${di.dname }">${di.dname }</h2></th>
			
			
			<th class="col-md-2">
				<h3 id="h3" style="margin-left: 20px;">
					<select id="${di.id }s1" name="country">
				 <option value="${di.vid }">${Varieties[di.vid-1].name }</option>
				    </select>
				</h3>
			</th>
			<th class="col-md-2"><h2 style="margin-left: 50px;" id="${di.id }dp" name="${di.price }">${di.price }元</h2></th>
			<th class="col-md-2">
				<div id="${di.id }dj" class="dj">
					<button id="butjia" class="btn-warning" dname="${di.dname }" price="${di.price }" did="${di.id }" na="${di.vid }" onclick="xiugai1(this)">修改</button>&nbsp;
					<button id="butjia" class="btn-danger" did="${di.id }" na="${di.vid }" onclick="shanchu(this)">删除</button>
					</div>
					
			</th>
		</tr></thead>
		</form>
	</c:forEach>
				</table>
		</div>
		</div>
			</div>
		<div id="divh1">
		
		</div>
	</div>
		
		<script type="text/javascript">

			new Vue({
				el: "#login",
				data() {
					return {
						adminname: sessionStorage.getItem("adminname"),
						pwd: ""
					}
				},
				methods: {
					yonghu(){
						document.location.href="${c}/gl/t3";
					},
					gltuichu(){
							this.$message({
								message: '退出成功',
								type: 'success'
							});
					}
				}
			});
			function index1() {
				document.location.href="${c}/index1";
			}
		
				//li
				function aaa(el) {
					var a1=$(el).attr("id");
					var a=$("#"+a1+"").attr("na");
					$.post("${c }/ds/signature/"+a+"",function(data){
						zhangshi(data);
					});
				};
			
				//首页
				function azy() {
					$.post("${c }/ds/all",function(data){
						zhangshi1(data);
					});
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
			
				
				//li方法
				function zhangshi(data) {
					var html="";
					var html1="";
					var html2="";
					var html3="";
					var html4="";
					for(var i=0;i<data.list.length;i++){
						html+="<thead><tr style="+"height:128px;"+">"+
						"<th class="+"col-md-2"+"><img id="+"img"+" src=${c }/img/"+data.list[i].dname+".jpeg style="+"width:110px;height:110px;"+"/></th>"+
						"<th class="+"col-md-2"+" style="+"text-align:left;"+"><h2 id="+data.list[i].id+"dn>"+data.list[i].dname+"</h2></th>"+
						"<th class="+"col-md-2"+">"+
						"<form method="+"post"+">"+
						"<h3  style="+"margin-left:20px;"+" id="+"h3"+">"+
						"<select id="+data.list[i].id+"s1"+" name="+"country"+">"+
						 "<option value="+data.list[i].vid+">"+data.Varieties[data.list[i].vid-1].name+"</option>"+
						    "</select></h3></form></th>"+
						"<th class="+"col-md-2"+"><h2 id="+data.list[i].id+"dp"+" style="+"margin-left:50px;"+">"+data.list[i].price+"元</h2></th>"+
						"<th class="+"col-md-2"+">"+
						"<div id="+data.list[i].id+"dj"+" class="+"dj"+">"+
						"<button id="+"butjia"+" class="+"btn-warning"+" dname="+data.list[i].dname+" price="+data.list[i].price+" na="+data.list[i].vid+" did="+data.list[i].id+" onclick="+"xiugai1(this)"+" style="+"border-radius:10px;"+">修改</button>"+
						"&ensp;<button id="+"butjia"+" class="+"btn-danger"+" dname="+data.list[i].dname+" price="+data.list[i].price+" na="+data.list[i].vid+" did="+data.list[i].id+" onclick="+"shanchu(this)"+" style="+"border-radius:10px;"+">删除</button>"+
						"</div></th>"+
						 "</tr></thead>"
						    }
					html2+="<tr>"+
					"<th class="+"col-md-2"+"></th>"+
					"<th class="+"col-md-2"+"><h3 style="+"margin-top:10px;"+">菜品名称</h3></th>"+
					"<th class="+"col-md-2"+" style="+"text-align:center;"+"><h3 style="+"margin-top:10px;"+">类别</h3></th>"+
					"<th class="+"col-md-2"+" style="+"text-align:center;"+"><h3 style="+"margin-top:10px;"+">单价</h3></th>"+
					"<th class="+"col-md-2"+"><h3 style="+"margin-left:10%;margin-top:10px;"+">操作</h3></th>"+
				"</tr>";
					for(var j=0;j<data.Varieties.length;j++){
						html4+="<option value="+data.Varieties[j].id+">"+data.Varieties[j].name+"</option>";
							}
					$("#th1").html(html);
					$("#divh1").html(html1);
					$("#tbgw").html(html2);
					$("#s1").html(html4);
				}
				//首页方法
				function zhangshi1(data) {
					var html="";
					var html1="";
					var html2="";
					var html3="";
					var html4="";
					for(var i=0;i<data.list.length;i++){
						html+="<tr style="+"height:128px;"+">"+
						"<th class="+"col-md-2"+" id="+"img"+data.list[i].id+"><img id="+"img"+" src=${c }/img/"+data.list[i].dname+".jpeg style="+"width:110px;height:110px;"+"/></th>"+
						"<th class="+"col-md-2"+" style="+"text-align:left;"+"><h2 id="+data.list[i].id+"dn>"+data.list[i].dname+"</h2></th>"+
						"<th class="+"col-md-2"+">"+
						"<form method="+"post"+">"+
						"<h3  style="+"margin-left:20px;"+" id="+"h3"+">"+
							"<select id="+data.list[i].id+"s1"+" name="+"country"+">"+
						 "<option value="+data.list[i].vid+">"+data.Varieties[data.list[i].vid-1].name+"</option>"+
						    "</select></h3></form></th>"+
						    "<th class="+"col-md-2"+"><h2 id="+data.list[i].id+"dp"+" style="+"margin-left:50px;"+">"+data.list[i].price+"元</h2></th>"+
						    "<th class="+"col-md-2"+">"+
							"<div id="+data.list[i].id+"dj"+" class="+"dj"+">"+
							"<button id="+"butjia"+" class="+"btn-warning"+" dname="+data.list[i].dname+" price="+data.list[i].price+" na="+data.list[i].vid+" did="+data.list[i].id+" onclick="+"xiugai1(this)"+" style="+"border-radius:10px;"+">修改</button>"+
							"&ensp;<button id="+"butjia"+" class="+"btn-danger"+" dname="+data.list[i].dname+" price="+data.list[i].price+" na="+data.list[i].vid+" did="+data.list[i].id+" onclick="+"shanchu(this)"+" style="+"border-radius:10px;"+">删除</button>"+
							"</div></th>"+
							 "</tr>";
						    }
					html2+="<tr>"+
					"<th class="+"col-md-2"+"></th>"+
					"<th class="+"col-md-2"+"><h3 style="+"margin-top:10px;"+">菜品名称</h3></th>"+
					"<th class="+"col-md-2"+" style="+"text-align:center;"+"><h3 style="+"margin-top:10px;"+">类别</h3></th>"+
					"<th class="+"col-md-2"+" style="+"text-align:center;"+"><h3 style="+"margin-top:10px;"+">单价</h3></th>"+
					"<th class="+"col-md-2"+"><h3 style="+"margin-left:10%;margin-top:10px;"+">操作</h3></th>"+
				"</tr>";
				    
				    html3+="<thead id="+"vt"+"><tr style="+"height:128px;"+"><th class="+"col-md-2"+"><form method="+"post"+" enctype="+"multipart/form-data"+">"+
					"<input id="+"file"+" type="+"file"+" name="+"file"+" style="+"width:160px;margin-bottom:35px;"+"></form></th>"+
					"<th class="+"col-md-2"+" style="+"text-align:left;"+"><h2 id="+"dn"+"><input id="+"dname"+" style="+"width:150px;"+"></h2></th>"+
					"<th class="+"col-md-2"+"><h3 id="+"h3"+" style="+"margin-left:8px;"+">"+
					"<select id="+"s1"+" name="+"select"+">"+
				    "</select>"+
					"</h3></th>"+
					"<th class="+"col-md-2"+"><h2 style="+"margin-left:50px;"+" id="+"dp"+"><input id="+"price"+" style="+"width:90px;"+" value="+"88.00"+">元</h2></th>"+
					"<th class="+"col-md-2"+"><div class="+"dj"+">"+
					"<button id="+"butjia"+" class="+"btn-warning"+" onclick="+"xinzen()"+" style="+"border-radius:10px;width:80px"+">新增</button>&nbsp;"+
					"</div></th></tr></thead><thead id="+"the"+"></thead>";
					for(var j=0;j<data.Varieties.length;j++){
					html4+="<option value="+data.Varieties[j].id+">"+data.Varieties[j].name+"</option>";
						}
					
					$("#th1").html(html3);
					$("#divh1").html(html1);
					$("#tbgw").html(html2);
					$("#the").html(html);
					$("#s1").html(html4);
				}

				//搜索框方法
				function zhangshi2(data) {
					var html="";
					var html1="";
					var html2="";
					var html3="";
					var html4="";
					for(var i=0;i<data.list.length;i++){
						html+="<thead><tr style="+"height:128px;"+">"+
						"<th class="+"col-md-2"+"><img id="+"img"+" src=${c }/img/"+data.list[i].dname+".jpeg style="+"width:110px;height:110px;"+"/></th>"+
						"<th class="+"col-md-2"+" style="+"text-align:left;"+"><h2 id="+data.list[i].id+"dn>"+data.list[i].dname+"</h2></th>"+
						"<th class="+"col-md-2"+">"+
						"<form method="+"post"+">"+
						"<h3  style="+"margin-left:20px;"+" id="+"h3"+">"+
						"<select id="+data.list[i].id+"s1"+" name="+"country"+">"+
						 "<option value="+data.list[i].vid+">"+data.Varieties[data.list[i].vid-1].name+"</option>"+
						    "</select></h3></form></th>"+
						"<th class="+"col-md-2"+"><h2 id="+data.list[i].id+"dp"+" style="+"margin-left:50px;"+">"+data.list[i].price+"元</h2></th>"+
						"<th class="+"col-md-2"+">"+
						"<div id="+data.list[i].id+"dj"+" class="+"dj"+">"+
						"<button id="+"butjia"+" class="+"btn-warning"+" dname="+data.list[i].dname+" price="+data.list[i].price+" na="+data.list[i].vid+" did="+data.list[i].id+" onclick="+"xiugai1(this)"+" style="+"border-radius:10px;"+">修改</button>"+
						"&ensp;<button id="+"butjia"+" class="+"btn-danger"+" dname="+data.list[i].dname+" price="+data.list[i].price+" na="+data.list[i].vid+" did="+data.list[i].id+" onclick="+"shanchu(this)"+" style="+"border-radius:10px;"+">删除</button>"+
						"</div></th>"+
						 "</tr></thead>"
						    }
					html2+="<tr>"+
					"<th class="+"col-md-2"+"></th>"+
					"<th class="+"col-md-2"+"><h3 style="+"margin-top:10px;"+">菜品名称</h3></th>"+
					"<th class="+"col-md-2"+" style="+"text-align:center;"+"><h3 style="+"margin-top:10px;"+">类别</h3></th>"+
					"<th class="+"col-md-2"+" style="+"text-align:center;"+"><h3 style="+"margin-top:10px;"+">单价</h3></th>"+
					"<th class="+"col-md-2"+"><h3 style="+"margin-left:10%;margin-top:10px;"+">操作</h3></th>"+
				"</tr>";
					for(var j=0;j<data.Varieties.length;j++){
						html4+="<option value="+data.Varieties[j].id+">"+data.Varieties[j].name+"</option>";
							}
					$("#th1").html(html);
					$("#divh1").html(html1);
					$("#tbgw").html(html2);
					$("#s1").html(html4);
				}
				$(function () { $("[data-toggle='tooltip']").tooltip(); });
				
				
				//修改
				function xiugai1(el) {
					var na=el.getAttribute("na");
					var did=el.getAttribute("did");
					var dname=el.getAttribute("dname");
					var price=el.getAttribute("price");
					var html="";
					var html1="";
					var html2="";
					var html3="";
					$.post("${c}/vt/vsall",function(data){
						for(var i=0;i<data.length;i++){
							html3+="<option value="+data[i].id+">"+data[i].name+"</option>";
						}
						$("#"+did+"s1").html(html3);
					})
						html+="<button id="+"butjia"+" class="+"btn-success"+" dname="+dname+" price="+price+" na="+na+" did="+did+" onclick="+"tijiao(this)"+" style="+"border-radius:10px;"+">提交</button>"+
						"&ensp;<button id="+"butjia"+" class="+"btn-primary"+" dname="+dname+" price="+price+" na="+na+" did="+did+" onclick="+"quxiao(this)"+" style="+"border-radius:10px;"+">取消</button>"
						html1+="<input class="+"dnameid"+" id="+"dnameid"+did+""+" type="+"text"+" name="+"dname"+" value="+dname+">";
						html2+="<input class="+"priceid"+" id="+"priceid"+did+""+" type="+"text"+" name="+"price"+" value="+price+">元";
						html3+="<form method="+"post"+" enctype="+"multipart/form-data"+">"+
						"<input id="+"file"+did+""+" type="+"file"+" name="+"file"+" style="+"width:160px;margin-bottom:35px;"+"></form>";
					$("#"+did+"dj").html(html);
					$("#"+did+"dn").html(html1);
					$("#"+did+"dp").html(html2);
					$("#img"+did+"").html(html3);
				}
				//取消
				function quxiao(el) {
					var na=el.getAttribute("na");
					var did=el.getAttribute("did");
					var dname=el.getAttribute("dname");
					var price=el.getAttribute("price");
					var html="";
					var html1="";
					var html2="";
					var html3="";
					$.post("${c}/vt/vsid/"+na+"",function(data){
						html3+="<option value="+data.id+">"+data.name+"</option>";
						$("#"+did+"s1").html(html3);
					})
						html+="<button id="+"butjia"+" class="+"btn-warning"+" dname="+dname+" price="+price+" na="+na+" did="+did+" onclick="+"xiugai1(this)"+" style="+"border-radius:10px;"+">修改</button>"+
						"&ensp;<button id="+"butjia"+" class="+"btn-danger"+" dname="+dname+" price="+price+" na="+na+" did="+did+" onclick="+"shanchu(this)"+" style="+"border-radius:10px;"+">删除</button>"
						
						html1+=dname;
						html2+=price+"元";
						html3+="<img id="+"img"+" src=${c }/img/"+dname+".jpeg style="+"width:110px;height:110px;"+"/>"
					$("#"+did+"dj").html(html);
					$("#"+did+"dn").html(html1);
					$("#"+did+"dp").html(html2);
					$("#img"+did+"").html(html3);
				}
				//删除
				function shanchu(el) {
					var id=el.getAttribute("did");
					var dname=el.getAttribute("dname");
					if (confirm("确定删除")) {
					$.post("${c}/ds/deletedsid/"+id+"/"+dname+"",function(){
						alert("菜品删除成功");
						// azy();
						$.post("${c }/ds/all",function(data){
							zhangshi1(data);
						});
					});
					 }else{
						 
					 }
				}

				//新增
				function xinzen() {
					var dname=$("#dname").val();
					var price=$("#price").val();
					var select=$("#s1").val();
					var file=$("#file").val();
					$.ajax({
						url:"${c}/ds/insertds/",
						type:"post",
						data:{
						"dname":dname,
						"price":price,
						"select":select,
						"file":file
						},
						datatype:"JSON",
						success:function(){
						alert("添加成功");
						azy();
					}
						});
				}
				function wancheng(el) {
					var bid=el.getAttribute("id");
					var did=el.getAttribute("did");
					var value=$("#"+bid+"in").val();
					
					$.post("${c}/gl/shanchuv/"+bid+"/"+value+"",function(data){
						leibie(data);
						alert("类别信息修改成功");
					})
				}
				function leibie(data) {
					var html="";
					var html1="";
					for(var i=0;i<data.length;i++){
						html+="<li><span class="+"spanli"+" id="+data[i].id+"li"+" onclick="+"aaa(this)"+" na="+data[i].id+"><span id="+data[i].id+"na"+">"+data[i].name+"</span>"+
						"<span id="+data[i].id+"spanbut"+" style="+"float:right;"+"><button onclick="+"quxiaov(this)"+" did="+data[i].name+" id="+data[i].id+" class="+"btn-warning"+">🖊</button>";
						
					}
					html1+="<li><a onclick="+"azy()"+">主页</a></li>";

					$("#divli").html(html);
					$("#syli").html(html1);
				}
				function xiugaiv(el) {
					var id=el.getAttribute("id");
					var did=el.getAttribute("did");
					var html="";
					var html1="";
					html+="<input na="+id+" class="+"in1"+" id="+id+"in"+" value="+did+">";
					html1+="<span><button onclick="+"wancheng(this)"+" id="+id+" did="+did+" class="+"btn-success"+">✔</button>&ensp;<button onclick="+"quxiaov1(this)"+" did="+did+" id="+id+" class="+"btn-primary"+">✖</button></span>";
					$("#"+id+"spanbut").html(html1);
					$("#"+id+"na").html(html);
				}
				function quxiaov1(el) {
					var id=el.getAttribute("id");
					var did=el.getAttribute("did");
					var html="";
					var html1="";
					
					html+=did;
					html1+="<button onclick="+"quxiaov(this)"+" did="+did+" id="+id+" class="+"btn-warning"+">🖊</button>";
					$("#"+id+"spanbut").html(html1);
					$("#"+id+"na").html(html);
				}
				function quxiaov(el) {
					
					var id=el.getAttribute("id");
					var did=el.getAttribute("did");
					var html="";
					var html1="";
					
					html+=did;
					html1+="<button onclick="+"xiugaiv(this)"+" did="+did+" id="+id+" class="+"btn-warning"+">🖊</button>"+"&ensp;<button id="+id+" onclick="+"shanchuc(this)"+" class="+"btn-danger"+">✖</button>";
					$("#"+id+"spanbut").html(html1);
					$("#"+id+"na").html(html);
				}
				//订单
				function ding() {
					document.location.href="${c}/gl/gldindan";
				};

				//订单方法
				function dingdan(data) {
					var html="";
					var html1="";
					var html2="";
					for(var i=0;i<data.length;i++){
						html+="<thead><tr style="+"height:128px;"+">"+
						"<th class="+"col-md-2"+">"+data[i].sid+"<img id="+"img"+" src=${c }/img/"+data[i].dname+".jpeg style="+"width:110px;height:110px;"+"/></th>"+
						"<th class="+"col-md-2"+" style="+"text-align:left;"+"><h2>"+data[i].dname+"</h2></th>"+
						"<th class="+"col-md-1"+">"+
						"<h3 id="+"h3"+">"+data[i].taste+"</h3></th>"+
						"<th class="+"col-md-2"+"><h2  style="+"margin-left:15px;"+">"+data[i].price+"元*1</h2></th>"+
						 "<th class="+"col-md-3"+"><div style="+"margin-bottom:40px;"+">"+data[i].sj+"<button style="+"margin-left:40px;"+" id="+data[i].id+" onclick="+"deleteoid(this)"+" class="+"btn-danger"+">✖</button></div></th>"+
						 "</tr></thead>"
						    }
					html2+="<tr>"+
					"<th style="+"text-align:center;"+"><h3>订单详情</h3></th>"+
				"</tr>"
					$("#th1").html(html);
					$("#divh1").html(html1);
					$("#tbgw").html(html2);
				}
				//提交
				function tijiao(el) {
					var did=el.getAttribute("did");
					var dname1=el.getAttribute("dname");
					var dname=$("#dnameid"+did+"").val();
					var price=$("#priceid"+did+"").val();
					var select=$("#"+did+"s1").val();
					var file=$("#file"+did+"").val();
					$.post({url:"${c}/gl/xiugai",
						data:{
							"did":did,
							"dname":dname,
							"price":price,
							"select":select,
							"file":file,
							"dname1":dname1
						},
						datatype:"JSON",
						success:function(){
						alert("修改成功");
						azy();
				}
					});
				}
				function vnamejia() {
					var name=$("#vnid").val();
					if(name!=null&&name!=""){
						$.post({
								url:"${c}/vt/insertvn",
								data:{"name":name},
								datatype:"JSON",
								success:function(data){
							alert("添加类别成功");
									azy();
							leibie(data);
								}
						});
					}
				}
				function shanchuc(el) {
					var id=el.getAttribute("id");
					if (confirm("确定删除")) {
					$.post({
						url:"${c}/vt/deleteid",
						data:{"id":id},
						datatype:"json",
						success:function(data){
							alert("删除类别成功");
							leibie(data);
						}
					});
					}else{
						
					}
				}
				function deleteoid(el) {
					var id=el.getAttribute("id");
					if (confirm("确定删除")) {
					$.post({
						url:"${c}/deleteoid",
						data:{"id":id},
						datatype:"json",
						success:function(){
							alert("删除订单成功");
							ding();
						}
					});
					}else{
						
					}
				}
		</script>
		
	</body>
</html>