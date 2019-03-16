
function setGridWidth(grid_selector){
	
	$(window).bind('resize', function() {
		var parent_column = $(grid_selector).closest('[class*="col-"]');
	    $(grid_selector).setGridWidth(parent_column.width());
	}).trigger('resize');
}



function BusinessTypeGrid(grid_selector,pager_selector){
//	var businessid = $('#businessid').val();
//	if(businessid=='' || businessid == null){
//		//alert("test 暂无数据");
//		//return ;
//	}
	jQuery(grid_selector).jqGrid({
		url: '/demo/user/list',
		datatype: "json",
		height: 300,
		mtype:"POST",
		colNames:['用户','密码', '邮箱', '信息', '创建日期','操作' ],
		colModel:[
//			{name:'id',index:'id',width:90, editable:true},
			{name:'userName',index:'userName', width:90,editable: true,editoptions:{size:"20",maxlength:"30"}},
			{name:'password',index:'password', width:90, editable: true},
			{name:'email',index:'email', width:90, editable: true},
			{name:'info',index:'info', width:90, editable: true},
			{name:'createTime',index:'createTime', width:90, editable: true},
			{name:'myac',index:'business_type', width:80, fixed:true, sortable:false, resize:false,
				formatter:formatOperations
			},
		],
		viewrecords : true,//显示总记录数
		rowNum:10,//在grid上显示记录条数，这个参数是要被传递到后台
		rowList:[10,20,30],
		pager : pager_selector,//定义翻页用的导航栏，必须是有效的html元素。翻页工具栏可以放置在html页面任意位置
		altRows: true, //设置表格 zebra-striped 值
	    jsonReader : {   //描述json 数据格式的数组
	    	 id: "id", 
	    	root:"rows",
	    	page: "page",
	    	total: "total",
	    	records: "records",
	    	repeatitems: false,
	    },
	    caption: "用户管理",//表格名称

		loadComplete : function() { //当从服务器返回响应时执行，xhr：XMLHttpRequest 对象
			var table = this;
			setTimeout(function(){
				updatePagerIcons(table);
			}, 0);
		},

	});
}


function updatePagerIcons(table) {
	var replacement = 
	{
		'ui-icon-seek-first' : 'ace-icon fa fa-angle-double-left bigger-140',
		'ui-icon-seek-prev' : 'ace-icon fa fa-angle-left bigger-140',
		'ui-icon-seek-next' : 'ace-icon fa fa-angle-right bigger-140',
		'ui-icon-seek-end' : 'ace-icon fa fa-angle-double-right bigger-140'
	};
	$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
		var icon = $(this);
		var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
		
		if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
	})
}



jQuery(function($) {
	
	
	//业务类型列表
	var grid_selector = "#grid-table";
	var pager_selector = "#grid-pager";
	BusinessTypeGrid(grid_selector,pager_selector);
	setGridWidth(grid_selector);//resize to fit page size
	navButtons(grid_selector,pager_selector);
	navSearchButtons(grid_selector,pager_selector);

	function enableTooltips(table) {
		$('.navtable .ui-pg-button').tooltip({container:'body'});
		$(table).find('.ui-pg-div').tooltip({container:'body'});
	}
	$(document).on('ajaxloadstart', function(e) {
		$(grid_selector).jqGrid('GridUnload');
		$('.ui-jqdialog').remove();
	});

//	添加用户按钮
	function navButtons(grid_selector,pager_selector){
		jQuery(grid_selector)
		.navGrid(pager_selector,{edit:false,add:false,del:false,search:false})
		.navButtonAdd(pager_selector,{
		   caption:"添加用户", 
		   buttonicon:"ace-icon fa fa-plus-circle purple", 
		   onClickButton: function(){ 
			   var url="ajax_add_page";
		    	 $.ajax({
		    			type : "POST",
		    			url : url,
		    			data : "id=",
		    			success : function(html) {
		    				if (html != null && html != "") {
		    					 $("#win").html(html);
		    					 $("#win").dialog({
		    						 width: 680, 
		    						 //title:'业务类型'
		    					 });
		    				}
		    			}
		    		});
		   }, 
		   position:"last"
		});
	}	
});

//删除用户
function del(id){
	$.ajax({
        type: "POST",
        url: 'delete',
        data: "id="+id ,
        success: function (data) {
        	if(data!=null || data !='')
        		if(data=='success'){
        			reloadGrid();
        			window_close();
        		}else{
        			alert("保存失败："+data);
        		}
        		
        },
        error: function(data) {
            alert("error:"+data.responseText);
         }
    });
}


function modify(id){
	
	$.ajax({
        type: "POST",
        url: 'ajax_edit_page',
        data: "id="+id ,
        success: function (data) {
        	if(data!=null || data !='')
					 $("#win").html(data);
					 $("#win").dialog({
						 width: 680, 
						 //title:'业务类型'
					 });
        },
        error: function(data) {
            alert("error:"+data.responseText);
         }
    });
}

/**
 * 刷新业务类型grid
 */
function reloadGrid(){
	jQuery("#grid-table").jqGrid('setGridParam').trigger('reloadGrid');
}

function formatOperations(cellvalue, options, rowObject){
	 return '<a class=" no-radius "  onclick="modify(\''+options.rowId+'\')" href="javascript:void(0)"><i class="ace-icon fa fa-pencil-square-o blue "></i></a>'
				+  '   '+
				'<a class=" no-radius "  onclick="del(\''+options.rowId+'\')" href="javascript:void(0)"><i class="ace-icon fa fa-trash-o red"></i></a>'
				;
}

//清除页面
function win_close(){
	$("#win").html('');
	$("#win").dialog('close');
}

$.fn.serializeObject=function(){  
    var hasOwnProperty=Object.prototype.hasOwnProperty;  
    return this.serializeArray().reduce(function(data,pair){  
        if(!hasOwnProperty.call(data,pair.name)){  
            data[pair.name]=pair.value;  
        }  
        return data;  
    },{});  
};  

function extendPostData(){
//	获取查询页面的查询条件
	 var data = $("#searchForm").serializeObject();
	 var postData = $("#grid-table").jqGrid("getGridParam", "postData");
	 $.extend(postData,   data );	 
}

function search(){
	extendPostData();
	$("#grid-table").jqGrid("setGridParam", { search: true }).trigger("reloadGrid", [{ page: 1}]);  //重载JQGrid

}

	