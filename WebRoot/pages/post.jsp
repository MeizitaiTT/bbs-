<%@page import="com.bbs.model.reply"%>
<%@page import="com.bbs.serviceImpl.ReplyDaoImpl"%>
<%@page import="com.bbs.service.ReplyDao"%>
<%@page import="com.bbs.model.User"%>
<%@page import="com.bbs.serviceImpl.UserDaoImpl"%>
<%@page import="com.bbs.service.UserDao"%>
<%@page import="com.bbs.serviceImpl.SubjectDapImpl"%>
<%@page import="com.bbs.service.SubjectDao"%>
<%@page import="com.bbs.model.Subject"%>
<%@page import="com.bbs.model.posts"%>
<%@page import="com.bbs.serviceImpl.PostDaoImpl"%>
<%@page import="com.bbs.service.PostDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
if (session.getAttribute("username") == null){
	response.sendRedirect("../login.jsp");
} 

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'post.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="./css/post-detail.css" rel="stylesheet">
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<%
  	int postId = Integer.parseInt(request.getParameter("id"));
  	PostDao pDao = new PostDaoImpl(); 	
  	posts post = pDao.getPostById(postId);
  	int subjectId = post.getSubjectId();
  	int userId = post.getUserId();  	
  	UserDao uDao = new UserDaoImpl();
  	User user = uDao.getUserById(userId);
  	SubjectDao sDao = new SubjectDapImpl();
  	Subject subject = sDao.getSubjectById(subjectId);
  	String pageNumStr = request.getParameter("page");
	int pageNum = 1;
	if (pageNumStr != null)
		pageNum = Integer.parseInt(pageNumStr);
	ReplyDao rDao = new ReplyDaoImpl();
	List replys = rDao.getReplyByPostid(postId,pageNum,5);
   %>
<body>
	<jsp:include page="/pages/header.jsp" />
	<div class="container" style="margin-top: 50px">
		<%if(pageNum==1) {%>
		<div class="row">
			<div class="col-md-1 post-border"></div>
			<div class="col-md-2 post-head">
				<!--<img src="img/tm-bg-slide-1.jpg" width="80px" height="80px" class="img-responsive img-circle">-->
				<img alt="" class="img-responsive img-circle"
					src="./upload/133845.57482217.jpg"
					style="margin:1px 1px;width: 120px;height: 120px;margin: 30px auto;" />

				<span class="user-info"> <span class="badge"
					style="background: #f1c40f;margin-top: 5px">发帖者</span> :<span
					style="margin-top: 5px"><%=user.getUsername() %></span> </span><br /> <span
					class="user-info"> <span class="badge"
					style="background: #2ecc71;margin-top: 5px">性别</span> :<%if(user.getSex()==1){ %><span
					style="background: #;margin-top: 5px">男</span>
					<%}else{ %> <span style="background: #;margin-top: 5px">女</span>
					<%} %> </span><br /> <span class="user-info"> <span class="badge"
					style="background: #ff6927;margin-top: 5px">注册时间</span>: <span
					style="margin-top: 5px"><%=user.getbirthDay() %></span> </span> <br>
			</div>
			<div class="col-md-8 post-content">

				<div class="post-title">
					<h2 style="margin-left:20px;color:black"><%=post.getTitle() %></h2>
					<div style="margin-left:20px">

						<span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;
						&nbsp;|&nbsp;<span>发表于:<%=post.getBuildDate() %></span>
						<%if(session.getAttribute("popedom")!=null){
 						if((Integer)session.getAttribute("popedom")==2){                   
                     %>
						<a style="float:right;margin-right: 20px;" href="">编辑</a>
						<%}} %>
					</div>
					<strong style=" float:right;margin-right:10px;margin-top: 10px">
						<span class="badge" style="background: #ff6927;width: 50px;">楼主</span>
					</strong>

				</div>
				<div style="margin: 20px">
					<%=post.getContent() %>
				</div>

			</div>
			<div class="col-md-1 post-border"></div>




		</div>
		<%} %>
	</div>







	<!-- 回复内容 -->
	<%for(int i=0;i<replys.size();i++) {
		Object[] rObject =(Object[]) replys.get(i);
		reply r =(reply) rObject[0];
		User u = (User) rObject[1];
	%>
	<div class="container">
		<div class="row" style="margin-top: 5px">
			<div class="col-md-1 reply-border"></div>
			<div class="col-md-2 reply-head">
				<img alt="" class="img-responsive img-circle"
					src=".<%=u.getImagepath() %>"
					style="margin:1px 1px;width: 120px;height: 120px;margin: 30px auto;" />
				<span class="user-info"> <span class="badge"
					style="background: #f1c40f;margin-top: 5px">姓名</span> :<%=u.getUsername() %><span
					class="badge" style="background: #f1c40f;margin-top: 5px"></span> </span><br />
				<span class="user-info"> <span class="badge"
					style="background: #2ecc71;margin-top: 5px">性别</span> :<%if(u.getSex()==1){ %>男<%}else{ %>女<%} %><span
					class="badge" style="background: #2ecc71;margin-top: 5px"></span> </span><br />
				<span class="user-info"> <span class="badge"
					style="background: #ff6927;margin-top: 5px">注册时间</span>: <%=u.getbirthDay() %><span
					class="badge" style="background: #ff6927;margin-top: 5px"></span> </span>
				<br>


			</div>
			<div class="col-md-8 reply-content">
				<div class="reply-time">
				
					<span style="color: gray">回复于:<%=r.getBuildDate() %></span>
					<%if(i==0){ %> <span class="badge"
						style="float:right;margin-right:10px;background: #ff6927;width: 50px;">沙发</span>
				<%} else if(i==1){%>
					<span class="badge"
						style="float:right;margin-right:10px;background: #ff5959;width: 50px;">板凳</span>
				<%}else if(i==2){ %>
					<span class="badge"
						style="float:right;margin-right:10px;background: #4b9ded;width: 50px;">地板</span>
				<%}else{ %>
					<span class="badge"
						style="float:right;margin-right:10px;background: #4b9ded;width: 50px;">第<%=i+1 %>楼</span>
				<%} %>

				</div>
				<div style="margin: 20px;"></div>
				
				<%=r.getContent() %>
			</div>
			<div class="col-md-1 reply-border"></div>			
		</div>
	</div>
<% }%>

	<!--这里是回复的分页  样式再调-->

	 <ul class="pagination pagination-lg" style="float:right;margin-right:45%">
