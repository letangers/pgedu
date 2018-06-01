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
<title>注册-家教网</title>
<link href="${pageContext.request.contextPath}/css/userRegister.css"
	media="all" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}	/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"
	type="text/javascript"></script>
<script>
	//添加自定义校验规则
	jQuery.validator.addMethod("isPhone", function(value, element) {
            var length = value.length;
            return this.optional(element) || (length == 11 && /^1[34578]\d{9}$/.test(value));
    }, "手机号码格式错误!");
	 $.validator.setDefaults({
	    submitHandler: function(form) {
	    	
	    	var form=$("#new_user").serialize();
		     $.ajax({
			    type: 'post',
			    url: '${pageContext.request.contextPath}/user/register.do',
			    data: form,
			    success: function(data) {
			       if(data.status == 200){
			       		alert("^_^!!!注册成功,快去登陆吧！！！");
			       		window.location.href="${pageContext.request.contextPath}/user/login.html";
			       }else{
			       		alert("注册失败 错误码为"+ data.status +" 错误信息为:"+data.errorMsg + "请联系管理员修复");
			       }
			    }
			});
	    }
	});
	$(document).ready(function() {
		$("#new_user").validate({
			rules: {
		      phone: {
		        required: true,
		        isPhone: true,
		        //检查手机号是否已经存在
		        remote: {
				    url: '${pageContext.request.contextPath}/user/isRegistered.do',  
				    type: "post",               //数据发送方式
				    dataType: "json",           //接受数据格式   
				    data: {                     //要传递的数据
				        phone: function() {
				          	return $("#phoneNumber").val();
				        }
				    }
				}
		      }
		    },
		    messages: {
		      phone: {	
		        required: "您没手输入手机号哦^_^~~~",
		        isPhone: "手机号码不正确哦-_-!!!",
		        remote: "该手机号已被注册啦！！！"
		      }
		    }
		});
	});
</script>
</head>
<body>
	<%@include file="base/site-nav-noLogin.jsp"%>

	<div class='preg_cta'>
		<div class='reg_header'>用户注册</div>
		<div class='preg_body'>
			<div class='body_left'>
				<form accept-charset="UTF-8" 
					class="form-horizontal" id="new_user" method="post">
					<DIV class=regLine>
						<DIV class=item1>
							<SPAN style="COLOR: red">*</SPAN>手机号&nbsp;(用于登录、<FONT
								style="COLOR: #2d69b4">激活帐号</FONT>及取回密码):
						</DIV>
						<DIV class=item2>
							<INPUT id="phoneNumber"  class="form-control" name="phone" type=text>

						</DIV>
					</DIV>
					<br />
					<DIV class=regLine>
						<DIV class=item1>
							<SPAN style="COLOR: red">*</SPAN>密码(密码由6-20个字符组成，区分大小写):
						</DIV>
						<DIV class=item2>
							<INPUT type="password"  class="form-control" name="password" id="password" required
								data-msg-required="请输入密码" minlength="6"
								data-msg-minlength="至少输入6个字符" >
						</DIV>
					</DIV>
					<br />
					<DIV class=regLine>
						<DIV class=item1>确认密码：</DIV>
						<DIV class=item2>
							<INPUT type="password"  class="form-control" equalTo="#password" name="confirm_password" required data-msg-required="确认密码不能为空" >
						</DIV>
					</DIV>
					<br/>
					<DIV class=regLine>
						<div class='form-group form-gro'>
							<div class='form-controls'>
								<input class="btn btn-success id_item"
									type="submit" value="注册" id="registerBtn" />
								 
								<span class='login_btn'> &nbsp;&nbsp;已有帐号，直接 <a href="/FamilyEdu/user/login">登录</a>
								</span>
							</div>
						</div>
					</DIV>
				</form>
			</DIV>
		</DIV>


	</div>
	<div class='pbody_pic'></div>


	<div class='pbody_pic'
		style="background-image: url(${pageContext.request.contextPath}/image/registerBg.png)"></div>


	<%@include file="base/footer-div.jsp"%>
</body>
</html>