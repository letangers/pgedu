<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>搜索-盘古教育</title>
  <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/search.css">
  <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layui.css">
</head>
<body>
	<%@include file="base/site-nav.jsp"%>
	 <div class="layui-col-md12 header">
			<div class="layui-container">
			  <div class="layui-row" >
					 <div class="layui-col-md3 ">
					    <div class="header-logo">
							<a href="/index.html"> <img alt="盘古教育" class="header-logo-img"
														src="${pageContext.request.contextPath}/image/logo2.png" /></a>
						</div>
					 </div>
					 <div class="layui-col-md9 ">
					   <div class="header-search">
							<form accept-charset="UTF-8" action="/search.html" method="get">
								<div class="header-search-form">
									<i class="glyphicon glyphicon-search"></i> 
									<input type="hidden" name="page" id="hidpage" >
									<input type="hidden" name="sPeriod" id="hidsPeriod" >
									<input type="hidden" name="sGender" id="hidsGender" >
									<input type="hidden" name="sTeachMethod" id="hidsTeachMethod" >
									<input class="header-search-input" id="inputSearch" name="keywords" placeholder="请输入您要搜索的课程"> <input class="header-search-btn" name="commit" type="submit" value="搜索">
								</div>
							</form>
						</div>
					 </div>
					 
				</div>
			</div> 
	 </div> 
	 <!-- 课程筛选 -->
	 <div class="layui-container">
		  <div class="layui-row" >
		  	 <div class="layui-col-md12  search-item-box">
  	 			  <div class="layui-row" >
				  	 <div class="layui-col-md12">
				  	 	<fieldset class="layui-elem-field layui-field-title">
						  <legend>课程筛选</legend>
						</fieldset>
				  	 </div>
				  </div>
				  
				  <div class="layui-row" id="sPeridContainer">
				  	
				  </div>
				  
				  <div class="layui-row" id="sSexContainer">
				  	
				  	 
				  </div>
				  
				  <div class="layui-row" id="sTeachMethodContainer">
				  	
				  </div>
		  	 </div>
		  </div>
	 </div>
	 <div class="layui-container">
		  <div class="layui-row" >
		  	 <div class="layui-col-md12 course-list-div " id="resultItemContainer">

	   	 	 </div>
		</div>
	 </div>
	 <div id="pageNav" style="text-align: center;"></div>
	
	<%@include file="base/footer-div.jsp"%>
<script src="${pageContext.request.contextPath}/js/layui.js"></script>

<script>
//jquery 获取数据
var resultVo = ${resultVo};


if(resultVo.page!=null)
	$("#hidpage").val(resultVo.page);
if(resultVo.sPeriod!=null)
	$("#hidsPeriod").val(resultVo.sPeriod);
if(resultVo.sGender!=null)
	$("#hidsGender").val(resultVo.sGender);
if(resultVo.sTeachMethod!=null)
	$("#hidsTeachMethod").val(resultVo.sTeachMethod);
if(resultVo.keywords!=null){
	$("#inputSearch").attr('placeholder',resultVo.keywords);
	$("#inputSearch").val(resultVo.keywords);
}



console.log(resultVo);
/* $.ajax({
	url:"http://localhost:8080/search/data.do",
	data:{
		"keywords" : "${keywords}",
		"sPeriod": "${sPerid}",
    	"sGrade": "${sGrade}",
    	"sGender": "${sGender}",
    	"sTeachMethod": "${sTeachMethod}"
	},
	success:function(data){
		console.log(data);
		resultVo = data;
	},
	method:"post",
	async:false
}); */
</script>
<script>





