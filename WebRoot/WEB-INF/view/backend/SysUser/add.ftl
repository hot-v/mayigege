<section class="content">
	<ol class="breadcrumb">
		<li></li>
		<li><a href="${base }/admin/user/index.html">用户管理</a></li>
		<li class="active">增加</li>
	</ol>
   
	<div class="row">
		<div class="col-md-12">
			<form id="myFormId" method="post"  class="form-horizontal" role="form" >
				<div class="box box-primary">
					<div class="box-body">
						<input type="hidden" name="id" value="${(entity.id)!}"/>
						
						<div class="form-group">
							<label for="fullname" class="col-md-3 control-label no-padding-right"> 姓名 </label>
							<div class="col-md-6">
							    <input type="text" id="fullname" name="fullname" value="${(entity.fullname)!}" class="form-control"/>
							</div>
							<div class="col-md-3"><font id="require-fullname" ></font><span id="errormsg-fullname" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="username" class="col-md-3 control-label no-padding-right"> 登录名 </label>
							<div class="col-md-6">
							    <input type="text" id="username" name="username" value="${(entity.username)!}" class="form-control"/>
							</div>
							<div class="col-md-3"><font id="require-username" ></font><span id="errormsg-username" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="status" class="col-md-3 control-label no-padding-right"> 状态 </label>
							<div class="col-md-6">
								<select id="status" name="status" val="${(entity.isDisabled)!}" class="form-control select2">
									<option value="0">启用</option>
									<option value="1">禁用</option>
								</select>
							</div>
							<div class="col-md-3"><font id="require-status" ></font><span id="errormsg-status" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="isSuperadmin" class="col-md-3 control-label no-padding-right"> 类型 </label>
							<div class="col-md-6">
								<select id="isSuperadmin" name="isSuperadmin" val="${(entity.isSuperadmin)!}" class="form-control select2">
									<option value="0">普通管理员</option>
									<option value="1">超级管理员</option>
								</select>
							</div>
							<div class="col-md-3"><font id="require-isSuperadmin" ></font><span id="errormsg-isSuperadmin" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="remark" class="col-md-3 control-label no-padding-right"> 备注 </label>
							<div class="col-md-6">
							    <input type="text" id="remark" name="remark" value="${(entity.remark)!}" class="form-control"/>
							</div>
							<div class="col-md-3"><font id="require-remark" ></font><span id="errormsg-remark" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label class="col-md-3 control-label no-padding-right"></label>
							<div class="col-md-6">
								<button type="button" class="btn btn-sm btn-primary btn-save">确定</button>
								<a class="btn btn-sm btn-primary" href="${base }/admin/user/index.html">返回</a>
							</div>
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
	        url:'${base}/admin/user/save.json',  
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
</script>