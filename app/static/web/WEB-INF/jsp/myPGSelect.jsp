<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>身份选择-家教网</title>
<link href="${pageContext.request.contextPath}/css/register.css" media="all" rel="stylesheet" type="text/css" />

</head>
<body>
	<%@include file="base/site-nav-noLogin.jsp"%>


	<div class='reg_cnt'>
		<div class='preg_img' style="background-image: url(${pageContext.request.contextPath}/image/registerStudent.png)">
			<img alt="Pword" class="pword"
				src="${pageContext.request.contextPath}/image/registerStudentWord.png" /> 
				<a
				href="user/chooseRole.do?chooseRole=parent" class="btn btn-lg btn-success preg_btn">我是家长</a>
		</div>
		<div class='split_line'></div>
		<div class='treg_img' style="background-image: url(${pageContext.request.contextPath}/image/registerTeacher.png)">
			<img alt="Tword" class="tword"
				src="${pageContext.request.contextPath}/image/registerTeacherWord.png" /> <a
				href="user/chooseRole.do?chooseRole=teacher" class="btn btn-lg btn-success reg_btn">我是教师</a>
		</div>
	</div>
	<%@include file="base/footer-div.jsp"%>
</body>
</html>