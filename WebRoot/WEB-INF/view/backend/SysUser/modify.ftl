<#-----author:liuxiantao------->
<#-----date:2017-04-07------->
<@backend.header title="文件">
		
</@backend.header>
<#escape x as x?html>  
<section class="content">
	<div class="row">
		<div class="col-md-12">
			<form id="myFormId" method="post" class="form-horizontal" role="form" >
			 <#if entity?exists>
				<div class="box-body">
				<input type="hidden" name="id" value="${(entity.id)!}"/>
		             <div class="form-group">
		                 <label for="oldPassword" class="col-md-3 control-label no-padding-right"> 原密码 </label>
		                 <div class="col-md-6">
		                     <input type="password" id="oldPassword" name="oldPassword" value="" class="form-control"/>
		                 </div>
		                 <div class="col-md-3"><font id="require-oldPassword"></font><span id="errormsg-oldPassword" class="error"></span></div>
		             </div>
	
		             <div class="form-group">
		                 <label for="password" class="col-md-3 control-label no-padding-right"> 新密码 </label>
		                 <div class="col-md-6">
		                     <input type="password" id="password" name="password" value="" class="form-control"/>
		                 </div>
		                 <div class="col-md-3"><font id="require-password"></font><span id="errormsg-password" class="error"></span></div>
		             </div>
		             
		             <div class="form-group">
		                 <label for="confirmPassword" class="col-md-3 control-label no-padding-right"> 确认密码 </label>
		                 <div class="col-md-6">
		                     <input type="password" id="confirmPassword" name="confirmPassword" value="" class="form-control"/>
		                 </div>
		                 <div class="col-md-3"><font id="require-confirmPassword"></font><span id="errormsg-confirmPassword" class="error"></span></div>
		             </div> 
				 
			 <#else>
				<div role="alert" class="alert alert-danger">
			      <strong>记录不存在</strong>
			    </div>
			</#if>
			<div class="form-group">
				    	<div class="form-group">
							<div class="col-sm-5 col-xs-offset-4 btn-group">
								<button type="button" class="btn btn-primary btn-update">保存</button>
								<button type="button" class="btn btn-default" onclick="$('#myModel').modal('hide');">取消</button>
							</div>
						</div>
				    </div>
				 </div>
		 </form>
		</div>
	</div>
</section>
</#escape>
<script type="text/javascript">
	jQuery(function($) {
		$(".btn-update").click(function(){
			$.ajax({  
		        type:'post',  
		        traditional :true,  
		        url:'${base}/SysUser/changePwd.json',
		        data:$("#myFormId").serialize(),  
		        success:function(data){
		        	switch(data.code){
		        	case 401:
		        		var n = noty({
				            text        : data.message,
				            type        : 'error',
				            dismissQueue: true,
				            layout      : 'topCenter',
				            theme       : 'relax',
				            timeout		: 1500,
				            callback: {     // 设置回调函数
						        afterClose: function() {
						        	
						        }
						    }
				        });
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
							        	location.href='${base}/logout.html';
							        }
							    }
					        });
			        	}else{
			        		var n = noty({
					            text        : data.message,
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
		        	alert('ajax错误');
		        }
		    });
		});
	});
</script>
