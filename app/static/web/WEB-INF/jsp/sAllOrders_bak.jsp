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
<title>订单管理-家教网</title>
<link href="${pageContext.request.contextPath}/css/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"
	type="text/javascript"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layui.css">

<script type="text/javascript">
	jQuery(document).ready(function() {
		$("#deleteReason").validate();
		jQuery(".deleteBtn").click(function() {
			jQuery("#deleteReason").attr("action", $(this).attr('name'));
		});

	});
</script>
<style type="text/css">
label.error{
	color:#c00;
}
</style>
</head>
<body>
	<%@include file="base/site-nav.jsp"%>
	<%@include file="base/t_p_header.jsp"%>
	<div class='p_main'>
		<div class='p_wrapper'>
			<%@include file="base/p_menu_parent.jsp"%>
			
			
			<div class='p_content' style="min-height: 280px; height: 425px;">
				<div class='p_block'>
					<div class='p_block_title p_content_block_title'>
						<h4>
							<i class='glyphicon glyphicon-align-justify'></i> 全部订单
						</h4>
					</div>
				</div>
				<div class="p_block">
					<table class="table table-striped">
						<thead>
							<tr>
								<th style="text-align: center;">课程名称</th>
								<th style="text-align: center;">家教姓名</th>
								<th style="text-align: center;">家教联系方式</th>
								<th style="text-align: center;">试讲日期</th>
								<th style="text-align: center;">学生名称</th>
								<th style="text-align: center;">状态</th>
								<th style="text-align: center;">订单详情</th>
								<th style="text-align: center;" colspan="1">操作</th>
							</tr>
						</thead>
						<c:forEach items="${sMyOrders }" var="myOrder">
							<tr>
								<td style="text-align: center; vertical-align: middle;">${myOrder.teachSubject}</td>
								<td style="text-align: center; vertical-align: middle;">${myOrder.teacher.username}</td>
								<td style="text-align: center; vertical-align: middle;">${myOrder.teacher.phoneNum}</td>
								<td style="text-align: center; vertical-align: middle;">${myOrder.teachDate}</td>
								<td style="text-align: center; vertical-align: middle;">${myOrder.student.stuName}</td>
								<c:if test="${myOrder.status==0}">
									<td style="text-align: center; vertical-align: middle;">
										待家教确认</td>
								</c:if>
								<c:if test="${myOrder.status==1}">
									<td style="text-align: center;">家教已确认</td>
								</c:if>
								<td style="text-align: center; vertical-align: middle;">
									<form action="/FamilyEdu/user/order/detail" method="post"
										target="_blank">
										<input type="hidden" name="orderId" value="${myOrder.id}">
										<button class="btn btn-success btn-xs">查看详情</button>
									</form>
								</td>
								<c:if test="${myOrder.status==0}">
									<td style="text-align: center; vertical-align: middle;"
										colspan="1">
											<a class="btn btn-success btn-xs deleteBtn" data-toggle="modal"
												data-target="#myModal" name="/FamilyEdu/user/myFamilyEduS/order/deleteOrder/${myOrder.id}">删除订单</a>
									</td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div
					style="position: absolute; top: 320px; margin: 0 auto; width: 910px;">
					<nav style="text-align: center;">
					<ul class="pagination">
						<c:if test="${sessionScope.sOrdersCurrentPage!=1}">
							<li><a
								href="/FamilyEdu/user/myFamilyEduS/order/unconfirmed?page=${sessionScope.sOrdersCurrentPage}&pageAction=pre"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:forEach begin="${sessionScope.sOrdersBeginPage}"
							end="${sessionScope.sOrdersTotalPage}" var="v">
							<c:if test="${ v==sOrdersCurrentPage}">
								<li class="active"><a
									href="/FamilyEdu/user/myFamilyEduS/order/unconfirmed?page=${v }">${v}</a></li>
							</c:if>
							<c:if test="${ v!=sOrdersCurrentPage}">
								<li><a
									href="/FamilyEdu/user/myFamilyEduS/order/unconfirmed?page=${v }">${v}</a></li>
							</c:if>
						</c:forEach>
						<c:if
							test="${sessionScope.sOrdersTotalPage!=sessionScope.sOrdersCurrentPage}">
							<c:if test="${sessionScope.sOrdersTotalPage!=0}">
							<li><a
								href="/FamilyEdu/user/myFamilyEduS/order/unconfirmed?page=${sessionScope.sOrdersCurrentPage}&pageAction=next"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
							</c:if>
						</c:if>
					</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	
	
	<%@include file="base/footer-div.jsp"%>
	<script src="${pageContext.request.contextPath}/js/layui.js"></script>
	
	<script>
	<script type="text/javascript">
		jQuery('#teachDate').datepicker({
			minDate : new Date()

		});

		jQuery("#addOrder").validate();
	</script>
</body>
</html>