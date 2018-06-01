/**
  RESTful模块
**/ 
layui.define(['jquery','layer'], function(exports){
	var $ = layui.$ 
	,layer = layui.layer;
	//GET（SELECT）：从服务器取出资源（一项或多项）。
	//POST（CREATE）：在服务器新建一个资源。
	//PUT（UPDATE）：在服务器更新资源（客户端提供改变后的完整资源）。
	//PATCH（UPDATE）：在服务器更新资源（客户端提供改变的属性）。
	//DELETE（DELETE）：从服务器删除资源。
	var RESTful = {
	    delete_ : function(dataObj,toUrl,successFun){
	    	dataObj._method = 'DELETE';
	    	$.ajax({
				   url: toUrl,
				   data: dataObj, //这也是一处坑，SpringMVC要求为严格形式的json字符串，必须保证json串不能出现畸形
				   type:"post",
				   traditional:true,
				   dataType:"json",  
				   success:successFun
			 });  
	    },
	    get_ : function(dataObj,toUrl,successFun){
	    	
	    	$.ajax({
				   url: toUrl,
				   data: dataObj, //这也是一处坑，SpringMVC要求为严格形式的json字符串，必须保证json串不能出现畸形
				   type:"get",
				   traditional:true,
				   dataType:"json",  
				   success:successFun
			 });  
	    },
	    post_ : function(dataObj,toUrl,successFun){
	    	
	    	$.ajax({
				   url: toUrl,
				   data: dataObj, //这也是一处坑，SpringMVC要求为严格形式的json字符串，必须保证json串不能出现畸形
				   type:"post",
				   traditional:true,
				   dataType:"json",  
				   success:successFun
			 });  
	    },
	    patch_ : function(dataObj,toUrl,successFun){
	    	dataObj._method = 'PATCH';
	    	$.ajax({
				   url: toUrl,
				   data: dataObj, //这也是一处坑，SpringMVC要求为严格形式的json字符串，必须保证json串不能出现畸形
				   type:"post",
				   traditional:true,
				   dataType:"json",  
				   success:successFun
			 });  
	    },
	    put_ : function(dataObj,toUrl,successFun){
	    	dataObj._method = 'PUT';
	    	$.ajax({
				   url: toUrl,
				   data: dataObj, //这也是一处坑，SpringMVC要求为严格形式的json字符串，必须保证json串不能出现畸形
				   type:"post",
				   traditional:true,
				   dataType:"json",  
				   success:successFun
			 });  
	    }
};
  
 
  
  exports('RESTful', RESTful); //注意，这里是模块输出的核心，模块名必须和use时的模块名一致
});