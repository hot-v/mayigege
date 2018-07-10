<section class="content">
	<ol class="breadcrumb">
		<li></li>
		<li><a href="${base }/admin/company/index.html">公司管理</a></li>
		<li class="active">查看</li>
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
							    <input type="text" id="name" name="name" value="${(entity.name)!}" class="form-control" disabled/>
							</div>
							<div class="col-md-3"><font id="require-name" ></font><span id="errormsg-name" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="address" class="col-md-3 control-label no-padding-right"> 公司地址 </label>
							<div class="col-md-6">
							    <input type="text" id="address" name="address" value="${(entity.address)!}" class="form-control" disabled/>
							</div>
							<div class="col-md-3"><font id="require-address" ></font><span id="errormsg-address" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="descn" class="col-md-3 control-label no-padding-right">Logo</label>
							<div class="col-md-6">
								<div id="logoDiv">
									<img src='${base}${entity.logo!}' path='${entity.logo!}' width='80px' height='80px' style='margin: 5px 5px 0 0'/>
								</div>
								<input type="hidden" id="logo" name="logo" value="${entity.logo!}" />
							</div>
						</div>
						
						<div class="form-group">
							<label for="covers" class="col-md-3 control-label no-padding-right">网站封面</label>
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
							<label for="mobile" class="col-md-3 control-label no-padding-right"> 联系电话 </label>
							<div class="col-md-6">
							    <input type="text" id="mobile" name="mobile" value="${(entity.mobile)!}" class="form-control" disabled/>
							</div>
							<div class="col-md-3"><font id="require-mobile" ></font><span id="errormsg-mobile" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="email" class="col-md-3 control-label no-padding-right"> 公司邮箱 </label>
							<div class="col-md-6">
							    <input type="text" id="email" name="email" value="${(entity.email)!}" class="form-control" disabled/>
							</div>
							<div class="col-md-3"><font id="require-email" ></font><span id="errormsg-email" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="desc" class="col-md-3 control-label no-padding-right"> 公司简介 </label>
							<div class="col-md-6">
							    <input type="text" id="desc" name="desc" value="${(entity.desc)!}" class="form-control" disabled/>
							</div>
							<div class="col-md-3"><font id="require-desc" ></font><span id="errormsg-desc" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label class="col-md-3 control-label no-padding-right"></label>
							<div class="col-md-6">
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
jQuery(function($) {
	$(".select2").select2();
});
</script>