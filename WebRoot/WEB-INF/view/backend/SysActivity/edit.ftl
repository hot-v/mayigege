<#assign allowType= 'jpg,png,jpeg,bmp'>
<link rel="stylesheet" type="text/css" href="${base}/static/backend/plugins/uploadify/uploadify.css"/>

<section class="content">
	<ol class="breadcrumb">
		<li></li>
		<li><a href="${base }/admin/activity/index.html">活动管理</a></li>
		<li class="active">编辑</li>
	</ol>
   
	<div class="row">
		<div class="col-md-12">
			<form id="myFormId" method="post"  class="form-horizontal" role="form" >
				<div class="box box-primary">
					<div class="box-body">
						<input type="hidden" name="id" value="${(entity.id)!}"/>
						
						<div class="form-group">
							<label for="caseName" class="col-md-3 control-label no-padding-right"> 活动名称 </label>
							<div class="col-md-6">
							    <input type="text" id="caseName" name="caseName" value="${(entity.caseName)!}" class="form-control"/>
							</div>
							<div class="col-md-3"><font id="require-caseName" ></font><span id="errormsg-caseName" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="customerCompany" class="col-md-3 control-label no-padding-right"> 举办单位 </label>
							<div class="col-md-6">
							    <input type="text" id="customerCompany" name="customerCompany" value="${(entity.customerCompany)!}" class="form-control"/>
							</div>
							<div class="col-md-3"><font id="require-customerCompany" ></font><span id="errormsg-customerCompany" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="categroyId" class="col-md-3 control-label no-padding-right"> 所属分类 </label>
							<div class="col-md-6">
								<select id="categroyId" name="categroyId" val="${(entity.categroyId)!}" class="form-control select2">
									<option value="">请选择</option>
									<#if (serviceList)?exists && ((serviceList)?size != 0)>
										<#list serviceList as categroy>
											<option value="${categroy.id!}" <#if categroy.id?? && categroy.id==entity.categroyId>selected</#if> >${categroy.serviceName!}</option>
										</#list>
									</#if>
								</select>
							</div>
							<div class="col-md-3"><font id="require-categroyId" ></font><span id="errormsg-categroyId" class="error"></span></div>
						</div>
						
						<div class="form-group hide">
							<label for="programmeId" class="col-md-3 control-label no-padding-right"> 策划方案 </label>
							<div class="col-md-6">
								<select id="programmeId" name="programmeId" val="${(entity.programmeId)!}" class="form-control select2">
									<option value="0">启用</option>
									<option value="1">禁用</option>
								</select>
							</div>
							<div class="col-md-3"><font id="require-programmeId" ></font><span id="errormsg-programmeId" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="activityPrice" class="col-md-3 control-label no-padding-right"> 活动价格 </label>
							<div class="col-md-6">
							    <input type="text" id="activityPrice" name="activityPrice" value="${(entity.activityPrice)!}" class="form-control"/>
							</div>
							<div class="col-md-3"><font id="require-activityPrice" ></font><span id="errormsg-activityPrice" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="startTime" class="col-md-3 control-label no-padding-right"> 开始时间 </label>
							<div class="col-md-6">
							    <input type="text" id="startTime" name="startTime" value="${(entity.startTime?string('yyyy-MM-dd'))!}" class="form-control dateCalendar" readonly />
							</div>
							<div class="col-md-3"><font id="require-startTime" ></font><span id="errormsg-startTime" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="endTime" class="col-md-3 control-label no-padding-right"> 结束时间 </label>
							<div class="col-md-6">
							    <input type="text" id="endTime" name="endTime" value="${(entity.endTime?string('yyyy-MM-dd'))!}" class="form-control dateCalendar" readonly />
							</div>
							<div class="col-md-3"><font id="require-endTime" ></font><span id="errormsg-endTime" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="teamName" class="col-md-3 control-label no-padding-right"> 团队名称 </label>
							<div class="col-md-6">
							    <input type="text" id="teamName" name="teamName" value="${(entity.teamName)!}" class="form-control"/>
							</div>
							<div class="col-md-3"><font id="require-teamName" ></font><span id="errormsg-teamName" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="teamSlogan" class="col-md-3 control-label no-padding-right"> 团队口号 </label>
							<div class="col-md-6">
							    <input type="text" id="teamSlogan" name="teamSlogan" value="${(entity.teamSlogan)!}" class="form-control"/>
							</div>
							<div class="col-md-3"><font id="require-teamSlogan" ></font><span id="errormsg-teamSlogan" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="activityAddress" class="col-md-3 control-label no-padding-right"> 活动地点 </label>
							<div class="col-md-6">
							    <input type="text" id="activityAddress" name="activityAddress" value="${(entity.activityAddress)!}" class="form-control"/>
							</div>
							<div class="col-md-3"><font id="require-activityAddress" ></font><span id="errormsg-activityAddress" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="organizationNum" class="col-md-3 control-label no-padding-right"> 组织人数 </label>
							<div class="col-md-6">
							    <input type="text" id="organizationNum" name="organizationNum" value="${(entity.organizationNum)!}" class="form-control"/>
							</div>
							<div class="col-md-3"><font id="require-organizationNum" ></font><span id="errormsg-organizationNum" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="covers" class="col-md-3 control-label no-padding-right">活动图片</label>
							<div class="col-md-6">
								<button type="button" id="coversBtn">图片上传</button>
								<div id="coversDiv">
									<#if (imgFiles)?exists && (imgFiles?size != 0)>
										<#list imgFiles as obj>
											<img src='${base}${obj.path!}' path='${obj.path!}' width='80px' height='80px' style='margin: 5px 5px 0 0'/>
											<a href='javascript:void(0);' onclick='deleteImg(this)'>删除</a>
										</#list>
									</#if>
								</div>
								<input type="hidden" id="covers" name="covers" value="${paths!}" />
							</div>
						</div>
						
						<div class="form-group">
							<label for="activityDesc" class="col-md-3 control-label no-padding-right"> 活动描述 </label>
							<div class="col-md-6">
							    <input type="text" id="activityDesc" name="activityDesc" value="${(entity.activityDesc)!}" class="form-control"/>
							</div>
							<div class="col-md-3"><font id="require-activityDesc" ></font><span id="errormsg-activityDesc" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label class="col-md-3 control-label no-padding-right"></label>
							<div class="col-md-6">
								<button type="button" class="btn btn-sm btn-primary btn-save">确定</button>
								<a class="btn btn-sm btn-primary" href="${base }/admin/activity/index.html">返回</a>
							</div>
					 	</div>
					 </div>
				 </div>
			</form>
		</div>
	</div>
