<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link href="${pageContext.request.contextPath}/css/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.js"
	type="text/javascript"></script>

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
								教学经历 </i>
						</h4>
					</div>
				</div>
				<div class='p_block'>
					<div class='t_main'>
						<div class='t_right'>
							<div class='show'>
								<div class='panel-body'>
									<form accept-charset="UTF-8"
										action="/t/addExperience.do"
										class="form-horizontal tpadding" id="addExperience"
										method="post">
										<input type="hidden" name="uid"
											value="${sessionScope.user.uid }">
										<div class='form-group te-mgb'>
											<div class='col-md-12 col-xs-12'>
												<div class='form-group'>
													<div class='tpadding'>
														<div class='form-group'>
															<div class='tpadding'>
																<div class='form-group'>
																	<div class='col-md-12 col-xs-12'>
																		<div class='col-md-12 col-xs-12 info-bottom'>
																			<div class='col-md-4 col-xs-4'>
																				<h4>我的教学生涯</h4>
																			</div>
																			<div class='col-md-2 col-xs-2' style="float: right;">
																				<button class='btn btn-success'>
																					<span class='glyphicon glyphicon-floppy-save'></span>
																					保存信息
																				</button>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div id='careers_content'></div>
														<div class="fields">
															<div
																class='panel panel-default tpanel-titles tpanel-ab b-radius'>
																<div class='panel-heading tpanel-titles b-radius'>
																	<div class='tpadding'>
																		<div class='row'>
																			<div class='col-md-4 col-xs-4'>我的学生</div>
																		</div>
																	</div>
																</div>
																<div class='panel-body'>
																	<div class='row form-group'>
																		<div class='col-md-2 col-xs-2'>
																			<div class='start-time'>
																				<input class="form-control sel_time" id="beginDate"
																					name="begintime" placeholder="开始辅导时间" size="30"
																					type="text" required readonly="readonly" />
																			</div>
																		</div>
																		<div class='col-md-2 col-xs-2'>
																			<div class='end-time'>
																				<input class="form-control sel_time" id="endDate"
																					name="endtime" placeholder="辅导结束时间" type="text"
																					required readonly="readonly" />
																			</div>
																		</div>
																		<div class='col-md-2 col-xs-2'>
																			<input class="form-control" id="studentName"
																				name="name" placeholder="学生姓名" size="30"
																				type="text" required />
																		</div>
																		<div class='col-md-3 col-xs-3'>
																			<input class="form-control" id="studentSchool"
																				name="grade" placeholder="学生所在学校、年级"
																				size="30" type="text" required />
																		</div>
																		<div class='col-md-3 col-xs-3'>
																			<input class="form-control" id="studentSubject"
																				name="subject" placeholder="辅导科目" size="30"
																				type="text" required />
																		</div>
																	</div>
																	<div class='row'>
																		<div class='col-md-12 col-xs-12'>
																			<textarea class="form-control" cols="40"
																				id="teachExperience" name="achievement"
																				placeholder="请根据你对学生的辅导情况，谈谈辅导经验" rows="6" required>
</textarea>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
								<div class='panel-body'>
									<div class="form-horizontal tpadding">
										<input type="hidden" name="uid"
											value="${sessionScope.user.uid }">
										<div class='form-group te-mgb'>
											<div class='col-md-12 col-xs-12'>
												<div class='form-group'>
													<div class='tpadding'>
														<div class='form-group'>
															<div class='tpadding'>
																<div class='form-group'>
																	<div class='col-md-12 col-xs-12'>
																		<div class='col-md-12 col-xs-12 info-bottom'>
																			<div class='col-md-4 col-xs-4'>
																				<h4>我的教学生涯展示</h4>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div id='careers_content'></div>
														<div class="fields">
															<c:forEach var="experience"
																items="${experiences}">
																<form
																	action="/t/deleteExperience.do"
																	method="post">
																	<input name="teid" type="hidden"
																		value="${experience.teid }">
																	<div
																		class='panel panel-default tpanel-titles tpanel-ab b-radius'>
																		<div class='panel-heading tpanel-titles b-radius'>
																			<div class='tpadding'>
																				<div class='row'>
																					<div class='col-md-4 col-xs-4'>我的学生</div>
																					<div
																						class='col-md-1 col-xs-1 col-md-offset-7 col-xs-offset-7'>
																						<button
																							onClick="return confirm('点击确定将删除该学习经历，是否确定？')"
																							style="border: none; height: 20px; background-color: #EFEFEF;">
																							<span class='glyphicon glyphicon-remove-circle'></span>
																						</button>
																					</div>
																				</div>
																			</div>
																		</div>
																		<div class='panel-body'>
																			<div class='row form-group'>
																				<div class='col-md-2 col-xs-2'>
																					<div class='start-time'>
																						<input class="form-control sel_time"
																							value="${experience.beginTime }" size="30"
																							type="text" readonly="readonly" />
																					</div>
																				</div>
																				<div class='col-md-2 col-xs-2'>
																					<div class='end-time'>
																						<input class="form-control sel_time"
																							value="${experience.beginTime }" type="text"
																							readonly="readonly" />
																					</div>
																				</div>
																				<div class='col-md-2 col-xs-2'>
																					<input class="form-control" size="30"
																						value="${experience.name }" type="text"
																						readonly="readonly" />
																				</div>
																				<div class='col-md-3 col-xs-3'>
																					<input class="form-control" size="30"
																						value="${experience.grade }" type="text"
																						readonly="readonly" />
																				</div>
																				<div class='col-md-3 col-xs-3'>
																					<input class="form-control" size="30"
																						value="${experience.subject }" type="text"
																						readonly="readonly" />
																				</div>
																			</div>
																			<div class='row'>
																				<div class='col-md-12 col-xs-12'>
																					<textarea class="form-control" cols="40" rows="6"
																						readonly="readonly">${experience.achievement }</textarea>
																				</div>
																			</div>
																		</div>
																	</div>
																</form>
															</c:forEach>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
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
	jQuery(document).ready(function() {
		$("#addExperience").validate();
	});
	jQuery('#beginDate').datepicker();
	jQuery('#endDate').datepicker();
</script>
</html>