<#-----author:liuxiantao------->
<#-----date:2017-04-07------->
<@backend.header title="用户授权">
</@backend.header>
<@backend.body>
	<#escape x as x?html><section class="content">
	<ol class="breadcrumb">
			<li></li>
	       <li><a href="${base }/admin/user/index.html">用户管理</a></li>
	       <li class="active">授权</li>
	   </ol>
        <div class="row">
            <div class="col-md-12">
                <form id="myFormId" method="post" class="form-horizontal" role="form" >
				<div class="box box-primary">
                    <input type="hidden" id="id" name="id" value="${(entity.id)!}"/>
                    <input type="hidden" id="roleId" name="roleId" value="${sysUserRole.roleId}"/>
                    <div class="panel panel-default">
                        <div class="panel-body">
							<#if entity?exists>
                                <div class="form-group">
                                    <label for="val" class="col-sm-3 control-label no-padding-right">角色名称</label>
                                    <div class="col-sm-6">
                                        <select class="form-control select2" id="role">
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
							    	<div class="form-group">
										<div class="col-sm-5 col-xs-offset-3">
											<button type="button" class="btn btn-sm btn-primary btn-save">确定</button>
											<a class="btn btn-sm btn-primary" href="${base }/admin/user/index.html">返回</a>
										</div>
									</div>
							    </div>
							<#else>
                                <div role="alert" class="alert alert-danger ">
                                    <strong>记录不存在</strong>
                                </div>
							</#if>
                        </div>
                    </div>
                </div>
                </form>
            </div>
        </div>
</section>
</#escape>
</@backend.body>
<@backend.footer>

<script type="text/javascript">
    $(document).ready(function(){
	$(".select2").select2();
        $(".btn-save").click(function(){
            if($("#roleId").val()==""){//默认赋值第一项
            	$("#roleId").val($("#role").val());
            }
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
<script type="text/javascript">
    $(document).ready(function(){
        $("#role").change(function(){
            $("#seedRole").empty();
            var id = $(this).val();
            $.ajax({
                type:'post',
                traditional :true,
                url:'${base}/SysRole/relRole.json',
                data:"id="+id,
                success:function(data){
                    if (data.success){
                        var list = eval(data.message);
                        $("#seedRole").append("<option value='"+id+"'>全部</option>");
                        for(var i=0;i<list.length;i++){
                            $("#seedRole").append("<option value='"+list[i]["roleId"]+"'>"+list[i]["roleName"]+"</option>");
                        }
                        $("#seedRole").show();
                    }else{
                        $("#seedRole").hide();

                    }
                    $("#roleId").val(id);
                }
            });
        });
    });
    function seedRoleChange(id){
        $("#roleId").val(id.value);
    }
</script>
</@backend.footer>
