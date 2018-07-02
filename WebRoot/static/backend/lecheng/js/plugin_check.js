
var stopOrPlay = 1;// 0暂停  1播放

var clarity = 0;//0 高清   1标清

var type = 0;//0播放/暂停    1高清/标清

var allowToFullscreen = false;//是否允许全屏

var clarityBtnStatus = true;//高标清切换按钮是否点击的状态  true可点击

var testEnvironment = "openapi.lechange.cn"; //测试环境地址

var ieVersion = {};//ie的版本号



$('.styleInput').on('focus',function()
{
        $(this).prev('div').hide();
});

  //预览信息表单填写error提示信息显示/隐藏  
/*$('.styleInput').on('blur',function()
{      
    if('' == $(this).val())
    {
        if('item3' == $(this).attr('id'))
        {
            if($('.item31_inputErr').is(':visible'))
            {
                $('.item31_inputErr').hide();
            }
        }

        $(this).prev('div').show();
        $('.'+$(this).attr('id')+'_inputErr').show();
        return;
    }
    else
    {
        $('.'+$(this).attr('id')+'_inputErr').hide();
        if('item3' == $(this).attr('id'))
        {
            if(isNaN($(this).val()))  //通道号为数字判断
            {
                $('.item31_inputErr').show();
                return;
            }
            else
            {
                $('.item31_inputErr').hide();
            }
        }
    }
});
*/

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
function hasIEPlugin(name)
{
    try
    {
        var comActiveX = new ActiveXObject(name);  
        delete comActiveX;
        return true;
    }
    catch(e)
    {
       return false;   
    }
    
}



