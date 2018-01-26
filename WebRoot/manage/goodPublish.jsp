<%@page import="com.bbs.model.posts"%>
<%@page import="com.bbs.serviceImpl.PostDaoImpl"%>
<%@page import="com.bbs.service.PostDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

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
if ((Integer) session.getAttribute("popedom") == null) {
		response.sendRedirect("../login.jsp");

	} else if ((Integer) session.getAttribute("popedom") != null) {
		if ((Integer) session.getAttribute("popedom") != 2)
			response.sendRedirect("../login.jsp");
	}
 %>
<body>
	<jsp:include page="/pages/header.jsp" />
	<div style="text-align:center">
		<h1>admin后台管理页面</h1>
	</div>
	<div class="container" style="margin-top: 80px">
		<div class="row">
			<div class="col-xs-3">
				<ul class="nav nav-pills nav-stacked">
					<li role="presentation"><a
						href="<%=path%>/manage/managePost.jsp">帖子管理</a></li>
					<li role="presentation"><a
						href="<%=path%>/manage/change_info.jsp">资料修改</a></li>
					<li role="presentation" class="active"><a
						href="<%=path%>/manage/goodPublish.jsp">精华帖请求</a></li>
					<li role="presentation"><a
						href="<%=path%>/manage/userManage.jsp">用户管理</a></li>
					<li role="presentation"><a
						href="<%=path%>/manage/subjectManage.jsp">模块管理</a></li>
					<li role="presentation"><a
						href="<%=path%>/manage/addSubject.jsp">增加模块</a></li>
				</ul>
			</div>

			<div class="col-md-9">
				<ul class="list-group">
					<a class="list-group-item active"> 精华帖申请列表 </a>
					<%
						String pageNumStr = request.getParameter("page");
						PostDao pDao = new PostDaoImpl();
						int pageNum = 1;
						if (pageNumStr != null)
							pageNum = Integer.parseInt(pageNumStr);
						List<posts> posts = pDao.getPostByStatus(2, pageNum, 10);
						
						for (posts post : posts) {
					%>
					<%
						if (post.getStatus() == 2) {
					%>
					<div class="list-group-item">
						<a href="<%=path%>/pages/post.jsp?id=<%=post.getId() %>" style="color:grey">
							<h4 class="list-group-item-heading" style="color:black"><%=post.getTitle()%></h4>
						</a><%=post.getContent().substring(0,3)%>.....<%if(post.getIsgood()==1) {%>
						<p style="float: right;margin-right: 50px">状态：已通过</p>
						<%}else if(post.getIsgood()==-1) {%>
						<p style="float: right;margin-right: 50px">状态：已拒绝</p>
						<%}else{ %>
						<a href="<%=path %>/judge_good.action?isgood=-1&id=<%=post.getId() %>"
							style="float: right">&nbsp;拒绝</a>&nbsp; <a href="<%=path %>/judge_good.action?isgood=1&id=<%=post.getId() %>"
							style="float: right">&nbsp;同意</a>
							<%} %>
						<p style="float: right;margin-right: 50px">
							发表日期:<%=post.getBuildDate()%></p>
					</div>
					<%
						}
						}
					%>
					<!--分页  -->
					
					<ul class="pagination pagination-lg" style="float:right">
						<%
							if (pageNum > 1) {
								int pageIndex = pageNum - 1;
						%>
						<li><a href="<%=path + "/manage/goodPublish.jsp?page=" + pageIndex%>">&laquo;</a>
						</li>
						<%
							}
							if (pageNum <= 5) {
								for (int i = 1; i <= 5; i++) {
									if (pageNum == i) {
						%>
						<li class="active"><a
							href="<%=path + "/manage/goodPublish.jsp?page=" + i%>"><%=i%></a>
						</li>
						<%
							} else {
						%>
						<li><a href="<%=path + "/manage/goodPublish.jsp?page=" + i%>"><%=i%></a>
						</li>
						<%
							}
									if (i == 5) {
						%>
						<li><a href="<%=path + "/manage/goodPublish.jsp?page=" + 6%>">&raquo;</a>
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
							href="<%=path + "/manage/goodPublish.jsp?page=" + pageIndex%>"><%=pageIndex%></a>
						</li>
						<%
							} else {
						%>

						<li class=""><a
							href="<%=path + "/manage/goodPublish.jsp?page=" + pageIndex%>"><%=pageIndex%></a>
						</li>
						<%
							}
								}
						%>
						<li><a href="<%=path + "/manage/goodPublish.jsp?page=" + maxPage%>">&raquo;</a>
						</li>
						<%}%>


					</ul>
					<br>
			</div>
		</div>
	</div>
</body>
</html>
