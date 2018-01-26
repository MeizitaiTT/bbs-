<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.bbs.serviceImpl.SubjectDapImpl"%>
<%@page import="com.bbs.model.Subject"%>
<%@page import="com.bbs.service.SubjectDao"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
SubjectDao sDao = new SubjectDapImpl();

List<Subject> subjects = sDao.getAllSubjectByStatus(1);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
   <head>
    <base href="<%=basePath%>">
   
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link href="./css/bootstrap.min.css" rel="stylesheet">
  <link href="./css/titlebar.css" rel="stylesheet">
  <!-- 
  <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
     -->
      <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </head>
  
  <body>
  
  
  <nav class="navbar navbar-inverse" role="navigation">
            <div class="navbar-header">
                <a class="navbar-brand" href="<%=path %>/index.jsp">BBS技术论坛</a>
            </div>
            
            <div>
      <ul class="nav navbar-nav">
         <li><a href="<%=path %>/index.jsp">首页</a></li>
         <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
               精选板块 <b class="caret"></b>
            </a>
           
            <ul class="dropdown-menu">
               
               <li class="divider"></li>
               <%for(Subject subject:subjects) {%>
               <li><a href="pages/list.jsp?SubjectId=<%=subject.getId()%>"><%=subject.getSubjectName() %></a></li>
              <% }%>
              
            </ul>
            
         </li>
          <li><a href="<%=path %>/pages/hotlist.jsp?page=1">论坛热帖</a></li>
          <li><a href="<%=path %>/pages/newlist.jsp?page=1">论坛新帖</a></li>
          <li><a href="<%=path %>/pages/goodlist.jsp?page=1">精华帖</a></li>
      </ul>
   </div>
            
            
            
          <% String username  = (String)session.getAttribute("username");
            Integer popedom = (Integer)session.getAttribute("popedom");
            System.out.print(username);
            System.out.print(popedom);
            if (username == null){
             %>   
                                          
            <ul class="nav navbar-nav navbar-right user">
                <li><a href="<%=basePath %>login.jsp">登陆</a></li>
                <li><a href="<%=basePath %>Regist.jsp">注册</a></li>
            </ul>
            <p class="navbar-text navbar-right">尊敬的游客您好！</p>
            
	      <%}else if(username!=null&&popedom.intValue()==1){	      	      
	       %>
   
           
               <ul class="nav navbar-nav navbar-right user">

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                             <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="<%=basePath+"pages/changeInfo.jsp"%>">设置</a></li>
                            <li><a href="<%=basePath+"pages/mypost.jsp"%>">我的帖子</a></li>
                            <li><a href="<%=basePath+"pages/changeInfo.jsp"%>">我要发帖</a></li>
                            <li class="divider"></li>
                            <li><a href="<%=path%>/logout.action">退出登陆</a></li>
                        </ul>
                    </li>
                </ul>
                 <p class="navbar-text navbar-right">尊敬的用户您好！</p>
             <%}else if(username!=null&&popedom.intValue()==2){
              %>    
               
             
             <ul class="nav navbar-nav navbar-right user">

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                             <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li ><a href="<%=path%>/manage/managePost.jsp">帖子管理</a></li>
			                <li  ><a href="<%=basePath+"manage/change_info.jsp" %>">资料修改</a></li>
			               
			                <li><a href="<%=path%>/manage/goodPublish.jsp">精华帖请求</a></li>
			                <li><a href="<%=path%>/manage/userManage.jsp">用户管理</a></li>
			                <li><a href="<%=path%>/manage/subjectManage.jsp">模块管理</a></li>
			                <li><a href="<%=path%>/manage/addSubject.jsp">增添模块</a></li>
                            <li class="divider"></li>
                            <li><a href="<%=path+"/logout.action"%>">退出登陆</a></li>
                        </ul>
                    </li>
                </ul>
                 <p class="navbar-text navbar-right">尊敬的管理员您好！</p>
             <%} %>
            
                <form class="navbar-form navbar-right" role="search" action="<%=request.getContextPath()%>">
		       <div class="input-group">
	         <input type="text" class="form-control" name="keywords" placeholder="search">
	        <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span> </span>
	     		 </div>
      		</form> 
            </nav>
  
  </body>
</html>
