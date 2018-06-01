<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>搜索-盘古教育</title>
<link href="./css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link href="./css/index.css"
	rel="stylesheet" type="text/css" />
<script src="./js/jquery-3.2.1.min.js"></script>
<script src="./js/bootstrap.js"></script>

</head>
<body>
	<%@include file="base/site-nav.jsp"%>
	<div class='autowidth' id='header'>
		<div class='wrapper'>
			<div class='header-search'>
				<form accept-charset="UTF-8" action="/search.do" method="post">
					<div class='header-search-form'>
						<i class='glyphicon glyphicon-search'></i>
						<input type="hidden" name="page" value="1">
						<input type="hidden" name="sPeriod" value="0">
						<input type="hidden" name="sGender" value="0">
						<input type="hidden" name="sTeachMethod" value="0">
						<input
							class='header-search-input' name='keywords'
							placeholder='${result.keywords}'> <input
							class="header-search-btn" name="commit" type="submit" value="搜索" />
					</div>
				</form>

			</div>
			<div class='header-logo'>
				<a href='/index.html'> <img alt="盘古教育" class="header-logo-img"
											src="${pageContext.request.contextPath}/image/logo2.png" />
				</a>
			</div>
		</div>
	</div>

	<div id='search-item-div'>
		<div class='div wrapper'>
			<div class='search-item-box'>
				<table class='table'>
					      &nbsp; &nbsp;课程筛选
					    <h4></h4>
					<tr>
						<td width='100px'>学生年级:</td>
						<td align='left'>
							<ul>
								<li id="sPeriod_0" ><a
									href="/FamilyEdu/user/nav?page=1&keywords=${result.keywords}&sPeriod=0&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}" rel="nofollow">全部</a>
								</li>
								<li id="sPeriod_1" class="sPeriod"><a href="/FamilyEdu/user/nav?page=1&keywords=${result.keywords}&sPeriod=1&sGrade=100&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}"
									rel="nofollow">小学</a></li>
								<li id="sPeriod_2" class="sPeriod"><a href="/FamilyEdu/user/nav?page=1&keywords=${result.keywords}&sPeriod=2&sGrade=200&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}"
									rel="nofollow">初中</a></li>
								<li id="sPeriod_3"  class="sPeriod"><a href="/FamilyEdu/user/nav?page=1&keywords=${result.keywords}&sPeriod=3&sGrade=300&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}"
									rel="nofollow">高中</a></li>
							</ul>
							<ul class='grade-div' id="sPeriod1">
								<li id="sGrade_100" class="sGrade"><a
									href="/FamilyEdu/user/nav?page=1&keywords=${result.keywords}&sPeriod=1&sGrade=100&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}" rel="nofollow">全部</a>
								</li>
								<li id="sGrade_1" class="sGrade"><a href="/FamilyEdu/user/nav?page=1&keywords=${result.keywords}&sPeriod=1&sGrade=1&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}"
									rel="nofollow">一年级</a></li>
								<li id="sGrade_2" class="sGrade"><a href="/FamilyEdu/user/nav?page=1&keywords=${result.keywords}&sPeriod=1&sGrade=2&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}"
									rel="nofollow">二年级</a></li>
								<li id="sGrade_3" class="sGrade"><a href="/FamilyEdu/user/nav?page=1&keywords=${result.keywords}&sPeriod=1&sGrade=3&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}"
									rel="nofollow">三年级</a></li>
								<li id="sGrade_4" class="sGrade"><a href="/FamilyEdu/user/nav?page=1&keywords=${result.keywords}&sPeriod=1&sGrade=4&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}"
									rel="nofollow">四年级</a></li>
								<li id="sGrade_5" class="sGrade"><a href="/FamilyEdu/user/nav?page=1&keywords=${result.keywords}&sPeriod=1&sGrade=5&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}"
									rel="nofollow">五年级</a></li>
								<li id="sGrade_6" class="sGrade"><a href="/FamilyEdu/user/nav?page=1&keywords=${result.keywords}&sPeriod=1&sGrade=6&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}"
									rel="nofollow">六年级</a></li>

							</ul>
							<ul class='grade-div' id="sPeriod2">
								<li id="sGrade_200" class="sGrade"><a
									href="/FamilyEdu/user/nav?page=1&keywords=${result.keywords}&sPeriod=2&sGrade=200&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}" rel="nofollow">全部</a>
								</li>
								<li id="sGrade_7" class="sGrade"><a href="/FamilyEdu/user/nav?page=1&keywords=${result.keywords}&sPeriod=2&sGrade=7&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}"
									rel="nofollow">初一</a></li>
								<li id="sGrade_8" class="sGrade"><a href="/FamilyEdu/user/nav?page=1&keywords=${result.keywords}&sPeriod=2&sGrade=8&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}"
									rel="nofollow">初二</a></li>
								<li id="sGrade_9" class="sGrade"><a href="/FamilyEdu/user/nav?page=1&keywords=${result.keywords}&sPeriod=2&sGrade=9&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}"
									rel="nofollow">初三</a></li>

							</ul>
							<ul class='grade-div' id="sPeriod3">
								<li id="sGrade_300" class="sGrade"><a
									href="/FamilyEdu/user/nav?page=1&keywords=${result.keywords}&sPeriod=3&sGrade=300&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}" rel="nofollow">全部</a>
								</li>
								<li id="sGrade_10" class="sGrade"><a href="/FamilyEdu/user/nav?page=1&keywords=${result.keywords}&sPeriod=3&sGrade=10&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}"
									rel="nofollow">高一</a></li>
								<li id="sGrade_11" class="sGrade"><a href="/FamilyEdu/user/nav?page=1&keywords=${result.keywords}&sPeriod=3&sGrade=11&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}"
									rel="nofollow">高二</a></li>
								<li id="sGrade_12" class="sGrade"><a href="/FamilyEdu/user/nav?page=1&keywords=${result.keywords}&sPeriod=3&sGrade=12&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}"
									rel="nofollow">高三</a></li>
							</ul>
						</td>
					</tr>
					<tr>
						<td>家教性别:</td>
						<td>
							<ul>
								<li id="sGender_0" class="sGender"><a
									href="/FamilyEdu/user/nav?page=1&keywords=${result.keywords}&sGender=0&sTeachMethod=${sessionScope.searchTeachMethod}&sPeriod=${sessionScope.searchPeriod}&sGrade=${sessionScope.searchGrade}" rel="nofollow">全部</a>
								</li>
								<li id="sGender_1" class="sGender"><a href="/FamilyEdu/user/nav?page=1&keywords=${result.keywords}&sGender=1&sTeachMethod=${sessionScope.searchTeachMethod}&sPeriod=${sessionScope.searchPeriod}&sGrade=${sessionScope.searchGrade}"
									rel="nofollow">男</a></li>
								<li id="sGender_2" class="sGender"><a href="/FamilyEdu/user/nav?page=1&keywords=${result.keywords}&sGender=2&sTeachMethod=${sessionScope.searchTeachMethod}&sPeriod=${sessionScope.searchPeriod}&sGrade=${sessionScope.searchGrade}"
									rel="nofollow">女</a></li>
							</ul>
						</td>
					</tr>
					<tr>
						<td>授课方式:</td>
						<td>
							<ul>
								<li id="sTeachMethod_0" class="sTeachMethod"><a
									href="/FamilyEdu/user/nav?page=1&keywords=${result.keywords}&sTeachMethod=0&sGender=${sessionScope.searchGender}&sPeriod=${sessionScope.searchPeriod}&sGrade=${sessionScope.searchGrade}" rel="nofollow">全部</a>
								</li>
								<li id="sTeachMethod_1" class="sTeachMethod"><a href="/FamilyEdu/user/nav?page=1&keywords=${result.keywords}&sTeachMethod=1&sGender=${sessionScope.searchGender}&sPeriod=${sessionScope.searchPeriod}&sGrade=${sessionScope.searchGrade}"
									rel="nofollow">一对一上门教授</a></li>
								<li id="sTeachMethod_2" class="sTeachMethod"><a href="/FamilyEdu/user/nav?page=1&keywords=${result.keywords}&sTeachMethod=2&sGender=${sessionScope.searchGender}&sPeriod=${sessionScope.searchPeriod}&sGrade=${sessionScope.searchGrade}"
									rel="nofollow">一对多补习班式教学</a></li>
							</ul>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>

	<div id='product'>
		<div class='wrapper'>
			<div class='course-list-div'>
				<c:forEach var="searchResult" items="${result.data}">
					<div class='course-list-box'>
						<a
							href='/FamilyEdu/user/myCourses/detail?courseId=${searchResult.teacher_image}'
							target='_blank'>
							<div class='course-list-box-left'>
								<div class='course-list-box-left-header'>
									<img alt="家教老师头像" src="${OSS_URL}/${searchResult.teacher_image }" />
								</div>
							</div>
						</a>
						<div class='course-list-box-middle'>
							<div class='course-list-box-middle-name'>
								<span>李老师</span> &nbsp;
								${searchResult.teacher_sex } &nbsp;
								${searchResult.teacher_age }岁
							</div>
							<div class='course-list-box-middle-check'>
								<img alt="Xlrz" class="course-list-box-middle-check-rz"
									src="./image/prove1.png"
									title="学历认证" /> <img alt="Sfrz"
									class="course-list-box-middle-check-rz"
									src="./image/prove2.png"
									title="身份认证" />
							</div>
							<div class='course-list-box-middle-line'>${searchResult.teacher_school }-
								${searchResult.teacher_major } -
								${searchResult.teacher_grade }</div>
							<div class='course-list-box-middle-line'>教学科目：${searchResult.course_teachPeriod }${searchResult.course_teachGrade }${searchResult.course_teachSubject }</div>
							<div class='course-list-box-middle-line'>授课经验：
								${searchResult.teacher_seniority}年 &nbsp;&nbsp;&nbsp;&nbsp;
								授课方式： ${searchResult.course_teachMethod }</div>
							<div class='course-list-box-middle-line'>个人简介:
								${searchResult.teacher_introduction }</div>
						</div>
						<div class='course-list-box-right'>
							<div class='course-list-box-right-detail'>
								<a
									href="/FamilyEdu/user/myCourses/detail?courseId=${searchResult.id }"
									class="btn btn-success" target="_blank"
									style="margin-top: 50px;">查看详情</a>
							</div>
						</div>
						<div class='course-list-box-line'></div>
					</div>

				</c:forEach>

			</div>
		</div>
	</div>
	<div id="pageNav"
		style="text-align: center; width: 1100px; margin: 0 auto;">
		<nav style="text-align: center;">
		<ul class="pagination">
			<c:if test="${result.page!=1}">
				<li><a
					href="/FamilyEdu/user/nav?page=${result.page}&pageAction=pre&keywords=${result.keywords}"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>
			<c:forEach begin="${1}"
				end="${result.totalPage}" var="v">
				<c:if test="${ v==searchCurrentPage}">
					<li class="active"><a
						href="/FamilyEdu/user/nav?page=${v }&keywords=${result.keywords}">${v}</a>
						</form></li>
				</c:if>
				<c:if test="${ v!=searchCurrentPage}">
					<li><a
						href="/FamilyEdu/user/nav?page=${v }&keywords=${result.keywords}">${v}</a>
					</li>
				</c:if>
			</c:forEach>
			<c:if
				test="${result.totalPage!=result.page}">
				<c:if test="${result.totalPage!=0}">
				<li><a
					href="/FamilyEdu/user/nav?page=${result.page}&pageAction=next&keywords=${result.keywords}"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
				</c:if>
			</c:if>
		</ul>
		</nav>
	</div>

	<%@include file="base/footer-div.jsp"%>
	<script type="text/javascript">
		function searchPeriod0(){
			jQuery("#sPeriod1").hide();
			jQuery("#sPeriod2").hide();
			jQuery("#sPeriod3").hide();
			jQuery(".sPeriod").removeClass("search-active");
			jQuery("#sPeriod_0").attr("class","search-active");
		}
		function searchPeriod1(){
			jQuery("#sPeriod1").show();
			jQuery("#sPeriod2").hide();
			jQuery("#sPeriod3").hide();
			jQuery(".sPeriod").removeClass("search-active");
			jQuery("#sPeriod_1").addClass("search-active");
		}
		function searchPeriod2(){
			jQuery("#sPeriod1").hide();
			jQuery("#sPeriod2").show();
			jQuery("#sPeriod3").hide();
			jQuery(".sPeriod").removeClass("search-active");
			jQuery("#sPeriod_2").addClass("search-active");

		}
		function searchPeriod3(){
			jQuery("#sPeriod1").hide();
			jQuery("#sPeriod2").hide();
			jQuery("#sPeriod3").show();
			jQuery(".sPeriod").removeClass("search-active");
			jQuery("#sPeriod_3").addClass("search-active");
		}
		function searchGrade(grade){
			jQuery(".sGrade").removeClass("search-active");
			jQuery("#sGrade_"+grade).addClass("search-active");
		}
		function searchGender(gender){
			jQuery(".sGender").removeClass("search-active");
			jQuery("#sGender_"+gender).addClass("search-active");
		}
		function searchTeachMethod(teachMethod){
			jQuery(".sTeachMethod").removeClass("search-active");
			jQuery("#sTeachMethod_"+teachMethod).addClass("search-active");
		}
	</script>
	<!-- out.print("<script type='text/javascript'>searchPeriod3();</script>");
	out.print("<script type='text/javascript'>searchGrade(12);</script>"); -->
	<c:if test="${result.sPeriod} = '*'">
		<script type='text/javascript'>searchPeriod0();</script>
	</c:if>
	<c:if test="${result.sPeriod} = '1'" >
		<script type='text/javascript'>searchPeriod1();</script>
	</c:if>
	<c:if test="${result.sPeriod }= '2'">
		<script type='text/javascript'>searchPeriod2();</script>
	</c:if>
	<c:if test="${result.sPeriod} = '3'">
		<script type='text/javascript'>searchPeriod3();</script>
	</c:if>


	<%-- <c:if test="${result.sGrade!=null}">
		<script type='text/javascript'>searchGrade("+session.getAttribute("searchGrade")+");</script>
	</c:if> --%>
	<%--  <%
		if(session.getAttribute("searchPeriod")==null || session.getAttribute("searchPeriod").equals("0")){
			out.print("<script type='text/javascript'>searchPeriod0();</script>");
		}
		else if(session.getAttribute("searchPeriod").equals("1")){
			out.print("<script type='text/javascript'>searchPeriod1();</script>");
		}else if(session.getAttribute("searchPeriod").equals("2")){
			out.print("<script type='text/javascript'>searchPeriod2();</script>");
		}else if(session.getAttribute("searchPeriod").equals("3")){
			out.print("<script type='text/javascript'>searchPeriod3();</script>");
		}
		if(session.getAttribute("searchGrade")!=null){
			out.print("<script type='text/javascript'>searchGrade("+session.getAttribute("searchGrade")+");</script>");
		}
		if(session.getAttribute("searchGender")!=null){
			out.print("<script type='text/javascript'>searchGender("+session.getAttribute("searchGender")+");</script>");
		}
		if(session.getAttribute("searchTeachMethod")!=null){
			out.print("<script type='text/javascript'>searchTeachMethod("+session.getAttribute("searchTeachMethod")+");</script>");
		}
	%>  --%>
</body>
</html>