function onPlayResult(code,type)    //点击播放返回错误码
{
    clarityBtnStatus = true;
    if(0 == type)  //播放状态
    {
        switch(code)
        {
            case "0":
            allowToFullscreen = false;
            $('#error').html('<div class="warnImg">提示：组帧失败，错误状态<a style="font-size:16px;color:#ff9007;display:block;" class="goSignin" href="javascript:;">点击返回预览信息填写页面</a></div>');
            break;

            case "1":
            allowToFullscreen = false;
            $('#error').html('<div class="warnImg">提示：内部要求关闭,如连接断开等，错误状态<a style="font-size:16px;color:#ff9007;display:block;" class="goSignin" href="javascript:;">点击返回预览信息填写页面</a></div>');
            break;

            case "2":
            allowToFullscreen = false;
            $('#error').html('<div class="warnImg">提示：会话已经收到Describe响应，连接建立中<a style="font-size:16px;color:#ff9007;display:block;" class="goSignin" href="javascript:;">点击返回预览信息填写页面</a></div>');
            break;

            case "3":
            allowToFullscreen = false;
            $('#error').html('<div class="warnImg">提示：RTSP鉴权失败，错误状态<a style="font-size:16px;color:#ff9007;display:block;" class="goSignin" href="javascript:;">点击返回预览信息填写页面</a></div>');
            break;

            case "4":
            allowToFullscreen = true;
            $('#error').html('<div class="warnImg">提示：收到PLAY响应，连接成功<a style="font-size:16px;color:#ff9007;display:block;" class="goSignin" href="javascript:;">点击返回预览信息填写页面</a></div>');
            if(1 == type)
            {
                if(0 == clarity)
                {
                    $('#error').html('<div class="warnImg">提示：已切换至标清状态<a style="font-size:16px;color:#ff9007;display:block;" class="goSignin" href="javascript:;">点击返回预览信息填写页面</a></div>');
                    setTimeout( "$('#error').html('<a style='font-size:14px;color:#ff9007;' class='goSignin' href='javascript:;'>点击返回预览信息填写页面</a>')" , 5000 );
                }
                else if(1 == clarity)
                {
                    $('#error').html('<div class="warnImg">提示：已切换至高清状态</div><a style="font-size:16px;color:#ff9007;display:block;" class="goSignin" href="javascript:;">点击返回预览信息填写页面</a>');
                    setTimeout( "$('#error').html('<a style='font-size:14px;color:#ff9007;' class='goSignin' href='javascript:;'>点击返回预览信息填写页面</a>')" , 5000 );
                }
            }
            break;

            case "5":
            allowToFullscreen = false;
            $('#error').html('<div class="warnImg">提示：录像文件回放正常结束<a style="font-size:16px;color:#ff9007;display:block;" class="goSignin" href="javascript:;">点击返回预览信息填写页面</a></div>');
            break;

            case "6":
            allowToFullscreen = false;
            $('#error').html('<div class="warnImg">提示：收到PAUSE响应<a style="font-size:16px;color:#ff9007;display:block;" class="goSignin" href="javascript:;">点击返回预览信息填写页面</a></div>');
            break;

            case "99":
            allowToFullscreen = false;
            $('#error').html('<div class="warnImg">提示：基于503错误码的连接最大数错误，错误状态<a style="font-size:16px;color:#ff9007;display:block;" class="goSignin" href="javascript:;">点击返回预览信息填写页面</a></div>');
            break;

            case "100":
            allowToFullscreen = false;
            $('#error').html('<div class="warnImg">提示：用户信息起始码，服务端上层传过来的信息码会在该起始码基础上累加，错误状态<a style="font-size:16px;color:#ff9007;display:block;" class="goSignin" href="javascript:;">点击返回预览信息填写页面</a></div>');
            break;

            default:
            allowToFullscreen = false;
            $('#error').html('<div class="warnImg">提示：异常错误<a style="font-size:16px;color:#ff9007;display:block;" class="goSignin" href="javascript:;">点击返回预览信息填写页面</a></div>');
            break;

        }
    }
    else if(99 == type)
    {
        allowToFullscreen = false;
        switch(code)
        {
            case "-1000":
                $('#error').html('<div class="warnImg">提示：HTTP交互出错或超时<a style="font-size:16px;color:#ff9007;display:block;" class="goSignin" href="javascript:;">点击返回预览信息填写页面</a></div>');
            break;

            case "OP1001":
                $('#error').html('<div class="warnImg">操作失败。<a style="font-size:16px;color:#ff9007;display:block;" class="goSignin" href="javascript:;">点击返回预览信息填写页面</a></div>');
            break;

            case "OP1007":
                $('#error').html('<div class="warnImg">无效的方法调用。<a style="font-size:16px;color:#ff9007;display:block;" class="goSignin" href="javascript:;">点击返回预览信息填写页面</a></div>');
            break;

            case "OP1008":
                $('#error').html('<div class="warnImg">appId为空。<a style="font-size:16px;color:#ff9007;display:block;" class="goSignin" href="javascript:;">点击返回预览信息填写页面</a></div>');
            break;

            case "OP1009":
                $('#error').html('<div class="warnImg">权限不足，无法执行此操作。<a style="font-size:16px;color:#ff9007;display:block;" class="goSignin" href="javascript:;">点击返回预览信息填写页面</a></div>');
            break;

            case "OP1010":
                $('#error').html('<div class="warnImg">应用被冻结。<a style="font-size:16px;color:#ff9007;display:block;" class="goSignin" href="javascript:;">点击返回预览信息填写页面</a></div>');
            break;

            case "OP1011":
                $('#error').html('<div class="warnImg">当天调用接口次数已达上限。<a style="font-size:16px;color:#ff9007;display:block;" class="goSignin" href="javascript:;">点击返回预览信息填写页面</a></div>');
            break;

            case "TK1002":
                $('#error').html('<div class="warnImg">token已过期或不存在，请重新获取token。<a style="font-size:16px;color:#ff9007;display:block;" class="goSignin" href="javascript:;">点击返回预览信息填写页面</a></div>');
            break;

            case "TK1003":
                $('#error').html('<div class="warnImg">非法token，请传入正确的token。<a style="font-size:16px;color:#ff9007;display:block;" class="goSignin" href="javascript:;">点击返回预览信息填写页面</a></div>');
            break;

            case "DV1007":
                $('#error').html('<div class="warnImg">设备离线。<a style="font-size:16px;color:#ff9007;display:block;" class="goSignin" href="javascript:;">点击返回预览信息填写页面</a></div>');
            break;

            default:
                $('#error').html('<div class="warnImg">错误码：'+code+'<a style="font-size:16px;color:#ff9007;display:block;" class="goSignin" href="javascript:;">点击返回预览信息填写页面</a></div>');
            break;
        }
    }
}

