<#assign allowType= 'jpg,png,jpeg,bmp'>

<section class="content">
	<ol class="breadcrumb">
		<li></li>
		<li><a href="${base }/admin/activity/index.html">活动管理</a></li>
		<li class="active">查看</li>
	</ol>
   
	<div class="row">
		<div class="col-md-12">
			<form id="myFormId" method="post"  class="form-horizontal" role="form" >
				<div class="box box-primary">
					<div class="box-body">
						<input type="hidden" name="id" value="${(entity.id)!}"/>
						
						<div class="form-group">
							<label for="caseName" class="col-md-3 control-label no-padding-right"> 活动名称 </label>
							<div class="col-md-6">
							    <input type="text" id="caseName" name="caseName" value="${(entity.caseName)!}" class="form-control" disabled/>
							</div>
							<div class="col-md-3"><font id="require-caseName" ></font><span id="errormsg-caseName" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="customerCompany" class="col-md-3 control-label no-padding-right"> 举办单位 </label>
							<div class="col-md-6">
							    <input type="text" id="customerCompany" name="customerCompany" value="${(entity.customerCompany)!}" class="form-control" disabled/>
							</div>
							<div class="col-md-3"><font id="require-customerCompany" ></font><span id="errormsg-customerCompany" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="categroyId" class="col-md-3 control-label no-padding-right"> 所属分类 </label>
							<div class="col-md-6">
								<select id="categroyId" name="categroyId" val="${(entity.categroyId)!}" class="form-control select2" disabled>
									<option value="">无</option>
									<#if (serviceList)?exists && ((serviceList)?size != 0)>
										<#list serviceList as categroy>
											<option value="${categroy.id!}" <#if categroy.id?? && categroy.id==entity.categroyId>selected</#if> >${categroy.serviceName!}</option>
										</#list>
									</#if>
								</select>
							</div>
							<div class="col-md-3"><font id="require-categroyId" ></font><span id="errormsg-categroyId" class="error"></span></div>
						</div>
						
						<div class="form-group hide">
							<label for="programmeId" class="col-md-3 control-label no-padding-right"> 策划方案 </label>
							<div class="col-md-6">
								<select id="programmeId" name="programmeId" val="${(entity.programmeId)!}" class="form-control select2" disabled>
									<option value="0">启用</option>
									<option value="1">禁用</option>
								</select>
							</div>
							<div class="col-md-3"><font id="require-programmeId" ></font><span id="errormsg-programmeId" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="activityPrice" class="col-md-3 control-label no-padding-right"> 活动价格 </label>
							<div class="col-md-6">
							    <input type="text" id="activityPrice" name="activityPrice" value="${(entity.activityPrice)!}" class="form-control" disabled/>
							</div>
							<div class="col-md-3"><font id="require-activityPrice" ></font><span id="errormsg-activityPrice" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="startTime" class="col-md-3 control-label no-padding-right"> 开始时间 </label>
							<div class="col-md-6">
							    <input type="text" id="startTime" name="startTime" value="${(entity.startTime?string('yyyy-MM-dd'))!}" class="form-control dateCalendar" disabled />
							</div>
							<div class="col-md-3"><font id="require-startTime" ></font><span id="errormsg-startTime" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="endTime" class="col-md-3 control-label no-padding-right"> 结束时间 </label>
							<div class="col-md-6">
							    <input type="text" id="endTime" name="endTime" value="${(entity.endTime?string('yyyy-MM-dd'))!}" class="form-control dateCalendar" disabled />
							</div>
							<div class="col-md-3"><font id="require-endTime" ></font><span id="errormsg-endTime" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="teamName" class="col-md-3 control-label no-padding-right"> 团队名称 </label>
							<div class="col-md-6">
							    <input type="text" id="teamName" name="teamName" value="${(entity.teamName)!}" class="form-control" disabled/>
							</div>
							<div class="col-md-3"><font id="require-teamName" ></font><span id="errormsg-teamName" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="teamSlogan" class="col-md-3 control-label no-padding-right"> 团队口号 </label>
							<div class="col-md-6">
							    <input type="text" id="teamSlogan" name="teamSlogan" value="${(entity.teamSlogan)!}" class="form-control" disabled/>
							</div>
							<div class="col-md-3"><font id="require-teamSlogan" ></font><span id="errormsg-teamSlogan" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="activityAddress" class="col-md-3 control-label no-padding-right"> 活动地点 </label>
							<div class="col-md-6">
							    <input type="text" id="activityAddress" name="activityAddress" value="${(entity.activityAddress)!}" class="form-control" disabled/>
							</div>
							<div class="col-md-3"><font id="require-activityAddress" ></font><span id="errormsg-activityAddress" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="organizationNum" class="col-md-3 control-label no-padding-right"> 组织人数 </label>
							<div class="col-md-6">
							    <input type="text" id="organizationNum" name="organizationNum" value="${(entity.organizationNum)!}" class="form-control" disabled/>
							</div>
							<div class="col-md-3"><font id="require-organizationNum" ></font><span id="errormsg-organizationNum" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label for="covers" class="col-md-3 control-label no-padding-right">活动图片</label>
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
							<label for="activityDesc" class="col-md-3 control-label no-padding-right"> 活动描述 </label>
							<div class="col-md-6">
							    <input type="text" id="activityDesc" name="activityDesc" value="${(entity.activityDesc)!}" class="form-control" disabled/>
							</div>
							<div class="col-md-3"><font id="require-activityDesc" ></font><span id="errormsg-activityDesc" class="error"></span></div>
						</div>
						
						<div class="form-group">
							<label class="col-md-3 control-label no-padding-right"></label>
							<div class="col-md-6">
								<a class="btn btn-sm btn-primary" href="${base }/admin/activity/index.html">返回</a>
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