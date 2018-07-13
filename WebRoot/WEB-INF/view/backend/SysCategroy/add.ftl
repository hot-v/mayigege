<#assign allowType= 'jpg,png,jpeg,bmp'>
<link rel="stylesheet" type="text/css" href="${base}/static/backend/plugins/uploadify/uploadify.css"/>

<section class="content">
	<ol class="breadcrumb">
		<li></li>
		<li><a href="${base }/admin/service/index.html">服务项目</a></li>
		<li class="active">增加</li>
	</ol>
	
	<div class="row">
	    <div class="col-md-12">
	        <form id="myFormId" method="post"  class="form-horizontal" role="form" >
				<div class="box-body">
					<input type="hidden" name="id" value="${(entity.id)!}"/>
	                <div class="form-group">
						<label for="serviceName" class="col-md-3 control-label no-padding-right"> 服务名称 </label>
						<div class="col-md-6">
						    <input type="text" id="serviceName" name="serviceName" value="${(entity.serviceName)!}" class="form-control"/>
						</div>
						<div class="col-md-3"><font id="require-serviceName" ></font><span id="errormsg-serviceName" class="error"></span></div>
					</div>
						
					<div class="form-group">
						<label for="icon" class="col-md-3 control-label no-padding-right">Icon图标</label>
						<div class="col-md-6">
							<button type="button" id="iconBtn">图片上传</button>
							<div id="iconDiv">
							</div>
							<input type="hidden" id="icon" name="icon" />
						</div>
						<div class="col-md-3"><font id="require-icon" style="color:red;">*</font><span id="errormsg-icon" class="error"></span></div>
					</div>
						
					<div class="form-group">
						<label for="covers" class="col-md-3 control-label no-padding-right">项目图片</label>
						<div class="col-md-6">
							<button type="button" id="coversBtn">图片上传</button>
							<div id="coversDiv">
							</div>
							<input type="hidden" id="covers" name="covers" />
						</div>
						<div class="col-md-3"><font id="require-covers" style="color:red;">*</font><span id="errormsg-covers" class="error"></span></div>
					</div>
					
					<div class="form-group">
						<label for="serviceDesc" class="col-md-3 control-label no-padding-right"> 服务简介 </label>
						<div class="col-md-6">
							<textarea name="serviceDesc" id="serviceDesc" ref="serviceDesc" class="form-control">
								${(entity.serviceDesc)!}
							</textarea>
						</div>
						<div class="col-md-3"><font id="require-serviceDesc" ></font><span id="errormsg-serviceDesc" class="error"></span></div>
					</div>
						
					<div class="form-group">
						<label class="col-md-3 control-label no-padding-right"></label>
						<div class="col-md-6">
							<button type="button" class="btn btn-sm btn-primary btn-save">确定</button>
							<a class="btn btn-sm btn-primary" href="${base }/admin/service/index.html">返回</a>
						</div>
				 	</div>
				</div>
	        </form>
	    </div>
	</div>
</section>

<script type="text/javascript" src="${base}/static/backend/plugins/uploadify/jquery.uploadify.min.js"></script>	
<script type="text/javascript" src="${base}/static/backend/kindeditor/kindeditor.js"></script>
<script type="text/javascript" src="${base}/static/backend/kindeditor/lang/zh-CN.js"></script>
<script type="text/javascript" src="${base}/static/validatejs/SysCategroy.js"></script>	
<script type="text/javascript">

jQuery(function($) {
	$(".select2").select2();
	$("#myFormId").validate(saveSysCategroyConfig);
	
	var editor = KindEditor.create('textarea[name="serviceDesc"]', {
		width : '100%',
		height : '400px',
    	urlType : 'absolute',
		allowFileManager : true,
		items: ['source','undo','redo','preview','print','cut','copy','paste','plainpaste','wordpaste','justifyleft','justifycenter','justifyright',
		'justifyfull','insertorderedlist','insertunorderedlist','indent','outdent','subscript','superscript','clearhtml','quickformat','selectall','fullscreen','formatblock',
		'fontname','fontsize','forecolor','hilitecolor','bold','italic','underline','strikethrough','lineheight','removeformat','image','table','hr','emoticons',
		'pagebreak','anchor','link','unlink'],
		uploadJson:'${base}/uploadFile/uploadImg.json',
		afterCreate : function() { 
         this.sync(); 
        },
		afterBlur:function(){ 
            this.sync(); 
        } 
	});	
	
	$(".btn-save").click(function(){
		if($("#myFormId").validateForm(saveSysCategroyConfig)) {
			$.ajax({  
		        type:'post',  
		        traditional :true,  
		        url:'${base}/admin/service/save.json',  
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
	    }
	});
	
	$("#iconBtn").uploadify({
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
        		clearUploadErrMsg($("#iconBtn").get(0));
        	
        	    if($("#iconDiv").find("span").length>0){
        			$("#iconDiv").find("span").remove();
        		}
        		var path="${base}"+data.message.src; 
        		if($("#icon").val()==""){
            		var $img=$("<img src='"+path+"' path='"+data.message.src+"' width='80px' height='80px' style='margin: 5px 5px 0 0'/>");
            		$("#iconDiv").append($img);
            		$("#icon").val(data.message.src);
        		}else{
				    $("#iconDiv img").attr("src",path);    
            		$("#icon").val(data.message.src);
        		}
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
        		clearUploadErrMsg($("#coversBtn").get(0));
        	
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