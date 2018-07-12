<#-----author:liuxiantao------->
<#-----date:2017-04-07------->
<@backend.header title="咨询管理">

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
                    	<small>咨询列表</small>
                	</li>
                </ul>
                
                <div class="tab-content">
                	<div class="tab-pane active" id="tab-content-list">
						<form method="post" id="searchForm" action="${base}/admin/contact/index.html" autocomplete="off">
					 		<input type="hidden" id="update_id" />
					 		<input type="hidden" id="search_type" />
					 		<div class="box-body">
					 			<div class="row">
						 			<div class="col-md-3">
							 			<div class="form-group">
											<label for="_title">咨询标题</label>
	                                    	<input type="text" id="_title" name="title" value="${(RequestParameters.title)!}" class="form-control"/>
										</div>
									</div>
						 		</div>
								<div class="col-md-offset-5 col-md-7 btn-group">
									<button class="btn btn-primary submitForm">查询</button>&nbsp;&nbsp;&nbsp;<button class="btn btn-default" onclick="clearForm('searchForm')">重置</button>
								</div> 
							</div>
							<div class="box">
					            <div class="box-body table-responsive no-padding">
									<table id="example2"  class="table table-bordered table-hover dataList">
			                            <thead>
				                            <tr>
				                                <th class="hide">id</th>
				                                <th>咨询标题</th>
				                                <th>咨询内容</th>
				                                <th>咨询人</th>
				                                <th>联系方式</th>
				                                <th>是否处理</th><#assign processedMap={'0':'未处理','1':'已处理'}>
				                                <th>处理结果</th>
				                                <th>处理人</th>
				                                <th width="200px">操作</th>
				                            </tr>
			                            </thead>
			                            <tbody>
											<#if (pager.entityList)?exists && ((pager.entityList)?size != 0)>
												<#list pager.entityList as entity>
			                                    <tr>
			                                        <td class="pk hide" id="id" title="${(entity.id)!}">${(entity.id)!}</td>
			                                        <td title="${(entity.title)!}">${(entity.title)!}</td>
			                                        <td title="${(entity.content)!}">${(entity.content)!}</td>
			                                        <td title="${(entity.username)!}">${(entity.username)!}</td>
			                                        <td title="${(entity.mobile)!}-${(entity.email)!}">${(entity.mobile)!}-${(entity.email)!}</td>
			                                        <td title="${(processedMap[''+entity.isProcessed])!}">${(processedMap[''+entity.isProcessed])!}</td>
			                                        <td title="${(entity.procResult)!}">${(entity.procResult)!}</td>
			                                        <td title="${(entity.procUserId)!}">${(entity.procUserId)!}</td>
			                                        <td>
			                                        	<a href="tab-content-detail" data-toggle="tab" onclick="opre('${(entity.id)!}','1')">查看</a>
			                                            <a href="javascript:void(0)" onclick="return del('${base}/admin/contact/delete.json',{id:'${(entity.id)!}'});">删除</a>
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
			showCount = showCount + 1;
			if(showCount>1)
				return false;
			
			var $this = $(e.target);
			var curPage = $this.attr("href");
			var id = $("#update_id").val();
			var searchType = $("#search_type").val();
			
			$("#nav-tab-edit").click();
				
			if(id == ""){
				//jumpPage("tab-content-edit","${base}/admin/contact/add.html");
			}else{
	 			if(searchType =='2'){
					//jumpPage("tab-content-edit","${base}/admin/contact/edit.html?id="+id);
				}else{
					jumpPage("tab-content-edit","${base}/admin/contact/detail.html?id="+id);
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
