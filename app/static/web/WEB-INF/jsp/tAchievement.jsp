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
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"
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
								学习成果 </i>
						</h4>
					</div>
				</div>
				<div class='p_block'>
					<div class='t_main'>
						<div class='t_right'>
							<div class='show'>
								<div class='panel-body'>
									<form accept-charset="UTF-8"
										action="/t/addAchievement.do"
										class="form-horizontal tpadding" enctype="multipart/form-data"
										id="addAchievement" method="post">
										<h4 class='text-danger'>1.上传学习成绩单、荣誉单、资格证书等,更好展示自我</h4>
										<div class='form-group te-mgb' id="InputsWrapper">
											<div class='col-md-12 info-bottom'>
												<a href="javascript:void(0)" id="addInput"
													class="add_nested_fields"
													style="color: #545454; font-size: 18px; top: 10px; position: absolute; right: 10px;">添加<span
													class='glyphicon glyphicon-pencil'></span></a>
												<div class='col-md-8'>
													<h4>学习成果图片上传</h4>
												</div>
											</div>
											<div class='col-md-4 col-xs-4'>
												<div class='tpadding'>
													<div class='form-group'>
														<div class='panel panel-default tpanel-border tpanel-ab'>
															<div class='panel-heading'>
																<div class='form-group te-mgb'>
																	<div
																		class='col-md-1 col-xs-1 col-md-offset-10 col-xs-offset-10'>
																		<h4 class='panel-title'>
																			<a href="javascript:void(0)"
																				class=" input-group btn-default glyphicon glyphicon-trash remove_nested_fields"
																				data-association="pictures" id="removeInput"></a>
																		</h4>
																	</div>
																</div>
															</div>
															<div class='panel-body'>
																<div class='tpadding'>
																	<div class='form-group'>
																		<label class="control-label col-md-3 tp-left"
																			for="teacher_pictures_attributes_0_标题">标题</label>
																		<div class='col-md-9 col-xs-9'>
																			<div class='btn-group'>
																				<input class="form-control  ctg-title" id="titles"
																					list="img_category" name="titles" size="30"
																					type="text" value="英语四级" required />
																				<datalist id='img_category'>
																				<option value='高考成绩单'></option>
																				<option value='英语四级'></option>
																				<option value='英语六级'></option>
																				<option value='奖学金证书'></option>
																				<option value='荣誉证书'></option>
																				</datalist>
																			</div>
																		</div>
																	</div>
																	<div class='form-group'>
																		<label class="control-label col-md-3 tp-left"
																			for="teacher_pictures_attributes_0_图片">图片</label>
																		<div class='col-md-9 col-xs-9 te-flow'>
																			<input id="imgs" name="images" type="file" required />
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<input class=" btn btn-success" type="submit" value="保存图片"
											style="float: right;" />
									</form>
								</div>
								<div class='panel-body'>
									<div class='form-group te-mgb'>
										<div class='col-md-12 info-bottom'>
											<div class='col-md-8'>
												<h4>学习成果展示</h4>
											</div>
										</div>
									</div>
									<c:forEach var="achievement"
										items="${achievements}">
										<form
											action="/t/deleteAchievement.do"
											method="post">
											<input name="taid" type="hidden" value="${achievement.taid }">
											<div class='col-md-3 col-xs-3'>
												<div class='tpadding'>
													<div class='form-group'>
														<div class='panel panel-default tpanel-border tpanel-ab'>
															<div class='panel-heading' style="height: 30px;">
																<div class='form-group te-mgb'>
																	<div class='col-md-10 col-xs-10 te-right tleft'>
																		${achievement.title}</div>
																	<div class='col-md-2 col-xs-2 tp-left te-zero'>
																		<label class='te-bottom te-top cursor-pointer'>
																			<button
																				onClick="return confirm('点击确定将删除该学习经历，是否确定？')"
																				style="border: none; background-color: #EFEFEF;">
																				<span class='glyphicon glyphicon-remove-circle'></span>
																			</button>
																		</label>
																	</div>
																</div>
															</div>
															<div class='panel-body tp-left te-bottom te-top'>
																<div class='thumbnail honor-img2 te-mgb'>
																	<div class='img-h'>
																		<img
																			
																			height="170px" src="${OSS_URL}/${achievement.image}"
																			width="100%" />
																	</div>
																</div>
															</div>
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


		<%@include file="base/footer-div.jsp"%>
	</div>
</body>
<script type="text/javascript">
	jQuery(document)
			.ready(
					function() {

						var MaxInput = 6;//设置一次最多上传6张图片
						var inputCount = 1;
						var x = jQuery("#InputsWrapper").length;

						jQuery("#addInput")
								.click(
										function() {
											if (x < MaxInput) {
												inputCount++;
												jQuery("#InputsWrapper")
														.append(
																"<div class='col-md-4 col-xs-4'><div class='tpadding'><div class='form-group'><div class='panel panel-default tpanel-border tpanel-ab'><div class='panel-heading'><div class='form-group te-mgb'><div class='col-md-1 col-xs-1 col-md-offset-10 col-xs-offset-10'><h4 class='panel-title'><a href='javascript:void(0)' class='input-group btn-default glyphicon glyphicon-trash remove_nested_fields' data-association='pictures'></a></h4></div></div></div><div class='panel-body'><div class='tpadding'><div class='form-group'><label class='control-label col-md-3 tp-left' for='teacher_pictures_attributes_0_标题'>标题</label><div class='col-md-9 col-xs-9'><div class='btn-group'><input class='form-control ctg-title' id='titles' list='img_category' name='titles' size='30' type='text' value='英语四级' required><datalist id='img_category'><option value='高考成绩单'></option><option value='英语四级'></option><option value='英语六级'></option><option value='奖学金证书'></option><option value='荣誉证书'></option></datalist></div></div></div><div class='form-group'><label class='control-label col-md-3 tp-left' for='teacher_pictures_attributes_0_图片'>图片</label><div class='col-md-9 col-xs-9 te-flow'><input id='imgs' name='images' type='file' required></div></div></div></div></div></div></div></div>");
												x++;
											}
										});

						jQuery("body").on("click", ".remove_nested_fields",
								function(e) {
									$(this).parents("div.col-xs-4").remove();
									x--;
								});
						$("#addAchievement").validate();
					});
</script>
</html>