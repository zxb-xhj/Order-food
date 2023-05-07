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
	</head>
	<body>
	<div style="height: 70px;position:fixed;background-color:#9BCD9B;width: 100%;">
		<div style="float: left;margin-top: 10px;margin-left: 90px;margin-right: 30px;">
		<img style="border-radius: 50%;width: 50px;height: 50px;" alt="" src="${c }/img/图标.jpg">
	</div>
		<div style="font-size: 35px;margin-top: 10px;">小 伙 计 餐 厅 欢 迎 您</div>
	</div>
		<div style="position:fixed;margin-top: 70px;width: 1536px;background-color:#C0C0C0;height: 50px;">
		
			
			      
		</div>
		
		<div id="t2" style="margin-left: 120px;float: left;">
		<div style="float: left;border-radius: 5px;margin-top: 145px;">
		<div id="gldiv">
			<div style="margin-top:100px;margin-left:520px;float:left;">
			<h3 style="text-align:center;width:300px;">管理员登录</h3>
			<form id="guanliform" action="${c }/gl/login" method="post">
			<div style="margin:25px;">
			    名称：<input type="text" id="name" name="name" v-model="name" placeholder="请输入名称"><br>
			    密码：<input type="password" id="pwd" name="pwd" v-model="pwd" placeholder="请输入密码"><br>
			    <input @click="adminlogin()" id="guanlidenglu" type="button" value="登录" class="btn-success" style="margin-left:76px;"><a href="${c }/ds/dishes">返回</a>
			    </div>
			</form>
			</div>
		</div>
		</div>
		</div>
		
		<script type="text/javascript">

			new Vue({
				el: "#t2",
				data() {
					return {
						name: "",
						pwd: "",
					}
				},
				methods: {
					adminlogin() {
						var params = new URLSearchParams();
						params.append('name', this.name);
						params.append('pwd', this.pwd);
						axios({
							method: "post",
							url: "http://localhost:8080/Order/gl/log",
							data: params
						}).then(Response => {
							// 重新查询数据
							//设置表格数据
							if (Response.data != ""&&Response.data !=null) {
								//提示删除成功语句
								this.$message({
									message: '登录成功',
									type: 'success'
								})
								sessionStorage.setItem("adminname",this.name);
								// alert(this.name);
								document.location.href="${c}/gl/login"
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
			});

			function dd() {
				var name=document.getElementById("name").value;
				var pwd=document.getElementById("pwd").value;
				if(name==null||name==""&&pwd==null||pwd==""){
					alert("登录失败！");
				}else{
				$.post("${c}/gl/log/"+name+"/"+pwd+"",function(data){
					if(data=="1"){
						alert("登录成功！");
					}else{
						alert("登录失败！");
					}
				});
				}
			}
			
		</script>
		
	</body>
</html>