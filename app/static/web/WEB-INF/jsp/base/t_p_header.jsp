<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id='p_header'>
		<div class='p_wrapper'>
			<div class='p_logo'>
				<a href='/'> <img alt="盘古教育" class="header-logo-img2"
					src="${pageContext.request.contextPath}/image/logo2.png" />
				</a>
			</div>

			<img alt="用户头像" class="p_title_img"

				<c:choose>
					<c:when test="${empty sessionScope.user.image}">
						src="/image/userImg.png"
					</c:when>
					<c:otherwise>
						src="${OSS_URL}/${sessionScope.user.image}"
					</c:otherwise>
				</c:choose>
			/>
			<div class='p_title'>个人主页</div>
		</div>
</div>