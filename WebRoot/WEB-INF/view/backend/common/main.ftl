<#global base="${basePath}"/>
<#global validateJS="${basePath!}${setting['validatejspath']!}"/>
<#macro header title="" charset="utf-8" lang="zh-CN">
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>${title!} ${setting['app.name']}</title>
  <!-- Tell the browser to be responsive to screen width -->
  <script>
	var formValidatorServletPath = "${base}";
	var ctx = "${base}/";
</script>
<link rel="shortcut icon" href="${base}/static/backend/login/images/favicon.ico?v=1" type="text/css"/>
<link type="image/x-icon" href="${base}/static/backend/login/images/favicon.ico?v=1" rel="bookmark" type="text/css" />
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" >
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="${base}/static/backend/bootstrap/css/bootstrap.min.css?v=1" type="text/css"/>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${base}/static/backend/font-awesome/css/font-awesome.min.css?v=1" type="text/css"/>
  <!-- Ionicons -->
  <link rel="stylesheet" href="${base}/static/backend/ionicons/css/ionicons.min.css?v=1" type="text/css"/>
  <!-- jvectormap -->
  <link rel="stylesheet" href="${base}/static/backend/plugins/jvectormap/jquery-jvectormap-1.2.2.css?v=1" type="text/css"/>
  <!-- Theme style -->
  <link rel="stylesheet" href="${base}/static/backend/adminlte/css/AdminLTE.min.css?v=1" type="text/css"/>
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="${base}/static/backend/adminlte/css/skins/_all-skins.min.css?v=1" type="text/css"/>

<!--引入弹窗组件start-->
<link rel="stylesheet" href="${base}/static/backend/js/popup/popup/style.css?v=1" />
<link rel="stylesheet" href="${base}/static/backend/plugins/spinner/bootstrap-spinner.css?v=1" type="text/css"/>

<link href="${base}/static/backend/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css?v=1" rel="stylesheet" type="text/css"/>

<link rel="stylesheet" href="${base}/static/backend/plugins/select2/select2.min.css?v=1" type="text/css"/>

<link rel="stylesheet" href="${base}/static/backend/css/main.css?v=2" type="text/css"/>
<link rel="stylesheet" href="${base}/static/backend/zTree/css/zTreeStyle/zTreeStyle.css?v=1" type="text/css"/>
<link rel="stylesheet" href="${base}/static/backend/plugins/iCheck/all.css?v=1" type="text/css"/>
<#nested>

</head>
 </#macro>
