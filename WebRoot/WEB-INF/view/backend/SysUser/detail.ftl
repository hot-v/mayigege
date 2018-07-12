<section class="content">
	<ol class="breadcrumb">
		<li></li>
       <li><a href="${base }/admin/user/index.html">用户管理</a></li>
       <li class="active">查看</li>
   </ol>
	<div class="row">
		<div class="col-md-12">
			<form class="form-horizontal" role="form">
				<div class="box box-primary">
					<div class="box-body">
						 <#if entity?exists>
						 	
						 	<div class="form-group">
								<label for="form-field-1" class="col-md-3 control-label no-padding-right"> 用户名称 </label>
								<div class="col-md-6">
								    <input type="text" name="fullname" value="${(entity.fullname)!}"  class="form-control" disabled />
						 		</div>
							 </div>	
						 	
						 	<div class="form-group">
								<label for="form-field-1" class="col-md-3 control-label no-padding-right"> 登录账号 </label>
								<div class="col-md-6">
								    <input type="text" name="username" value="${(entity.username)!}"  class="form-control" disabled />
						 		</div>
							 </div>	
						 	
						 	<#assign isDisableds={'0':'启用','1':'禁用'}>
						 	<div class="form-group">
								<label for="form-field-1" class="col-md-3 control-label no-padding-right"> 用户状态 </label>
								<div class="col-md-6">
									<input type="text" name="isDisabled" value="${(isDisableds[''+entity.isDisabled])!}"  class="form-control" disabled />
						 		</div>
							 </div>	
						 	<#assign isSuperadmins={'0':'普通管理员','1':'超级管理员'}>
						 	<div class="form-group">
								<label for="form-field-1" class="col-md-3 control-label no-padding-right"> 用户类型 </label>
								<div class="col-md-6">
									<input type="text" name="isSuperadmin" value="${(isSuperadmins[''+entity.isSuperadmin])!}"  class="form-control" disabled />
						 		</div>
							 </div>	
						 	
						 	<div class="form-group">
								<label for="form-field-1" class="col-md-3 control-label no-padding-right"> 备注 </label>
								<div class="col-md-6">
								    <textarea name="remark" id="remark" ref="remark" class="form-control" disabled>${(entity.remark)!}</textarea>
						 		</div>
							 </div>	
							 
							<div class="form-group">
						    	<label  class="col-md-3 control-label no-padding-right"></label>
								<div class="col-md-6">
									<a class="btn btn-sm btn-primary" href="${base }/admin/user/index.html">返回</a>
								</div>
						    </div>
						<#else>
							<div role="alert" class="alert alert-danger ">
						      <strong>记录不存在</strong>
						    </div>
						</#if>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>