<%@page import="com.bbs.serviceImpl.PostDaoImpl"%>
<%@page import="com.bbs.service.PostDao"%>
<%@page import="com.bbs.model.Subject"%>
<%@page import="com.bbs.serviceImpl.SubjectDapImpl"%>
<%@page import="com.bbs.service.SubjectDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
<div style="text-align:center"><h1>admin后台管理页面</h1></div>
	<div class="container" style="margin-top: 80px">
		<div class="row">
			<div class="col-xs-3">
				<ul class="nav nav-pills nav-stacked">
					<li role="presentation" class="active"><a href="<%=path%>/manage/managePost.jsp">帖子管理</a>
					</li>
					<li role="presentation"><a
						href="<%=path%>/manage/change_info.jsp">资料修改</a></li>
					<li role="presentation"><a
						href="<%=path%>/manage/goodPublish.jsp">精华帖请求</a></li>
					<li role="presentation" ><a
						href="<%=path%>/manage/userManage.jsp">用户管理</a></li>
					<li role="presentation"><a
						href="<%=path%>/manage/subjectManage.jsp">模块管理</a></li>
						<li role="presentation" ><a
						href="<%=path%>/manage/addSubject.jsp">增加模块</a>
					</li>
				</ul>
			</div>

			<div class="col-md-9">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<a class="list-group-item active"> 所有板块 </a>
						<div class="ibox-content">
<%

	SubjectDao sDao = new SubjectDapImpl();
	List<Subject> subjects = sDao.getAllSubjectByStatus(1);
	PostDao pDao = new PostDaoImpl();
	
%>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>id</th>
										<th>板块名</th>
										<th>板块帖子数</th>
										<th>板块描述</th>
										<th>板块生成时间</th>
										<th>板块管理者</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<%
										for (Subject subject : subjects) {
									%>
									<tr>
										<td><%=subject.getId()%></td>
										<td><%=subject.getSubjectName()%></td>
										<td><%=pDao.getPostNumBySubject(subject.getId())%></td>
										<td><%=subject.getSubjectDescription()%></td>
										<td><%=subject.getbuildDate()%></td>
										<td><%=subject.getManagerId()%></td>
										<td><a
											href="<%=basePath%>manage/managePostTwo.jsp?Id=<%=subject.getId()%>">进入</a>
											
										</td>

									</tr>
									<%} %>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
  </body>
</html>
