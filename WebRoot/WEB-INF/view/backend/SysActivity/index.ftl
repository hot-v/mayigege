<#-----author:liuxiantao------->
<#-----date:2017-04-07------->
<@backend.header title="活动管理">
	<link rel="stylesheet" href="${base}/static/backend/plugins/daterangepicker/daterangepicker.css">
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
                    	<small>活动列表</small>
                	</li>
                </ul>
                
                <div class="tab-content">
                	<div class="tab-pane active" id="tab-content-list">
						<form method="post" id="searchForm" action="${base}/admin/activity/index.html" autocomplete="off">
					 		<input type="hidden" id="update_id" />
					 		<input type="hidden" id="search_type" />
					 		<div class="box-body">
					 			<div class="row">
						 			<div class="col-md-3">
							 			<div class="form-group">
											<label for="caseName">活动名称</label>
	                                    	<input type="text" id="caseName" name="caseName" value="${(RequestParameters.caseName)!}" class="form-control"/>
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
				                                <th>活动名称</th>
				                                <th>举办单位</th>
				                                <th>活动分类</th>
				                                <th>开始时间</th>
				                                <th>结束时间</th>
				                                <th>活动地点</th>
				                                <th>组织人数（人）</th>
				                                <th>团队名称</th>
				                                <th>备注</th>
				                                <th width="200px">操作</th>
				                            </tr>
			                            </thead>
			                            <tbody>
											<#if (pager.entityList)?exists && ((pager.entityList)?size != 0)>
												<#list pager.entityList as entity>
			                                    <tr>
			                                        <td class="pk hide" id="id" title="${(entity.id)!}">${(entity.id)!}</td>
			                                        <td title="${(entity.caseName)!}">${(entity.caseName)!}</td>
			                                        <td title="${(entity.customerCompany)!}">${(entity.customerCompany)!}</td>
			                                        <td title="${(categroyMap[entity.categroyId?string])!}">${(categroyMap[entity.categroyId?string])!}</td>
			                                        <td title="${(entity.startTime?string('yyyy-MM-dd'))!}">${(entity.startTime?string('yyyy-MM-dd'))!}</td>
			                                        <td title="${(entity.endTime?string('yyyy-MM-dd'))!}">${(entity.endTime?string('yyyy-MM-dd'))!}</td>
			                                        <td title="${(entity.activityAddress)!}">${(entity.activityAddress)!}</td>
			                                        <td title="${(entity.organizationNum)!}">${(entity.organizationNum)!}</td>
			                                        <td title="${(entity.teamName)!}">${(entity.teamName)!}</td>
			                                        <td title="${(entity.activityDesc)!}">${(entity.activityDesc)!}</td>
			                                        <td>
			                                        	<a href="tab-content-detail" data-toggle="tab" onclick="opre('${(entity.id)!}','1')">查看</a>
			                                            <a href="tab-content-edit" data-toggle="tab" onclick="opre('${(entity.id)!}','2')">编辑</a>
			                                            <a href="javascript:void(0)" onclick="return del('${base}/admin/activity/delete.json',{ids:'${(entity.id)!}'});">删除</a>
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
<script src="${base}/static/backend/plugins/daterangepicker/moment.min.js"></script>
<script src="${base}/static/backend/plugins/daterangepicker/daterangepicker.js"></script>
<script type="text/javascript">
	jQuery(function($) {
		$(".select2").select2();
	
		//定义locale汉化插件
	    var locale = {
	        "format": 'YYYY-MM-DD',
	        "separator": " -222 ",
	        "applyLabel": "确定",
	        "cancelLabel": "取消",
	        "fromLabel": "起始时间",
	        "toLabel": "结束时间",
	        "customRangeLabel": "自定义",
	        "weekLabel": "W",
	        "daysOfWeek": ["日", "一", "二", "三", "四", "五", "六"],
	        "monthNames": ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
	        "firstDay": 1
	    };
	    
	    //日期控件初始化
	    $('#start-btn').daterangepicker(
	        {
	            'locale': locale,
	            //汉化按钮部分
	            ranges: {
	                '今日': [moment(), moment()],
	                '昨日': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
	                '最近7日': [moment().subtract(6, 'days'), moment()],
	                '最近30日': [moment().subtract(29, 'days'), moment()],
	                '本月': [moment().startOf('month'), moment().endOf('month')],
	                '上月': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')],
	            },
	            <#if beginDate??>
	            startDate: moment("${(RequestParameters.beginDate1)!}"),
	            endDate: moment("${(RequestParameters.beginDate2)!}")
				<#else>
	            startDate: moment().subtract(30, 'days'),
	            endDate: moment()            
	            </#if>
	        },
	        function (start, end) {
	        	var s = start.format('YYYY-MM-DD');
	            var e = end.format('YYYY-MM-DD');
	            var t = s + ' 至 ' + e;
	
	            if (start._isValid == false && end._isValid == false) {
	                s = "";
	                e = "";
	                t ='<span style="float: left"><span><i class="fa fa-calendar"></i> 时间 </span><i class="fa fa-caret-down"></i></span>'
	            }
	            $('#_beginDate1').val(s);
	            $('#_beginDate2').val(e);
	            $('#start-btn span').html(t);
	            $('#start-btn').next().val(s).next().val(e);
	            
	        }
		);
	    
	    $('#end-btn').daterangepicker(
	        {
	            'locale': locale,
	            //汉化按钮部分
	            ranges: {
	                '今日': [moment(), moment()],
	                '昨日': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
	                '最近7日': [moment().subtract(6, 'days'), moment()],
	                '最近30日': [moment().subtract(29, 'days'), moment()],
	                '本月': [moment().startOf('month'), moment().endOf('month')],
	                '上月': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')],
	            },
	            <#if endDate??>
	            startDate: moment("${(RequestParameters.endDate1)!}"),
	            endDate: moment("${(RequestParameters.endDate2)!}")
				<#else>
	            startDate: moment().subtract(30, 'days'),
	            endDate: moment()            
	            </#if>
	        },
	        function (start, end) {
	        	var s = start.format('YYYY-MM-DD');
	            var e = end.format('YYYY-MM-DD');
	            var t = s + ' 至 ' + e;
	
	            if (start._isValid == false && end._isValid == false) {
	                s = "";
	                e = "";
	                t ='<span style="float: left"><span><i class="fa fa-calendar"></i> 时间 </span><i class="fa fa-caret-down"></i></span>'
	            }
	            
	            $('#_endDate1').val(s);
	            $('#_endDate2').val(e);
	            $('#end-btn span').html(t);
	            $('#end-btn').next().val(s).next().val(e);
	            
	        }
		);
		
		
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
				jumpPage("tab-content-edit","${base}/admin/activity/add.html");
			}else{
	 			if(searchType =='2'){
					jumpPage("tab-content-edit","${base}/admin/activity/edit.html?id="+id);
				}else{
					jumpPage("tab-content-edit","${base}/admin/activity/detail.html?id="+id);
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