<% if (pageNum>1) { int pageIndex = pageNum -1;%>
    <li><a href="<%=path+"/pages/post.jsp?id="+postId+"&page="+pageIndex%>">&laquo;</a></li>
    <%}
    	if (pageNum<=5){
    		for (int i=1; i<=5; i++){
    		if (pageNum == i){
     %>
    <li class="active"><a href="<%=path+"/pages/post.jsp?id="+postId+"&page="+i%>"><%=i %></a></li>
    <%}else {
     %>
    <li><a href="<%=path+"/pages/post.jsp?id="+postId+"&page="+i%>"><%=i%></a></li>
    <%}
    if (i ==5){
    %>
     <li><a href="<%=path+"/pages/post.jsp?id="+postId+"&page="+6%>">&raquo;</a></li>
   <%}}}
    if (pageNum >5){
    int maxPage = pageNum+1;
    for (int i=4; i>=0; i--){
    	int pageIndex = pageNum - i;
    	if (i==0){
     %>
   
     <li class="active"><a href="<%=path+"/pages/post.jsp?id="+postId+"&page="+pageIndex%>"><%=pageIndex%></a></li>
   <%}else {%>
    
     <li class=""><a href="<%=path+"/pages/post.jsp?id="+postId+"&page="+pageIndex%>"><%=pageIndex%></a></li>
     <%}}%>
      <li><a href="<%=path+"/pages/post.jsp?id="+postId+"&page="+maxPage%>">&raquo;</a></li>
    <%}%>
    </ul>
	<br>
	<%
  		int cuserId = 0;
  		if(session.getAttribute("uid")!=null){
  			cuserId = (Integer)session.getAttribute("uid");
  		}
  	 %>
	<!-- 文本编辑器，可以选择别的 -->
	<div style="height: 200px;margin: 70px auto; width: 800px;">
		<form action="<%=path %>/add_reply.action" method="post">
			<input type="hidden" name="postId" value="<%=post.getId()%>">
			<input type="hidden" name="subjectId" value="<%=subject.getId()%>">
			<input type="hidden" name="userId" value="<%=cuserId%>">
			<div style="margin: 5px auto;height: 100px; width: 800px">
				<textarea id="TextArea1" cols="20" rows="1" name="content"
					class="ckeditor"></textarea>

			</div>
			<s:fielderror fieldName="limit"></s:fielderror>
			<div style="float:right;margin: 60px auto">
				<input type="submit" class="btn btn-primary" style="width: 60px;"
					value="回复"></input>
			</div>
		</form>
	</div>

</body>
</html>
