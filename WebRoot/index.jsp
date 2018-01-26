<%@page import="com.bbs.serviceImpl.SubjectDapImpl"%>
<%@page import="com.bbs.service.SubjectDao"%>
<%@page import="com.bbs.model.Subject"%>
<%@page import="com.bbs.serviceImpl.PostDaoImpl"%>
<%@page import="com.bbs.service.PostDao"%>
<%@page import="com.bbs.model.posts"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh" class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<title>技术论坛</title>
<!-- <link rel="stylesheet" type="text/css" href="css/zzsc-demo.css"> -->
<link href="css/index.css" rel="stylesheet">
<%
	PostDao pDao = new PostDaoImpl();
	List newposts = pDao.getNewTwoPost();
	List goodposts = pDao.getGoodTwoPost();
	SubjectDao sDao = new SubjectDapImpl();
	List<Subject> subjects = sDao.getAllSubject();
 %>
</head>
<body>
	<jsp:include page="/pages/header.jsp" />
	<div style="width: 100%;">


		<div class="container user-info">
			<div class="row">
				<div class="col-xs-12">
					<div id="carousel-example-generic" class="carousel slide"
						data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0"
								class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>
						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<img src="img/2.jpg" alt="...">
								<div class="carousel-caption"></div>
							</div>
							<div class="item">
								<img src="img/2.jpg" alt="...">
								<div class="carousel-caption"></div>
							</div>

							<div class="item">
								<img src="img/1.jpg" alt="...">
								<div class="carousel-caption"></div>
							</div>
						</div>

						<!-- Controls -->
						<a class="left carousel-control" href="#carousel-example-generic"
							role="button" data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span> </a> <a
							class="right carousel-control" href="#carousel-example-generic"
							role="button" data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span> </a>
					</div>
				</div>
			</div>


			<div class="container" style="margin-top: 30px;">
				<div class="col-md-9" style="padding-left:0">
					<ul class="list-group">
						<div class="list-group-item active">
							论坛新帖 <a href="<%=path %>/pages/newlist.jsp?page=1" style="float: right;color: white">更多></a>
							<!--<p style="float: right"></p>-->
						</div>
						<div>
						<%for(int i = 0;i<newposts.size();i++){
							Object[] p =(Object[]) newposts.get(i);
							posts post = (posts)p[0];
							Subject subject = (Subject)p[1];
						 %>
							<a href="<%=path %>/pages/post.jsp?id=<%=post.getId() %>" class="list-group-item">
								<h5>来自话题：<%=subject.getSubjectName() %></h5>
								<h4 class="list-group-item-heading"><%=post.getTitle() %></h4> <%=post.getContent().substring(0, 3) %>...<span
								class="label label-primary" style="float:right">新</span>
								<p class="text-right" style="float: right;margin-right: 20px">浏览量:<%=post.getHasread() %>&nbsp;评论量:<%=pDao.getReplyNumById(post.getId()) %> %></p>
								</a>
						<%} %>		
							
					</ul>
				</div>
				<div class="col-md-3">
					<ul class="list-group">
						<div class="list-group-item active">论坛公告</div>

						<a href="" class="list-group-item">
							<p>欢迎来到BBS技术论坛，本论坛只有会员才可查看论坛帖子，若您想继续浏览，请注册！</p>
							<p>祝您愉快</p>
						</a>

					</ul>
					<a href="<%=path %>/pages/publish.jsp"><button type="button" class="btn btn-primary"
							style="width: 200px;height:50px;margin-left: 30px">我要发帖</button>
					</a>
				</div>
			</div>
			<div class="container">
				<div class="col-md-9" style="padding-left:0">

					<ul class="list-group">
						<div class="list-group-item active">
							精华帖 <a href="<%=path %>/pages/goodlist.jsp?page=1" style="float: right;color: white">更多></a>
							<!--<p style="float: right"></p>-->
						</div>
						
						<%for(int i = 0;i<goodposts.size();i++){
							Object[] p =(Object[]) newposts.get(i);
							posts post = (posts)p[0];
							Subject subject = (Subject)p[1];
						 %>
							<a href="<%=path %>/pages/post.jsp?id=<%=post.getId() %>" class="list-group-item">
								<h5>来自话题：<%=subject.getSubjectName() %></h5>
								<h4 class="list-group-item-heading"><%=post.getTitle() %></h4> <%=post.getContent().substring(0, 3) %>...<span
								class="label label-danger" style="float:right">精</span>
								<p class="text-right" style="float: right;margin-right: 20px">浏览量:<%=post.getHasread() %>&nbsp;评论量:<%=pDao.getReplyNumById(post.getId()) %> %></p>
							</a>
						<%} %>
						

					</ul>

				</div>
			</div>
			<div>

				<hr />
				<div class="col-sm-12">
					<h3 style="margin-top: 20px;margin-left: 15px">板块分类</h3>
					<hr />
					<div class="container">
					<%for(int i = 0;i<subjects.size();i++){
						Subject temp = subjects.get(i);
						if(i%4==1){
					 %>
						<div class="row">
						<%} %>
							<div class="col-md-3 col-sm-12">
								<a href="pages/list.jsp?SubjectId=<%=temp.getId()%>">
									<div class="main-forum"style="background-color:white">
									<div>
									<img alt="" src=".<%=temp.getImagepath()%>"style="height:80px;width:80px">
									</div>
										<h4 style="color:black"><%=temp.getSubjectName() %></h4>
										<h5 style="color:black"><%=temp.getSubjectDescription() %></h5>
									</div> </a>

							</div>
						<%if(i%4==4) {%>
						</div>
						<%}} %>
							




				</div>


			</div>
		</div>
	</div>
	</div>
	<jsp:include page="/pages/footer.jsp" />
</body>
</html>