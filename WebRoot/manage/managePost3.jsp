<%@page import="com.bbs.serviceImpl.SubjectDapImpl"%>
<%@page import="com.bbs.service.SubjectDao"%>
<%@page import="com.bbs.model.Subject"%>
<%@page import="com.bbs.model.posts"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
if ((Integer) session.getAttribute("popedom") == null) {
		response.sendRedirect("../login.jsp");

	} else if ((Integer) session.getAttribute("popedom") != null) {
		if ((Integer) session.getAttribute("popedom") != 2)
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
						href="<%=path%>/manage/managePost.jsp">帖子管理</a>
					</li>
					<li role="presentation"><a
						href="<%=path%>/manage/change_info.jsp">资料修改</a></li>
					<li role="presentation"><a
						href="<%=path%>/manage/goodPublish.jsp">精华帖请求</a></li>
					<li role="presentation"><a
						href="<%=path%>/manage/userManage.jsp">用户管理</a></li>
					<li role="presentation"><a
						href="<%=path%>/manage/subjectManage.jsp">模块管理</a></li>
						<li role="presentation" ><a
						href="<%=path%>/manage/addSubject.jsp">增加模块</a>
					</li>
				</ul>
			</div>

			 <div class="col-xs-9">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        发布新的帖子
                    </h3>
                </div>
                <div class="panel-body">
				
				<form id="form1" action="<%=path %>/update_post.action?id=<%=post.getId() %>&user=admin" method="post" enctype="multipart/form-data">
				<div class="ibox-content">
					<div class="form-group">
                                <label class="col-sm-2 control-label">文章标题</label>

                                <div class="col-sm-10">
                                
                                    <input type="text" class="form-control" name="title" value="<%=post.getTitle()%>">
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
                                <textarea name="content" data-provide="markdown" rows="10" value="<%=post.getContent()%>"><%=post.getContent()%></textarea>
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
		</div>
	</div>
</body>
</html>
