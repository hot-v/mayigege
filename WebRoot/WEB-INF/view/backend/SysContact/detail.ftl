<section class="content">
	<ol class="breadcrumb">
		<li></li>
       <li><a href="${base }/admin/contact/index.html">咨询管理</a></li>
       <li class="active">查看</li>
   </ol>
	<div class="row">
		<div class="col-md-12">
			<form class="form-horizontal" role="form">
				<div class="box box-primary">
					<div class="box-body">
						 <#if entity?exists>
						 	
						 	<div class="form-group">
								<label for="form-field-1" class="col-md-3 control-label no-padding-right"> 咨询标题 </label>
								<div class="col-md-6">
								    <input type="text" name="title" value="${(entity.title)!}"  class="form-control" disabled />
						 		</div>
							 </div>	
						 	
						 	<div class="form-group">
								<label for="form-field-1" class="col-md-3 control-label no-padding-right"> 咨询内容 </label>
								<div class="col-md-6">
								    <input type="text" name="content" value="${(entity.content)!}"  class="form-control" disabled />
						 		</div>
							 </div>	
						 	
						 	<div class="form-group">
								<label for="form-field-1" class="col-md-3 control-label no-padding-right"> 咨询人 </label>
								<div class="col-md-6">
								    <input type="text" name="username" value="${(entity.username)!}"  class="form-control" disabled />
						 		</div>
							 </div>	
						 	
						 	<div class="form-group">
								<label for="form-field-1" class="col-md-3 control-label no-padding-right"> 联系电话 </label>
								<div class="col-md-6">
								    <input type="text" name="mobile" value="${(entity.mobile)!}"  class="form-control" disabled />
						 		</div>
							 </div>	
						 	
						 	<div class="form-group">
								<label for="form-field-1" class="col-md-3 control-label no-padding-right"> 邮箱 </label>
								<div class="col-md-6">
								    <input type="text" name="email" value="${(entity.email)!}"  class="form-control" disabled />
						 		</div>
							 </div>	
						 	
						 	<div class="form-group">
								<label for="form-field-1" class="col-md-3 control-label no-padding-right"> 咨询时间 </label>
								<div class="col-md-6">
								    <input type="text" name="createTime" value="${(entity.createTime?string('yyyy-MM-dd HH:mm:ss'))!}"  class="form-control" disabled />
						 		</div>
							 </div>	
						 	
						 	<#assign processedMap={'0':'未处理','1':'已处理'}>
						 	<div class="form-group">
								<label for="form-field-1" class="col-md-3 control-label no-padding-right"> 是否处理 </label>
								<div class="col-md-6" style="margin-top:5px;">
									${(processedMap[''+entity.isProcessed])!}
						 		</div>
							 </div>	
						 	
						 	<div class="form-group">
								<label for="form-field-1" class="col-md-3 control-label no-padding-right"> 处理结果 </label>
								<div class="col-md-6">
								    <input type="text" name="procResult" value="${(entity.procResult)!}"  class="form-control" disabled />
						 		</div>
							 </div>	
						 	
						 	<div class="form-group">
								<label for="form-field-1" class="col-md-3 control-label no-padding-right"> 处理人 </label>
								<div class="col-md-6">
								    <input type="text" name="procUserId" value="${(entity.procUserId)!}"  class="form-control" disabled />
						 		</div>
							 </div>	
						 	
						 	<div class="form-group">
								<label for="form-field-1" class="col-md-3 control-label no-padding-right"> 处理时间 </label>
								<div class="col-md-6">
								    <input type="text" name="procTime" value="${(entity.procTime?string('yyyy-MM-dd HH:mm:ss'))!}"  class="form-control" disabled />
						 		</div>
							 </div>	
							 
							<div class="form-group">
						    	<label  class="col-md-3 control-label no-padding-right"></label>
								<div class="col-md-6">
									<a class="btn btn-sm btn-primary" href="${base }/admin/contact/index.html">返回</a>
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