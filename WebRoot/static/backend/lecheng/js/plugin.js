


















function testPlugin(){ 
sID="{D27CDB6E-AE6D-11cf-96B8-444553540000}" 
 with(info){ 
   addBehavior('#default#clientcaps') 
   info.innerText=isComponentInstalled(sID,"componentid")?'Flash插件已安装，版本：'+getComponentVersion(sID,"componentid"):"未安装插件" 
 } 
} 
window.attachEvent("onload",testPlugin);

<span id="info">系统正在检测你的播放器版本...</span> 





function checkPlugins(pluginsName, activexObjectName) {
         // 通常ActiveXObject的对象名称是两个插件名称的组合
         if (activexObjectName == '') activexObjectName = pluginsName + "." + pluginsName;
        
         var np = navigator.plugins;
         // 针对于FF等非IE
         if (np && np.length) {
             for(var i = 0; i < np.length; i ++) {
                 if(np[i].name.indexOf(pluginsName) != -1) return true;
             }
             return false;
         }
         // 针对于IE
         else if (window.ActiveXObject) {
             try {
                 var axobj =eval_r("new ActiveXObject(activexObjectName);");
                 // 将对象转化为布尔类型
                 return axobj ? true : false;
             } catch (e) {
                 return false;
             }
         } else {
             // 以上情况都排除则返回false
             return false;
         }
     }

/***最后说明一点的是，如何来查找插件的名称？我是通过Editplus中Html工具栏里面的“插入Object”命令来获取的，
比如插入Flash对象之后这个命令会产生一段HTML代码，其中Object中的id属性里面，将名称的空格和最后的Object去除就是对象的名称了。
比如Flash的id为“Shockwave Flash Object”，那它的插件名称为“Shockwave”；Quicktime的插件名称为“Quicktime”等等。***/







/***使用javascript代码检测是否安装Adobe Reader ActiveX。另外，若未安装直接跳转到adobe reader下载的页面，提示用户下载并安装。***/
function Check_AdobeReader() {
 var displayString;
 var acrobat = new Object();
 acrobat.installed = false;
 acrobat.version ="0.0";

 if (navigator.plugins && navigator.plugins.length) 
 {
     for (x = 0; x < navigator.plugins.length; x++) {
         if (navigator.plugins[x].description.indexOf("Adobe Acrobat") != -1) {
                 acrobat.version = parseFloat(navigator.plugins[x].description.split("Version")[1]);
                 if (acrobat.version.toString().length == 1) acrobat.version +=".0";
                 acrobat.installed = true;
                 displayString ="Acrobat Version:"+ acrobat.version;
                 break;
             } else if (navigator.plugins[x].description.indexOf("Adobe PDF Plug-In") != -1) {
                 acrobat.installed = true;
                 acrobat.version ="8+";
                 displayString ="Acrobat Version 8 or Above";
            }
        }
 } 
 else if (window.ActiveXObject) 
 {
     for (x = 2; x < 10; x++) {
         try {
         oAcro = eval("new ActiveXObject('PDF.PdfCtrl."+ x +"');");
         if (oAcro) {
             acrobat.installed = true;

             acrobat.version = x +".0";
             displayString ="Acrobat Version:"+ acrobat.version;
            }
        }
         catch (e) { }
    }

     try {
         oAcro4 = new ActiveXObject("PDF.PdfCtrl.1");
         if (oAcro4) {
             acrobat.installed = true;
             acrobat.version = '4.0';
             displayString = 'Acrobat Version: ' + acrobat.version;
        }
    }
     catch (e) { }

     try {
         oAcro7 = new ActiveXObject('AcroPDF.PDF.1');
         if (oAcro7) {
             acrobat.installed = true;
             acrobat.version = '7.0';
             displayString = 'Acrobat Version: ' + acrobat.version;
        }
    }
     catch (e) { }
}

 return acrobat;
}

