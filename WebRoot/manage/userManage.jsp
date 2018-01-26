<%@page import="com.bbs.model.User"%>
<%@page import="com.bbs.serviceImpl.UserDaoImpl"%>
<%@page import="com.bbs.service.UserDao"%>
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
						href="<%=path%>/manage/change_info.jsp">资料修改</a>
					</li>
					<li role="presentation"><a
						href="<%=path%>/manage/goodPublish.jsp">精华帖请求</a>
					</li>
					<li role="presentation" class="active"><a
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
						<a class="list-group-item active"> 所有用户信息 </a>
						<%
							String pageNumStr = request.getParameter("page");
							UserDao pDao = new UserDaoImpl();
							int pageNum = 1;
							if (pageNumStr != null)
								pageNum = Integer.parseInt(pageNumStr);
							List<User> users = pDao.getUserByPopedom(1, pageNum, 10);
							System.out.print(session.getAttribute("uid"));
						%>
						<div class="ibox-content">

							<table class="table table-hover">
								<thead>
									<tr>
										<th>id</th>
										<th>姓名</th>
										<th>年龄</th>
										<th>性别</th>
										<th>身份</th>
										<th>注册时间</th>
										<th>状态</th>
										<th>操作</th>

									</tr>
								</thead>
								<tbody>
									<%
										for (User user : users) {
									%>
									<tr>
										<td><%=user.getId()%></td>
										<td><%=user.getUsername()%></td>
										<td><%=user.getAge()%></td>
										<%
											if (user.getSex() == 1) {
										%>
										<td>男</td>
										<%
											} else {
										%>
										<td>女</td>
										<%
											}
										%>
										<td>会员</td>
										<td><%=user.getbirthDay()%></td>
										<%
											if (user.getStatus() == 0) {
										%>
										<td>已删除</td>
										<%
											} else {
										%>
										<td>正常</td>
										<%
											}
										%>
										<td><a
											href="<%=basePath%>manage/changeUserInfo.jsp?Id=<%=user.getId()%>">修改</a>/<a
											href="<%=path%>/delete_user.action?Id=<%=user.getId()%>"">删除</a>
										</td>
										<td></td>
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
					<li><a
						href="<%=path + "/manage/userManage.jsp?page=" + pageIndex%>">&laquo;</a>
					</li>
					<%
						}
						if (pageNum <= 5) {
							for (int i = 1; i <= 5; i++) {
								if (pageNum == i) {
					%>
					<li class="active"><a
						href="<%=path + "/manage/userManage.jsp?page=" + i%>"><%=i%></a></li>
					<%
						} else {
					%>
					<li><a href="<%=path + "/manage/userManage.jsp?page=" + i%>"><%=i%></a>
					</li>
					<%
						}
								if (i == 5) {
					%>
					<li><a href="<%=path + "/manage/userManage.jsp?page=" + 6%>">&raquo;</a>
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
						href="<%=path + "/manage/userManage.jsp?page="
								+ pageIndex%>"><%=pageIndex%></a>
					</li>
					<%
						} else {
					%>

					<li class=""><a
						href="<%=path + "/manage/userManage.jsp?page="
								+ pageIndex%>"><%=pageIndex%></a>
					</li>
					<%
						}
							}
					%>
					<li><a
						href="<%=path + "/manage/userManage.jsp?page=" + maxPage%>">&raquo;</a>
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
