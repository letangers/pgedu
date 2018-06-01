<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心-家教网</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"
	type="text/javascript"></script>
<script>
	$(document).ready(function() {
		$("#edidTBaseInfo").validate();
	});
	$(document).ready(function() {
		$("#updateImages").validate();
	});
	$(document).ready(function() {
		$("#updateUserImage").validate();
	});
	$(document).ready(function() {
		$("#updateTBaseInfo").validate();
	});
</script>

<style type="text/css">
#grade {
	width: 113px;
	height: 34px;
}
</style>
</head>
<body>
	<%@include file="base/site-nav.jsp"%>
	<%@include file="base/t_p_header.jsp"%>

	<div class='p_main'>
		<div class='p_wrapper'>
		
			<%@include file="base/p_menu.jsp"%>
			<div class='p_content' id="noValidateImage">
				<div class='p_block'>
					<div class='p_block_title p_content_block_title'>
						<h4>
							<i class='glyphicon-color glyphicon glyphicon-circle-arrow-up'>
								基本信息 </i>
						</h4>
					</div>
				</div>
				<div class='p_block'>
					<div class='t_main'>
						<div class='t_right'>
							<div class='show'>
								<div class='panel-body'>
										<form accept-charset="UTF-8"
										action="/t/updateValidateInfo.do"
										class="form-horizontal tpadding" enctype="multipart/form-data"
										id="updateImages" method="post">
										<h4 class='text-danger'>
											1.资格认证和个人基本信息将作为资格审核的重要依据，请认真填写，资格审核通过才能发布课程</h4>
										<h4 class='text-danger'>2.仅当个人头像、个人证件、教学证件全部上传完毕后才会进行资格审核</h4>
										<div class='form-group te-mgb'>
											<div class='col-md-12 info-bottom'>
												<div class='col-md-8'>
													<h4>
														1.资格认证 <span class='font-orange'> (*必填) </span>
													</h4>
												</div>
											</div>
											<div class='col-md-11'>

												<div class='col-md-6'>
													<div class='panel panel-default basicpanel-height b-radius'>
														<div class='panel-heading b-radius'>
															<strong>个人头像</strong>
														</div>
														<div class='panel-body text-danger'>
															<div class='row'>
																<div class='col-md-6'>
																	<img alt="User" class="img-circle" height="120px"
																			<c:choose>
																				<c:when test="${empty sessionScope.user.image}">
																					src="/image/userImg.png"
																				</c:when>
																				<c:otherwise>
																					src="${OSS_URL}/${sessionScope.user.image}"
																				</c:otherwise>
																			</c:choose>
																		width="120px" />
																</div>
																<div class='col-md-6 tp-left'>
																	<P>1.请使用近期个人照片</P>
																	<p>2.照片不大于3M</p>
																	<p style="color: #C00;">
																		<input id="userImage" name="image_file" type="file"
																			required data-msg-required="进行资格认证个人照片不能为空"
																			accept="image/*" />
																	</p>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class='col-md-6'>
													<div class='panel panel-default basicpanel-height b-radius'>
														<div class='panel-heading b-radius'>
															<strong>个人证件(*必填，否则无法发布课程)</strong>
														</div>
														<div class='panel-body text-danger'>
															<div class='row'>
																<div class='col-md-6'>
																	<img alt="Paper" class="img-circle" height="120px"
																		src="${pageContext.request.contextPath}/image/userImg3.png"
																		width="120" />
																</div>
																<div class='col-md-6 tp-left'>
																	<p>1.身份证正面图片</p>
																	<p>2.请确保图片清晰可见</p>
																	<p>3.照片不大于3M</p>
																	<p style="color: #C00;">
																		<input id="idImage" name="idcard_file" accept="image/*"
																			type="file" required
																			data-msg-required="进行资格认证个人证件不能为空" />
																	</p>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class='col-md-6'>
													<div class='panel panel-default basicpanel-height b-radius'>
														<div class='panel-heading b-radius'>
															<strong>教学证件(*必填，否则无法发布课程)</strong>
														</div>
														<div class='panel-body text-danger'>
															<div class='row'>
																<div class='col-md-6'>
																	<img alt="Paper" class="img-circle" height="120px"
																		src="${pageContext.request.contextPath}/image/userImg2.png"
																		width="120" />
																</div>
																<div class='col-md-6 tp-left'>
																	<p>1.学生使用学生证</p>
																	<p>2.家教使用教师资格证</p>
																	<p>3.照片不大于3M</p>
																	<p style="color: #C00;">
																		<input id="teachImage" name="studentcard_file"
																			accept="image/*" type="file" required
																			data-msg-required="进行资格认证教学证件不能为空" />
																	</p>
																</div>
															</div>
														</div>
													</div>
												</div>
												
											</div>
											<div class='col-md-11'>
												<div class='row'>
													<div class='col-md-4'>
														<div class='form-group'>
															<label class="col-md-5 control-label " for="teacher_name">姓名：</label>
															<div class='col-md-7' style="color: #c00;">
																<input class="form-control" id="teacher_name" name="name"
																	required data-msg-required="请输入用户名" minlength="2"
																	maxlength="20" data-msg-minlength="用户名长度为2~20个字符"
																	value="${sessionScope.teahcer.name }" />
															</div>
														</div>
													</div>
													<div class='col-md-4'>
														<div class='form-group'>
															<label class="col-md-5 control-label " for="teacher_age">年龄：</label>
															<div class='col-md-7' style="color: #c00;">
																<input class="form-control" id="teacher_age" name="age"
																	type="number" value="${sessionScope.teacher.age }" />
															</div>
														</div>
													</div>
													<div class='col-md-4'>
														<div class='form-group'>
															<label class="col-md-5 control-label" for="sex_div">性别：</label>
															<div class='col-md-7' id="sex_div">
																<label class='radio-inline'> <input
																	id="teacher_sex_1" name="sex" type="radio" value="1" />
																	男
																</label> <label class='radio-inline'> <input
																	id="teacher_sex_2" name="sex" type="radio" value="0" />
																	女
																</label>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class='col-md-11'>
												<div class='row'>
													<div class='col-md-4'>
														<div class='form-group'>
															<label class="col-md-5 control-label"
																for="student_identity_school">学校：</label>
															<div class='col-md-7' style="color: #c00;">
																<input class="form-control" id="student_identity_school"
																	name="school" size="30" type="text" required
																	data-msg-required="学校一栏不能为空，所在学校或毕业院校"
																	value="${sessionScope.teacher.school}" />
															</div>
														</div>
													</div>
													<div class='col-md-4'>
														<div class='form-group'>
															<label class="col-md-5 control-label"
																for="grade">年级：</label>
															<div class='col-md-7' style="color: #c00;">
																<select name="grade" required id="grade"
																	style="color: black;" data-msg-required="年级一栏不能为空"
																	class="grade">
																	<option value="">--选择年级--</option>
																	<option value="高一">高一</option>
																	<option value="高二">高二</option>
																	<option value="高三">高三</option>
																	<option value="大一">大一</option>
																	<option value="大二">大二</option>
																	<option value="大三">大三</option>
																	<option value="大四">大四</option>
																	<option value="在读研究生">在读研究生</option>
																	<option value="在读博士">在读博士</option>
																	<option value="已毕业">已毕业</option>
																	<option value="在教教师">在教教师</option>
																</select>
	
															</div>
														</div>
													</div>
													<div class='col-md-4'>
														<div class='form-group'>
															<label class="col-md-5 control-label"
																for="student_identity_major">专业：</label>
															<div class='col-md-7' style="color: #c00;">
																<input class="form-control" id="student_identity_major"
																	name="major" size="30" type="text" required
																	data-msg-required="所学专业不能为空"
																	value="${sessionScope.teacher.major }" />
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class='col-md-11'>
												<div class='row'>
													<div class='col-md-4'>
														<div class='form-group'>
															<label class="col-md-5 control-label  " for="teacher_teaching_age">教龄：</label>
															<div class='col-md-7'>
																<input class="form-control" id="teacher_teaching_age"
																	min="0" name="seniority" type="number" 
																	value="${sessionScope.teacher.seniority}" />
															</div>
														</div>
													</div>
													<div class='col-md-4'>
														<div class='form-group'>
															<label class="col-md-5 control-label">用户邮箱：</label>
															<div class='col-md-7'>
																<input class="form-control" id="teacher_pay_num"
																	type="text" disabled="disabled"
																	value="{sessionScope.user.email }"
																	style="width: 250px;" />
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class='col-md-11'>
											<div class='col-md-12 te-right'>
												<textarea class="form-control" cols="40"
													id="teacher_introduction" name="introduction"
													placeholder="请填写个人简介,可以详细的说明一下自己的学习，工作，性格，经验等，以便家长更好的了解你，加深自己在家长心中的印象，提高自己的竞争力。。。。。。"
													rows="8"></textarea>
												<input class=" btn btn-success" type="submit" value="进行资格审核"
													style="float: right; margin-top: 20px;" />
											</div>
										</div>
										</div>
									</form>
							
									<form accept-charset="UTF-8"
										action="/user/updateUserImage.do"
										class="form-horizontal tpadding" enctype="multipart/form-data"
										id="updateUserImage" method="post">
										<h4 class='text-danger'>1.用户已通过资格认证,完善个人基本信息后可以发布课程</h4>
										<div class='form-group te-mgb'>
											<div class='col-md-12 info-bottom'>
												<div class='col-md-8'>
													<h4>1.修改个人头像</h4>
												</div>
											</div>
											<div class='col-md-11'>

												<div class='col-md-6'>
													<div class='panel panel-default basicpanel-height b-radius'>
														<div class='panel-heading b-radius'>
															<strong>个人头像</strong>
														</div>
														<div class='panel-body text-danger'>
															<div class='row'>
																<div class='col-md-6'>
																	<img alt="User" class="img-circle" height="120px"
																			<c:choose>
																				<c:when test="${empty sessionScope.user.image}">
																					src="/image/userImg.png"
																				</c:when>
																				<c:otherwise>
																					src="${OSS_URL}/${sessionScope.user.image}"
																				</c:otherwise>
																			</c:choose> width="120px" />
																</div>
																<div class='col-md-6 tp-left'>
																	<P>1.请使用近期个人照片</P>
																	<p>2.照片不大于3M</p>
																	<p style="color: #C00;">
																		<input id="userImage" name="userImage" type="file"
																			required data-msg-required="修改头像图片不能为空" />
																	</p>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class='col-md-6'>
													<input class=" btn btn-success" type="submit"
														value="修改用户头像"
														style="margin-top: 80px; margin-left: 100px;" />
												</div>
											</div>
										</div>
									</form>
									<div id="ingValidateImage">
										<div class='col-md-12 info-bottom'>
											<div class='col-md-8'>
												<h4>
													1.资格认证 <span class='font-orange'> (*必填) </span>
												</h4>
											</div>
										</div>
										<h4 class='text-danger'>
											1.用户正在进行资格审核中，我们将会在两个工作日之内对用户信息进行审核，并将以短信的形式进行通知，请注意注册手机短信！</h4>
										<h4 class='text-danger'>2.用户通过资格审核后才能发布课程</h4>
									</div>
									<form accept-charset="UTF-8"
										action="/t/updateUserInfo.do"
										class="form-horizontal tpadding" 
										id="edidTBaseInfo" method="post">
										<div class='col-md-12 info-bottom'>
											<div class='col-md-4'>
												<h4>
													2.个人基本信息 <span class='font-orange'> (*必填) </span>
												</h4>
											</div>
										</div>
										<input type="hidden" name="uid"
											value="${sessionScope.user.uid}">
										<div class='col-md-11'>
											<div class='row'>
												<div class='col-md-4'>
													<div class='form-group'>
														<label class="col-md-5 control-label " for="teacher_姓名：">姓名：</label>
														<div class='col-md-7' style="color: #c00;">
															<input class="form-control" id="teacher_name" name="name"
																required data-msg-required="请输入用户名" minlength="2"
																maxlength="20" data-msg-minlength="用户名长度为2~20个字符"
																value="${sessionScope.teahcer.name }" />
														</div>
													</div>
												</div>
												<div class='col-md-4'>
													<div class='form-group'>
														<label class="col-md-5 control-label " for="teacher_年龄：">年龄：</label>
														<div class='col-md-7' style="color: #c00;">
															<input class="form-control" id="teacher_age" disabled="disabled"
																type="number" value="${sessionScope.teacher.age }" />
														</div>
													</div>
												</div>
												<div class='col-md-4'>
													<div class='form-group'>
														<label class="col-md-5 control-label" for="teacher_性别：">性别：</label>
														<div class='col-md-7'>
															<label class='radio-inline'> <input required
																id="teacher_sex_1" name="sex" type="radio" value="男" />
																男
															</label> <label class='radio-inline'> <input
																id="teacher_sex_2" name="sex" type="radio" value="女" />
																女
															</label>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class='col-md-11'>
											<div class='row'>
												<div class='col-md-4'>
													<div class='form-group'>
														<label class="col-md-5 control-label"
															for="student_identity_学校：">学校：</label>
														<div class='col-md-7' style="color: #c00;">
															<input class="form-control" id="student_identity_school"
																name="school" size="30" type="text" required
																data-msg-required="学校一栏不能为空，所在学校或毕业院校" disabled="disabled"
																value="${sessionScope.teacher.school}" />
														</div>
													</div>
												</div>
												<div class='col-md-4'>
													<div class='form-group'>
														<label class="col-md-5 control-label"
															for="student_identity_年级：">年级：</label>
														<div class='col-md-7' style="color: #c00;">
															<select name="grade" required id="grade"
																style="color: black;" data-msg-required="年级一栏不能为空"
																class="grade">
																<option value="">--选择年级--</option>
																<option value="高一">高一</option>
																<option value="高二">高二</option>
																<option value="高三">高三</option>
																<option value="大一">大一</option>
																<option value="大二">大二</option>
																<option value="大三">大三</option>
																<option value="大四">大四</option>
																<option value="在读研究生">在读研究生</option>
																<option value="在读博士">在读博士</option>
																<option value="已毕业">已毕业</option>
																<option value="在教教师">在教教师</option>
															</select>

														</div>
													</div>
												</div>
												<div class='col-md-4'>
													<div class='form-group'>
														<label class="col-md-5 control-label"
															for="student_identity_专业：">专业：</label>
														<div class='col-md-7' style="color: #c00;">
															<input class="form-control" id="student_identity_major"
																name="major" size="30" type="text" required
																data-msg-required="所学专业不能为空" disabled="disabled"
																value="${sessionScope.teacher.major }" />
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class='col-md-11'>
											<div class='row'>
												<div class='col-md-4'>
													<div class='form-group'>
														<label class="col-md-5 control-label  " for="teacher_教龄：">教龄：</label>
														<div class='col-md-7'>
															<input class="form-control" id="teacher_teaching_age"
																min="0" name="seniority" type="number" disabled="disabled"
																value="${sessionScope.teacher.seniority}" />
														</div>
													</div>
												</div>
												<div class='col-md-4'>
													<div class='form-group'>
														<label class="col-md-5 control-label">用户邮箱：</label>
														<div class='col-md-7'>
															<input class="form-control" id="teacher_pay_num"
																type="text" disabled="disabled"
																value="{sessionScope.user.email }"
																style="width: 250px;" />
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class='col-md-11'>
											<div class='col-md-12 te-right'>
												<textarea class="form-control" cols="40"
													id="teacher_introduction" name="introduction" disabled="disabled"
													placeholder="请填写个人简介,可以详细的说明一下自己的学习，工作，性格，经验等，以便家长更好的了解你，加深自己在家长心中的印象，提高自己的竞争力。。。。。。"
													rows="8">{sessionScope.user.introduction}</textarea>
												<input class=" btn btn-success" type="submit" value="保存信息"
													style="float: right; margin-top: 20px;" />
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			
		</div>
	</div>

	<%@include file="base/footer-div.jsp"%>
	<script type="text/javascript">
		function noValidateImage() {
			jQuery("#updateImages").show();
			jQuery("#updateUserImage").hide();
			jQuery("#ingValidateImage").hide();
			jQuery("#edidTBaseInfo").hide();
		}
		function hasValidateImage() {
			jQuery("#updateUserImage").show();
			jQuery("#updateImages").hide();
			jQuery("#ingValidateImage").hide();
			
		}
		function ingValidateImage() {
			jQuery("#ingValidateImage").show();
			jQuery("#updateImages").hide();
			jQuery("#updateUserImage").hide();
			jQuery("#edidTBaseInfo").hide();
		}
		function fGenderChecked() {
			jQuery("#teacher_sex_2").attr("checked", "checked");
		}
		function mGenderChecked() {
			jQuery("#teacher_sex_1").attr("checked", "checked");
		}

		function gradeSelete() {
			jQuery("#grade").val("{sessionScope.user.grade}");
		}
		
		function noStatus(){
			alert("用户尚未进行资格认证，请资格认证后再进行课程发布");
		}
	</script>	
	<shiro:authenticated>
		<shiro:hasRole name="teacher_invalidate">  
	   		 <script type='text/javascript'>console.log("1");noValidateImage();</script>
		</shiro:hasRole> 
		
		<shiro:hasRole name="teacher_validating">  
		
	   		<script type='text/javascript'>console.log("2");ingValidateImage();</script>
		</shiro:hasRole> 
		<shiro:hasRole name="teacher_validated">  
	   		<script type='text/javascript'>console.log("3");hasValidateImage();</script>
		</shiro:hasRole> 
	</shiro:authenticated> 
</body>
</html>