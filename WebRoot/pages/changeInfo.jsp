<%@page import="com.bbs.serviceImpl.UserDaoImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.bbs.model.User"%>
<%@page import="com.bbs.serviceImpl.UserDaoImpl"%>
<%@page import="com.bbs.service.UserDao"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'changeInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <jsp:include page="/pages/header.jsp"/>
     
     
     <div class="container" style="margin-top: 30px">
    <div class="row">
        <div class="col-xs-3">
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation" class="active"><a href="<%=basePath%>pages/changeInfo.jsp">资料修改</a></li>
                <li role="presentation"><a href="<%=basePath%>pages/mypost.jsp?page=1">我的帖子</a></li>
                  <li role="presentation"><a href="<%=basePath%>pages/records.jsp">申请记录</a></li>
                  <li role="presentation" ><a href="<%=basePath%>pages/publish.jsp">发表新帖</a></li>
            </ul>

        </div>

        <div class="col-xs-9">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        个人信息修改
                    </h3>
                </div>
                <div class="panel-body">
				<%
					String name = (String)session.getAttribute("username");
					User current = new User();
					System.out.print(name);
					int uid = 0;
					if(name==null)
						response.sendRedirect("../login.jsp"); 				
					else{
					    uid = (Integer)session.getAttribute("uid");
						UserDao uDao = new UserDaoImpl();
						current = uDao.getUserById(uid);
					}	
					
					
				 %>
				<form id="form1" action="<%=path %>/change_info.action" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <img alt="" class="avatar left" height="70" src="<%=path+current.getImagepath()%>" width="70" />
                            请上传你的头像<br/>

                        </div>
                        <input type="file" id="inputfile"  name="photoImg"><br/>

                        <div class="form-group">
                            <label for="name">用户名</label>
                            <input id="username" type="text" class="form-control" name="username" id="username" width="200px" height="80px" value="<%=current.getUsername() %>"
                                   placeholder="请输入名称"> <p class="help-block"><s:fielderror fieldName="username"></s:fielderror></p>
                        </div>

                        <div class="form-group">
                            <label for="name">性 别</label><br/>
                    <% if(current.getSex()==1){%>        
                            男<input type="radio" name="sex" value="1" checked="checked"> 
                             &nbsp &nbsp女<input type="radio" name="sex" value="0">
                           <%}else if(current.getSex()==0){%> 
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
                        <input type="hidden" name="Id" value="<%=uid%>">
                        <input type="submit" value="提交"> <s:fielderror fieldName="update-result"></s:fielderror>
                    </form>
                </div>
            </div>




                </div>
            </div>
        </div>
    </div>
</div>
     
      <jsp:include page="/pages/footer.jsp"/>
  </body>
  <script type="text/javascript" src="js/jquery.validate.min.js"></script>
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript">
  alert(1);
  	$(function(){
  	
  	 	$("#form1").validate({
  	 		rules:{
                    username:{
                        required:true
                    },
                    
                    password:{
                    	
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
                    	required:"必填"
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
  </body>
</html>
