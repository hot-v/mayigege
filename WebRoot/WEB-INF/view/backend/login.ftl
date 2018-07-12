<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>全球安——云安防管理平台</title>
    <link rel="shortcut icon" href="${base}/static/backend/login/images/favicon.ico?v=1" type="text/css"/>
    <link rel="stylesheet" href="${base}/static/backend/login/css/animate.min.css" type="text/css"/>
    <link rel="stylesheet" href="${base}/static/backend/login/css/login.css" type="text/css"/>
</head>
<body>
<!-- wrapper start -->
<div class="container">
    <div class="section-header">
        <!-- header start -->
        <div class="mod-header">
            <h1><a href="javascript:void(0)" class="icon-logo" title="蚂蚁策划管理平台"><span>蚂蚁策划管理平台</span></a></h1>
            <div class="mod-tab-list">
                <ul>
                    <li><a id="loginBtn" href="javascript:void(0)">登录</a></li>
                </ul>
            </div>
        </div>
        <!-- header end -->
    </div>
    <div class="section-main">
        <!-- main start -->
        <div class="main-wrapper">
            <div class="mod-page-intro part-login">
                <div class="intro-wrapper">
                    <div class="intro-detail">
                        <div class="detail-wrapper">
                            <div class="title">
                                <h2>蚂蚁哥哥</h2>
                            </div>
                            <div class="detail">
                                <h3>策划管理平台</h3>
                            </div>
                        </div>
                    </div>
                    <div class="mod-login">
                        <div class="login-inner">
                            <div class="wy-login-wrapper">
                                <h2>账号登录</h2>
                                <form class="login-form" role="form">
                                    <input type="text" class="login-form-input" name="username" id="exampleInputEmail1" placeholder="请输入账号" value="admin"/>
                                    <input type="password" class="login-form-input" name="password" id="exampleInputPassword1" placeholder="请输入密码" value="111111"/>
                                    <div class="login-form-password">
                                        <label id="errorInfo">&nbsp;</label>
                                    </div>
                                    <button type="button" class="btn btn-login">登 录</button>
                                    <div class="login-form-footer">

                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="intro-video">
                    <video id="video" class="video" src="${base}/static/backend/login/images/video/top.webm" autoplay="autoplay" loop="loop"></video>
                </div>
            </div>
        </div>
        <!-- main end -->
    </div>
    <div class="wy-footer" style="height:40px;">
        <div>
            <div class="copyright">
                <p>Copyright © 2018 - 2020 mayigege. All Rights Reserved. 蚂蚁哥哥 版权所有</p>
            </div>
        </div>
    </div>
</div>
<!-- wrapper end -->

<script src="${base}/static/backend/login/js/jquery.min.js"></script>
<script src="${base}/static/backend/login/js/wow.min.js"></script>

<script type="text/javascript">
	if(window.parent != window) {
		window.parent.location.href = "${base}/admin/login";
	}
	
	$(document).ready(function(){
		$(document).keyup(function(event){
			if(event.keyCode ==13){
		        login();
		 	}
		});
		$(".btn-login").click(function(){
			login();
		});
	});
	
	function login(){
		var params = {};
		params['username'] = $("input[name=username]").val();
		params['password'] = $("input[name=password]").val();
		
		$.post('${base}/admin/login.json',params,function(data){
			if(data.success) {
                   location.href="${base}/admin/index.html";
			} else {
				$("#errorInfo").html('<font color="red">'+data.message+'</font>');
			}
		});
		
	}

    var wow = new WOW({
        boxClass: 'wow',
        animateClass: 'animated',
        offset: 0,
        mobile: true,
        live: true
    });
    wow.init();

    var  hasShowHeader = false;
    $(window).on('scroll', function(e) {
        var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
        if(scrollTop > 850 && !hasShowHeader) {
            $(document.body).addClass('show-header');
            hasShowHeader = true;
        } else if(scrollTop <= 850) {
            $(document.body).removeClass('show-header');
            hasShowHeader = false;
        }
    });

    $('#loginBtn').on('click', function(e) {
        window.scrollTo(0, 0);
    });
</script>

</body>
</html>