</section>

<script type="text/javascript" src="${base}/static/backend/plugins/uploadify/jquery.uploadify.min.js"></script>
<script type="text/javascript">

function deleteImg(obj){
	var imgPath=$(obj).prev().attr("path");
	$.ajax({  
        type:'post',   
     	async:false,
        traditional :true,  
        url:'${base}/uploadFile/deleteImg.json',
        data:{"imgPath":imgPath,"id":"-1"},  
        success:function(data){
        	if(data.code == '401'){
        		location.href = data.message;
        	}else{
        		if (data.success){
        			var n = noty({
			            text        : data.message,
			            type        : 'success',
			            dismissQueue: true,
			            layout      : 'topCenter',
			            theme       : 'relax',
			            timeout		: 1500
			        });
			        $(obj).prev().remove();
			        $(obj).remove();
			        
		        	var imgs="";
			        $("#coversDiv img").each(function(){
		        		if(imgs==""){
		        			imgs=$(this).attr("path");
		        		}else{
		        			imgs=imgs+";"+$(this).attr("path");
		        		}
			        });
	        		$("#covers").val(imgs);
	        	}else{
	        		var n = noty({
			            text        : msg,
			            type        : 'error',
			            dismissQueue: true,
			            layout      : 'topCenter',
			            theme       : 'relax',
			            timeout		: 1500
			        });
	        	}
        	}
        },
        error:function(data){
        	alert(data.message);
        }
    });
}

