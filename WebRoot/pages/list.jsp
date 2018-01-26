<%@page import="com.bbs.model.posts"%>
<%@page import="com.bbs.serviceImpl.PostDaoImpl"%>
<%@page import="com.bbs.service.PostDao"%>
<%@page import="com.bbs.model.Subject"%>
<%@page import="com.bbs.serviceImpl.SubjectDapImpl"%>
<%@page import="com.bbs.service.SubjectDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	Subject s = new Subject();
	List<posts> posts = null;
	
	PostDao pDao = new PostDaoImpl();
	
	String pageNumStr = request.getParameter("page");
	int pageNum = 1;
	if (pageNumStr != null)
		pageNum = Integer.parseInt(pageNumStr);
	int SubjectId = 0;
	if (request.getParameter("SubjectId") != null) {
		SubjectId = Integer.parseInt(request.getParameter("SubjectId"));
		SubjectDao sDao = new SubjectDapImpl();
		s = sDao.getSubjectById(SubjectId);
		posts = pDao.getPostByTypeIstop(SubjectId, pageNum, 10);
	}
	List<posts> topPosts = pDao.getPostByIstop(1,SubjectId);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>更多帖子</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<link href="../css/titlebar.css" rel="stylesheet">
<link href="../css/search-result.css" rel="stylesheet" />
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<jsp:include page="/pages/header.jsp" />


	<!-- 帖子列表 -->

	<div class="list-group search-list">
		<a href="#" class="list-group-item active"> <%=s.getSubjectName()%>
		</a>
		<%	if(pageNum==1){
			for (posts topPost : topPosts) {
		%>
		<a href="" class="list-group-item">
			<h4 class="list-group-item-heading"><%=topPost.getTitle()%></h4> <%=topPost.getContent().substring(0, 3)%>..
			<p class="text-right post-date">
				浏览量:<%=topPost.getHasread()%>&nbsp;评论量:<%=pDao.getReplyNumById(topPost.getId())%>&nbsp;发表日期:<%=topPost.getBuildDate()%>
			</p> <span class="label label-primary" style="float:right">顶</span> <%if(topPost.getIsgood()==1){ %>
			<span class="label label-danger" style="float:right">精</span> <%} %> </a>
		<%}} %>
		<%for(posts post:posts){ %>
		<%
			if (post.getStatus() != 0) {
		%>
		<a href="" class="list-group-item">
			<h4 class="list-group-item-heading"><%=post.getTitle()%></h4> <%=post.getContent().substring(0, 3)%>..
			<p class="text-right post-date">
				浏览量:<%=post.getHasread()%>&nbsp;评论量:<%=pDao.getReplyNumById(post.getId())%>&nbsp;发表日期:<%=post.getBuildDate()%></p>
			<%if(post.getIsgood()==1){ %> <span class="label label-danger"
			style="float:right">精</span> <%} %> </a>
		<%
			}
			}
		%>

	</div>


	<ul class="pagination pagination-lg"
		style="float:right;margin-right:45%;">
		<%
			if (pageNum > 1) {
				int pageIndex = pageNum - 1;
		%>
		<li><a
			href="<%=path + "/pages/list.jsp?SubjectId=" + SubjectId
						+ "&page=" + pageIndex%>">&laquo;</a>
		</li>
		<%
			}
			if (pageNum <= 5) {
				for (int i = 1; i <= 5; i++) {
					if (pageNum == i) {
		%>
		<li class="active"><a
			href="<%=path + "/pages/list.jsp?SubjectId="
								+ SubjectId + "&page=" + i%>"><%=i%></a>
		</li>
		<%
			} else {
		%>
		<li><a
			href="<%=path + "/pages/list.jsp?SubjectId="
								+ SubjectId + "&page=" + i%>"><%=i%></a>
		</li>
		<%
			}
					if (i == 5) {
		%>
		<li><a
			href="<%=path + "/pages/list.jsp?SubjectId="
								+ SubjectId + "&page=" + 6%>">&raquo;</a>
		</li>
		<%
			}
				}
			}
			if (pageNum > 5) {
				int maxPage = pageNum + 1;
				for (int i = 4; i >= 0; i--) {
					int pageIndex = pageNum - i;
					if (i == 0) {
		%>

		<li class="active"><a
			href="<%=path + "/pages/list.jsp?SubjectId="
								+ SubjectId + "&page=" + pageIndex%>"><%=pageIndex%></a>
		</li>
		<%
			} else {
		%>

		<li class=""><a
			href="<%=path + "/pages/list.jsp?SubjectId="
								+ SubjectId + "&page=" + pageIndex%>"><%=pageIndex%></a>
		</li>
		<%
			}
				}
		%>
		<li><a
			href="<%=path + "/pages/list.jsp?SubjectId=" + SubjectId
						+ "&page=" + maxPage%>">&raquo;</a>
		</li>
		<%
			}
		%>


	</ul>
	<br>





</body>

</html>