function isAcrobatPluginInstall() { 
 var flag = false; 
 // 如果是firefox浏览器 
 if (navigator.plugins && navigator.plugins.length) { 
 for (x = 0; x < navigator.plugins.length; x++) {

 if (navigator.plugins[x].name == 'Adobe Acrobat') 
 flag = true; 
}
}
 // 下面代码都是处理IE浏览器的情况 
 else if (window.ActiveXObject) { 
 for (x = 2; x < 10; x++) { 
 try { 
 oAcro = eval("new ActiveXObject('PDF.PdfCtrl."+ x +"');"); 
 if (oAcro) { 
 flag = true; 
}
 } catch (e) { 
 flag = false; 
}
}
 try { 
 oAcro4 = new ActiveXObject('PDF.PdfCtrl.1'); 
 if (oAcro4) 
 flag = true; 
 } catch (e) { 
 flag = false; 
}
 try { 
 oAcro7 = new ActiveXObject('AcroPDF.PDF.1'); 
 if (oAcro7) 
 flag = true; 
 } catch (e) { 
 flag = false; 
}
}
 if (flag) { 
 return true;

 } else { 
alert("对不起,您还没有安装PDF阅读器软件呢,为了方便预览PDF文档,请选择安装！");
 location = 'http://ardownload.adobe.com/pub/adobe/reader/win/9.x/9.3/chs/AdbeRdr930_zh_CN.exe'; 
}
 return flag; 
}










