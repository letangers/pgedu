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
<title>注册-盘古教育</title>
<link href="${pageContext.request.contextPath}/css/userLogin.css"
	media="all" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}	/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.js" type="text/javascript"></script>
<script>
	//添加自定义校验规则
	jQuery.validator.addMethod("isPhone", function(value, element) {
            var length = value.length;
            return this.optional(element) || (length == 11 && /^1[34578]\d{9}$/.test(value));
    }, "手机号码格式错误!");
     $.validator.setDefaults({
	    submitHandler: function(form) {
	    	var form=$("#userLogin").submit();

	    }
	});
	$(document).ready(function() {
		$("#userLogin").validate({
			rules: {
		      phone: {
		        required: true,
		        isPhone: true
		      }
		    },
		    messages: {
		      phone: {
		        required: "您没手输入手机号哦^_^~~~",
		        isPhone: "手机号码格式不正确哦-_-!!!"
		      }
		    }
		});
	});
</script>


</head>
<body>
	<%@include file="base/site-nav-noLogin.jsp"%>
	<div class='login_container autowidth'>
		<div class='login_main'>
			<div class='left'>
				<img alt="盘古教育宣传图片" class="bgimg"
					src="${pageContext.request.contextPath}/image/registerImg2.png" />
			</div>
			<div class='right'>
				<div class="LoginText">用户登录</div>
				<div class='login-panel'>
					<form accept-charset="UTF-8"
						class="form-horizontal" id="userLogin" method="post">
						<div style="
								    margin-top: 10px;
								    text-align: center;">
							<span style="color:red;font-size: 16px;">${loginMsg}</span>
						</div>

						<div class='inputs'>
							<div class='input-group'>
								<div class='input-group-addon left_bc'>
									<span class='glyphicon glyphicon-user'></span>
								</div>
								<input id="phoneNumber" name="phone" autofocus="autofocus" class="login-controls txt_left" placeholder="请输入注册手机号"
								size="30" type="text" value="" 	style="	margin-left: 40px;"/>
							</div>
						</div>
						<div class='inputs'>
							<div class='input-group'>
								<div class='input-group-addon left_bc'>
									<span class='glyphicon glyphicon-lock'></span>
								</div>
								<input autocomplete="off" class="login-controls txt-left"
									id="password" name="password" required
									data-msg-required="请输入密码,密码不能为空"
									placeholder="请输入密码" size="30" type="password" 	style="	margin-left: 40px;"/>
							</div>
						</div>
						<div class='input_div'>
							<input class="btn btn-lg btn-block btn_back" name="commit" id="loginBtn"
								type="submit" value="登录"/>
						</div>
						<span>
							<a style="float: left; margin-left: 169px;  margin-top: 10px;"
							href="/user/register.html">还没有账号?立即注册</a></span>
					</form>



				</div>
			</div>
		</div>
	</div>



	<%@include file="base/footer-div.jsp"%>
</body>
</html>