function onPlayBegan(index)   //开始直播回调
{
    var ocx = document.getElementById('LCOpenSDKPlugIn');
    ocx.setAttribute("width","800");
    ocx.setAttribute("height","600");
    $('#error').html('<div class="warnImg">正在直播中...</div>');
}


function checkSystem()
{
     if(isWindows())
     {
		 if(isIE())  //是ie
		 {
		 	var DEFAULT_VERSION = "8.0";  //线上为ie8
		     if(parseFloat(ieVersion.version) < parseFloat(DEFAULT_VERSION )) //小于ie8
		     {
                 $('.item').hide();
                 $('.previewFormBg').hide();
		     	 $('body').css('background-color','#ffffff');
		     	 $('#nonsupport').show();
		     }
		     else    //ie9以上    
		     {
		     	var hasPlugin = hasIEPlugin('LCOPENSDKPLUGIN.LCOpenSDKPlugInCtrl.1');
		     	if(true == hasPlugin)             //已安装插件
		     	{
		    		$('.item').hide();
                    $('body').css('background-color','#e3edf3');
                    //$('#hasPlugin').show();
		     	}
		    	else                 //未安装插件
		     	{
		     		$('.item').hide();
                     $('.previewFormBg').hide();
		 	    	$('body').css('background-color','#ffffff');
		 	    	$('#noPlugin').show();
		     	}
		     }
		 }
         else     //非ie
         {
             $('.item').hide();
             $('.previewFormBg').hide();
             $('body').css('background-color','#ffffff');
             $('#nonsupport').show();
         }
     }
     else     //非Windows
     {
     	$('.item').hide();
        $('.previewFormBg').hide();
        $('body').css('background-color','#ffffff');
        $('#nonsupportSys').show();
     }

}

/*function submitToPreview() //提交表单信息
{       
    if('' == $('#item1').val() || 0 == $('#item1').val().length)
    {
        $('.item1_inputErr').eq(0).show();
        return;
    }
    else
    {
        $('.item1_inputErr').eq(0).hide();

        if('' == $('#item2').val() || 0 == $('#item2').val().length)
        {
            $('.item2_inputErr').eq(0).show();
            return;
        }
        else
        {
            $('.item2_inputErr').eq(0).hide();

            if('' == $('#item3').val() || 0 == $('#item3').val().length)
            {
                $('.item3_inputErr').eq(0).show();
                return;
            }
            else if(isNaN($('#item3').val()))  //通道号为数字判断
            {
                $('.item31_inputErr').eq(0).show();
                return;
            }
            else
            {
                $('.item31_inputErr').eq(0).hide();
                $('.item3_inputErr').eq(0).hide();
               // $('#hasPlugin').hide();
                $('body').css('background-color','#e3edf3');
                $('#previewPage').show();
                var ocx = null;
                ocx = window.document.createElement("object");
                ocx.setAttribute("id","LCOpenSDKPlugIn");
                ocx.setAttribute("classid","clsid:14107C75-63C4-4E57-9C70-ED5675EAA254");
                ocx.setAttribute("width","800");
                ocx.setAttribute("height","600");
                $('#videoBox').html(ocx); 
                setTimeout('CallOcx();',0);
            }
        }
    }
}*/  
     





function StopOcx()   
{
    allowToFullscreen = false;
    if("undefined" != typeof LCOpenSDKPlugIn){
    	LCOpenSDKPlugIn.stopRtspReal(); 
    	$('#error').html('<div class="warnImg">提示：已经停止播放</div>');
    }
}

/**
     * 插件全屏
     * 按ESC键退出全屏
     */
function enableFullScreen()
{
    if(allowToFullscreen)
    {
        LCOpenSDKPlugIn.enableFullScreen(1);//全屏
    }
    else if(stopOrPlay == 1)
    {
        $('#error').html('<div class="warnImg">提示：停止播放状态不能切换全屏<a style="font-size:16px;color:#ff9007;display:block;" class="goSignin" href="javascript:;">点击返回预览信息填写页面</a></div>'); //线上需修改，不需要文字提示
        return;
    }else{
        $('#error').html('<div class="warnImg">提示：异常状态不能切换全屏<a style="font-size:16px;color:#ff9007;display:block;" class="goSignin" href="javascript:;">点击返回预览信息填写页面</a></div>'); //线上需修改，不需要文字提示
        return;
    }
    
}


