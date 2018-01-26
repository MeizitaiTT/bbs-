<%@page import="com.bbs.model.User"%>
<%@page import="com.bbs.serviceImpl.UserDaoImpl"%>
<%@page import="com.bbs.service.UserDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<%
if ((Integer) session.getAttribute("popedom") == null) {
		response.sendRedirect("../login.jsp");

	} else if ((Integer) session.getAttribute("popedom") != null) {
		if ((Integer) session.getAttribute("popedom") != 2)
			response.sendRedirect("../login.jsp");
	}
 %>
<title>My JSP 'goodPublish.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<%
int id = Integer.parseInt(request.getParameter("Id"));
UserDao uDao = new UserDaoImpl();
User u = uDao.getUserById(id);
 %>

<body>
	<jsp:include page="/pages/header.jsp" />
	<div style="text-align:center"><h1>admin后台管理页面</h1></div>
	<div class="container" style="margin-top: 80px">
		<div class="row">
			<div class="col-xs-3">
				<ul class="nav nav-pills nav-stacked">
					<li role="presentation"><a href="<%=path%>/manage/managePost.jsp">帖子管理</a>
					</li>
					<li role="presentation"><a
						href="<%=path%>/manage/change_info.jsp">资料修改</a></li>
					<li role="presentation"><a
						href="<%=path%>/manage/goodPublish.jsp">精华帖请求</a></li>
					<li role="presentation" class="active"><a
						href="<%=path%>/manage/userManage.jsp">用户管理</a></li>
					<li role="presentation"><a
						href="<%=path%>/manage/subjectManage.jsp">模块管理</a></li>
						<li role="presentation" ><a
						href="<%=path%>/manage/addSubject.jsp">增加模块</a>
					</li>
				</ul>
			</div>

			<div class="col-md-9">

				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">用户信息修改</h3>
					</div>
					<div class="panel-body">
						<form id="form1" action="<%=path %>/change_user_info.action?uid=<%=u.getId() %>" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <img alt="" class="avatar left" height="70" src="<%=path+u.getImagepath()%>" width="70" />
                            请上传你的头像<br/>

                        </div>
                        <input type="file" id="inputfile"  name="photoImg"><br/>

                        <div class="form-group">
                            <label for="name">用户名</label>
                            <input id="username" type="text" class="form-control" name="username" id="username" width="200px" height="80px" value="<%=u.getUsername() %>"
                                   placeholder="请输入名称"> <p class="help-block"><s:fielderror fieldName="username"></s:fielderror></p>
                        </div>

                        <div class="form-group">
                            <label for="name">性 别</label><br/>
                    <% if(u.getSex()==1){%>        
                            男<input type="radio" name="sex" value="1" checked="checked"> 
                             &nbsp &nbsp女<input type="radio" name="sex" value="0">
                           <%}else if(u.getSex()==0){%> 
                            男<input type="radio" name="sex" value="1" > 
                             &nbsp &nbsp女<input type="radio" name="sex" value="0" checked="checked">
                           <%}else{ %>
                             男<input type="radio" name="sex" value="1" > 
                             &nbsp &nbsp女<input type="radio" name="sex" value="0ssssss">
                           <%} %>
                        </div>


 
                        <dl class="form-group">
                            <dt><label for="user_profile_company">密码</label></dt>
                            <dd><input class="form-control" id="password" name="password" size="30" type="password" width="200px" /></dd>
                        </dl>
                        <dl class="form-group">
                            <dt><label for="user_profile_location">重复密码</label></dt>
                            <dd><input class="form-control" id="confirm_password" name="confirm_password" size="30" type="password" width="200px" /></dd>
                        </dl>
                        <dl class="form-group">
                            <dt><label for="user_profile_location">年龄</label></dt>
                            <dd><input class="form-control" id="age" name="age" size="30" type="text" width="200px" /></dd>
                        </dl>
                        
                        <input type="submit" value="提交"> <s:fielderror fieldName="update-result"></s:fielderror>
                    </form>
					</div>
				</div>

			</div>

		</div>
	</div>
</body>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
  <script type="text/javascript">
  	$(function(){
  	 	$("#form1").validate({
  	 		rules:{
                    username:{
                        required:true
                    },
                    
                    password:{
                   		 required:true
                        rangelength:[6,20]
                    },
                    confirm_password:{
                        equalTo:"#password"
                    }              
                },
                messages:{
                    username:{
                        required:"必填"
                    },
                    
                    password:{
                        rangelength: $.validator.format("密码最小长度:{0}, 最大长度:{1}。")
                    },
                    confirm_password:{
                        equalTo:"两次密码输入不一致"
                    }                                    
                }
  	 	});
  	});
  </script>
  <style type="text/css">
  .error{
    color:red;
  }
  </style>
</html>
