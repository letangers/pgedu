<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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
<%-- <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> --%>
</head>
<body>
	<%@include file="base/site-nav.jsp"%>
	<%@include file="base/t_p_header.jsp"%>
	<div class='p_main'>
		<div class='p_wrapper'>
			<%@include file="base/p_menu.jsp"%>

			<div class='p_content'>
				<div class='p_block'>
					<div class='p_block_title p_content_block_title'>
						<h4>
							<i class='glyphicon glyphicon-user'></i> 我的信息
						</h4>
					</div>
				</div>
				<div class='p_block'>
					<shiro:lacksRole name="teacher_invalidate">  
						<div class='p_content_info info-mgb2'>
							<div class='p_content_t'>
								<span>${teacher.name}</span>
							</div>
							<table class='p_content_table' id="userInfo">
								<!-- <tr>
									<td class='p_content_td'>邮&nbsp;箱:</td>
									<td>{sessionScope.user.email}</td>
								</tr> -->
								<tr>
									<td class='p_content_td'>年&nbsp;龄：</td>
									<td>${teacher.age}</td>
								</tr>
								<tr>
									<td>性&nbsp;别：</td>
									<td>${teacher.sex}</td>
								</tr>
								<tr>
									<td class='p_content_td'>所在院校:</td>
									<td>${teacher.school}</td>
								</tr>
								<tr>
									<td class='p_content_td'>所在年级:</td>
									<td>${teacher.grade}</td>
								</tr>
								<tr>
									<td class='p_content_td'>所学专业:</td>
									<td>${teacher.major}</td>
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
					</shiro:lacksRole>   
					<shiro:hasRole name="teacher_invalidate"> 
						<div class='p_block'>
							<div class='col-md-12 col-xs-12 margin-task'>
								<div class='col-md-12 col-xs-12'>
									<p>
									<h3 class='font-orange text-center'>只需要完成三步家长就能约你了！亲，约吗？
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
										<a class='task-style' href='/t/infoBase.html'>
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
														需要填写内容包括：您的基本情况，个人简介，上传个人照片和学生证照片。基本信息填写完整后，我们会进行人工资格审核，审核通过后才能发布课程哦。
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
										<h3 class='text-center'>第二步：包装自己</h3>
										</p>
									</div>
									<div class='col-md-12 col-xs-12'>
										<a class='task-style task1-bottom'
											href='/t/achievement.html'>
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
													<h4>学习成果</h4>
													</P>
												</div>
												<div class='col-md-12 col-xs-12'>
													<P>
													<h5>
														家长很关心家教自己的学习情况，请把你的各种成绩、各种获奖、各种闪光点都写上来，我就不信家长不找你，嘿嘿。</h5>
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
										<a class='task-style' href='/t/experience.html'>
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
													<h4>教学经历</h4>
													</P>
												</div>
												<div class='col-md-12 col-xs-12'>
													<P>
													<h5>你的教学经历是对你个人能力的完美诠释，快写上你漂亮的经历，让家长了解一下你的个人能力吧。</h5>
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
										<h3 class='text-center'>第三步：发布课程</h3>
										</p>
									</div>
									<div class='col-md-12 col-xs-12'>
										<a class='task-style' href='/course.html'>
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
													<h4>发布课程</h4>
													</P>
												</div>
												<div class='col-md-12 col-xs-12'>
													<P>
													<h5>好激动哦，已经到最后一步了，发布自己擅长的课程，家长就可以约你喽，可以发布多个课程。</h5>
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
					</shiro:hasRole>
				</div>
			</div>
		</div>
	</div>

	<%@include file="base/footer-div.jsp"%>
</body>
</html>