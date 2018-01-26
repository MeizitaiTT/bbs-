<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'Regist.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/bootstrap.min.css" rel="stylesheet">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<jsp:include page="/pages/header.jsp" />
	<div class="container" style="height:400px;width:400px">
		<div class="regist col-md-12">
			<h3 style="text-align:center">欢迎来到BBS技术论坛</h3>
			<p style="text-align:center">请填写注册信息</p>
			<form id="form1" role="form" action="<%=path%>/regist.action"
				method="post">

				<input id="username" type="text" class="form-control"
					name="username" style="height: 40px; margin-top: 20px;"
					placeholder="请输入用户名" required>
				<s:fielderror fieldName="username"></s:fielderror>

				<input id="password" type="password" class="form-control"
					name="password" style="height: 40px;margin-top: 20px;"
					placeholder="请输入密码" required>
				<s:fielderror fieldName="password"></s:fielderror>
			
				<div style="margin-top: 10px;margin-left: 10px;">
					<div style="float: left;margin-bottom: 10px">性别:</div>
					<div style="float:left;margin-left: 100px;margin-bottom: 10px">
						男<input type="radio" name="sex" value="1">
					</div>
					<div style="float: right;margin-right: 100px;margin-bottom: 10px">
						女<input type="radio" name="sex" value="0">
					</div>
				</div>
							
				<input id="age" type="text" class="form-control" name="age" required
					style="height: 40px;margin-top: 20px;" placeholder="请输入年龄">
				<s:fielderror fieldName="email"></s:fielderror>
				
				<div
					style="height: 80px;width: 100%;margin-top: 20px;margin-left: 30px;">
					<input type="submit" class="btn btn-primary" value="注册"
						style="margin:auto;width: 80%;height: 40px;padding: 10px;"></input>
				</div>
				<p class="text-muted text-center">
					<small>已经有账户了？</small><a href="<%=path%>/login.jsp">点此登录</a>
				</p>
			</form>


		</div>
	</div>

	<jsp:include page="/pages/footer.jsp" />
</body>
</html>
