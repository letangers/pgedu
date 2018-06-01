<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<!-- 动态获取URL 选择菜单 -->
		<script type="text/javascript">
		 	$(function(){//indexOf("Text") > 0
		 		var pathname = window.location.pathname;
		 		var tOrp = pathname.split('/')[1];
		 		$("#addOrders").hide();
		 	
		 		if(pathname.indexOf("infoBase")>0){ //基本信息
		 			$("#infoBase").addClass("p_active");
		 			
		 		}else if(pathname.indexOf("student")>0){//学习成果
		 			$("#student").addClass("p_active");
		 		}else if(pathname.indexOf("updatePassword")>0){//密码修改
		 			$("#updatePassword").addClass("p_active");
		 		}else if(pathname.indexOf("course")>0){//发布课程
		 			$("#course").addClass("p_active");
		 		}else if(pathname.indexOf("show.html")>0){//发布课程
		 			
		 			$("#orders").addClass("p_active");
		 		}else if(pathname.indexOf("order")>0){//发布课程
		 			
		 			$("#addOrders").addClass("p_active");
		 			$("#addOrders").show();
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
					<li><a id="infoBase" href='/p/infoBase.html'> <span
							class='pnav-left'> 基本信息 </span>
					</a></li>
					<li><a id="student" href='/p/student.html'> <span
							class='pnav-left'> 学生信息 </span>
					</a></li>
					<li><a id="updatePassword" href='/user/updatePassword.html'>
							<i class='pnav-left'></i> 密码修改
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
						<a id="addOrders" href="javascript:void(0);"> <i class="glyphicon glyphicon glyphicon-pencil"></i> 生成订单
						</a>
						<a id="orders" href='/order/show.html'> <i
							class='glyphicon glyphicon-align-justify'></i> 订单管理
					</a></li> 
				</ul>
			</div>
			<div class='p_block'></div>
		</div>