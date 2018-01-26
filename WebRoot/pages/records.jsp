<%@page import="com.bbs.serviceImpl.PostDaoImpl"%>
<%@page import="com.bbs.model.posts"%>
<%@page import="com.bbs.service.PostDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'records.jsp' starting page</title>
    
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
  if (session.getAttribute("username") == null){
	response.sendRedirect("../login.jsp");
	}
   %>
  <body>
    <jsp:include page="/pages/header.jsp"/>
   
   <div class="container" style="margin-top: 30px">
    <div class="row">
        <div class="col-xs-3">
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation" ><a href="<%=basePath%>pages/changeInfo.jsp">资料修改</a></li>
                <li role="presentation"><a href="<%=basePath%>pages/mypost.jsp">我的帖子</a></li>
                <li role="presentation" class="active"><a href="">申请记录</a></li>
                <!--<li role="presentation"><a href="#">Messages</a></li>-->
                <li role="presentation" ><a href="<%=basePath%>pages/publish.jsp">发表新帖</a></li>
            </ul>
        </div>

        <div class="col-md-9">

            <ul class="list-group">
                <a class="list-group-item active">
                    申请记录
                </a>

                <%                
                  	String pageNumStr = request.getParameter("page");
                  	PostDao pDao = new PostDaoImpl(); 
                  	int pageNum = 1;
                  	if (pageNumStr != null)
                  	   	pageNum = Integer.parseInt(pageNumStr);
                  	List<posts> posts = pDao.getPostByUserId((Integer)session.getAttribute("uid"),pageNum,10); 
                 	System.out.print(session.getAttribute("uid"));
                 	for(posts post:posts ){
               %>
              
                <%if(post.getStatus()==2){ %>
                <div class="list-group-item">
                    <a href="" style="color:grey">
                    <%=post.getTitle() %>
                    </a>
                    <%if(post.getIsgood()==1){ %>
                    <p style="float: right;margin-right: 50px">状态：已通过</p>
                    <%}else if(post.getIsgood()==-1){ %>
                    <p style="float: right;margin-right: 50px">状态：未通过</p>
                    <%} else if(post.getIsgood()==0){%>
                    <p style="float: right;margin-right: 50px">状态：审核中</p>
                    <%} %>
                </div>
 				<%}} %>
            </ul>
            
<ul class="pagination pagination-lg" style="float:right">
<% if (pageNum>1) { int pageIndex = pageNum -1;%>
    <li><a href="<%=path+"/pages/records.jsp?page="+pageIndex%>">&laquo;</a></li>
    <%}
    	if (pageNum<=5){
    		for (int i=1; i<=5; i++){
    		if (pageNum == i){
     %>
    <li class="active"><a href="<%=path+"/pages/records.jsp?page="+i%>"><%=i %></a></li>
    <%}else {
     %>
    <li><a href="<%=path+"/pages/records.jsp?page="+i%>"><%=i%></a></li>
    <%}
    if (i ==5){
    %>
     <li><a href="<%=path+"/pages/records.jsp?page="+6%>">&raquo;</a></li>
   <%}}}
    if (pageNum >5){
    int maxPage = pageNum+1;
    for (int i=4; i>=0; i--){
    	int pageIndex = pageNum - i;
    	if (i==0){
     %>
   
     <li class="active"><a href="<%=path+"/pages/records.jsp?page="+pageIndex%>"><%=pageIndex%></a></li>
   <%}else {%>
    
     <li class=""><a href="<%=path+"/pages/records.jsp?page="+pageIndex%>"><%=pageIndex%></a></li>
     <%}}%>
      <li><a href="<%=path+"/pages/records.jsp?page="+maxPage%>">&raquo;</a></li>
    <%}%>
    
   
</ul><br>

        </div>
    </div>
</div>
  </body>
</html>