<#macro body>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">

    <!-- Logo -->
    <a href="${base}/dashboard.html" class="logo">
      
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini">MAYI</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg">蚂蚁哥哥</span>
    </a>

    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="${base}/admin/index.html" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- User Account: style can be found in dropdown.less -->
            <li class="dropdown user user-menu">
                <a href="javascript:void(0);" onclick="return onAction({url:'${base}/admin/user/modify.html?id=${USER_INFO.id}',title:'修改密码',callback:refreshList});">
                    <i aria-hidden="true" class="fa fa-user"></i>
                    <span class="hidden-xs">${USER_INFO.fullname}</span>
                </a>
            </li>
          <li>
            <a href="#" id="sign-out">
              <i class="fa fa-sign-out" aria-hidden="true"></i>
              <span class="hidden-xs">退出</span>
            </a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <#assign requestUri=rc.requestUri?substring(rc.contextPath?length)/>
      <#list FunctionList as f>
      	<#if requestUri?matches(f.url)>
      		<#if f.navigate>
		  		<#assign parent = f/>
      		<#else>
	  			<#assign parent = FunctionMap[""+f.parentId]!/>
	  		</#if>
		</#if>
      </#list>
      <ul class="sidebar-menu">
      
      	<#list FunctionChildMap["0"] as f1>
		<@shiro.hasAnyRoles name="${f1.rolenames}">
		<li class="<#if parent?if_exists == f1>active</#if> treeview">
			<a href="${base}${f1.url!}">
				<i class="fa ${f1.icon!}"></i>
				<span> ${f1.name}</span>
				<#if FunctionChildNavigateMap[""+f1.id]?size != 0>
				<i class="fa pull-right"></i>
				</#if>
			</a>
			<#if FunctionChildNavigateMap[""+f1.id]?size != 0>
			<ul class="treeview-menu">
			<#list FunctionChildMap[""+f1.id] as f2>
				<@shiro.hasAnyRoles name="${f2.rolenames}">
				<#if f2.navigate>
				<li <#if  parent?if_exists == f2>class="active"</#if>>
					<a href="${base}${f2.url!}" <#if FunctionChildMap[""+f2.id]?size != 0>class="nofocus"</#if>>
						<i class="fa ${f2.icon!}"></i>
						${f2.name}
						<#if FunctionChildNavigateMap[""+f2.id]?size != 0>
						<i class="fa pull-right"></i>
						</#if>
					</a>
					<#if FunctionChildNavigateMap[""+f2.id]?size != 0>
					<ul class="treeview-menu">
					<#list FunctionChildMap[""+f2.id] as f3>
						<@shiro.hasAnyRoles name="${f3.rolenames}">
						<#if f3.navigate>
							 <li <#if  parent?if_exists == f3>class="active"</#if>><a href="${base}${f3.url!}"><i class="fa ${f3.icon!}"></i> ${f3.name}</a></li>
						</#if>
						</@shiro.hasAnyRoles>
					</#list>
					</ul>
					</#if>
				</li>
				</#if>
				</@shiro.hasAnyRoles>
			</#list>
			</ul>
			</#if>
		</li>
		</@shiro.hasAnyRoles>
		</#list>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" id="mainDiv">
	  <div class="page-content">
	    <#nested>
	  </div>
		<div class="modal fade" id="myModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title" id="myModalLabel"></h4>
		            </div>
		            <div class="modal-body">
		            </div>
		            <div class="modal-footer">
	                    &nbsp;
	                </div>
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
  	</div>
  
	<div sytle="display:none;">
		<form id="postForm" action="" method="post">
		</form>
	</div>
	
	<div class="modal fade" id="controllLoadModal">
	    <div style="width: 200px;height:20px; z-index: 20000; position: absolute; text-align: center; left: 50%; top: 50%;margin-left:-100px;margin-top:-10px">
	        <div class="progress progress-striped active" style="margin-bottom: 0;">
	            <div class="progress-bar" style="width: 100%;"></div>
	        </div>
	        <h5 style="color:#fff;">正在加载...</h5>
	    </div>
	</div>

</div>
<!-- ./wrapper -->

</#macro>
<#macro footer>
</body>
<!-- jQuery 2.2.0 -->
<script src="${base}/static/backend/plugins/jQuery/jQuery-2.2.0.min.js"></script>
<script src="${base}/static/backend/bootstrap/js/bootstrap.min.js"></script>
<script src="${base}/static/backend/adminlte/js/app.js"></script>
<script type="text/javascript" src="${base}/static/backend/js/popup/drag.js"></script>
<script type="text/javascript" src="${base}/static/backend/js/popup/dialog.js"></script>
<script type="text/javascript" src="${base}/static/backend/js/noty/jquery.noty.packaged.js"></script>
<script src="${base}/static/backend/js/bootstrap-popover.js"></script>
<script src="${base}/static/backend/js/bootstrap-tooltip.js"></script>
<script src="${base}/static/backend/js/app.js"></script>
<script src="${base}/static/backend/js/dialog.js"></script>
<script src="${base}/static/backend/js/formValidator/validateEngine.js"></script>
<script src="${base}/static/backend/plugins/spinner/jquery.spinner.js"></script>
<script src="${base}/static/backend/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script src="${base}/static/backend/plugins/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${base}/static/backend/plugins/select2/select2.js"></script>
<script src="${base}/static/backend/plugins/select2/i18n/zh-CN.js"></script>
<script src="${base}/static/backend/zTree/js/jquery.ztree.all.js"></script>
<script src="${base}/static/backend/plugins/iCheck/icheck.min.js"></script>

