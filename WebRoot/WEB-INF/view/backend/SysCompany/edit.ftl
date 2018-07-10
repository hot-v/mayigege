<#assign allowType= 'jpg,png,jpeg,bmp'>
<link rel="stylesheet" type="text/css" href="${base}/static/backend/plugins/uploadify/uploadify.css"/>
<script type="text/javascript" src="${base}/static/backend/plugins/uploadify/jquery.uploadify.min.js"></script>	

<section class="content">
	<ol class="breadcrumb">
		<li></li>
		<li><a href="${base }/admin/company/index.html">公司管理</a></li>
		<li class="active">编辑</li>
	</ol>
   
	<div class="row">
		<div class="col-md-12">
			<form id="myFormId" method="post"  class="form-horizontal" role="form" >
				<div class="box box-primary">
					<div class="box-body">
						<input type="hidden" name="id" value="${(entity.id)!}"/>
						
						<div class="form-group">
							<label for="name" class="col-md-3 control-label no-padding-right"> 公司名称 </label>
							<div class="col-md-6">
							    <input type="text" id="name" name="name" value="${(entity.name)!}" class="form-control"/>
							</div>
							<div class="col-md-3"><font id="require-name" ></font><span id="errormsg-name" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="address" class="col-md-3 control-label no-padding-right"> 公司地址 </label>
							<div class="col-md-6">
							    <input type="text" id="address" name="address" value="${(entity.address)!}" class="form-control"/>
							</div>
							<div class="col-md-3"><font id="require-address" ></font><span id="errormsg-address" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="descn" class="col-md-3 control-label no-padding-right">Logo</label>
							<div class="col-md-6">
								<button type="button" id="logoBtn">图片上传</button>
								<div id="logoDiv">
									<img src='${base}${entity.logo!}' path='${entity.logo!}' width='80px' height='80px' style='margin: 5px 5px 0 0'/>
								</div>
								<input type="hidden" id="logo" name="logo" value="${entity.logo!}" />
							</div>
						</div>
						
						<div class="form-group">
							<label for="covers" class="col-md-3 control-label no-padding-right">网站封面</label>
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
							<label for="mobile" class="col-md-3 control-label no-padding-right"> 联系电话 </label>
							<div class="col-md-6">
							    <input type="text" id="mobile" name="mobile" value="${(entity.mobile)!}" class="form-control"/>
							</div>
							<div class="col-md-3"><font id="require-mobile" ></font><span id="errormsg-mobile" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="email" class="col-md-3 control-label no-padding-right"> 公司邮箱 </label>
							<div class="col-md-6">
							    <input type="text" id="email" name="email" value="${(entity.email)!}" class="form-control"/>
							</div>
							<div class="col-md-3"><font id="require-email" ></font><span id="errormsg-email" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="desc" class="col-md-3 control-label no-padding-right"> 公司简介 </label>
							<div class="col-md-6">
							    <input type="text" id="desc" name="desc" value="${(entity.desc)!}" class="form-control"/>
							</div>
							<div class="col-md-3"><font id="require-desc" ></font><span id="errormsg-desc" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label class="col-md-3 control-label no-padding-right"></label>
							<div class="col-md-6">
								<button type="button" class="btn btn-sm btn-primary btn-save">确定</button>
								<a class="btn btn-sm btn-primary" href="${base }/admin/company/index.html">返回</a>
							</div>
					 	</div>
					 </div>
				 </div>
			</form>
		</div>
	</div>
</section>

<script type="text/javascript">

function deleteImg(obj){
	var imgPath=$(obj).prev().attr("path");
	$.ajax({  
        type:'post',   
     	async:false,
        traditional :true,  
        url:'${base}/uploadFile/deleteImg.json',
        data:{"imgPath":imgPath,"id":"${(entity.id)!}"},  
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
	$(".btn-save").click(function(){
		$.ajax({  
	        type:'post',  
	        traditional :true,  
	        url:'${base}/admin/company/update.json',  
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
	
	$("#logoBtn").uploadify({
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
        	    if($("#logoDiv").find("span").length>0){
        			$("#logoDiv").find("span").remove();
        		}
        		var path="${base}"+data.message.src; 
        		if($("#logo").val()==""){
            		var $img=$("<img src='"+path+"' path='"+data.message.src+"' width='80px' height='80px' style='margin: 5px 5px 0 0'/>");
            		$("#logoDiv").append($img);
            		$("#logo").val(data.message.src);
        		}else{
				    $("#logoDiv img").attr("src",path);    
            		$("#logo").val(data.message.src);
        		}
        		
        		
        		/*var path="${base}"+data.message.src; 
    			var $img=$("<img src='"+path+"' path='"+data.message.src+"' width='80px' height='80px' style='margin: 5px 5px 0 0'/><a href='javascript:void(0);' onclick='deleteImg(this)'>删除</a>");
        		$("#logoDiv").append($img);
        		var imgs=$("#logo").val();
        		if(imgs==""){
        			imgs=data.message.src;
        		}else{
        			imgs=imgs+";"+data.message.src;
        		}
        		$("#logo").val(imgs);*/
        	}
		}
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