<#-----author:liuxiantao------->
<#-----date:2017-04-07------->
<@backend.header title="系统角色">
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
                    	<i class="fa fa-user-secret"></i>
                    	<small>系统角色</small>
                	</li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="tab-content-list">
					 	<form method="post" id="searchForm" action="${base}/admin/role/index.html" autocomplete="off">
					 		<input type="hidden" id="update_id" />
					 		<input type="hidden" id="search_type" />
				            <div class="box-body">
						 		<div class="row">
		                            <div class="col-md-3">
		                                <div class="form-group">
		                                    <label for="_roleName">角色名称</label>
		                                    <input type="text" id="_roleName" name="roleName" value="${(RequestParameters.roleName)!}" class="form-control "/>
		                                </div>
		                            </div>
		                        </div>
						 		
					 			<div class="row">
									<div class="col-md-offset-5 col-md-7 btn-group">
										<button class="btn btn-primary submitForm">查询</button><button class="btn btn-default" onclick="clearForm('searchForm')">重置</button>
									</div> 
								</div>
							</div>
							<div class="box">	
								<div class="box-header with-border">
									<div class="btn-group">
                                		<a class="btn btn-sm btn-primary" data-toggle="tab" href="#tab-content-add">新增</a>
									</div>
					            </div>
					            <div class="box-body table-responsive no-padding">
									<table class="table table-bordered table-hover dataList">
										<thead>
											<tr>
				                                <th class="hide">role_id</th>
				                                <th>角色名称</th>
				                                <th>描述</th>
				                                <th>操作</th>
				                            </tr>
										</thead>
										<tbody>
				                              <#if (pager.entityList)?exists && ((pager.entityList)?size != 0)>
				                                <#list pager.entityList as entity>
				                                <tr>
				                                    <td class="pk hide" id="roleId" title="${(entity.roleId)!}" class="col-md-1">${(entity.roleId)!}</td>
				                                    <td title="${(entity.roleName)!}" class="col-md-5">${(entity.roleName)!}</td>
				                                    <td title="${(entity.descn)!}" class="col-md-5">${(entity.descn)!}</td>
				                                    <td class="col-md-1">
														  <a href="tab-content-detail" data-toggle="tab" onclick="opre('${(entity.roleId)!}','1')">查看</a>
				                                      	  <a href="tab-content-edit" data-toggle="tab" onclick="opre(${(entity.roleId)!},'2')">编辑</a>
				                                          <a onclick="return del('${base}/admin/role/delete.json',{roleId:'${(entity.roleId)!}'});" style="cursor:pointer">删除</a>
				                                    </td>
				                                </tr>
				                                </#list>
				                              <#else>
				                              <tr>
				                                  <td colspan="5" class="error center">无记录</td>
				                              </tr>
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
<script>
	jQuery(function($) {
		//tab显示监听
		$('a[data-toggle="tab"]').on('shown.bs.tab',function(e){
			showCount = showCount + 1;
			if(showCount>1)
				return false;
			
			var $this = $(e.target);
			var curPage = $this.attr("href");
			var id = $("#update_id").val();
			var searchType = $("#search_type").val();
			
			$("#nav-tab-edit").click();
				
			if(id == ""){
				jumpPage("tab-content-edit","${base}/admin/role/add.html");
			}else{
	 			if(searchType =='2'){
					jumpPage("tab-content-edit","${base}/admin/role/edit.html?id="+id);
				}else{
					jumpPage("tab-content-edit","${base}/admin/role/detail.html?id="+id);
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