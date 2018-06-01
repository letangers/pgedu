<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>订单详情</title>
<link href="${pageContext.request.contextPath}/css/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.js"
	type="text/javascript"></script>
</head>
<body>



	<div
		style="width: 910px; height:900px; padding: 0px; border: 1px solid #dfdfdf; margin:0px auto; background-color: #fdfdfe">
		<div class='p_block'>
			<div class='p_block_title p_content_block_title'>
				<h4>
					<i class='glyphicon glyphicon-pencil'></i> 订单详情
				</h4>
			</div>
		</div>
		<div class="p_block">
				<div class='order-step-title' style="width: 880px;">家教信息</div>
				<div class='order-step-info' style="width: 880px;">
					<div class='order-info-image' style="padding-left: 0px;width: 150px;padding-top: 10px;">
						<img class="img-circle" src="${teacherUser.image }" />
					</div>
					<div class='order-info-teacher'>
						<p class='order-info-title'>${teacher.name }</p>
						<p>${teacher.school }</p>
						<p>性别:${teacher.sex}</p>
					</div>
					<div class='order-info-teacher'>
						<p>年龄:${teacher.age}</p>
						<p>年级:${teacher.grade}</p>
					</div>
					<div style="padding-top: 30px">
						<%-- <p>联系方式：${teacher.phoneNum}</p> --%>
						<p>专业：${teacher.major}</p>
					</div>
				</div>
				<div class='order-step-title' style="width: 880px;">家长信息</div>
				<div class='order-step-info' style="width: 880px;">
					<div class='order-info-image' style="padding-left: 0px;width: 150px;padding-top: 10px;">
						 <img class="img-circle" src="${parentUser.image }" />
					</div>
					<div class='order-info-teacher' style="padding-top: 50px;width: 120px;">
						<p class='order-info-title'>${parent.name }</p>
					</div>
					<div class='order-info-teacher' style="padding-top: 52px;">
						<p >联系方式：${parentUser.phone }</p>
					</div>
					<div class='order-info-teacher' style="padding-top: 52px;padding-left: 20px;">
						<p >居住地区：${parent.address }</p>
					</div>
				</div>
				<div class='order-step-title' style="width: 880px;">学生信息</div>
				<div class='order-step-content' style="width: 880px;padding-left: 80px;margin-bottom: 10px;">
					<div class='order-info-teacher' style="width: 120px; margin-right: 30px;">
						<p class='order-info-title' style="width: 120px; margin-right: 30px;">${student.name}</p>
					</div>
					<div class='order-info-teacher' style="padding-top: 30px">
						<p>年级：${student.grade}</p>
						<p>年龄：${student.age}</p>
					</div>
					<div class='order-info-teacher' style="padding-top: 30px">
						<p>学校：${student.school}</p>
						<p>性别：${student.sex}</p>
					</div>
				</div>
				<div class='order-step-content' style="width: 880px;padding-left: 80px;min-height: 30px;margin-top: 0px;">
				学生简介：${student.introduction}
				</div>
				<div class='order-step-title' style="width: 880px;">课程信息</div>
				<div class='order-step-content' style="width: 880px;margin-left: 0px;padding-left: 100px;">
					<div class='order-info-teacher' style="padding-top: 30px;">
						<p>教授课程：${order.teachcourse}</p>
					</div>
					<div class='order-info-teacher' style="padding-top: 30px">
						<p>教授时间：${order.teachdate}</p>
					</div>
					<c:if test="${order.status==0 }">
					<div class='order-info-teacher' style="padding-top: 30px">
						<p>订单状态：订单未支付</p>
					</div>
					</c:if>
					<c:if test="${order.status==1 }">
					<div class='order-info-teacher' style="padding-top: 30px">
						<p>订单状态：订单待确认</p>
					</div>
					</c:if>
						<c:if test="${order.status==2 }">
					<div class='order-info-teacher' style="padding-top: 30px">
						<p>订单状态：订单已确认</p>
					</div>
					</c:if>
					<c:if test="${order.status==3 }">
					<div class='order-info-teacher' style="padding-top: 30px">
						<p>订单状态：订单已取消</p>
					</div>
					</c:if>
					
					
				</div>
		</div>

	</div>

	<%@include file="base/footer-div.jsp"%>
	
</body>
</html>