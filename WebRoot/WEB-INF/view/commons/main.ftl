<#global base=rc.contextPath/>
<#-- 页首 -->
<#macro header title="" charset="utf-8" lang="zh-CN">
<!DOCTYPE html>
<html>
<head>
	<title>上海义吉文化传播有限公司</title>
	<link rel="stylesheet" href="${base}/static/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css" type="text/css">
	<link rel="stylesheet" href="${base}/static/css/animate.min.css">
	<link rel="stylesheet" href="${base}/static/css/googleapis.css">
	<link rel="stylesheet" href="${base}/static/css/templatemo-style.css">
	<link rel="stylesheet" type="text/css" href="${base}/static/css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="${base}/static/css/popup.css" />
<#nested>
</head>
</#macro>
<#-- 页首 -->


<#-- 主体 -->
<#macro body>
<body>

</body>
</#macro>
<#-- 主体 -->


<#-- 页尾 -->
<#macro footer>
	<script src="${base}/static/js/jquery.js"></script>
	<script src="${base}/static/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="${base}/static/js/jquery.simple-text-rotator.js"></script>
	<script src="${base}/static/js/smoothscroll.js"></script>
	<script src="${base}/static/js/wow.min.js"></script>
	<script src="${base}/static/js/jquery.flexslider.js"></script>
	<script src="${base}/static/js/templatemo-script.js"></script>
	<script src="${base}/static/js/popup.js"></script>
<#nested>
</html>
</#macro>
<#-- 页尾 -->
