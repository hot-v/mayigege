
var stopOrPlay = 1;// 0暂停  1播放

var clarity = 0;//0 高清   1标清

var type = 0;//0播放/暂停    1高清/标清

var allowToFullscreen = false;//是否允许全屏

var clarityBtnStatus = true;//高标清切换按钮是否点击的状态  true可点击

var testEnvironment = "openapi.lechange.cn"; //测试环境地址

var ieVersion = {};//ie的版本号

var videoIndex = $("#videoIndex").val();


/**
 * 是否为windows系统
 * */
var isWindows = function() {
        return /windows|win32/i.test(navigator.userAgent);
};

/**
 * 是否为IE
 * */
function isIE(){
    var userAgent = navigator.userAgent, 
    rMsie = /(msie\s|trident.*rv:)([\w.]+)/, 
    rFirefox = /(firefox)\/([\w.]+)/, 
    rOpera = /(opera).+version\/([\w.]+)/, 
    rChrome = /(chrome)\/([\w.]+)/, 
    rSafari = /version\/([\w.]+).*(safari)/; 
    var browser; 
    var version; 
    var ua = userAgent.toLowerCase(); 

    var match = rMsie.exec(ua);    
    if (match != null) {  
        ieVersion = { browser : "IE", version : match[2] || "0" };
        return true; 
    }  
    var match = rFirefox.exec(ua);  
    if (match != null) {  
        var ffVersion = { browser : match[1] || "", version : match[2] || "0" };
        return false; 
    }  
    var match = rOpera.exec(ua);  
    if (match != null) { 
       var opVersion =  { browser : match[1] || "", version : match[2] || "0" };
       return false;
    }  
    var match = rChrome.exec(ua);  
    if (match != null) {  
        var chVersion = { browser : match[1] || "", version : match[2] || "0" };
        return false;
    }  
    var match = rSafari.exec(ua);  
    if (match != null) {  
       var sfVersion = { browser : match[2] || "", version : match[1] || "0" }; 
       return false;
    }  
    if (match != null) {  
        var ohterVersion = { browser : "", version : "0" }; 
        return false;
    }
}
	
/**
     * 检测IE中的插件
     * @param 插件名 name
     * @return boolean 存在插件返回true，否则返回false
     */
function hasIEPlugin(name){
    try{
        var comActiveX = new ActiveXObject(name);  
        delete comActiveX;
        return true;
    }catch(e){
       return false;   
    }
}


function checkSystem(){
     if(isWindows()){
		 if(isIE()){  //是ie
		 	var DEFAULT_VERSION = "8.0";  //线上为ie8
		     if(parseFloat(ieVersion.version) < parseFloat(DEFAULT_VERSION )){ //小于ie8
                 $('.item').hide();
                 $('.previewFormBg').hide();
		     	 $('body').css('background-color','#ffffff');
		     	 $('#nonsupport').show();
		     	 $("#hideDiv").hide();
		     }else{   //ie9以上    
		     	var hasPlugin = hasIEPlugin('LCOPENSDKPLUGIN.LCOpenSDKPlugInCtrl.1');
		     	if(true == hasPlugin){             //已安装插件
		    		$('.item').hide();
                    $('body').css('background-color','#e3edf3');
                    $('#hideDiv').show();
		     	}else{                 //未安装插件
		     		$('.item').hide();
                    $('.previewFormBg').hide();
		 	    	$('body').css('background-color','#ffffff');
		 	    	$('#noPlugin').show();
		 	    	$("#hideDiv").hide();
		     	}
		     }
		 }else{     //非ie
             $('.item').hide();
             $('.previewFormBg').hide();
             $('body').css('background-color','#ffffff');
             $('#nonsupport').show();
             $("#hideDiv").hide();
         }
     }else{     //非Windows
     	$('.item').hide();
        $('.previewFormBg').hide();
        $('body').css('background-color','#ffffff');
        $('#nonsupportSys').show();
        $("#hideDiv").hide();
     }
}


function StopOcxFOR(i){
	allowToFullscreen = false;
	var ocx = document.getElementById('LCOpenSDKPlugIn_'+i);
	ocx.stopRtspReal();
}


window.onbeforeunload = function(){
	if(videoIndex != ""){
		for(var i=0;i<videoIndex.split(",").length;i++){
			StopOcxFOR(i);
		}
	}
}