function toPlayBtn()  //播放
{
    stopOrPlay = 0;
    if($('#btn01').hasClass('btn01'))
    {
        return;
    }
    else
    {
        $('#btn01').removeClass('btn01_other');
        $('#btn01').addClass('btn01');
    }
}
function toStopBtn()   //暂停
{
    stopOrPlay = 1;
    if($('#btn01').hasClass('btn01_other'))
    {
        return;
    }
    else
    {
        $('#btn01').removeClass('btn01');
        $('#btn01').addClass('btn01_other');
    }
}

function toHDBtn()  //HD  高清
{
    clarity = 0;
    if($('#btn03').hasClass('btn03'))
    {
        return;
    }
    else
    {
        $('#btn03').removeClass('btn03_sd');
        $('#btn03').addClass('btn03');
    }
}
function toSDBtn()   //SD 标清
{
    clarity = 1;
    if($('#btn03').hasClass('btn03_sd'))
    {
        return;
    }
    else
    {
        $('#btn03').removeClass('btn03');
        $('#btn03').addClass('btn03_sd');
    }
}




function CallOcx()    //1播放  0暂停
{   
    type = 0;
    var ocx = document.getElementById('LCOpenSDKPlugIn');
    ocx.setAttribute("width","1");
    ocx.setAttribute("height","1");

    var token = $('#token').val();
    var deviceID = $('#deviceID').val();
    var channelID = parseInt($('#channelID').val());
   //--初始化、装载样式文件   
    if(1 == stopOrPlay)
    {
        toPlayBtn();//按钮状态
        LCOpenSDKPlugIn.openLog(1);    //线上需更改
        LCOpenSDKPlugIn.initOpenApi(testEnvironment,443);   //线上需更改
     // alert(token+","+deviceID+","+channelID+","+clarity);
        var iRes = LCOpenSDKPlugIn.playRtspReal(token,deviceID,channelID, clarity);
       
        $('#error').html('<div class="warnImg loading">正在加载中...</div>');
        if(iRes == -1)
        {
             $('#error').html('<div class="warnImg">提示：失败</div>');
             return;
        }
        
    }
    else if(0 == stopOrPlay)
    {
        toStopBtn();//按钮状态
        StopOcx();
    }

}

function changeClarity()    //清晰度切换
{
    if(clarityBtnStatus){
        type = 1;
        if(1 == stopOrPlay)//如果是暂停状态不能切换清晰度
        {
            $('#error').html('<div class="warnImg">提示：停止播放状态无法切换清晰度</div>');
            return;
        }
        else
        {
            StopOcx();
            if(0 == clarity)//高清
            {
                toSDBtn();
                $('#error').html('<div class="warnImg">提示：正在切换至标清...<a style="font-size:16px;color:#ff9007;display:block;" class="goSignin" href="javascript:;">点击返回预览信息填写页面</a></div>');
            }
            else if(1 == clarity) //标清
            {
                toHDBtn();
                $('#error').html('<div class="warnImg">提示：正在切换至高清...<a style="font-size:16px;color:#ff9007;display:block;" class="goSignin" href="javascript:;">点击返回预览信息填写页面</a></div>');
            }
            LCOpenSDKPlugIn.openLog(1);     //打印日志，线上需更改
            LCOpenSDKPlugIn.initOpenApi(testEnvironment,443);  //线上需更改
            var token = $('#token').val();
            var deviceID = $('#deviceID').val();
            var channelID = parseInt($('#channelID').val());
            clarityBtnStatus = false; 
            var iRes = LCOpenSDKPlugIn.playRtspReal(token,deviceID,channelID, clarity);
    
            // alert(clarityBtnStatus);
        }
    }else{
        // alert(clarityBtnStatus);
        return;
    }
    
}

window.onbeforeunload = function()
{
    StopOcx();
}