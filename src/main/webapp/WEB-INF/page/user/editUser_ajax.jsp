<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
 <base href="<%=basePath%>" /> 
 <script type="text/javascript">
	$(document).ready(function() {
		var id = $("#id").val();
	});	
 
	
// 	function resetPassword(){
// 		var id = $("#id").val();
// 		if(id=='' || id== null){
// 			return ;
// 		}else{
// 			$.ajax({
// 		        type: "POST",
// 		        url: 'user/resetPassword',
// 		        data: "id=" + id ,
// 		        success: function (data) {
// 		        	if(data!=null || data !='')
// 		        		if(data=='success'){
// 		        			alert('修改成功');
// 		        		}else{
// 		        			alert("修改失败："+data);
// 		        		}
		        		
// 		        },
// 		        error: function(data) {
// 		            alert("error:"+data.responseText);
// 		         }
// 		    });
// 		}
// 	}
 
	 function saveUser(){
			$.ajax({
		        type: "POST",
		        url: 'user/saveUser',
		        data: $('#UserForm').serialize() ,
		        dataType:'text',
		        success: function (data) {
		        	if(data!=null || data !='')
		        		if(data=='success'){
		        			reloadGrid();
		        			win_close();
		        		}else{
		        			alert("保存失败："+data);
		        		}
		        		
		        },
		        error: function(data) {
		            alert("error:"+data.responseText);
		         }
		    });
			
		}
 
 	
//  	function validate(){
//  		return true;
//  		var item = $(":checkbox:checked"); 
//  		var len=1; 
//  		var account = $("#userName").val();
//  		var password = $("#password").val();
//  		if(len==0){ 
//  		  alert("请选择用户角色");
//  		  return false;
//  		}else if(account==''){
//  			 	alert("请输入系统账号");
//  	 		  return false;
//  		} else if(password==''){
// 			 	alert("请输入真实姓名");
// 	 	 		  return false;
// 	 		}
 		
//  		return true;
 		
//  	}
 
 
//  	function validateAccount(){
//  		var id = $("#id").val();
//  		if(id!=''){
//  			return ;
//  		}
//  		return ;
//  		var account = $("#userName").val();
//  		$.ajax({
// 	        type: "POST",
// 	        url: 'user/validateAccount',
// 	        data: 'account=' + account ,
// 	        success: function (data) {
// 	        	if(data!=null || data !='')
// 	        		if(data=='success'){
	        			
// 	        		}else{
// 	        			//alert("该账号已经存在，请重新输入");
// 	        			//$("#userName").focus();  
// 	        		}
	        		
// 	        }
// 	    });
//  	}
 

</script>
 
 <div class="page-header">
	<h1>
		用户
		<small>
			<i class="ace-icon fa fa-angle-double-right"></i>
			${action }
		</small>
	</h1>
</div>
 
 <form class="form-horizontal" id="UserForm" >
<div class="row">
<div class="col-xs-12">
<!-- PAGE CONTENT BEGINS -->

<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 用户： </label>

	<div class="col-sm-9">
		<input type="text" id="userName" name="userName"   class="col-xs-10 col-sm-5"  value="${currentUser.userName }" onblur="validateAccount()"/>
		<input type="hidden" id="id" name="id"  value="${currentUser.id }"/>
	</div>
</div>
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 密码： </label>

	<div class="col-sm-9">
		<input type="text" id="password" name="password"   class="col-xs-10 col-sm-5"  value="${currentUser.password }"/>
	</div>
</div>
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> email：</label>
	<div class="col-sm-9">
		<input type="text" id="email" name="email"   class="col-xs-10 col-sm-5"  value="${currentUser.email }"/>
	</div>
</div>
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> info：</label>
	<div class="col-sm-9">
		<input type="text" id="info" name="info"   class="col-xs-10 col-sm-5"  value="${currentUser.info }"/>
	</div>
</div>
<div class="form-group">
	<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> createTime：</label>
	<div class="col-sm-9">
		<input type="date" id="createTime" name="createTime"   class="col-xs-10 col-sm-5"  value="${currentUser.createTime }"/>
	</div>
</div>



<div class="clearfix form-actions">
	<div class="col-md-offset-3 col-md-9">
		<button class="btn btn-info" type="button" onclick="saveUser()">
			<i class="ace-icon fa fa-check bigger-110"></i>
			保存
		</button>

		&nbsp; &nbsp; &nbsp;
		<button class="btn" type="reset" onclick="win_close()">
			<i class="ace-icon fa fa-undo bigger-110"></i>
			取消
		</button>
	</div>
</div>
</div>
</div>
</form>
