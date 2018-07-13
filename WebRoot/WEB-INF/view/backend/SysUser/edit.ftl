<section class="content">
	<ol class="breadcrumb">
		<li></li>
       	<li><a href="${base }/admin/user/index.html">用户管理</a></li>
       	<li class="active">编辑</li>
	</ol>
	
	<div class="row">
		<div class="col-md-12">
			<form id="myFormId" method="post" class="form-horizontal" role="form" >
				<#if entity?exists>
					<div class="box box-primary">
						<div class="box-body">
							<input type="hidden" name="id" value="${(entity.id)!}"/>
							
							<div class="form-group">
								<label for="fullname" class="col-md-3 control-label no-padding-right"> 用户名称 </label>
								<div class="col-md-6">
									<input type="text" id="fullname" name="fullname" value="${(entity.fullname)!}" class="form-control"/>
								</div>
								<div class="col-md-3"><font id="require-fullname"></font><span id="errormsg-fullname" class="error"></span></div>
							</div>
							
							<div class="form-group">
								<label for="username" class="col-md-3 control-label no-padding-right"> 登录账号 </label>
								<div class="col-md-6">
									<input type="text" id="username" name="username" value="${(entity.username)!}" class="form-control"/>
								</div>
								<div class="col-md-3"><font id="require-username"></font><span id="errormsg-username" class="error"></span></div>
							</div>
						
							<div class="form-group">
								<label for="password" class="col-md-3 control-label no-padding-right"> 登录密码 </label>
								<div class="col-md-6">
								    <input type="password" id="password" name="password" value="" class="form-control"/>
								</div>
								<div class="col-md-3"><font id="require-password" ></font><span id="errormsg-password" class="error"></span></div>
							</div>
							
							<div class="form-group">
								<label for="status" class="col-md-3 control-label no-padding-right"> 用户状态 </label>
								<div class="col-md-6">
									<select id="isDisabled" name="isDisabled" val="${(entity.isDisabled)!}"  class="form-control select2" onchange="clearErrMsg(this)">
										<option value="">请选择</option>
										<option value="0" <#if entity.isDisabled?string == "0"> selected </#if>>启用</option>
										<option value="1" <#if entity.isDisabled?string == "1"> selected </#if>>禁用</option>
									</select>
								</div>
								<div class="col-md-3"><font id="require-isDisabled"></font><span id="errormsg-isDisabled" class="error"></span></div>
							</div>
							
							<div class="form-group">
								<label for="isSuperadmin" class="col-md-3 control-label no-padding-right"> 用户类型 </label>
								<div class="col-md-6">
									<select id="isSuperadmin" name="isSuperadmin" val="${(entity.isSuperadmin)!}"  class="form-control select2" onchange="clearErrMsg(this)">
										<option value="">请选择</option>
										<option value="0" <#if entity.isSuperadmin?string == "0"> selected </#if>>普通管理员</option>
										<option value="1" <#if entity.isSuperadmin?string == "1"> selected </#if>>超级管理员</option>
									</select>
								</div>
								<div class="col-md-3"><font id="require-isSuperadmin"></font><span id="errormsg-isSuperadmin" class="error"></span></div>
							</div>
							
							<div class="form-group">
								<label for="remark" class="col-md-3 control-label no-padding-right"> 备注 </label>
								<div class="col-md-6">
									<textarea name="remark" id="remark" ref="remark" class="form-control">${(entity.remark)!}</textarea>
								</div>
								<div class="col-md-3"><font id="require-remark"></font><span id="errormsg-remark" class="error"></span></div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label no-padding-right"></label>
								<div class="col-md-6">
									<button type="button" class="btn btn-sm btn-primary btn-update">确定</button>
									<a class="btn btn-sm btn-primary" href="${base }/admin/user/index.html">返回</a>
								</div>
							</div>
						</div>
					</div>
				 <#else>
					<div role="alert" class="alert alert-danger ">
					  <strong>记录不存在</strong>
					</div>
				</#if>
			</form>
		</div>
	</div>
</section>

<script type="text/javascript" src="${base}/static/validatejs/SysUser.js"></script>	
<script type="text/javascript">
	jQuery(function($) {
		$(".select2").select2();
		$("#myFormId").validate(saveSysUserConfig);
	
		$(".btn-update").click(function(){
			if($("#myFormId").validateForm(saveSysUserConfig)) {
				$.ajax({  
			        type:'post',  
			        traditional :true,  
			        url:'${base}/admin/user/update.json',  
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
	});
</script>