<script type="text/javascript" src="${base}/static/backend/bootstrap/js/base-modal.js"></script>
<script>
var showCount = 0;

$(document).ready(function () {
	//初始化菜单选中 start
    var path_array = window.location.pathname.split('/');
    var scheme_less_url = '//' + window.location.host + window.location.pathname;
    if(window.location.pathname.indexOf("admin") != -1){
    	if (path_array[2] == 'index.html') {
	        scheme_less_url = '/' + path_array[1] + '/' + path_array[2];
	    } else {
	        scheme_less_url = '/' + path_array[1] + '/' + path_array[2] + '/' + path_array[3];
	    }
    }else{
    	if (path_array[1] == 'index.html') {
	        scheme_less_url = '/' + path_array[1] + '/' + path_array[2];
	    } else {
	        scheme_less_url = '/' + path_array[1] + '/' + path_array[2]+ '/' + path_array[3];
	    }
    }

    $('ul.treeview-menu>li').find('a[href="' + scheme_less_url + '"]').closest('li').addClass('active');  //二级链接高亮
    $('ul.treeview-menu>li').find('a[href="' + scheme_less_url + '"]').closest('li.treeview').addClass('active');  //一级栏目[含二级链接]高亮
    $('.sidebar-menu>li').find('a[href="' + scheme_less_url + '"]').closest('li').addClass('active');  //一级栏目[不含二级链接]高亮
   
	//初始化菜单选中 end

	$.fn.modal.Constructor.prototype.enforceFocus = function () { };
	$("#sign-out").click(function(){
	     Dialog.confirm({message: "确认退出系统吗？" }).on(function (e) {
	       if (!e) {
	         return;
	       }
	       location.href='${base}/admin/logout.html';
	     });
	});

	$('li.messages-menu').click(function(){
        if($('ul.dropdown-menu').is(':hidden')){ 
        	$('ul.dropdown-menu').show(); 
        	$('a.nav-warn-icon').css({"background":"#fff","color":"#666"}); 
        	return false;
        }else{ 
        	$('ul.dropdown-menu').hide(); 
        	$('a.nav-warn-icon').css({"background":"#373D41","color":"#fff"}); 
        }  
    }); 
    
    $('body').click(function(){ 
        $('ul.dropdown-menu').hide(); 
        $('a.nav-warn-icon').css({"background":"#373D41","color":"#fff"}); 
    });



    //弹出
    var elButtonWith = $('#buttonWith');
    var elAside = $('#aside');
    elButtonWith.on('click', function() {
        elAside.addClass('active');
        $.smartScroll(elAside, '.scrollable');
        $('html').addClass('noscroll');
    });

    $('.hideAside').on('click', function () {
        $('html').removeClass('noscroll');
        elAside.removeClass('active');
        $("#jgmc").text($(".gs-active").find("label").text());
        setOrgInfo();
    });
});

//tab 跳转页面
function jumpPage(id,url){
	$.ajax({
		url:url,
		type:"GET",
		cache:false,
		async:false,
		dataType:"html",
		error:function(){
			top.Dialog.alert("页面加载出错！");
		},
		success:function(resp){
			$("#"+id).html(resp);
		}
	});
}


//tab 跳转设置标题
function setTitle(title){
	$("ul.nav-tabs li.header small").text(title);
}

function clearErrMsg(obj){
	var val = $(obj).val();
	var id = $(obj).attr("id");
	if(val != ""){
		$(obj).parent().next().find("span[id='errormsg-"+id+"']").html("");
		$(obj).parent().next().find("span[id='errormsg-"+id+"']").removeClass("errMsgBd");
	}
}

function clearUploadErrMsg(obj){
	var id = $(obj).attr("id").replace("Btn","");
	
	$(obj).parent().next().find("span[id='errormsg-"+id+"']").html("");
	$(obj).parent().next().find("span[id='errormsg-"+id+"']").removeClass("errMsgBd");
}

