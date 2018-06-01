<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/siteNav.css">
<div id='site-nav'>
	<div class='wrapper' id="noUserWrapper">
		<ul class='status-info'>
			<li>
				<div class='main-link-div'>
					<a class='main-link' href=''> <i
						class='glyphicon glyphicon-home'></i> 首页
					</a>
				</div>
			</li>
			<li>
				<div class='main-link-div'></div>
			</li>
			<li><!-- 客服QQ: xxxxxxx--></li>
		</ul>
		<ul class='tag-info'>
			<li><a class='login-link' href='user/login.html'> <i
					class='glyphicon glyphicon-user'></i> 请登录
			</a> <a class='register-link' href='user/register.html'> 免费注册 </a></li>
		</ul>
	</div>
	<div class='wrapper' id="hasUserWrapper">
		<ul class='status-info'>
			<li>
				<div class='main-link-div'>
					<a class='main-link' href=''> <i
						class='glyphicon glyphicon-home'></i> 首页
					</a>
				</div>
			</li>
			<li>
				<div class='main-link-div'>
					<a class='login-link' href='user/center/${sessionScope.user.uid}.html'>
						个人中心 </a>
				</div>
			</li>
			<li>
				<div class='main-link-div'></div>
			</li>
			<li><!-- 客服QQ: --></li>
		</ul>
		<ul class='tag-info'>
			<li><a  class='login-link'
					href='/user/center/${sessionScope.user.uid}.do'> <i
					class='glyphicon glyphicon-user'></i>${ sessionScope.user.phone}</a> 
				<a class='register-link' href='/user/logout.do'> 退出 </a></li>
		</ul>
	</div>
</div>
<script type="text/javascript">
	function noUser() {
		jQuery("#noUserWrapper").show();
		jQuery("#hasUserWrapper").hide();
	}
	function hasUser() {
		jQuery("#hasUserWrapper").show();
		jQuery("#noUserWrapper").hide();
	}
</script>
<!-- js代码 是否显示用户 -->

<%
	if (session.getAttribute("user") == null) {
		out.print("<script type='text/javascript'>noUser();</script>");
	}
	if (session.getAttribute("user") != null) {
		out.print("<script type='text/javascript'>hasUser();</script>");
	}
%>