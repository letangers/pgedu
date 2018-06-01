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
<script src="${pageContext.request.contextPath}/js/area.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"
	type="text/javascript"></script>

<script type="text/javascript">
	jQuery(document).ready(function() {
		$("#addCource").validate();
	});
</script>
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
							<i class='glyphicon-color glyphicon glyphicon-circle-arrow-up'>
								我的课程</i>
						</h4>
					</div>
				</div>
				<div class='p_block'>
					<div class='t_main'>
						<div class='t_right'>
							<div class='show'>
								<div class='panel-body'>
									<form accept-charset="UTF-8"
										action="/course/add.do"
										class="form-horizontal tpadding" id="addCourse" method="post">
										<input type="hidden" name="uid"
											value="${sessionScope.user.uid }">
										<h4 class='text-danger'>
											用户已通过资格认证，可以发布课程，每个用户最多可同时发布3个课程！</h4>
										<div class='col-md-12 info-bottom'>
											<div class='col-md-4'>
												<h4>
													发布课程 <span class='font-orange'> (*必填) </span>
												</h4>
											</div>
										</div>
										<div class='col-md-11'>
											<!-- <div class='row'>
												<label class="col-md-5 control-label" style="width: 106px;">居住地区：</label>
												<div class='col-md-7' style="height: 49px;">
													<select id="s_province" name="teachprovince"
														style="height: 34px; width: 113px;" required></select> <select
														id="s_city" name="teachcity"
														style="height: 34px; width: 113px; margin-left: 20px;"></select>
													<select id="s_county" name="teachdistrict"
														style="height: 34px; width: 113px; margin-left: 20px;"></select>

												</div>
											</div> -->
										</div>
										<div class='col-md-11'>
											<div class='row'>
												<div class='col-md-4'>
													<div class='form-group'>
														<label class="col-md-5 control-label">授课方式：</label>
														<div class='col-md-7' style="color: #c00;">
															<select name="teachMethod" required id="teachmethod"
																style="width: 200px; height: 34px; color: #6D6D6D;">
																<option value="">--授课方式--</option>
																<option value="一对一上门教授">一对一上门教授</option>
																<option value="一对多补习班式教学">一对多补习班式教学</option>
															</select>

														</div>
													</div>
												</div>

												<div class='col-md-4' style="margin-left: 100px;">
													<div class='form-group'>
														<label class="col-md-5 control-label">授课类型：</label>
														<div class='col-md-7' style="color: #c00;">
															<select name="teachType" required id="teachType"
																style="width: 200px; height: 34px; color: #6D6D6D;">
																<option value="">--授课类型--</option>
																<option value="小初高教育">小初高教育</option>
																<option value="兴趣特长教学">兴趣特长教学</option>
															</select>

														</div>
													</div>
												</div>
											</div>
										</div>
										<div class='col-md-11'>
											<div class='row'>
												<label class="col-md-5 control-label" style="width: 106px;">适教区域：</label>
												<div class='col-md-7' style="height: 49px;">
													<input class="form-control" name="ableArea" type="text"
														style="width: 630px;" placeholder="填写适教区域" required />
												</div>
											</div>
										</div>
										<div class='col-md-11'>
											<div class='row'>
												<label class="col-md-5 control-label" style="width: 106px;">教授科目：</label>
												<div class='col-md-4' style="width: 160px;" >
													<div class='form-group'>
												<div class='col-md-7' style="color: #c00;">
															<select name="teachPeriod" required
																style="width: 150px; height: 34px; color: #6D6D6D;">
																<option value="">--学生学段--</option>
																<option value="全学段">全学段</option>
																<option value="小学">小学</option>
																<option value="初中">初中</option>
																<option value="高中">高中</option>
															</select>
														</div>
														</div></div>
														<div class='col-md-4' style="width: 160px;" >
														<div class='form-group'>
												<div class='col-md-7' style="color: #c00;">
															<select name="teachGrade" required
																style="width: 150px; height: 34px; color: #6D6D6D;">
																<option value="">--学生年级--</option>
																<option value="小学全年级">小学全年级</option>
																<option value="一年级">一年级</option>
																<option value="二年级">二年级</option>
																<option value="三年级">三年级</option>
																<option value="四年级">四年级</option>
																<option value="五年级">五年级</option>
																<option value="六年级">六年级</option>
																<option value="初中全年级">初中全年级</option>
																<option value="初一">初一</option>
																<option value="初二">初二</option>
																<option value="初三">初三</option>
																<option value="高中全年级">高中全年级</option>
																<option value="高一">高一</option>
																<option value="高二">高二</option>
																<option value="高三">高三</option>
																
															</select>
														</div>
														</div></div>
														<div class='col-md-4' style="width: 160px;" >
														<div class='form-group'>
												<div class='col-md-7'>
															<input style="height: 34px;" type="text" name="teachSubject" placeholder="输入教学科目" required>
														</div></div>
														</div>
											</div>
										</div>
										<div class='col-md-11'>
											<div class='row'>
												<label class="col-md-5 control-label" style="width: 106px;">适教时间：</label>
												<div class='col-md-7' style="height: 49px;">
													<input class="form-control" name="freeTime" required
														type="text" style="width: 630px;"
														placeholder="填写能够教学的时间段，如星期天下午，星期六全天有空，星期五下午2:00~下午5:00等等" />
												</div>
											</div>
										</div>
										<div class='col-md-11'>
											<div class='row'>
												<div class='col-md-2 col-xs-2'
													style="float: right; margin-top: 20px;">
													<button class='btn btn-success'>
														<span class='glyphicon glyphicon-pencil'></span> 发布课程
													</button>
												</div>
											</div>
										</div>
									</form>
								</div>
								<div class='panel-body' style="padding-bottom: 30px;">
									<div class='col-md-12 info-bottom'>
										<div class='col-md-4'>
											<h4>已发布课程</h4>
										</div>
									</div>
								</div>
								<c:forEach items="${courses }" var="course">
								<div class='panel-body'
									style="width: 850px; background: #F7F7F7;margin-left: 13px;margin-bottom: 20px;">
									<form accept-charset="UTF-8"
										action="/course/delete.do"
										class="form-horizontal tpadding" id="deleteCourse"
										method="post">
										<input type="hidden" name="cid"
											value="${course.cid }">
										<div class='col-md-11'>
											<!-- <div class='row'>
												<label class="col-md-5 control-label" style="width: 106px;">居住地区：</label>
												<div class='col-md-7' style="height: 49px;">
													<input class="form-control" name="ablearea" type="text"
														style="width: 630px;" value="{course.ablearea }"
														disabled="disabled" />
												</div>
											</div> -->
										</div>
										<div class='col-md-11'>
											<div class='row' style="height: 49px;">
												<label class="col-md-5 control-label" style="width:106px;">授课方式：</label>
												<div class='col-md-7' style="width: 200px;">
													<input class="form-control" name="teachMethod" type="text"
														value="${course.teachMethod }" disabled="disabled"
														style="width: 230px;">
												</div>

												<label class="col-md-5 control-label" style="text-align: left;width:106px;margin-left: 93px;">授课类型：</label>
												<div class='col-md-7' style="width: 200px;">
													<input class="form-control" name="teachType" type="text"
														value="${course.teachType }" disabled="disabled"
														style="width: 230px;">
												</div>
											</div>
										</div>
								<div class='col-md-11'>
									<div class='row'>
										<label class="col-md-5 control-label" style="width: 106px;">适教区域：</label>
										<div class='col-md-7' style="height: 49px;">
											<input class="form-control" name="ableArea" type="text"
												style="width: 630px;" disabled="disabled"  value="${course.ableArea }"/>
										</div>
									</div>
								</div>
								<div class='col-md-11'>
									<div class='row'>
										<label class="col-md-5 control-label" style="width: 106px;">教授科目：</label>
										<div class='col-md-7' style="height: 49px;">
											<input class="form-control" name="teachSubject" type="text"
												required style="width: 630px;"
												disabled="disabled"  value="${course.teachPeriod }${course.teachGrade }${course.teachSubject }" />
										</div>
									</div>
								</div>
								<div class='col-md-11'>
									<div class='row'>
										<label class="col-md-5 control-label" style="width: 106px;">适教时间：</label>
										<div class='col-md-7' style="height: 49px;">
											<input class="form-control" name="freeTime" required
												type="text" style="width: 630px;"
												disabled="disabled"  value="${course.freeTime }" />
										</div>
									</div>
								</div>
								<div class='col-md-11'>
									<div class='row'>
										<div class='col-md-2 col-xs-2'
											style="float: right; margin-top: 20px;">
											<button class='btn btn-success'>
												<span class='glyphicon glyphicon-pencil'></span> 删除课程
											</button>
										</div>
									</div>
								</div>
								</form>
							</div></c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>

	<%@include file="base/footer-div.jsp"%>
</body>
<script type="text/javascript">
	_init_area();
</script>

</html>