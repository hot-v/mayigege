<section class="content" style="height:300px;">
    <div class="row">
        <div class="col-xs-12">
            <form id="myFormId" method="post" class="form-horizontal" role="form" >
                <input type="hidden" id="id" name="id" value="${(entity.id)!}"/>
                <div class="panel panel-default">
                    <div class="panel-body">
						<#if entity?exists>
                            <div class="form-group">
                                <label for="val" class="col-sm-3 control-label no-padding-right">角色名称</label>
                                <div class="col-sm-6">
                                    <select class="form-control select2" id="roleId" name="roleId">
										<#if roleList?exists>
											<#list roleList as role>
                                                <option value="${role.roleId!}" <#if sysUserRole.roleId?? && sysUserRole.roleId==role.roleId>selected</#if> >
                                                	<#if (role.roleName+role.descn)?length gt 25>
											 			 ${(role.roleName+'('+role.descn+')')?substring(0,25)}...
											 		<#else>
											 			${role.roleName!}
                                                        <#if role.descn!=''>
                                                           	（${role.descn!}）
                                                        </#if>
											 		</#if>
                                                </option>
											</#list>
										</#if>
                                    </select>
                                    <select class="form-control" style="width:48%;margin-left:3%;display: none;float:left;	" id="seedRole" onchange="seedRoleChange(this);">
                                    </select>
                                </div>
                            </div>
							<div class="form-group">
								<label class="col-md-3 control-label no-padding-right"></label>
								<div class="col-md-6">
									<button type="button" class="btn btn-sm btn-primary btn-save">确定</button>
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

<script type="text/javascript">
    $(document).ready(function(){
		$(".select2").select2();
		
        $(".btn-save").click(function(){
            $.ajax({
                type:'post',
                traditional :true,
                url:'${base}/admin/user/authc.json',
                data:$("#myFormId").serialize(),
                success:function(data){
                    if(data.code == '401'){
                        location.href = data.message;
                    }else{
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
                    alert(data.message);
                }
            });
        });
    });
</script>