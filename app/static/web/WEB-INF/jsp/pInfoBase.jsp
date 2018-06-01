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

<script src="${pageContext.request.contextPath}/js/jquery.validate.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/area.js"></script>

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

label.error {
	color: #c00;
}
</style>
</head>
<body>
	<%@include file="base/site-nav.jsp"%>
	<%@include file="base/t_p_header.jsp"%>

	<div class='p_main'>
		<div class='p_wrapper'>
			<%@include file="base/p_menu_parent.jsp"%>

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
										action="/user/updateUserImage.do"
										class="form-horizontal tpadding" enctype="multipart/form-data"
										id="updateUserImage" method="post">
										
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
									
									<form accept-charset="UTF-8"
										action="/p/updateUserInfo.do"
										class="form-horizontal tpadding" enctype="multipart/form-data"
										id="edidTBaseInfo" method="post">
										<div class='col-md-12 info-bottom'>
											<div class='col-md-4'>
												<h4>
													2.个人基本信息 <span class='font-orange'> (*必填) </span>
												</h4>
											</div>
										</div>
										<input type="hidden" name="uid"
											value="${sessionScope.user.uid }">
										<div class='col-md-11'>
											<div class='row'>
												<div class='col-md-4'>
													<div class='form-group'>
														<label class="col-md-5 control-label " for="teacher_姓名：">姓名：</label>
														<div class='col-md-7'>
															<input class="form-control" id="teacher_name" name="name"
																required data-msg-required="请输入姓名" minlength="2"
																maxlength="20" data-msg-minlength="用户名长度为2~20个字符"
																value="${parent.name }" />
														</div>
													</div>
												</div>
												
												<div class='col-md-4'>
													<div class='form-group'>
														<label class="col-md-5 control-label">联系方式：</label>
														<div class='col-md-7'>
															<input class="form-control" id="teacher_pay_num"
																name="phone"
																type="text" disabled="disabled"
																
																value="${sessionScope.user.phone}"
																style="width: 200px;" />
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class='col-md-11'>
											<div class='row' style="width: 860px;">
												<label class="col-md-5 control-label"
													style="width: 106px; margin-right: 15px;">居住地区：</label> 
													<input  name="address"												
													style="width: 464px; height: 34px; margin-right: 20px;"
													type="text" placeholder="填写居住详细住址" value="${parent.address }"
													required required data-msg-required="请输入地址" />
											</div>
										</div>
										<div class='col-md-11'>
											<div class='col-md-12 te-right'>
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
		_init_area();
		
		function noParentStatus(){
			alert("用户尚未进行家长资格认证，请资格认证后再进行课程预约");
		}
	</script>

	<script type='text/javascript'>hasValidateImage();</script>
</body>
</html>