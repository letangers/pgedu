<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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

<script type="text/javascript">
	function updateSuccess() {
		alert("密码修改成功！");
	}
</script>
<script>
	$(document).ready(function() {
		$("#updatePassword").validate();
	});
</script>
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
							<i class='glyphicon glyphicon-asterisk greay'></i> 密码修改
						</h4>
					</div>
				</div>
				<div class='p_block'>
					<div class='p_block_password'>
						<form accept-charset="UTF-8"
							action="/user/updatePassword.do"
							class="form-horizontal" id="updatePassword" method="post">
							<div class='form-group'>
								<label class="col-md-2 control-label" for="teacher_当前密码:">当前密码:</label>
								<div class='col-md-4 col-xs-4'>
									<input autocomplete="off" class="form-control"
										id="teacher_current_password" name="oldPassword" size="30"
										type="password" required data-msg-required="请输入当前密码"
										data-rule-remote="/user/isTrueOldPassword.do"
										data-msg-remote="当前密码不正确" />
								</div>
							</div>
							<div class='form-group'>
								<label class="col-md-2 control-label" for="teacher_新密码:">新密码:</label>
								<div class='col-md-4 col-xs-4'>
									<input autocomplete="off" class="form-control" id="newPassword"
										name="password" size="30" type="password" required
										data-msg-required="请输入新密码" minlength="6"
										data-msg-minlength="至少输入6个字符" />
								</div>
							</div>
							<div class='form-group'>
								<label class="col-md-2 control-label" for="teacher_确认密码:">确认密码:</label>
								<div class='col-md-4 col-xs-4'>
									<input autocomplete="off" class="form-control" size="30"
										type="password" required data-msg-required="确认密码不能为空"
										equalTo="#newPassword" />
								</div>
							</div>
							<div class='form-group'>
								<div
									class='col-sm-offset-2 col-sm-offset-2 col-sm-10 col-sm-10 col-md-4 col-xs-4'>
									<input class="btn btn-success form-control" name="commit"
										type="submit" value="提交" />
								</div>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>


	
	<%@include file="base/footer-div.jsp"%>
</body>
<style>
label.error {
	color: #C00;
}
</style>
</html>