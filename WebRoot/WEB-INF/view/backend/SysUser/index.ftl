<#-----author:liuxiantao------->
<#-----date:2017-04-07------->
<@backend.header title="用户管理">

</@backend.header>
<@backend.body>
<#escape x as x?html>  
<section class="content">
	<ol class="breadcrumb">
		<li></li>
       <li>用户管理</li>
    </ol>
    <div class="row">
        <div class="col-md-12">
            <form method="post" id="searchForm" action="${base}/admin/user/index.html" autocomplete="off">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="_username">用户名</label>
                                    <input type="text" id="_username" name="username" value="${(RequestParameters.username)!}" class="form-control"/>
								</div>
							</div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="status">状态</label>
                                    <select id="_isDisabled" name="isDisabled" val="${(RequestParameters.isDisabled)!}" class="form-control select2" style="width: 100%;">
                                        <option value="">-</option>
                                        <option value="0">启用</option>
                                        <option value="1">禁用</option>
                                    </select>
								</div>
							</div>
						</div>
                        <div class="col-md-offset-5 col-md-7">
                            <button class="btn btn-xs btn-primary submitForm">查询</button>&nbsp;&nbsp;&nbsp;<button class="btn btn-xs btn-primary clearForm">重置</button>
                        </div>
					</div>
				</div>
                <div class="box">
                    <div class="box-header with-border">
                        <div class="btn-group">
                                <a class="btn btn-sm btn-primary" href="${base}/admin/user/add.html">新增</a>
						</div>
                    </div>
                    <div class="box-body">
                        <table id="example2"  class="table table-bordered table-hover dataList">
                            <thead>
                            <tr>
                                <th class="hide">id</th>
                                <th>用户名</th>
                                <th>姓名</th>
                                <th>角色</th>
                                <th>类型</th><#assign isSuperadmins={'0':'普通管理员','1':'超级管理员'}>
                                <th>状态</th><#assign isDisableds={'0':'启用','1':'禁用'}>
                                <th>备注</th>
                                <th width="200px">操作</th>
                            </tr>
                            </thead>
                            <tbody>
								<#if (pager.entityList)?exists && ((pager.entityList)?size != 0)>
									<#list pager.entityList as entity>
                                    <tr>
                                        <td class="pk hide" id="id" title="${(entity.id)!}">${(entity.id)!}</td>
                                        <td title="${(entity.username)!}">${(entity.username)!}</td>
                                        <td title="${(entity.fullname)!}">${(entity.fullname)!}</td>
                                        <td title="${(entity.roleName)!}">${(entity.roleName)!}</td>
                                        <td title="${(isSuperadmins[''+entity.isSuperadmin])!}">${(isSuperadmins[''+entity.isSuperadmin])!}</td>
                                        <td title="${(isDisableds[''+entity.isDisabled])!}">${(isDisableds[''+entity.isDisabled])!}</td>
                                        <td title="${(entity.remark)!}">${(entity.remark)!}</td>
                                        <td>
                                        	<a href="${base}/admin/user/detail.html?id=${(entity.id)!}">查看</a>
                                            <a href="${base}/admin/user/edit.html?id=${(entity.id)!}">编辑</a>
                                            <a href="javascript:void(0)" onclick="return del('${base}/admin/user/delete.json',{id:'${(entity.id)!}'});">删除</a>
                                            <a href="${base}/admin/user/authc.html?id=${(entity.id)!}">授权</a>
                                            <a href="javascript:void(0);" onclick="return onAction({url:'${base}/admin/user/reset.json',params:{ids:${(entity.id)!}},message:'重置后的密码为：111111',confirm:true});">重置密码</a>
                                        </td>
                                    </tr>
									</#list>
								<#else>
                                <tr><td colspan="9" class="error center">无记录</td></tr>
								</#if>
                            </tbody>
                        </table>
                    </div>
                    <div class="panel-footer">
						<@backend.pagination pager=pager/>
                    </div>
				</div>
			</form>
		</div>
	</div>
</section>
	
</#escape>
</@backend.body>
<@backend.footer>
<#--javascript include here-->
		<script type="text/javascript">
			jQuery(function($) {
				$(".select2").select2();
			})
		</script>
</@backend.footer>
