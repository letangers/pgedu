<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>个人中心-家教网</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>


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
							<i class='glyphicon glyphicon-user'></i> 我的信息
						</h4>
					</div>
				</div>
				<div class='p_block'>
					<div class='p_content_info info-mgb2'>
						<div class='p_content_t'>
							<span>${parent.name}</span>
						</div>
						<table class='p_content_table'>
							
							<tr>
								<td class='p_content_td'>住&nbsp;址：</td>
								<td>${parent.address}</td>
							</tr>
							<tr>
								<td class='p_content_td'>联系方式:</td>
								<td>${sessionScope.user.phone}</td>
							</tr>
						</table>
					</div>
					<div class='t_content_img'>
						<img alt="Photo" class="img-thumbnail" height="100px"
								<c:choose>
									<c:when test="${empty sessionScope.user.image}">
										src="/image/userImg.png"
									</c:when>
									<c:otherwise>
										src="${OSS_URL}/${sessionScope.user.image}"
									</c:otherwise>
								</c:choose>
							 width="100px" />
					</div>
					<div class='p_block'>
						<div class='col-md-12 col-xs-12 margin-task'>
							<div class='col-md-12 col-xs-12'>
								<p>
								<h3 class='font-orange text-center'>只需要完成三步就能预约家教了？等什么？
								</h3>
								</p>
							</div>
							<div class='col-md-12 col-xs-12 task-wrap-padding'>
								<div class='col-md-12 col-xs-12'>
									<p>
									<h3 class='text-center'>第一步：基本信息</h3>
									</p>
								</div>
								<div class='col-md-12 col-xs-12'>
									<a class='task-style' href='/p/infoBase.html'>
										<div class='col-md-1 col-xs-1'>
											<P>
											<h1>
												<i class='glyphicon glyphicon-hand-right'></i>
											</h1>
											</P>
										</div>
										<div class='col-md-10 col-xs-10'>
											<div class='col-md-12 col-xs-12'>
												<P>
												<h4>基本信息</h4>
												</P>
											</div>
											<div class='col-md-12 col-xs-12'>
												<P>
												<h5>
													需要填写内容包括：您的基本情况，上传个人照片和身份证件正面照片。基本信息填写完整后，我们会进行人工资格审核，审核通过后进行预约。
												</h5>
												</P>
											</div>
										</div>
										<div class='col-md-1 col-xs-1 padding-none'>
											<p>
											<h1>
												<i class='glyphicon glyphicon-chevron-right'></i>
											</h1>
											</p>
										</div>
									</a>
								</div>
								<div class='col-md-12 col-xs-12'>
									<p>
									<h3 class='text-center'>第二步：完善信息</h3>
									</p>
								</div>
								<div class='col-md-12 col-xs-12'>
									<a class='task-style'
										href='/p/student.html'>
										<div class='col-md-1 col-xs-1'>
											<P>
											<h1>
												<i class='glyphicon glyphicon-hand-right'></i>
											</h1>
											</P>
										</div>
										<div class='col-md-10 col-xs-10'>
											<div class='col-md-12 col-xs-12'>
												<P>
												<h4>学习信息</h4>
												</P>
											</div>
											<div class='col-md-12 col-xs-12'>
												<P>
												<h5>
													填写学生信息，让家教对学生有大致了解，更好进行教育</h5>
												</P>
											</div>
										</div>
										<div class='col-md-1 col-xs-1'>
											<p>
											<h1>
												<i class='glyphicon glyphicon-chevron-right'></i>
											</h1>
											</p>
										</div>
									</a>
								</div>
								<div class='col-md-12 col-xs-12'>
									<p>
									<h3 class='text-center'>第三步：预约家教</h3>
									</p>
								</div>
								<div class='col-md-12 col-xs-12'>
									<a class='task-style' href='/index.html'>
										<div class='col-md-1 col-xs-1'>
											<P>
											<h1>
												<i class='glyphicon glyphicon-hand-right'></i>
											</h1>
											</P>
										</div>
										<div class='col-md-10 col-xs-10'>
											<div class='col-md-12 col-xs-12'>
												<P>
												<h4>预约家教</h4>
												</P>
											</div>
											<div class='col-md-12 col-xs-12'>
												<P>
												<h5>好激动哦，已经到最后一步了，在首页寻找搜索相对课程的家教，就可以预约到心仪的家教啦！</h5>
												</P>
											</div>
										</div>
										<div class='col-md-1 col-xs-1'>
											<p>
											<h1>
												<i class='glyphicon glyphicon-chevron-right'></i>
											</h1>
											</p>
										</div>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="base/footer-div.jsp"%>
</body>
</html>