$(function() {
    (function checkChrome45(){
        var chromeVersionS = navigator.userAgent.toLocaleLowerCase();
        var start = chromeVersionS.indexOf('chrome');
        var versionC = parseFloat(chromeVersionS.slice(start+7));
        var isNotSquare = window.location.href.indexOf('square.ys7.com') < 0;
        if(versionC >= 45 && isNotSquare){
            var address =  window.location.protocol + '//' + window.location.host + '/static/chromeTip.html';
            window.location.href = address;
        }
    })();

//如果没有启动或者安装控件，提示用户
var $tipHtmls = '<div class="NavTips" style="background: #f6f2aa;text-align: center;height: 50px;line-height: 50px;font-size: 14px;width: 100%;position: fixed;top: 0;left:0;color:##333333;font-family:"Microsoft Yahei"; font-size:13px;">'+
                '<div class="container">'+
                '<div>未启动控件或未安装控件</div>'+
                '</div>'+
                '</div>';
        //$('.compatible-detect').before($tipHtmls);          

    var $tip = $("#tip"),
            from = $('#form [name="from"]').val(),
            host = $('#form [name="host"]').val(),
            returnUrl = $('#form [name="returnUrl"]').val(),
            r = $('#form [name="r"]').val();
    host = host == void 0 ? '' : host;
    var paramUrl = '?host=' + host + '&returnUrl=' + returnUrl + '&r=' + r;
    var datas = {};
    var currentSign='';
    var mobileKeyCode = $("#mobileKeyCode"),
            getMobileKeyCode = $(".getMobileKeyCode");
			terminal_getMobileKeyCode = $(".terminal_getMobileKeyCode");
    
    var username = $('label[uid="username"]'),
	password = $('label[uid="password"]'),
	rpassword = $('label[uid="rpassword"]');
	var userPass = false;
	var ypasswordPass = false;
	var yconfirmPwdPass = false;
	var $yindexcode = $('#r-indexcode');
	var $ypassword = $('#r-password');
	var $yconfirmPwd = $('#r-confirmPwd');
	var targetDelElement = [];
    var smsType = 'sign';
    if($('#terminal_signPhone').length!=0){
    	$('#terminal_signPhone').html(terminal_phoneESC);
    }

    var pageTimer = {}; //定义计算器全局变量
    function clearTime(){
        for (var each in pageTimer) {
            clearInterval(pageTimer[each]); //清楚定时器
         }
         $('#terminal_getCode').html('获取验证码');
    }
    var i = 0;
    var timeTag = false;
    // 获取或设置一个值,该值指示是否已安装插件
    var hasPlugin = false;
    // 获取或设置一个值,该值指示是否不安装插件直接登录
    var isLoginNoPlugin = false;
    // 检测插件，每200毫秒循环一次，共10次
    (function checkPlugin() {
        setTimeout(function() {
            try {
                $("#password_plugin")[0].GetHDSign();
                hasPlugin = true;
                $('.NavTips').remove();
                return;
            } catch (e) {
                if (++i < 10) {
                    checkPlugin();
                } else {
                    hasPlugin = false;
                    $('.compatible-detect').before($tipHtmls);
                }
            }
        }, 200);
    })();
    // 绑定提示第一步
    $('#startDownloadPlugin1').click(function() {
        hideModal('downloadPluginModal1');
        showModal('downloadPluginModal2');
    });
    // 返回上一步
    $('.godownloadPluginModal1').click(function() {
        hideModal('downloadPluginModal2');
        showModal('downloadPluginModal1');
    });
    // 开始下载插件，每隔1s检测插件是否安装成功
    $('#startDownloadPlugin2').click(function() {
        hideModal('downloadPluginModal2');
        showModal('pluginDownloadingModal');
        isLoginNoPlugin = false;
        (function checkPlugin() {
            setTimeout(function() {
                if (timeTag)
                    return;
                try {
                    if (isIE) { // IE
                        var safeBox = new ActiveXObject("SAFEPWSBOX.SafePWSBoxCtrl.1");
                        if ($("object").length !== 0) {
                            $("object").remove();
                            window.console && console.log("移除object标签");
                        }
                        var $object = $("<object>"),
                                object = $object[0];
                        $object.attr({
                            classid: 'clsid:1AB3E92A-0F77-4610-B9E2-21D096295B9C',
                            id: 'password_plugin',
                            name: 'password_plugin'
                        });
                        $("body").append($object);
                        window.navigator.plugins.refresh(false); // 刷新浏览器插件
                        $("#password_plugin")[0].GetHDSign();
                    } else { // 非IE
                        if ($("embed").length !== 0) {
                            $("embed").remove();
                            window.console && console.log("移除embed标签");
                        }
                        var $embed = $("<embed>"),
                                embed = $embed[0];
                        $embed.attr({
                            type: 'application/shipin7-safebox-plugin',
                            id: 'password_plugin',
                            name: 'password_plugin'
                        });
                        $("body").append($embed);
                        window.navigator.plugins.refresh(false); // 刷新浏览器插件
                        embed.GetHDSign();
                    }
                    hasPlugin = true;
                    hideModal('pluginDownloadingModal');
                    $("#login").click();
                    timeTag = true;
                    $('.NavTips').remove();
                    return;
                } catch (e) {
                    checkPlugin();
                    window.console && window.console.log(e.toString());
                }
            }, 1000);
        })();
    });
    
function checkMac(){
	 var ua = navigator.userAgent.toLowerCase();
	 var Mac = /macintosh|mac os x/,
		Air = /adobeair/;
	if(Mac.test(ua) || Air.test(ua)){
		return true;
	}else{
		return false;
	}
}
 
	
	function resetInterval(id){
		 for (var each in pageTimer) {
            clearInterval(pageTimer[each]); //清楚定时器
         }
		 $("#" + id).removeClass("disabledBtn").removeAttr("disabled").html('获取验证码');
	}
   


    // 添加键盘事件
    $('#password,#code_input,#username').keypress(function(e) {
        var theEvent = window.event || e;
        var code = theEvent.keyCode || theEvent.which;
        if (code == 13) {
			$("#login").click();
        }
    });
    $('#signCode').keypress(function(e) {
        var theEvent = window.event || e;
        var code = theEvent.keyCode || theEvent.which;
        if (code == 13) {
        	saveSignFn();
        }
    });


    // 点击“看不清”按钮
    $("#code_a").click(function() {
        var random = Math.random();
        $('#code_img')[0].src = basePath + '/captcha?random=' + random + '&indexcode=' + $("#username").val();
    });
    
    $("#code_img").click(function(){
        $("#code_a").click();
    })

    // 点击忘记密码按钮
    $("#forget_pass").click(function() {
        var url = basePath + '/forget';
        url += paramUrl;
        window.location.href = url;
    });

    // 点击QQ登录
    $("#login-qq").click(function() {
        var url = basePath + '/oauth/qq';
        url += paramUrl;
        window.location.href = url;
    });

    // 点击Logo
    $("#logo").click(function() {
        window.location.href = 'http://www.ys7.com';
    });

    // 点击注册
    $("#register").click(function() {
        var url = basePath + '/register';
        url += paramUrl;
        window.location.href = url;
    });

    // 点击演示点
    $("#demo").click(function() {
        window.location.href = 'http://square.ys7.com/square/index.jsp';
    });

    function saveSignFn() {
        var code = $('#signCode').val();
        if (code == '') {
            $(".up_prompt_warn_nored").html("不能为空").css({
                visibility: 'visible'
            });
            return false;
        }
        if (smsType == 'sign') {
            $.ajax({
                url: basePath + '/sign/add',
                type: 'POST',
                timeout: 60000,
                data: {
                    account: datas.account,
                    password: datas.password,
                    code: code,
                    sign: (isLoginNoPlugin ? 0 : datas.sign),
                    cname: (isLoginNoPlugin ? 0 : datas.cname)
                },
                cache: false,
                dataType: 'json',
                success: function(data) {
                    if (data.retcode == '0') {
                        $("#login").click();
                    } else {
                        $(".up_prompt_warn_nored").html("验证码错误，请核对").css({
                            visibility: 'visible'
                        });
                    }
                }
            });
        } else if (smsType == 'tiny') {
            $.ajax({
                url: basePath + '/tiny/actv',
                type: 'POST',
                timeout: 60000,
                data: {
                    account: datas.account,
                    password: datas.password,
                    code: code
                },
                cache: false,
                dataType: 'json',
                success: function(data) {
                    if (data.retcode == '0') {
                        $("#login").click();
                    } else {
                        $(".up_prompt_warn_nored").html("验证码错误，请核对").css({
                            visibility: 'visible'
                        });
                    }
                }
            });
        }
        return false;
    }
    $('#saveSign').on('click', saveSignFn);
    $('#valTmsf').on('click', function() {
        datas.tpwd = $('#tmsfCode').val();
        $("#login").click();
    });

    //根据弹出框id隐藏弹出框
    var hideModal = function(id) {
        $("#" + id).addClass("hide");
        $("#" + id).find("input").val("");
        $(".model_iframe").addClass("hide");
    };
    //根据弹出框id显示弹出框
    var showModal = function(id) {
        $("#" + id).removeClass("hide");
        var width = $("#" + id).outerWidth();
        $(".model_iframe").width(width).height("150px").removeClass("hide").css({
            left: '50%',
            marginLeft: -width / 2
        });
    };

    //弹出框关闭操作
    $(".terminalModal .close").on('click', function() {
        timeTag = true;
        var id = $(this).parents(".terminalModal").attr("id");
        $(".up_prompt_warn_nored").html("").css({
            visibility: 'visible'
        });
        currentSign = '';
		targetDelElement = [];
        hideModal(id);
		
		clearTime();
    });
    //弹出框取消操作
    $(".terminalModal .up_modal_hide").on('click', function() {
        var id = $(this).parents(".terminalModal").attr("id");
        $(".up_prompt_warn_nored").html("").css({
            visibility: 'visible'
        });
        currentSign = '';
		targetDelElement = [];
        hideModal(id);
    });

    // 设置手机验证码输入禁用和启用
    var disableMobileKeyCodeInput = function() {
        mobileKeyCode.val("").attr("disabled", "disabled");
    }
    
    function getMobileKeyCode_ClickEvent(param){
    	if ($(this).hasClass("disabledBtn")){
    		 return false;
    	}
		var IntervalId = '';
    	var hrefParam = window.location.href.split('?')[1].split('&')[0];
		var account = hrefParam ? hrefParam.split('=')[1]:'';
        if (smsType == 'sign') {
        	var url = basePath + '/sign/sms',
        	    data={
	                account: datas.account || account,
	                password: datas.password || $.cookie('terminal_password')
	            };
        	if(param =="terminal"){
        		url = basePath + '/sign/smsDel';
				IntervalId = terminal_getMobileKeyCode.attr("id");
        	}else{
				 IntervalId = getMobileKeyCode.attr("id");
			}
			countdown(IntervalId);
                       
            $.ajax({
                url: url,
                type: 'POST',
                timeout: 60000,
                data:data,
                cache: false,
                dataType: 'json',
                success: function(data) {
					//resetInterval(IntervalId);
                    if (data.retcode == '0') {
                        $(".up_prompt_warn_nored").html("").css({
                            visibility: 'hidden'
                        });
                    } else if (data.retcode == '-5' || data.retcode == '-52') {
                        $(".up_prompt_warn_nored").html("操作过于频繁，休息一下再试吧").css({
                            visibility: 'visible'
                        });
                    } else if (data.retcode == '-4') {
                        $(".up_prompt_warn_nored").html("用户不存在").css({
                            visibility: 'visible'
                        });
                    } else if (data.retcode == '-42') {
                        $(".up_prompt_warn_nored").html("用户密码错误").css({
                            visibility: 'visible'
                        });
                    }else if (data.retcode == '-41') {
                        $(".up_prompt_warn_nored").html("用户SMSTo（手机、邮箱）不存在").css({
                            visibility: 'visible'
                        });
                    }  else {
                        $(".up_prompt_warn_nored").html("消息通道忙，休息一下再试吧").css({
                            visibility: 'visible'
                        });
                    }
                },
                error: function() {
					resetInterval(IntervalId);
                    $(".up_prompt_warn_nored").html("消息通道忙，休息一下再试吧").css({
                        visibility: 'visible'
                    });
                }
            });
        } else if (smsType == 'tiny') {
            $.ajax({
                url: basePath + '/tiny/sms',
                type: 'POST',
                timeout: 60000,
                data: {
                    account: datas.account,
                    password: datas.password
                },
                cache: false,
                dataType: 'json',
                success: function(data) {
					resetInterval(IntervalId);
                    if (data.retcode == '0') {
                        $(".up_prompt_warn_nored").html("").css({
                            visibility: 'hidden'
                        });
                    } else if (data.retcode == '-5' || data.retcode == '-52') {
                        $(".up_prompt_warn_nored").html("操作过于频繁，休息一下再试吧").css({
                            visibility: 'visible'
                        });
                    } else {
                        $(".up_prompt_warn_nored").html("消息通道忙，休息一下再试吧").css({
                            visibility: 'visible'
                        });
                    }
                },
                error: function() {
					resetInterval(IntervalId);
                    $(".up_prompt_warn_nored").html("消息通道忙，休息一下再试吧").css({
                        visibility: 'visible'
                    });
                }
            });
        }
    }
    //发送验证码  
    getMobileKeyCode.on('click', function() {
    	getMobileKeyCode_ClickEvent();
    });
    $('.terminal_getMobileKeyCode').on('click', function() {
    	getMobileKeyCode_ClickEvent('terminal');
    });
    // 60秒倒计时
    function countdown(btn_checkcode_id) {
        var sec = 59,
                countId = setInterval(count, 1000);
        pageTimer["timer1"] = countId, //赋值定时器
                mobileKeyCode.removeAttr("disabled");
        $("#" + btn_checkcode_id).addClass("disabledBtn").attr("disabled", "disabled");

        function count() {
            $("#" + btn_checkcode_id)[0].innerHTML = "获取验证码(" + sec + ")";
            if (!(sec--)) {
                $("#" + btn_checkcode_id)[0].innerHTML = "获取验证码";
                clearInterval(countId);
                $("#" + btn_checkcode_id).removeClass("disabledBtn").removeAttr("disabled");
            }
        }

    };
    
    /*------用户名密码设置--code-------------*/
    
  //为某个输入框添加错误提示 comps组件名 , text显示信息
	var showWarn = function(comps, text){
		comps.siblings(".promptBox").removeClass("up_prompt_pass").addClass('up_prompt_warn');
		comps.siblings(".promptBox").html(text);
	}
	var setRightPrompt = function(comps){
		comps.siblings(".promptBox").removeClass("up_prompt_warn").addClass('up_prompt_pass');
		comps.siblings(".promptBox").html('');
	}
	var hideWarn = function(comps){
		comps.siblings(".promptBox").removeClass('up_prompt_pass up_prompt_warn');
		comps.siblings(".promptBox").html('');
	}
	$yindexcode.on('blur',function(){
		var me = $(this);
		var value = me.val();
		if(!value){
			userPass = false;
			showWarn(me, "不能为空");
		}else if(value.length < 4){
			userPass = false;
			showWarn(me, "不能少于4个字符");
		}else if(value.length>20){
			userPass = false;
			showWarn(me, "不能超过20个字符");
		}else if(/^_*$/.test(value)){
			userPass = false;
			showWarn(me, "不能全为下划线");
		}else if(/^\d*$/.test(value)){
			userPass = false;
			showWarn(me, "不能全为数字");
		}else if( !(/^[a-zA-Z0-9_]{1,}$/.test(value))){
			userPass = false;
			showWarn(me, "只能输入英文、数字和下划线");
		}else{
			hideWarn(me);
			ajax_check_indexcode();
		}
	});
	// 验证用户名
	var ajax_check_indexcode = function() {
		$.ajax({
			url : basePath + 'chk',
			type : 'post',
			timeout : 60000,
			data : {
				t :'1',
				v : $yindexcode.val()
			},
			dataType : 'json',
			success : function(data, status) {
				if(data.registered){
					showWarn($yindexcode, '该用户名已存在，换一个吧');
					userPass = false;
				}else{
					userPass = true;
					setRightPrompt($yindexcode);
				}
			},
			error : function(xhr , status ,error){
				userPass = false;
				if(xhr.status != 200){
					showWarn($yindexcode, "验证失败，请检查您的网络");
				}
			}
		});
	};
	$ypassword.on('blur',function(){
		var me = $(this);
		var value = me.val();
		var ret;
		RegExp.escape = function(source){
		  return String(source).replace(/([\!\\\/\.\$\*\^\(\)\[\]\{\}\?\+\-\|])/g, "\\$1");
		};		
		ret = new RegExp('^'+RegExp.escape(value[0])+'*$').test(value);
		if(!value){
			ypasswordPass =false;
			showWarn(me, "不能为空");
		}else if(value.length < 6){
			ypasswordPass =false;
			showWarn(me, "不能少于6个字符");
		}else if(value.length>16){
			ypasswordPass =false;
			showWarn(me, "不能超过16个字符");
		}else if(ret){
			ypasswordPass =false;
			showWarn(me, "不能为同一符号");
		}else if( /\s/.test(value)){
			ypasswordPass =false;
			showWarn(me, "不能包含空格");
		}else if(/^\d+$/.test(value)){
			ypasswordPass =false;
			showWarn(me, "不能全为数字");
		}else if(/^[a-zA-Z]+$/.test(value)){
			ypasswordPass =false;
			showWarn(me, "不能全为字母");
		}else{
			ypasswordPass =true;
			hideWarn(me);
			setRightPrompt(me);
		}
	});
	$yconfirmPwd.on('blur',function(){
		var me = $(this);
		var value = me.val();
		var ret;
		RegExp.escape = function(source){
		  return String(source).replace(/([\!\\\/\.\$\*\^\(\)\[\]\{\}\?\+\-\|])/g, "\\$1");
		};		
		ret = new RegExp('^'+RegExp.escape(value[0])+'*$').test(value);
		if(!value){
			yconfirmPwdPass =false;
			showWarn(me, "不能为空");
		}else if(value.length < 6){
			yconfirmPwdPass =false;
			showWarn(me, "不能少于6个字符");
		}else if(value.length>16){
			yconfirmPwdPass =false;
			showWarn(me, "不能超过16个字符");
		}else if(ret){
			yconfirmPwdPass =false;
			showWarn(me, "不能为同一符号");
		}else if( /\s/.test(value)){
			yconfirmPwdPass =false;
			showWarn(me, "不能包含空格");
		}else if(/^\d+$/.test(value)){
			yconfirmPwdPass =false;
			showWarn(me, "不能全为数字");
		}else if(/^[a-zA-Z]+$/.test(value)){
			yconfirmPwdPass =false;
			showWarn(me, "不能全为字母");
		}else if($ypassword.val()!= value){
			yconfirmPwdPass =false;
			showWarn(me, "两次输入的密码不一致");
		}else{
			yconfirmPwdPass =true;
			hideWarn(me);
			setRightPrompt(me);
		}
	});
	// 用户名
	$yindexcode.focus(function(){
		hideWarn($yindexcode);
		$(this).attr("placeholder","4-20个字符（英文、数字、下划线）");
	}).blur(function() {
		if(!$yindexcode.val()){
    		showWarn($yindexcode, "不能为空");
    	}
		$(this).attr("placeholder","");
	});
	
	// 密码
	$ypassword.focus(function(){
		hideWarn($ypassword);
		$(this).attr("placeholder","6-16个字母、数字或符号，不能全为字母或数字");
	}).blur(function() {
		if(!$ypassword.val()){
    		showWarn($ypassword, "不能为空");
    	}
		$(this).attr("placeholder","");
	});
	
	// 确认密码
	$yconfirmPwd.focus(function(){
		hideWarn($yconfirmPwd);
		$(this).attr("placeholder","请再次输入密码");
	}).blur(function() {
		if(!$yconfirmPwd.val()){
    		showWarn($yconfirmPwd, "不能为空");
    	}
		$(this).attr("placeholder","");
	});
    $(".setUserInfoBtn").on('click',function(){
    	if(!$yindexcode.val()){
    		showWarn($yindexcode, "不能为空");
    	}
    	if(!$ypassword.val()){
    		showWarn($ypassword, "不能为空");
    	}
    	if(!$yconfirmPwd.val()){
    		showWarn($yconfirmPwd, "不能为空");
    	}
    	if(!userPass || !ypasswordPass || !yconfirmPwdPass){
    		return false;
    	}
    	backVerify();
    });
    /*------用户名密码设置--code-------------*/
    $(document).keydown(function(e) {
        var theEvent = window.event || e;
        var code = theEvent.keyCode || theEvent.which;
        if (code == 13) {
        	if($( '#userInfoSet').is(":visible")){
        		$(".setUserInfoBtn").focus().click();
        	}
        }
    });
    
    $(function() {
        disableMobileKeyCodeInput();


    });


    // 根据后台返回的广告图片对象设置广告图片
    if(adObj){
        try{
            if (typeof JSON.parse !== 'function') {
                adObj =(new Function("", "return " + adObj))();
            }else{
                adObj = JSON.parse(adObj);
            }
        }catch(e){
            // 解析出错
            window.console && console.log('广告图片对象解析出错，使用默认图片')
            adObj = [{url: "/assets/images/defaultBG_new.png", href:"http://square.ys7.com/square/index.jsp"}];
        }
    }else{
        adObj = [{url: "/assets/images/defaultBG_new.png", href:"http://square.ys7.com/square/index.jsp"}];
    }
    var adHtml = '';
    if(adObj.length == 1){
        adHtml += '<div onclick="javascript:window.open(\''+adObj[0].href+'\')" style="background: url('+adObj[0].url+') no-repeat center;" ></div>';
        $('#adImage').html(adHtml);
    }else{
        for(var temp = 0; temp < adObj.length; temp++){
            adHtml += '<div onclick="javascript:window.open(\''+adObj[temp].href+'\')" style="display:none;background: url('+adObj[temp].url+') no-repeat center;" ></div>';
        }
        $('#adImage').html(adHtml);
        var currentAd = 0;
        var $adImageDiv = $('#adImage').children();
        $adImageDiv.eq(currentAd).fadeIn("fast");
        setInterval(function(){
            $adImageDiv.eq(currentAd).fadeOut("slow",function(){
                currentAd++;
                if(currentAd == adObj.length){
                    currentAd = 0;
                }
                $adImageDiv.eq(currentAd).fadeIn("fast");
            });
            
        }, 5000);
    }
    $('.loginDetail .delete').click(function(e){
   	 var target = e.target;
   	 currentSign = target.parentElement.getAttribute('sign');
   	targetDelElement.push($(target.parentElement));
	showModal('terminal_SMS_verification');
	$('#terminal_signCode').val('');
	getMobileKeyCode_ClickEvent('terminal');
	});
 $('#batchDelete').click(function(e){
	 var selectItem = $('.toggleSelect');
	 var len = selectItem.length;
     //每次点击批量删除时，初始化currentSign值
     currentSign = '';
	 for(var i = 0; i < len ; i++){
		 if($(selectItem[i]).is(':checked')){
			 var currentTar = $(selectItem[i]);
			 currentSign = currentSign + currentTar.parent().parent().attr('sign')+",";
			targetDelElement.push($(currentTar.parent().parent()));
		 }
	 }
	 if(currentSign == ''){
		 $('#deleteLoading').removeClass('hide');
		 setTimeout(function(){
			 $('#deleteLoading').addClass('hide');
		 },2000);
		 return;
	 }
    //清除定时器 
    for (var each in pageTimer) {
        clearInterval(pageTimer[each]); //清除定时器
    }

	showModal('terminal_SMS_verification');
	$('#terminal_signCode').val('');
	getMobileKeyCode_ClickEvent('terminal');
	});	
	
    $('#continue').click(function(){
    	$('#continue_delete').addClass('hide');
    	
    	//window.location.reload();
    	
    });
    
    function removeElement(){
    	if(targetDelElement && targetDelElement.length > 0){
    		var len = targetDelElement.length;
    		$.each(targetDelElement,function(i,val){
    			val.remove();
    		});
    		targetDelElement = [];
    	}
    }
    
  $('#terminal_saveSign').click(function(e){
  var code = $('#terminal_signCode').val();
        if (code == '') {
            $(".up_prompt_warn_nored").html("不能为空").css({
                visibility: 'visible'
            });
            return false;
        }

  	  $.ajax({
                url: basePath + '/sign/del',
                type: 'POST',
                timeout: 60000,
                data: {
					sign:currentSign,
					smsCode:code,
					phone:terminal_phone,
					userId:userId 
                },
                cache: false,
                dataType: 'json',
                success: function(data) {
		   if (data.retcode == '0') {
		    	hideModal('terminal_SMS_verification');
		    	removeElement();
		    	terminalManageLogin(JSON.parse(  $.cookie('doLoginParams')));
		    	
               } else if(data.retcode == '-51') {
                   $(".up_prompt_warn_nored").html("短信验证码校验不通过").css({
                       visibility: 'visible'
                   });

               }else if(data.retcode == '-7') {
                   $(".up_prompt_warn_nored").html("终端删除失败").css({
                       visibility: 'visible'
                   });
               }else if(data.retcode == '-8') {
                   $(".up_prompt_warn_nored").html("").css({
                       visibility: 'visible'
                   });
                   hideModal('terminal_SMS_verification');
                   $(".up_prompt_warn_nored").html("").css({
                       visibility: 'visible'
                   });
                   removeElement();
                   $('#continue_delete .modal-body p').html('删除成功，绑定的终端数请删除到'+data.limits+'个以内！');
                   $('#continue_delete').removeClass('hide');
               }else {
                        $(".up_prompt_warn_nored").html("验证码错误，请核对").css({
                            visibility: 'visible'
                        });
                    }
                },
                error: function() {
                    $(".up_prompt_warn_nored").html("验证码错误，请核对").css({
                        visibility: 'visible'
                    });
                }
            });
  });
  
  function terminalManageLogin(datas){
	  $.ajax({
		  url:basePath + '/doLogin',
	  	  type:"POST",
	  	  timeout:60000,
	  	  data:datas,

	  	  cache:false,
	  	  dataType:"json",
	  	  success:function(data,status){
	  		  switch(Number(data.retcode)){
	  			  case 0:
	  				  document.title = "登录成功，正在跳转，请稍后";
	  				  window.location.href = data.redirectUrl;
	  				  break;
	  		  }
	  	  },
	  	  error:function(xhr, status, error){
	  		  if(xhr.status != 200){
	  			$('#terminalLoading').removeClass('hide');
		    	setTimeout(function(){
		    		$('#terminalLoading').addClass('hide');
		    	},3000);
	  		  }
	  	  }
	  });
  }
    
  
});