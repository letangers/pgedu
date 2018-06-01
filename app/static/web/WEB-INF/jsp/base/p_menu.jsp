<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<!-- 动态获取URL 选择菜单 -->
		<script type="text/javascript">
		 	$(function(){//indexOf("Text") > 0
		 		var pathname = window.location.pathname;
		 		var tOrp = pathname.split('/')[1];
		 		if(pathname.indexOf("infoBase")>0){ //基本信息
		 			$("#infoBase").addClass("p_active");
		 		}else if(pathname.indexOf("achievement")>0){//学习成果
		 			$("#achievement").addClass("p_active");
		 		}else if(pathname.indexOf("experience")>0){//教学经历
		 			$("#experience").addClass("p_active");
		 		}else if(pathname.indexOf("updatePassword")>0){//密码修改
		 			$("#updatePassword").addClass("p_active");
		 		}else if(pathname.indexOf("course")>0){//发布课程
		 			$("#course").addClass("p_active");
		 		}else if(pathname.indexOf("show.html")>0){
		 			$("#orders").addClass("p_active");
		 		}else{//用户中心 
		 			$("#userCenter").addClass("p_active");
		 		}
		 	});
		</script>
		<div class='p_menu'>
			<div class='p_block'>
				<div class='p_block_title'>
					<h4>我的信息</h4>
				</div>
			</div>
			<div class='p_block'>
				<ul class='nav'>
					<li><a id="userCenter" href='/user/center/${sessionScope.user.uid}.html'>
							<i class='glyphicon glyphicon-user'></i> 用户中心
					</a></li>
					<li><a id="infoBase" href='/t/infoBase.html'> <span
							class='pnav-left'> 基本信息 </span>
					</a></li>
					<li><a id="achievement" href='/t/achievement.html'> <span
							class='pnav-left'> 学习成果 </span>
					</a></li>
					<li><a id="experience" href='/t/experience.html'> <span
							class='pnav-left'> 教学经历 </span>
					</a></li>
					<li><a id="updatePassword" href='/user/updatePassword.html'>
							<i class='pnav-left'></i> 密码修改
					</a></li>
				</ul>
			</div>
			<div class='p_block'>
				<div class='p_block_title'>
					<h4>我的课程</h4>
				</div>
			</div>
			<div class='p_block'>
				<ul id="course" class='nav'>
					<li><a 
						href='/course.html'> <i
							class='glyphicon glyphicon-circle-arrow-up'></i> 我的课程
					</a></li>
				</ul>
			</div>
			<div class='p_block'>
				<div class='p_block_title'>
					<h4>我的订单</h4>
				</div>
			</div>
			<div class='p_block'>
				<ul class='nav'>
					<li>
						
						<a id="orders" href='/order/show.html'> <i
							class='glyphicon glyphicon-align-justify'></i> 订单管理
					</a></li> 
				</ul>
			</div>
			<div class='p_block'></div>
		</div>