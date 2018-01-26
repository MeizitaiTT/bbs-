<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<%
if ((Integer) session.getAttribute("popedom") == null) {
		response.sendRedirect("../login.jsp");

	} else if ((Integer) session.getAttribute("popedom") != null) {
		if ((Integer) session.getAttribute("popedom") != 2)
			response.sendRedirect("../login.jsp");
	}
 %>
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
<div style="text-align:center"><h1>admin后台管理页面</h1></div>
	<div class="container" style="margin-top: 80px">
		<div class="row">
			<div class="col-xs-3">
				<ul class="nav nav-pills nav-stacked">
					<li role="presentation"><a href="<%=path%>/manage/managePost.jsp">帖子管理</a>
					</li>
					<li role="presentation"><a
						href="<%=path%>/manage/change_info.jsp">资料修改</a></li>
					<li role="presentation"><a
						href="<%=path%>/manage/goodPublish.jsp">精华帖请求</a></li>
					<li role="presentation" ><a
						href="<%=path%>/manage/userManage.jsp">用户管理</a></li>
					<li role="presentation"><a
						href="<%=path%>/manage/subjectManage.jsp">模块管理</a></li>
						<li role="presentation"class="active" ><a
						href="<%=path%>/manage/addSubject.jsp">增加模块</a>
					</li>
				</ul>
			</div>

			<div class="col-md-9">
				<div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        增加主题
                    </h3>
                </div>
                <div class="panel-body">
				
				<form id="form1" action="<%=path %>/add_subject.action" method="post" enctype="multipart/form-data">


                        <div class="form-group">
                            <img alt="" class="avatar left" height="70" src="" width="70" />
                            请上传你的主题头像<br/>

                        </div>
                        <input type="file" id="inputfile" accept="image/*" name="photoImg"><br/>

                        <div class="form-group">
                            <label for="name">主题名</label>
                            <input id="username" type="text" class="form-control" name="subjectName" id="name" width="200px" height="80px" value=""
                                   placeholder="请输入名称"> <p class="help-block"><s:fielderror fieldName="subjectName"></s:fielderror></p>
                        </div>
                        <div class="form-group">
                            <label for="name">主题描述</label>
                            <input id="username" type="text" class="form-control" name="subjectDescription" id="name" width="200px" height="80px" value=""
                                   placeholder="请输入名称"> <p class="help-block"><s:fielderror fieldName="update_result"></s:fielderror></p>
                        </div>

                        


                       
                        
                 
                        <input type="submit" value="提交"> <s:fielderror fieldName="update-result"></s:fielderror>
                    </form>
                </div>
            </div>
				
			</div>
		</div>
	</div>
</body>
</html>