//一般直接写在一个js文件中
layui.use(['laypage','layer','form','element','jquery'], function(){
  var layer = layui.layer
  ,form = layui.form
  ,element = layui.element
  ,laypage = layui.laypage
  ,$ = layui.$;
  
  //动态获取数据 

  //设置分页
  laypage.render({
    elem: 'pageNav' //注意，这里的 test1 是 ID，不用加 # 号
    ,count: resultVo.count //数据总数，从服务端得到
    ,limit: resultVo.limit //每页显示的条数。laypage将会借助 count 和 limit 计算出分页数。
    ,limits: [10, 20, 30, 40, 50],
    jump: function(obj, first){
	      //obj包含了当前分页的所有参数，比如：
		    //首次不执行
		    if(!first){
		      console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
	      	   console.log(obj.limit); //得到每页显示的条数
		    }
	    }
  });
  //设置课程筛选

});
</script> 
<!-- 模板引擎 -->
<script type="text/javascript">
	
	layui.use('laytpl', function(){
	  var laytpl = layui.laytpl;
	  
	var getTpl = searchItem.innerHTML;

     /*sPeriod init*/
     var sPeridData = {
	  		"title" : "学生年级",
	  		"list":[{
	  		 	"name" : "全部",
	  		 	"url" : "search.html?keywords="+resultVo.keywords+"&sGender="+resultVo.sGender+"&sGrade="+resultVo.sGrade+"&sPeriod=*&sTeachMethod="+resultVo.sTeachMethod
	  		},{
	  		 	"name" : "小学",
	  		 	"url" : "search.html?keywords="+resultVo.keywords+"&sGender="+resultVo.sGender+"&sGrade="+resultVo.sGrade+"&sPeriod=小学&sTeachMethod="+resultVo.sTeachMethod
	  		},{
	  		 	"name" : "初中",
	  			 "url" : "search.html?keywords="+resultVo.keywords+"&sGender="+resultVo.sGender+"&sGrade="+resultVo.sGrade+"&sPeriod=初中&sTeachMethod="+resultVo.sTeachMethod
	  		},{
	  		 	"name" : "高中",
	  		 	"url" : "search.html?keywords="+resultVo.keywords+"&sGender="+resultVo.sGender+"&sGrade="+resultVo.sGrade+"&sPeriod=高中&sTeachMethod="+resultVo.sTeachMethod
	  		}]
	  }
	  //选中某个节点.
	  switch(resultVo.sPeriod){
	  case "小学":
	  sPeridData.list[1].sel = true;
	  break;
	  case "初中":
	  sPeridData.list[2].sel = true;
	  break;
	  case "高中":
	  sPeridData.list[3].sel = true;
	  break;
	  default:
	  sPeridData.list[0].sel = true;
	  break;
	  }
	  
	  var sPeridView = document.getElementById('sPeridContainer');
		
	  laytpl(getTpl).render(sPeridData, function(html){
		  sPeridView.innerHTML = html  + "<hr>";;
	  });
	  
     /*sGrade init
     var sGradeData = {
	  		"title" : "学生年级",
	  		"list":[{
	  		 	"name" : "全部",
	  		 	"url" : "xxxx"
	  		},{
	  		 	"name" : "小学",
	  		 	"url" : "xxxx"
	  		},{
	  		 	"name" : "初中",
	  		 	"url" : "xxxx"
	  		},{
	  		 	"name" : "高中",
	  		 	"url" : "xxxx"
	  		}]
	  }
	  var sGradeView = document.getElementById('sPeridContainer');
		
	  laytpl(getTpl).render(sGradeData, function(html){
		  sPeridView.innerHTML = html  + "<hr>";;
	  });*/
	//"url" : "search.html?keywords="+resultVo.keywords+"&sGender="+resultVo.sGender+"&sGrade="+resultVo.sGrade+"&sPeriod="+resultVo.sPeriod+"&sTeachMethod="+resultVo.sTeachMethod
     /*sSex init*/
      var sSexData = {
	  		"title" : "家教性别",
	  		"list":[{
	  		 	"name" : "全部",
	  		 	"url" : "search.html?keywords="+resultVo.keywords+"&sGender=*&sGrade="+resultVo.sGrade+"&sPeriod="+resultVo.sPeriod+"&sTeachMethod="+resultVo.sTeachMethod
	  		},{
	  		 	"name" : "男",
	  		 	"url" : "search.html?keywords="+resultVo.keywords+"&sGender=男&sGrade="+resultVo.sGrade+"&sPeriod="+resultVo.sPeriod+"&sTeachMethod="+resultVo.sTeachMethod
	  		},{
	  		 	"name" : "女",
	  		 	"url" : "search.html?keywords="+resultVo.keywords+"&sGender=女&sGrade="+resultVo.sGrade+"&sPeriod="+resultVo.sPeriod+"&sTeachMethod="+resultVo.sTeachMethod
	  		}]
	  };
	  
	  //选中某个节点.
	  switch(resultVo.sGender){
	  case "男":
	  	sSexData.list[1].sel = true;
	  break;
	  case "女":
	  	sSexData.list[2].sel = true;
	  break;
	  default:
	  	sSexData.list[0].sel = true;
	  break;
	  }
	  
	  var sSexView = document.getElementById('sSexContainer');
		
	  laytpl(getTpl).render(sSexData, function(html){
		  sSexView.innerHTML = html  + "<hr>";;
	  });

	  /*sTeacherMethod init*/
      var sTeachMethodContainerData = {
	  		"title" : "授课方式",
	  		"list":[{
	  		 	"name" : "全部",
	  		 	"url" : "search.html?keywords="+resultVo.keywords+"&sGender="+resultVo.sGender+"&sGrade="+resultVo.sGrade+"&sPeriod="+resultVo.sPeriod+"&sTeachMethod=*"
	  		},{
	  		 	"name" : "一对一上门教授",
	  		 	"url" : "search.html?keywords="+resultVo.keywords+"&sGender="+resultVo.sGender+"&sGrade="+resultVo.sGrade+"&sPeriod="+resultVo.sPeriod+"&sTeachMethod=一对一上门教授"
	  		},{
	  		 	"name" : "一对多补习班式教学",
	  		 	"url" : "search.html?keywords="+resultVo.keywords+"&sGender="+resultVo.sGender+"&sGrade="+resultVo.sGrade+"&sPeriod="+resultVo.sPeriod+"&sTeachMethod=一对多补习班式教学"
	  		}]
	  };
	  
	   //选中某个节点.
	  switch(resultVo.sTeachMethod){
	  case "一对一上门教授":
	  	sTeachMethodContainerData.list[1].sel = true;
	  break;
	  case "一对多补习班式教学":
	  	sTeachMethodContainerData.list[2].sel = true;
	  break;
	  default:
	  	sTeachMethodContainerData.list[0].sel = true;
	  break;
	  }
	  var sTeachMethodContainerView = document.getElementById('sTeachMethodContainer');
		
	  laytpl(getTpl).render(sTeachMethodContainerData, function(html){
		  sTeachMethodContainerView.innerHTML = html  ;
	  });

	  /*resultItem init*/
		
	    var data = { 
		  "list": resultVo.data
		};
		
		var resultItemTpl = resultItem.innerHTML
		,view = document.getElementById('resultItemContainer');
		laytpl(resultItemTpl).render(data, function(html){
		  
		  view.innerHTML = html;
		});



	}); 
