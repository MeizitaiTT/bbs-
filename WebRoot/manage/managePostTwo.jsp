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
<%
	if ((Integer) session.getAttribute("popedom") == null) {
		response.sendRedirect("../login.jsp");

	} else if ((Integer) session.getAttribute("popedom") != null) {
		if ((Integer) session.getAttribute("popedom") != 2)
			response.sendRedirect("../login.jsp");
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'managePost.jsp' starting page</title>

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
	<jsp:include page="/pages/header.jsp" />
	<div style="text-align:center">
		<h1>admin后台管理页面</h1>
	</div>
	<div class="container" style="margin-top: 80px">
		<div class="row">
			<div class="col-xs-3">
				<ul class="nav nav-pills nav-stacked">
					<li role="presentation" class="active"><a
						href="<%=path%>/manage/managePost.jsp">帖子管理</a></li>
					<li role="presentation"><a
						href="<%=path%>/manage/change_info.jsp">资料修改</a>
					</li>
					<li role="presentation"><a
						href="<%=path%>/manage/goodPublish.jsp">精华帖请求</a>
					</li>
					<li role="presentation"><a
						href="<%=path%>/manage/userManage.jsp">用户管理</a>
					</li>
					<li role="presentation"><a
						href="<%=path%>/manage/subjectManage.jsp">模块管理</a>
					</li>
					<li role="presentation"><a
						href="<%=path%>/manage/addSubject.jsp">增加模块</a></li>
				</ul>
			</div>

			<div class="col-md-9">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<a class="list-group-item active"> 所有帖子 </a>
						<div class="ibox-content">
							<%
								int type = Integer.parseInt(request.getParameter("Id"));
								String pageNumStr = request.getParameter("page");
								PostDao pDao = new PostDaoImpl();
								int pageNum = 1;
								if (pageNumStr != null)
									pageNum = Integer.parseInt(pageNumStr);
								List<posts> posts = pDao.getPostByType(type, pageNum, 10);
								System.out.print(session.getAttribute("uid"));
							%>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>id</th>
										<th>文章名</th>
										<th>文章浏览数</th>
										<th>文章回帖数</th>
										<th>文章生成时间</th>
										<th>文章作者Id</th>
										<th>修改</th>
										<th>显示</th>
									</tr>
								</thead>
								<tbody>
									<%
										for (posts post : posts) {
									%>
									<tr>
										<td><%=post.getId() %></td>
										<td><%=post.getTitle() %></td>
										<td><%=post.getHasread() %></td>
										<td><%=pDao.getReplyNumById(post.getId()) %></td>
										<td><%=post.getBuildDate() %></td>
										<td><%=post.getUserId() %></td>
										
										<td><a href="<%=path%>/admin_edit_post.action?postId=<%=post.getId()%>">进入</a>/
										<%if(post.getStatus()!=0) {%>
										<a href="<%=path%>/admin_delete_post?Id=<%=post.getId()%>">删除</a>
										<%}else{ %>
										<p style="float: right;margin-right: 50px">已删除</p>
										<%} %>
										</td>
										<td>
										<%if(post.getIsgood()==0) {%>									
										<a href="<%=path%>/judge_good.action?isgood=1&id=<%=post.getId() %>">加精</a>
										<%}else if(post.getIsgood()==1){%>										
										<p style="float: right;margin-right: 50px">已加精</p>
										<%}else if(post.getIsgood()==-1){%>
										<p style="float: right;margin-right: 50px">已拒绝加精<a href="<%=path%>/judge_good.action?isgood=1&id=<%=post.getId() %>">再加精</a></p>
										<%} %>
										<%if(post.getIstop()!=1) {%>
										<a href="<%=path%>/set_top.action?istop=1&Id=<%=post.getId() %>">置顶</a>
										<%}else{ %>
										<a href="<%=path%>/set_top.action?istop=0&Id=<%=post.getId() %>">取消置顶</a>
										<%} %>
										</td>

									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<ul class="pagination pagination-lg" style="float:right">
					<%
						if (pageNum > 1) {
							int pageIndex = pageNum - 1;
					%>
					<li><a href="<%=path + "/manage/managePostTwo.jsp?Id="+type+"&page=" + pageIndex%>">&laquo;</a>
					</li>
					<%
						}
						if (pageNum <= 5) {
							for (int i = 1; i <= 5; i++) {
								if (pageNum == i) {
					%>
					<li class="active"><a
						href="<%=path + "/manage/managePostTwo.jsp?Id="+type+"&page=" + i%>"><%=i%></a>
					</li>
					<%
						} else {
					%>
					<li><a href="<%=path + "/manage/managePostTwo.jsp?Id="+type+"&page=" + i%>"><%=i%></a>
					</li>
					<%
						}
								if (i == 5) {
					%>
					<li><a href="<%=path + "/manage/managePostTwo.jsp?Id="+type+"&page=" + 6%>">&raquo;</a>
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
						href="<%=path + "/manage/managePostTwo.jsp?Id="+type+"&page=" + pageIndex%>"><%=pageIndex%></a>
					</li>
					<%
						} else {
					%>

					<li class=""><a
						href="<%=path + "/manage/managePostTwo.jsp?Id="+type+"&page=" + pageIndex%>"><%=pageIndex%></a>
					</li>
					<%
						}
							}
					%>
					<li><a href="<%=path + "/manage/managePostTwo.jsp?Id="+type+"&page=" + maxPage%>">&raquo;</a>
					</li>
					<%
						}
					%>


				</ul>
			</div>
		</div>
	</div>
</body>
</html>
