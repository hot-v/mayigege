<section class="content">
	<ol class="breadcrumb">
		<li></li>
		<li><a href="${base }/admin/service/index.html">服务项目</a></li>
		<li class="active">查看</li>
	</ol>
	
	<div class="row">
	    <div class="col-md-12">
	        <form id="myFormId" method="post"  class="form-horizontal" role="form" >
				<div class="box-body">
					<input type="hidden" name="id" value="${(entity.id)!}"/>
	                <div class="form-group">
						<label for="serviceName" class="col-md-3 control-label no-padding-right"> 服务名称 </label>
						<div class="col-md-6">
						    <input type="text" id="serviceName" name="serviceName" value="${(entity.serviceName)!}" class="form-control" disabled/>
						</div>
					</div>
						
					<div class="form-group">
						<label for="covers" class="col-md-3 control-label no-padding-right">项目图片</label>
						<div class="col-md-6">
							<div id="coversDiv">
								<#if (imgFiles)?exists && (imgFiles?size != 0)>
									<#list imgFiles as obj>
										<img src='${base}${obj.path!}' path='${obj.path!}' width='80px' height='80px' style='margin: 5px 5px 0 0'/>
									</#list>
								</#if>
							</div>
							<input type="hidden" id="covers" name="covers" value="${paths!}" />
						</div>
					</div>
					
					<div class="form-group">
						<label for="serviceDesc" class="col-md-3 control-label no-padding-right"> 服务简介 </label>
						<div class="col-md-6">
							<input type="text" id="serviceDesc" name="serviceDesc" value="${(entity.serviceDesc)!}" class="form-control" disabled/>
						</div>
					</div>
						
					<div class="form-group">
						<label class="col-md-3 control-label no-padding-right"></label>
						<div class="col-md-6">
							<a class="btn btn-sm btn-primary" href="${base }/admin/service/index.html">返回</a>
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
});

</script>