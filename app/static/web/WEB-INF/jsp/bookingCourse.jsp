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
<title>生成订单-盘古教育</title>
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
	<%@include file="base/site-nav.jsp"%>
	<%@include file="base/t_p_header.jsp"%>

	<div class='p_main'>
		<div class='p_wrapper'>
			
			<%@include file="base/p_menu_parent.jsp"%>
			<div class='p_content'>
				<div class='p_block'>
					<div class='p_block_title p_content_block_title'>
						<h4>
							<i class='glyphicon glyphicon-pencil'></i> 生成订单
						</h4>
					</div>
				</div>
				<div class="p_block">
				
					<form accept-charset="UTF-8" id="addOrder"
						action="/order.do"
						class="form-horizontal" method="post">
						
						<input name="tuid" type="hidden" value="${teacher.uid }" />
						<div class='order-step-title' style="width: 880px;">第一步：确认课程信息</div>
						<div class='order-step-info' style="width: 880px;">
							<div class='order-info-image'>
								<img class="img-circle"
									src=" ${teacherUser.image }" />
							</div>
							<div class='order-info-teacher'>
								<p class='order-info-title'>${teacher.name }</p>
								<p>${teacher.school }</p>
								<!-- <p>联系方式：{bookCourse.createUser.phoneNum}</p> -->
							</div>
							<div class='order-info-course'>
								<!-- <p>课程：{bookCourse.teachSubject}</p>
								<p>适教时间：{bookCourse.freeTime}</p> -->
							</div>
						</div>
						<div class='order-step-title' style="width: 880px;">第二步：确认联系方式</div>
						<div class='order-step-content' style="width: 880px;">
							<div class='form-group'>
								<label class="col-md-2 col-xs-2 control-label">联系人</label>
								<div class='col-md-4 col-xs-4'>
									<input name="linkman" type="hidden" value="${order.linkman }" />
									<input class="form-control" size="30" type="text" 
										value="${order.linkman }" disabled="disabled" />
								</div>
							</div>
							<div class='form-group'>
								<label class="col-md-2 col-xs-2 control-label">联系电话</label>
								<div class='col-md-4 col-xs-4'>
									<input name="phone" type="hidden" value="${order.phone }" />
									<input class="form-control" size="30" type="text" name="phone"
										value="${order.phone }" disabled="disabled" />
								</div>
							</div>
							<div class='form-group'>
								<label class=" col-md-2 col-xs-2 control-label">授课地址</label>
								<div class='col-md-4 col-xs-4'>
									<input name="addrees" type="hidden" value="${order.addrees }" />
									<input class="form-control" value="${order.addrees }" name="addrees"
										disabled="disabled" size="30" type="text" />
								</div>
							</div>
						</div>
						<div class='order-step-title' style="width: 880px;">第三步：填写授课详细信息</div>
						<div class='order-step-content' style="width: 880px;">
							<div class='form-group'>
								<label class="col-md-2 col-xs-2 control-label">选择辅导学生</label>
								<div class='col-md-4 col-xs-4'>
									<input name="uid" type="hidden" value="${studentList[0].uid }" />
									<c:forEach items="${studentList}" var="myStudent">
										
										<label class='radio-inline'> <input id="teacher_sex_1"
											name="sid" type="radio" value="${myStudent.sid}" required/>
											${myStudent.name}
										</label>
									</c:forEach>
								</div>
							</div>
							<div class='form-group'>
								<label class="col-md-2 col-xs-2 control-label">选择教学时间</label>
								<div class='col-md-4 col-xs-4'>
									<input class="form-control sel_time" id="teachDate"
										name="teachdate" placeholder="选择教学时间" size="30" type="text"
										required />
								</div>
							</div>
							<div class='form-group'>
								<label class="col-md-2 col-xs-2 control-label">填写补习课程</label>
								<div class='col-md-4 col-xs-4'>
									<input class="form-control" 
										name="teachcourse"  type="text"
										value="" size="30" placeholder="填写补习课程" required/>
								</div>
							</div>
						</div>
						

						<div class='order-step-title' style="width: 880px;">
							<div class='form-group' style="width:800px;">
								<div class='col-md-2 col-xs-2' style="float: right;">
									<input class="btn  btn-warning" 
										type="submit" value="提交订单" id="commitOrder"/>
								</div>
							</div>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

	<div id='footer-div'>
		<div class='wrapper'>
			<div class='footer-service'>
				<div class='footer-service-title'>客服电话：</div>
				<div class='footer-service-content'>13570577165</div>
			</div>
			<div class='footer-intro'>
				<div class='footer-intro-head'>
					<span class='footer-intro-title'> 家教网 </span> <span
						class='footer-intro-substitle'> 中小学生家教预约平台 </span>
				</div>
				<p class='footer-desc'>家教网 -中小学生家教预约平台
					是一个互联网教育平台。为了学习更有效、为了教育更灵活、更亲切，我们致力于本地化家教教育。在这个平台上，老师和学生可以免费发布信息、随时沟通、灵活教学。学生无论是为了应对升学，攻克难题，还是课外兴趣发展，我们都能提供强大的知识和经验支持。
				</p>
				<p class='footer-desc'>
					<br> Copyright © 2015 - 2016 家教网
				</p>
			</div>
			<div class='footer-about'>
				<i></i>
				<ul class='footer-list'>
					<li><a> 活动公告 </a></li>
					<li><a> 常见问题 </a></li>
					<li><a> 服务协议 </a></li>
					<li><a> 隐私声明 </a></li>
					<li><a> 商务合作 </a></li>
				</ul>
			</div>
			<div class='footer-contact'>
				<i></i>
				<ul class='footer-list'>
					<li><a> 意见反馈 </a></li>
					<li><a> 官方微信 </a></li>
					<li><a> 新浪微博 </a></li>
					<li><a> 关于我们 </a></li>
					<li><a> 联系我们 </a></li>
				</ul>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	jQuery('#teachDate').datepicker({
		minDate:new Date()
		
	});
	
	jQuery("#addOrder").validate();
	function sameUser() {
		jQuery("#commitOrder").attr("disabled",
				"true");
		
	}
</script>

</body>
</html>