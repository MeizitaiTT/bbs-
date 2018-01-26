<%@page import="com.bbs.serviceImpl.SubjectDapImpl"%>
<%@page import="com.bbs.model.Subject"%>
<%@page import="com.bbs.service.SubjectDao"%>
<%@page import="com.bbs.model.posts"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
if (session.getAttribute("username") == null){
	response.sendRedirect("../login.jsp");
} 
posts post= (posts)request.getAttribute("post");

SubjectDao sDao = new SubjectDapImpl();

List<Subject> subjects = sDao.getAllSubjectByStatus(1);
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
<link href="./css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="./css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="./css/animate.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="./css/plugins/markdown/bootstrap-markdown.min.css" />


</head>

<body>
	<jsp:include page="/pages/header.jsp" />


	<div class="container" style="margin-top: 30px">
		<div class="row">
			<div class="col-xs-3">
				<ul class="nav nav-pills nav-stacked">
					<li role="presentation"><a
						href="<%=basePath%>pages/changeInfo.jsp">资料修改</a>
					</li>
					<li role="presentation"><a
						href="<%=basePath%>pages/mypost.jsp?page=1">我的帖子</a>
					</li>
					<li role="presentation"><a
						href="<%=basePath%>pages/records.jsp">申请记录</a>
					</li>
					<li role="presentation" class="active"><a
						href="<%=basePath%>pages/publish.jsp">发表新帖</a>
					</li>
				</ul>

			</div>
			<%if(post==null){ %>
			<div class="col-xs-9">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">发布新的帖子</h3>
					</div>
					<div class="panel-body">

						<form id="form1" action="<%=path %>/publish_post.action"
							method="post" enctype="multipart/form-data">
							<div class="ibox-content">
								<div class="form-group">
									<label class="col-sm-2 control-label">文章标题</label>

									<div class="col-sm-10">

										<input type="" class="form-control" name="title">
									</div>
									<s:fielderror fieldName="limit"></s:fielderror>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label">文章内容</label>
									<div class="col-sm-10">
										<div class="ibox float-e-margins">
											<div class="ibox-title">
												<h5>请输入文章内容</h5>

											</div>
											<div class="ibox-content">
												<textarea name="content" data-provide="markdown" rows="10"></textarea>
											</div>
										</div>

									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" style="margin-top:15px">选择板块</label>

									<div class="col-sm-10" style="margin-top:15px">
										<select class="form-control m-b" name="subjectId">
											<%for(Subject subject:subjects) {%>
											<option value="<%=subject.getId()%>"><%=subject.getSubjectName() %></option>
											<%} %>

										</select>


									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 col-sm-offset-2" style="margin-top:15px">
										<button class="btn btn-primary" type="submit">保存内容</button>

										<button class="btn btn-white" type="submit">取消</button>
									</div>
								</div>
							</div>


						</form>
					</div>
				</div>
			</div>
			<%}else{ %>
			<div class="col-xs-9">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">发布新的帖子</h3>
					</div>
					<div class="panel-body">

						<form id="form1"
							action="<%=path %>/update_post.action?id=<%=post.getId() %>"
							method="post" enctype="multipart/form-data">
							<div class="ibox-content">
								<div class="form-group">
									<label class="col-sm-2 control-label">文章标题</label>

									<div class="col-sm-10">

										<input type="text" class="form-control" name="title"
											value="<%=post.getTitle()%>">
									</div>
									<s:fielderror fieldName="limit"></s:fielderror>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label">文章内容</label>
									<div class="col-sm-10">
										<div class="ibox float-e-margins">
											<div class="ibox-title">
												<h5>请输入文章内容</h5>

											</div>
											<div class="ibox-content">
												<textarea name="content" data-provide="markdown" rows="10"
													value="<%=post.getContent()%>"><%=post.getContent()%></textarea>
											</div>
										</div>

									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" style="margin-top:15px">选择板块</label>

									<div class="col-sm-10" style="margin-top:15px">
										<select class="form-control m-b" name="subjectId">
											<%for(Subject subject:subjects) {%>
											<option value="<%=subject.getId()%>"><%=subject.getSubjectName() %></option>
											<%} %>

										</select>


									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 col-sm-offset-2" style="margin-top:15px">
										<button class="btn btn-primary" type="submit">保存内容</button>

										<button class="btn btn-white" type="submit">取消</button>
									</div>
								</div>
							</div>


						</form>
					</div>
				</div>
			</div>
			<%} %>
		</div>
	</div>
	</div>
	</div>

	<jsp:include page="/pages/footer.jsp" />
	<script type="text/javascript" src="js/plugins/markdown/markdown.js"></script>
	<script type="text/javascript" src="js/plugins/markdown/to-markdown.js"></script>
	<script type="text/javascript"
		src="js/plugins/markdown/bootstrap-markdown.js"></script>
	<script type="text/javascript"
		src="js/plugins/markdown/bootstrap-markdown.zh.js"></script>
</body>


</html>
