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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单管理-家教网</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<link href="${pageContext.request.contextPath}/css/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
 <link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/js/jquery.validate.js"
			type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<script src="${pageContext.request.contextPath}/js/layui.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layui.css">

<script type="text/javascript">
	jQuery(document).ready(function() {
		$("#deleteReason").validate();
		jQuery(".deleteBtn").click(function() {
			jQuery("#deleteReason").attr("action", $(this).attr('name'));
		});

	});
</script>
<style type="text/css">
label.error{
	color:#c00;
}
</style>
</head>
<body>
	<%@include file="base/site-nav.jsp"%>
	<%@include file="base/t_p_header.jsp"%>
	<div class='p_main'>
		<div class='p_wrapper'>
			<%@include file="base/p_menu_parent.jsp"%>
			
			
			<div class='p_content' style="min-height: 280px; height: 425px;">
				<div class='p_block'>
					<div class='p_block_title p_content_block_title'>
						<h4 style="
						    top: 12px;
						">
							<i class='glyphicon glyphicon-align-justify'></i> 全部订单
						</h4>
					</div>
				</div>
				<div class="p_block">
					<table id="orderTable" lay-filter="orderTable"></table>
				</div>
			</div>
		</div>
	</div>
	
	
	<%@include file="base/footer-div.jsp"%>
	
	
	<script type="text/javascript">
	//config的设置是全局的
	layui.config({
	  dir: '/layui/' ,
	  base: '/js/' //假设这是test.js所在的目录
	 
	});
	layui.use(['layer','element','table','jquery','RESTful'], function(){
	  var layer = layui.layer
	  ,form = layui.form
	  ,element = layui.element
	  ,table = layui.table
	  ,$ = layui.jquery
	  ,RESTful = layui.RESTful;
	
		  
		 /*  $('#teachDate').datepicker({
			minDate : new Date()

		  });

		 $("#addOrder").validate(); */
		 
		  table.render({
		
		  	  url: '/order.do'
		  	 ,method:'get'
		  	 ,response: {
				  statusName: 'status' //数据状态的字段名称，默认：code
				  ,statusCode: 200 //成功的状态码，默认：0
				  ,msgName: 'errorMsg' //状态信息的字段名称，默认：msg
				  ,countName: 'count' //数据总数的字段名称，默认：count
				  ,dataName: 'data' //数据列表的字段名称，默认：data
				}    
		  	 ,skin: 'nob'
		  	 ,even: true
		  	 ,height: 'full-400' //固定值
		  	 ,page: true
			 ,elem: '#orderTable' //指定原始表格元素选择器（推荐id选择器）
			 ,id: 'idTest'
			 ,cols: [[
			 		
			 		{field:'teachCourse', title: '课程名称', width: 100} //这里的templet值是模板元素的选择器
				    ,{field:'teacherName', title:'家教姓名', width:100}
				   	,{field:'teachDate', title:'试讲日期', width:100,sort:true}
				   	,{field:'parentName', title:'家教姓名', width:100}
				    ,{field:'studentName', title:'学生姓名', width:100}
				    ,{field:'stauts', title:'状态', width:80,templet: '#stautsTpl'}
				    ,{fixed: 'right',  align:'center', toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器
		
				]]
		
			});
		
		
		  	table.on('tool(orderTable)', function(obj){ //注：tool是工具条事件名，orderTable是table原始容器的属性 lay-filter="对应的值"
			  var data = obj.data; //获得当前行数据
			  var layEvent = obj.event; //获得 lay-event 对应的值
			  var tr = obj.tr; //获得当前行 tr 的DOM对象
			 
			
			  if(layEvent === 'cancel'){ //取消
				
				
			    layer.confirm('真到要取消订单么行么', function(index){
			     	
			     	var dataObj = {};
			         RESTful.delete_(dataObj,"/order/"+data.oid+".do",function(ResultVO){
			       	
			    	  if(ResultVO.status == 200 ){
			    		//  obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
			    	      
			    	      table.reload('idTest', {});
						  
						  layer.close(index);
			    	      layer.msg("取消订单成功");
			    	  }else{
			    		  layer.close(index);
			    		  layer.alert("取消失败 错误代码:"+ResultVO.code +" 错误信息:"+ResultVO.msg);
			    	  }
			      }); 
			   });
			  } else if(layEvent === 'update'){ //编辑
			  
			   
			  }
			});
			
			//点击事件监听
			table.on('checkbox(test)',function(obj){
				//console.log(obj);
			});
		});
	</script>
	<script type="text/html" id="stautsTpl">
		
  		{{#if(d.status == 0){ }}
			<span class="layui-badge-rim layui-bg-orange">未支付</span>
 		 {{#  } else if(d.status == 1){ }}
    		<span class="layui-badge-rim layui-bg-gray">待确认</span>
 		{{#  } else if(d.status == 2){ }}
    		<span class="layui-badge-rim layui-bg-green">已确认</span>
		{{#  } else if(d.status == 3){ }}
    		<span class="layui-badge-rim layui-bg-red">已取消</span>
 		{{#  } }}
	</script>

	<script type="text/html" id="barDemo">
  
       <a class="layui-btn layui-btn-mini" lay-event="update" href="${pageContext.request.contextPath}/order/detail/{{d.oid}}.html">查看详情</a>
	   
      
  	 

       <!-- 这里同样支持 laytpl 语法，如： -->
       {{#  if(d.status != 3){ }}
          <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="cancel">取消</a>
       {{#  } }}
	</script>
	
	
	<script type="text/javascript">
		
	</script>
</body>
</html>