jQuery(function($) {
	$(".select2").select2();
	
	$('.dateCalendar').datetimepicker({
		language: 'zh-CN',//显示中文
		format:'yyyy-mm-dd',
		autoclose:true,//自动关闭
		minView:2,//最精准的时间选择为日期0-分 1-时 2-日 3-月
		weekStart:0,
		todayBtn: true//显示今日按钮
	});
	
	$(".btn-save").click(function(){
		$.ajax({  
	        type:'post',  
	        traditional :true,  
	        url:'${base}/admin/activity/update.json',  
	        data:$("#myFormId").serialize(),  
	        success:function(data){
	        	switch(data.code){
	        	case 401:
	        		location.href = data.message;
        			break;
        		default:
	        		if (data.success){
		        		var n = noty({
				            text        : data.message,
				            type        : 'success',
				            dismissQueue: true,
				            layout      : 'topCenter',
				            theme       : 'relax',
				            timeout		: 1500,
				            callback: {     // 设置回调函数
						        afterClose: function() {
                                	location.reload();
						        }
						    }
				        });
		        	}else{
		        		for(var msg in data.message){
			        		var n = noty({
					            text        : msg,
					            type        : 'error',
					            dismissQueue: true,
					            layout      : 'topCenter',
					            theme       : 'relax',
					            timeout		: 1500
					        });
			        	}
		        	}
	        	}
	        },
	        error:function(data){
	        	alert('ajax错误');
	        }
	    });
	});
	
	$("#coversBtn").uploadify({
		swf 			: '${base}/static/backend/plugins/uploadify/uploadify.swf',	//swf文件路径
		method			: 'post',	// 提交方式
		uploader		: '${base}/uploadFile/uploadImg.json', // 服务器端处理该上传请求的程序(servlet, struts2-Action)
		preventCaching	: true,		// 加随机数到URL后,防止缓存
		buttonCursor	: 'hand',	// 上传按钮Hover时的鼠标形状
		buttonText		: '上传文件'	, //按钮上显示的文字，默认”SELECTFILES”
		height			: 30	, // 30 px
		width			: 120	, // 120 px
		fileObjName		: 'imgFile',	//文件对象名称, 即属性名
		fileSizeLimit	: '2MB'	,		// 文件大小限制, 100 KB
		fileTypeDesc	: 'any'	,	//文件类型说明 any(*.*)
		fileTypeExts	: '<#list allowType?default('*.*')?split(",") as t>*.${t};</#list>',		// 允许的文件类型,分号分隔
		//formData		: {'allowType':'${allowType!}'} , //指定上传文件附带的其他数据。也动态设置。可通过getParameter()获取
		multi			: false ,	// 多文件上传
		progressData	: 'percentage',	// 进度显示, speed-上传速度,percentage-百分比	
		queueID			: 'fileQueue',//上传队列的DOM元素的ID号
		uploadLimit		: 999,	// 最多上传文件数量
		// 没有兼容的FLASH时触发
		onFallback : function(){ alert( 'Flash was not detected!' );},
		// 上传文件失败触发
		onUploadError : function(file, errorCode, errorMsg, errorString){ 
			var n = noty({
	            text        : errorMsg,
	            type        : 'error',
	            dismissQueue: true,
	            layout      : 'topCenter',
	            theme       : 'relax',
	            timeout		: 1500
	        });
		},
        // 在每一个文件上传成功后触发
        onUploadSuccess : function(file, data, response) {
        	data=$.parseJSON(data);
        	if(!data.success){
        		var n = noty({
		            text        : "文件上传失败",
		            type        : 'error',
		            dismissQueue: true,
		            layout      : 'topCenter',
		            theme       : 'relax',
		            timeout		: 1500
		        });
        	}else{
        		var path="${base}"+data.message.src; 
    			var $img=$("<img src='"+path+"' path='"+data.message.src+"' width='80px' height='80px' style='margin: 5px 5px 0 0'/><a href='javascript:void(0);' onclick='deleteImg(this)'>删除</a>");
        		$("#coversDiv").append($img);
        		var imgs=$("#covers").val();
        		if(imgs==""){
        			imgs=data.message.src;
        		}else{
        			imgs=imgs+";"+data.message.src;
        		}
        		$("#covers").val(imgs);
        	}
		}
	});
});
</script>