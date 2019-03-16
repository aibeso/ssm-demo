<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%-- <base href="<%=basePath%>" /> --%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>

	<!-- page specific plugin styles -->
	<script src="../static/ace/assets/js/jquery.2.1.1.min.js"></script>
 	<script src="../static/ace/assets/js/jqGrid/jquery.jqGrid.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="../static/ace/assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="../static/ace/assets/font-awesome/4.1.0/css/font-awesome.min.css" />
	<link rel="stylesheet" href="../static/ace/assets/css/ui.jqgrid.css" />
	
	<script src="../static/ace/assets/js/date-time/bootstrap-datepicker.min.js"></script>
	<link rel="stylesheet" href="../static/ace/assets/css/jquery-ui.custom.min.css" />
	<link rel="stylesheet" href="../static/ace/assets/css/chosen.css" />
	<link rel="stylesheet" href="../static/ace/assets/css/datepicker.css" />
	<link rel="stylesheet" href="../static/ace/assets/css/bootstrap-timepicker.css" />
	<link rel="stylesheet" href="../static/ace/assets/css/daterangepicker.css" />
	<link rel="stylesheet" href="../static/ace/assets/css/bootstrap-datetimepicker.css" />
	<link rel="stylesheet" href="../static/ace/assets/css/colorpicker.css" />
	<link rel="stylesheet" href="../static/ace/assets/css/ace.min.css" id="main-ace-style" />
	
 	<script src="../js/user/userMgr.js"></script> 

	<link rel="stylesheet" href="../static/ace/assets/css/ace-skins.min.css" />
	<link rel="stylesheet" href="../static/ace/assets/css/ace-rtl.min.css" />
	
		<script src="../static/ace/assets/js/jquery-ui.min.js"></script>
		<script src="../static/ace/assets/js/jqGrid/i18n/grid.locale-cn.js"></script>
		<script src="../static/ace/assets/js/bootstrap.min.js"></script>
		<script src="../static/ace/assets/js/ace-elements.min.js"></script>
		<script src="../static/ace/assets/js/ace.min.js"></script>
		<script src="../static/ace/assets/js/typeahead.jquery.min.js"></script>
		<script src="../static/ace/assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="../static/ace/assets/js/jquery.easypiechart.min.js"></script>
		<script src="../static/ace/assets/js/jquery.sparkline.min.js"></script>
		<script src="../static/ace/assets/js/flot/jquery.flot.min.js"></script>
		<script src="../static/ace/assets/js/flot/jquery.flot.pie.min.js"></script>
		<script src="../static/ace/assets/js/flot/jquery.flot.resize.min.js"></script>
		
		
	
		<script type="text/javascript">
		$(document).ready(function() {
			
		});	
	</script>

</head>


<body>
	<div class="space-15"></div>
	<div class="row">
		<div class="col-sm-12">
		<div class="widget-box">
			<div class="widget-body">
				<div class="widget-main">
				<form id="searchForm" action="" method="post">
					<div class="row">

					<div class="col-sm-3 ">
						<div class="form-group">
							<label class="col-sm-4 control-label no-padding-right" for="form-field-2">用户：</label>
							<div class="col-sm-8">
								<input type="text" id="userName" name="userName"  class="form-control" />
							</div>
						</div>
					</div>
					<div class="col-sm-3 ">
						<div class="form-group">
							<label class="col-sm-4 control-label no-padding-right" for="form-field-2">密码：</label>
							<div class="col-sm-8">
								<input type="text" id="password" name="password"  class="form-control" />
							</div>
						</div>
					</div>
					</div>
					<div class="space-6"></div>
					
					<div class="row">
					<div class="col-sm-3 ">
						<div class="form-group">
							<label class="col-sm-4 control-label no-padding-right" for="form-field-2">邮箱：</label>
							<div class="col-sm-8">
								<input type="text" id="email" name="email"  class="form-control" />
							</div>
						</div>
					</div>
					<div class="col-sm-3" >
						<div class="form-group">
							<label class="col-sm-4 control-label no-padding-right" for="form-field-2">信息：</label>
							<div class="col-sm-8">
								<input type="text" id="info" name="info" class="form-control" />
							</div>
						</div>
					</div>
					<div class="col-sm-3 ">
						<div class="form-group">
							<label class="col-sm-4 control-label no-padding-right" for="form-field-2">创建日期：</label>
							<div class="col-sm-8">
								<input type="date" id="createTime" name="createTime"  class="form-control" />
							</div>
						</div>
					</div>
					
					</div>

					</form>
					</div> 
					
					
					<div class="space-6"></div>
					
					<div class="row">
					<div class="col-sm-4">
						<div class="form-group padding-left">
						&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-sm btn-success" onclick="search()">
								查询
							</button>
						</div>
					</div>
					<div class="col-sm-2" >
					</div>
					<div class="col-sm-3" >
					</div>
					<div class="col-sm-3">
					</div>
					
					</div> 
					
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
	
		<div class="col-sm-12">
			<div class="widget-box">
				<div class="widget-main no-padding">
					<div class="modal-body no-padding">
					<table id="grid-table"></table>
					<div id="grid-pager"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="win"></div>

</body>
</html>