</script>


<script id="searchItem" type="text/html">
	 <div class="layui-col-md1 search-item">
				 	{{d.title}}:
	 </div>
	 <div class="layui-col-md10 ">
		 <div class="menu">
		        <ul>
		        	{{#  layui.each(d.list, function(index, item){ }}
			            <li><a href="{{item.url}}" {{# if(item.sel == true){ }} class="sel" {{# } }}>{{item.name}}</a></li>
		            {{#  }); }}
		        </ul>
		  </div>

	 </div>

</script>
<script id="resultItem" type="text/html">
	{{#  layui.each(d.list, function(index, item){ }}
	  	 	<div class="course-list-box">
					<a href="/FamilyEdu/user/myCourses/detail?courseId=null" target="_blank">
						<div class="course-list-box-left">
							<div class="course-list-box-left-header">
								<img alt="家教老师头像" style=" width: 172px; height: 162px; " src="${OSS_URL}/{{ item.teacher_image }}">
							</div>
						</div>
					</a>
					<div class="course-list-box-middle">
						<div class="course-list-box-middle-name">
							<span>{{ item.teacher_name}}</span> &nbsp;
							{{#  if(item.teacher_sex == 1 || item.teacher_sex == '男'){ }}
								男
							{{#  }else{ }}
								女
							{{#  } }}
							 &nbsp;
							{{ item.teacher_age}}
						</div>
						<div class="course-list-box-middle-check">
							<img alt="Xlrz" class="course-list-box-middle-check-rz" src="./image/prove1.png" title="学历认证"> <img alt="Sfrz" class="course-list-box-middle-check-rz" src="./image/prove2.png" title="身份认证">
						</div>
						<div class="course-list-box-middle-line">{{ item.teacher_school}}-
							{{ item.teacher_major}} -
							{{ item.teacher_grade}}</div>
						<div class="course-list-box-middle-line">教学科目：{{ item.course_teachSubject}}</div>
						<div class="course-list-box-middle-line">授课经验：
							{{ item.teacher_seniority}}年 &nbsp;&nbsp;&nbsp;&nbsp;
							授课方式： {{item.course_teachMethod}}</div>
						<div class="course-list-box-middle-line">个人简介:
							{{item.teacher_introduction}}</div>
					</div>
					<div class="course-list-box-right">
						<div class="course-list-box-right-detail">
							<a href="${pageContext.request.contextPath}/course/detail/{{item.id}}.html" class="layui-btn layui-btn-radius" target="_blank" style="margin-top: 50px;">查看详情</a>
						</div>
					</div>
				</div>
    {{#  }); }}
</script>

</body>
</html>
      