<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>课程详情-盘古教育</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layui.css">
</head>
<body>
	<%@include file="base/site-nav.jsp"%>
	<div class='autowidth' id='header'>
		<div class='wrapper'>
			<div class='header-search'>
				<form accept-charset="UTF-8" action="/search.html" method="get">
					<div class='header-search-form'>
						<i class='glyphicon glyphicon-search'></i> 
						<input
							class='header-search-input' name='keywords'
							placeholder='输入搜索你想学的课程试试'> <input
							class="header-search-btn"  type="submit" value="搜索" />
					</div>
				</form>

			</div>
			<div class='header-logo'>
				<a href='/FamilyEdu'> <img alt="家教网" class="header-logo-img"
					src="${pageContext.request.contextPath}/image/logo2.png" />
				</a>
			</div>
		</div>
	</div>

	<div id='details-nav'></div>
	<div id='details-info'>
		<div class='wrapper'>
			<div class='details-info-div'>
				<div class='details-header-box'>
					<div class='details-header-box1'>
						<div class='course-list-box-left-detail'>
							<img alt="Normal_a9ea805f96310cd1e9a7e06811099c296fc3bd98"
								src="${OSS_URL}/${user.image }" />
						</div>
					</div>
					<div class='details-header-box2'>
						<img alt="Xlrz" class="details-first-s-img"
							src="${pageContext.request.contextPath}/image/prove1.png"
							title="学历认证" /> <span class='details-first-s-name'>学历认证</span> <img
							alt="Sfrz" class="details-first-s-img"
							src="${pageContext.request.contextPath}/image/prove2.png"
							title="身份认证" /> <span class='details-first-s-name'>身份认证</span>
					</div>
				</div>
				<div class='details-first-div'>
					<div class='details-first-f'>${teacher.name }</div>
				</div>
				<div class='details-second-div'>
					<div class='details-second-f'>所在学校：</div>
					<div class='details-second-s'>${teacher.school }-
						${teacher.major } - ${teacher.grade }</div>
				</div>
				<div class='details-second-div'>
					<div class='details-second-f'>授课类型：</div>
					<div class='details-second-s'>${course.teachType }</div>
					<div class='details-second-f'>授课方式：</div>
					<div class='details-second-s'>${course.teachMethod }</div>
				</div>
				<div class='details-second-div' style="width: 800px;">
					<div class='details-second-f'>授课经验：</div>
					<div class='details-second-s'>${teacher.seniority }年教龄</div>
					<div class='details-second-f'>教学科目：</div>
					<div class='details-second-s2'>${course.teachPeriod }${course.teachGrade }${course.teachSubject }</div>
				</div>
				<div class='details-second-div' style="width: 800px;">
					<div class='details-second-f'>适教时间：</div>
					<div class='details-second-s2'>${course.freeTime }</div>
					
					<a class="btn btn-warning" style="float: right;" id="bookingCourse" href="/order/${teacher.uid}.html" >预约课程</a>
				</div>
			</div>
		</div>

	</div>

	<div id='details-list-box'>
		<div class='wrapper'>
			<div class='container-fluid'>
				<div class='row'>
					<div class='col-md-9' style="width: 1130px;">
						<div class='col-md-12 info-title info-bd info-pdlr'>
							<ul class='nav nav-pills'>
								<li role='presentation'><a class='font-black'
									href='#namecard'> 我的名片 </a></li>
								<li role='presentation'><a class='font-black'
									href='#studyresult'> 学习成果 </a></li>
								<li role='presentation'><a class='font-black'
									href='#experience'> 教学经历 </a></li>
							</ul>
						</div>
						<div class='col-md-12 info-pdlr'>
							<div class='col-md-12 info-content info-mgb'
								style="background-color: #F6F8FF;">
								<div class='col-md-12 info-bbtm'>
									<h4>
										<span class='glyphicon glyphicon-user'></span> <a
											class='font-black' name='namecard'> 我的名片 </a>
									</h4>
								</div>
								<div class='col-md-12'>
									<h5>
										<div class='col-md-2 info-mgb'>
											<span class='text-muted'> 姓名： </span>
											${teacher.name }
										</div>
										<div class='col-md-2'>
											<span class='text-muted'> 年龄： </span> ${teacher.age }
										</div>
										<div class='col-md-2'>
											<span class='text-muted'> 性别： </span>
											${teacher.sex }
										</div>
										<div class='col-md-12 info-mgb'>
											<span class='text-muted'> 现居地点： </span> {teacher.homeArea }
										</div>
										<div class='col-md-12 info-mgb subject-content'>
											<span class='text-muted'> 教学科目： </span>
											${course.teachPeriod }${course.teachGrade }${course.teachSubject}
										</div>
										<div class='col-md-12 info-mgb'>
											<span class='text-muted'> 我的简介： </span>
										</div>
										<div class='col-md-12 info-mgb introduction content-height'>${teacher.introduction }</div>
									</h5>
								</div>
							</div>
							<div class='col-md-12 info-pdlr info-mgb info-content'
								style="background-color: #F6F8FF;">
								<div class='row'>
									<div class='col-md-12'>
										<div class='col-md-12 info-bbtm'>
											<h4>
												<span class='glyphicon glyphicon-book'></span> <a
													class='font-black' name='studyresult'> 我的学习成果 </a>
											</h4>
										</div>
									</div>
								</div>
								<div class='col-md-12'>
									<div class='col-md-12 text-center'>
										<h4>
											<span class='glyphicon glyphicon-bookmark'></span> 我的荣誉
										</h4>
									</div>
									<div class='col-md-12'>
										<c:forEach items="${achievementList}"
											var="achievement">
											<div class='col-md-3'>
												<div class='thumbnail honor-img'>
													<div class='img-h'>
														<img alt="Normal_acf72ca6969600c66711214d2ae1adaa4400da45"
															height="170px" src="${OSS_URL}/${achievement.image}"
															width="100%" />
													</div>
													<div class='caption text-center'>${achievement.title}</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
							<div class='col-md-12 info-pdlr info-mgb info-content'
								style="background-color: #F6F8FF;">
								<div class='row'>
									<div class='col-md-12'>
										<div class='col-md-12 info-bbtm'>
											<h4>
												<span class='glyphicon glyphicon-time'> <a
													class='font-black' name='experience'> 我的教学经历 </a>
												</span>
											</h4>
										</div>
									</div>
								</div>
								<c:forEach items="${experiencesList}" var="experience">
									<div class='col-md-12'>
										<div class='qa-message-list'>
											<div class='message-item'>
												<div class='message-inner'>
													<div class='message-head clearfix'>${experience.begintime }
														到 ${experience.endtime } | 学生：${experience.name } |
														学校：${experience.grade } |
														辅导科目：${experience.subject }</div>
													<div class='qa-message-content'>${experience.achievement }</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
							
							<div class='col-md-12 info-pdlr info-mgb info-content'
								style="background-color: #F6F8FF;">
								<div class='row'>
									<div class='col-md-12'>
										<div class='col-md-12 info-bbtm'>
											<h4>
												<span class='glyphicon glyphicon-time'> <a
													class='font-black' name='experience'> 我的教学评价</a>
												</span>
											</h4>
										</div>
									</div>
								</div>
								<%-- <c:forEach items="${sessionScope.orderComments}" var="comment">
									<div class='col-md-12'>
										<div class='qa-message-list'>
											<div class='message-item'>
												<div class='message-inner'>
													<div class='qa-message-content'>${comment.comment }</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach> --%>
								
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>



	
	
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">用户登录</h4>
				</div>
				<div class="modal-body">
				
						<div style="margin: 0; padding: 0; display: inline">
						</div>
						<div class='inputs'>
							<div class='input-group'>
								<div class='input-group-addon left_bc'>
									<span class='glyphicon glyphicon-user'></span>
								</div>
								<input autofocus="autofocus" class="login-controls txt_left"
									 name="email" placeholder="请输入注册邮箱" id="email"
									size="30" type="text" />
							</div>
						</div>
						<div class='inputs'>
							<div class='input-group'>
								<div class='input-group-addon left_bc'>
									<span class='glyphicon glyphicon-lock'></span>
								</div>
								<input autocomplete="off" class="login-controls txt-left"
									name="password"
									placeholder="请输入密码" size="30" type="password" id="password"/>
							</div>
						</div>
						<div class='input_div'>
							<input class='btn btn-lg btn-block btn_back' id="loginBtn"
								 type='button' value='登录'>
						</div>
						<div class='input_div'>
							<div class='row'>
								<div class='col-md-4 col-md-offset-4 reg_align' style="float: right;">
									<a href="/FamilyEdu/user/register" class="login_reg">用户注册</a>
								</div>
							</div>
						</div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
</body>
</html>