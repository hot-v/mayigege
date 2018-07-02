
//分页插件  langzhang
/***
 * totalNum:总条数
 * pageSize:每页显示数量
 * curPage:当前页
 * formId:form表单id
 * url:后台url
 * jump:回调函数  会返回一个查询data结果集  可对data进行处理
 */
;(function($, window, document,undefined) {
    //定义Beautifier的构造函数
    var Pagination = function(ele, opt) {
        this.$element = ele,
        this.defaults = {
        		'totalNum':2,	//总条数
				'pageSize':10,	//每页显示数量
				'curPage':1,	//当前页
				'formId':'',
				'url':'',
				'jump':function(obj){
					
				}
        },
        this.options = $.extend({}, this.defaults, opt)
    }
    //定义Beautifier的方法
    Pagination.prototype = {
    	pageData:function(){
    		var opts,$this,formId,$form_,start,url,limit;
    		opts = this.options;
    		$this = this;
    		formId = opts.formId;
    		start = (opts.curPage - 1) * opts.pageSize;
    		limit = opts.pageSize;
    		//读取from 对象
    		if(opts.formId==''){
    			$form_ = $("from:eq(0)");
    		}else{
    			$form_ = $(formId);
    		}
    		//设置请求地址
    		if(opts.url==''){
    			url = $form_.attr("action");
    		}else{
    			url = opts.url;
    		}
    		
    		$.ajax({
    			url:url,
    			data:$form_.serialize()+"&start="+start+"&limit="+limit,
    			type:'POST',
    			traditional:true,
    			error:function(){
    				top.Dialog.alert("数据加载异常！");
    			},
    			success:function(data){
    				if(data.code == 1){
    					//回调函数
    					opts.totalNum = data.obj.totalRecords;
    					opts.pageSize = data.obj.pageSize;
    					var obj = {'curPage':opts.curPage,'totalNum':opts.totalNum,'pageSize':opts.pageSize};
    					opts.jump(data, obj);
    					$this.createTag();
    				}else{
    					top.Dialog.alert("数据加载异常！");
    				}
    			}
    		});
    	},
    	
        createTag: function() {
        	var opts = this.options;
        	var $this = this;
        	var lastNum = parseInt((opts.totalNum  +  opts.pageSize  - 1) / opts.pageSize);
			var curPage = parseInt(opts.curPage);
			
			//创建分页标签
			var startLi = 1;
			var endLi = 1;
			//开始位置
			if(curPage==1 || curPage==2){
				startLi = 1;
				if(endLi+2<lastNum){
					endLi = curPage + 2;
				}else{
					endLi = lastNum;
				}
			}else if(curPage == lastNum || curPage==(lastNum-1)){
				if((curPage-2)>0){
					startLi = curPage-2;
					endLi = lastNum;
				}else{
					startLi = 1;
					endLi = lastNum;
				}
			}else{
				startLi = curPage - 2;
				endLi = curPage + 2;
			}
			
			var tag = "<div class='row'>";
			tag += "<nav>";
		    tag += "<ul class='pagination navbar-toggle'>";
		    tag += "<li>";
		    tag += "<a><font color='red' id='dataNum'>"+opts.totalNum+"</font>条</a>";
		    tag += "</li>";    	
		    tag += "<li>";
		    tag += "<a id='totalPage'>"+lastNum+"页</a>";
		    tag += "</li>";
		    tag += "<li id='upPage' page = '1'>";    	
		    tag += "<a aria-label='Previous' href='javascript:void(0)'>";    
		    tag += "<span aria-hidden='true'>«</span>";    
		    tag += "</a>";
		    tag += "</li>";
		    for(var i=startLi;i<=endLi;i++){
		    	if(curPage==i){
		    		tag += "<li id=\"page_"+i+"\" class='active' page='"+i+"'><a><font>"+i+"</font></a></li>";
		    	}else{
		    		tag += "<li id=\"page_"+i+"\" page='"+i+"'><a><font>"+i+"</font></a></li>";
		    	}
		    	
		    }
		    tag += "<li page = '"+lastNum+"'>";
		    tag += "<a aria-label='Next' href='javascript:void(0)'>";
		    tag += "<span aria-hidden='true'>»</span>";
		    tag += "</a>";
		    tag += "</li>";
		    tag += "</ul>";
		    tag += "</nav></div>";
		    
			this.$element.each(function(){
				$(this).find(".row").remove();
				$(this).append(tag).find("li[page]").click(function(){
					var page = $(this).attr("page");
					opts.curPage = page;
					$this.pageData();
				});
			});
        }
    }
    
	    //在插件中使用pagination对象
	    $.fn.myPager = function(options) {
	        //创建pagination的实体
	        var pagination = new Pagination(this, options);
	        pagination.pageData();
	        //调用其方法
	        return pagination.createTag();
	    }
	})(jQuery, window, document);