function deleteImg(obj){
	var imgPath=$(obj).prev().attr("path");
	var hiddenObj = $(obj).parent().parent().find("input[type='hidden']").get(0);
	$.ajax({  
        type:'post',   
     	async:false,
        traditional :true,  
        url:'${base}/uploadFile/deleteImg.json',
        data:{"imgPath":imgPath,"id":"-1","type":1},  
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
			            timeout		: 1500
			        });
			        $(obj).prev().remove();
			        
		        	var imgs="";
			         $(obj).parent().find("img").each(function(){
		        		if(imgs==""){
		        			imgs=$(this).attr("path");
		        		}else{
		        			imgs=imgs+";"+$(this).attr("path");
		        		}
			        });
	        		$(hiddenObj).val(imgs);
	        		
			        $(obj).remove();
	        	}else{
	        		var n = noty({
			            text        : msg,
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
}
</script>
<#nested>
</html>
</#macro>
<#macro pagination pager>
<#if (pager.totalRecords)?default(0) != 0>
<div class="row">
	<input type="hidden" id="startId" name="start" value="${(RequestParameters.start?default(0))!}"/>	
	<nav>
      <ul class="pagination navbar-toggle">
        <li>
        	<a><font color="red">${(pager.totalRecords)!}</font>条</a>
        </li>
        <li>
        	<a>${(pager.totalPages)!}页</a>
        </li>
        <li>
          <a aria-label="Previous" href="javascript:void(0)" 
          	<#if pager.pageNum != 1>
          	onclick="toPage(0);"
          	</#if>
          	>
            <span aria-hidden="true">«</span>
          </a>
        </li>
        <#if pager.pageNum gt 2>
        <li><a href="javascript:void(0)" onclick="toPage(${(pager.previousPage - 2)*pager.pageSize!});">${(pager.pageNum - 2)!}</a></li>
        <li><a href="javascript:void(0)" onclick="toPage(${(pager.previousPage - 1)*pager.pageSize!});">${(pager.pageNum - 1)!}</a></li>
        <#elseif pager.pageNum gt 1>
        <li><a href="javascript:void(0)" onclick="toPage(${(pager.previousPage - 1)*pager.pageSize!});">${(pager.pageNum - 1)!}</a></li>
        </#if>
        <li class="active"><a><font color="white">${(pager.pageNum)!}</font></a></li>
        <#if (pager.totalPages - pager.pageNum) gt 1>
        <li><a href="javascript:void(0)" onclick="toPage(${(pager.pageNum)*pager.pageSize!});">${(pager.nextPage)!}</a></li>
        <li><a href="javascript:void(0)" onclick="toPage(${(pager.nextPage)*pager.pageSize!});">${(pager.nextPage + 1)!}</a></li>
        <#elseif (pager.totalPages - pager.pageNum) gt 0>
        <li><a href="javascript:void(0)" onclick="toPage(${(pager.pageNum)*pager.pageSize!});">${(pager.nextPage)!}</a></li>
        </#if>
        <li>
          <a aria-label="Next" href="javascript:void(0)" 
          <#if pager.totalPages != pager.pageNum>
          onclick="toPage(${(pager.totalPages-1)*pager.pageSize!});"
          </#if>
          >
            <span aria-hidden="true">»</span>
          </a>
        </li>
      </ul>
    </nav>
	</div>
</#if>
</#macro>

<#macro params uri>
	<#list RequestParameters?if_exists?keys as key>
	<#if RequestParameters[key]?has_content>
	<input type="hidden" name="${uri+key!}" value="${RequestParameters[key]!}"/>
	</#if>
	</#list>
</#macro>

<#macro warning>
	<#if errorMsgs?exists && errorMsgs?has_content>
		<div class="errorblock">
		<#if errorMsgs?is_string>
			${errorMsgs}<br/>
		<#else>
		<#list errorMsgs as msg>
			${msg}<br/>
		</#list>
		</#if>
		</div>
	</#if>
</#macro>
