<#-----author:liuxiantao------->
<#-----date:2017-04-07------->
<@backend.header title="用户管理">

</@backend.header>
<@backend.body>
<#escape x as x?html>  

<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="nav-tabs-custom">
                <ul class="nav nav-tabs pull-right">
                   	<li>
                   		<a href="#tab-content-edit" data-toggle="tab" id="nav-tab-edit">
                   			<i class="fa fa fa-edit"></i>
                   		</a>
               		</li>
                    <li class="active">
                    	<a  href="#" onclick="refreshList()">
                    		<i class="fa fa-list-ul"></i>
                		</a>
                	</li>
                    <li class="pull-left header">
                    	<i class="fa fa-group"></i>
                    	<small>用户列表</small>
                	</li>
                </ul>
                
                <div class="tab-content">
                	<div class="tab-pane active" id="tab-content-list">
						<form method="post" id="searchForm" action="${base}/admin/user/index.html" autocomplete="off">
					 		<input type="hidden" id="update_id" />
					 		<input type="hidden" id="search_type" />
					 		<div class="box-body">
					 			<div class="row">
						 			<div class="col-md-3">
							 			<div class="form-group">
											<label for="_username">用户名</label>
	                                    	<input type="text" id="_username" name="username" value="${(RequestParameters.username)!}" class="form-control"/>
										</div>
									</div>
						 		</div>
								<div class="col-md-offset-5 col-md-7 btn-group">
									<button class="btn btn-primary submitForm">查询</button>&nbsp;&nbsp;&nbsp;<button class="btn btn-default" onclick="clearForm('searchForm')">重置</button>
								</div> 
							</div>
							<div class="box">
								<div class="box-header with-border">
									<div class="btn-group">
                                		<a class="btn btn-sm btn-primary" data-toggle="tab" href="#tab-content-add">新增</a>
									</div>
					            </div>
					            <div class="box-body table-responsive no-padding">
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
			                                        	<a href="tab-content-detail" data-toggle="tab" onclick="opre('${(entity.id)!}','1')">查看</a>
			                                            <a href="tab-content-edit" data-toggle="tab" onclick="opre('${(entity.id)!}','2')">编辑</a>
			                                            <a href="javascript:void(0)" onclick="return del('${base}/admin/user/delete.json',{id:'${(entity.id)!}'});">删除</a>
			                                            <a href="javascript:void(0);" onclick="return onAction({url:'${base}/admin/user/authc.html?userId=${(entity.id)!}',title:'授权',width:500,height:300,callback:refreshList});">授权</a>
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
								<div class="">
									<@backend.pagination pager=pager/>
								</div>
							</div>
						</form>
             		</div>
             		<div class="tab-pane" id="tab-content-edit">
					 
             		</div>
                </div>
			</div>
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
		
		//tab显示监听
		$('a[data-toggle="tab"]').on('shown.bs.tab',function(e){
			var $this = $(e.target);
			var curPage = $this.attr("href");
			var id = $("#update_id").val();
			var searchType = $("#search_type").val();
			
			$("#nav-tab-edit").click();
				
			if(id == ""){
				jumpPage("tab-content-edit","${base}/admin/user/add.html");
			}else{
	 			if(searchType =='2'){
					jumpPage("tab-content-edit","${base}/admin/user/edit.html?id="+id);
				}else{
					jumpPage("tab-content-edit","${base}/admin/user/detail.html?id="+id);
				}
			}
		});
	});
	
	function opre(id,searchType){
		$("#update_id").val(id);
		$("#search_type").val(searchType);
	}
</script>
</@backend.footer>
