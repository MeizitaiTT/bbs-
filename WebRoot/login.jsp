<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/bootstrap.min.css" rel="stylesheet">
    
	 <link href="css/login.css" rel="stylesheet">
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <jsp:include page="/pages/header.jsp"/>
    <div class="container" style="margin-left:auto;margin-right:auto;height:400px;width:400px">
    <div class="regist col-md-12">
    <h3 style="">欢迎来到BBS技术论坛</h3>
    <p>登陆：</p>
    	<form id="form1" role="form" action="<%=path%>/login.action" method="post">
            <!--<label for="name">用户名:</label>-->
            <input id="username" required type="text" class="form-control" name="username" style="height: 40px; margin-top: 20px;"
                   placeholder="请输入用户名"><s:fielderror fieldName="username"></s:fielderror>
            <!--<label for="name"></label>-->
            <input type="password" required class="form-control" name="password" style="height: 40px;margin-top: 20px;margin-bottom:10px"
                   placeholder="请输入密码"><s:fielderror fieldName="password"></s:fielderror>
         
        <div style="height: 100px;width: 100%;margin-top: 0px;">
            <div style="float:left;width: 50%;padding: 10px 10px 10px 0;">
                <input type="submit" class="btn btn-primary" value="登陆"
                   style="margin:auto;width: 80%;height: 50px;padding: 13px;"></input>
            </div>
        </div>
		<p class="text-muted"><small>还没有账户？</small><a href="<%=path%>/Regist.jsp">点此注册</a>
                </p>       
    </form>


	</div>
 </div>
 
    <jsp:include page="/pages/footer.jsp"/>
  </body>
</html>
