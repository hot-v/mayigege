<section class="content">
	<ol class="breadcrumb">
		<li></li>
		<li><a href="${base }/admin/config/index.html">参数配置</a></li>
		<li class="active">编辑</li>
	</ol>
	
	<div class="row">
	    <div class="col-md-12">
	        <form id="myFormId" method="post"  class="form-horizontal" role="form" >
				<div class="box-body">
					<input type="hidden" name="id" value="${(entity.id)!}"/>
	                <div class="form-group">
						<label for="keyname" class="col-md-3 control-label no-padding-right"> 变量名 </label>
						<div class="col-md-6">
						    <input type="text" id="keyname" name="keyname" value="${(entity.keyname)!}" class="form-control"/>
						</div>
					</div>
					<div class="form-group">
						<label for="val" class="col-md-3 control-label no-padding-right"> 变量值 </label>
						<div class="col-md-6">
							<input type="text" id="val" name="val" value="${(entity.val)!}" class="form-control"/>
						</div>
					</div>
					<div class="form-group">
		                <label for="desc" class="col-md-3 control-label no-padding-right"> 描述 </label>
		                <div class="col-md-6">
		                    <input type="text" id="desc" name="desc" value="${(entity.desc)!}" class="form-control"/>
		                </div>
	            	</div>
			        <div class="form-group">
						<label for="category" class="col-md-3 control-label no-padding-right"> 分类 </label>
						<div class="col-md-6">
						    <input type="text" id="category" name="category" value="${(entity.category)!}" class="form-control"/>
							<font class="required1" color="gray">&nbsp;</font>
						</div>
					</div>
					
					<div class="form-group">
						<label for="categoryDesc" class="col-md-3 control-label no-padding-right"> 分类描述 </label>
						<div class="col-md-6">
						    <input type="text" id="categoryDesc" name="categoryDesc" value="${(entity.categoryDesc)!}" class="form-control"/>
							<font class="required1" color="gray">&nbsp;</font>
						</div>
					</div>	
					<div class="form-group">
						<label for="orderNo" class="col-md-3 control-label no-padding-right"> 排序 </label>
						<div class="col-md-6">
					        <div class="input-group spinner"  data-trigger="spinner">
						        <input type="text" class="form-control text-center" id="orderNo" name="orderNo" value="${entity.orderNo!1}"  onkeyup="this.value=this.value.replace(/\D/g,'')"  onblur="this.value=this.value.replace(/\D/g,'')" />
							    <div class="input-group-btn-vertical">
							      <button class="btn btn-default" type="button" onclick="up();" data-spin="up"><i class="fa fa-caret-up"></i></button>
							      <button class="btn btn-default" type="button" onclick="down();" data-spin="down"><i class="fa fa-caret-down"></i></button>
							    </div>
							  </div>
						</div>
						<div class="col-md-3"><font id="require-orderNo" ></font><span id="errormsg-orderNo" class="error"></span></div>
					</div>	 
						
					<div class="form-group">
						<label class="col-md-3 control-label no-padding-right"></label>
						<div class="col-md-6">
							<button type="button" class="btn btn-sm btn-primary btn-save">确定</button>
							<a class="btn btn-sm btn-primary" href="${base }/admin/config/index.html">返回</a>
						</div>
				 	</div>
				</div>
	        </form>
	    </div>
	</div>
</section>

<script type="text/javascript">
jQuery(function($) {
	$(".select2").select2();
	$(".btn-save").click(function(){
		$.ajax({  
	        type:'post',  
	        traditional :true,  
	        url:'${base}/admin/config/update.json',  
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
});

function up(){
	var val = parseInt($("#orderNo").val());
	if(val >= 1000){
		val = 1000;
	}else{
		val = val + 1;
	}
	$("#orderNo").val(val);
}

function down(){
	var val = parseInt($("#orderNo").val());
	if(val <= 1){
		val = 1;
	}else{
		val = val - 1;
	}
	$("#orderNo").val(val);
}
</script>