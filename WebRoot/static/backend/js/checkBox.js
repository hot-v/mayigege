jQuery(function($) {
	var paramIdList = $("#paramIdList").val().split(",");
	$("input[type='checkbox']").each(function(){
		var id = $(this).val();
		if(paramIdList.indexOf(id) >= 0){
			$(this).prop('checked',true).attr('checked',true);
		}
	})
	
	isAllChecked();	
})

function isAllChecked(){
	//复选框数量
	var checkboxLen = $("input[id^='sel_']").length;
	//被选中数量
	var checkedLen = $("input[id^='sel_']:checked").length;

	if(checkedLen !=0 && checkedLen==checkboxLen){
		$("#checkAll2").prop("checked",true);
	}else{
		$("#checkAll2").prop("checked",false);
	}
	
}

//全选反选
function clickAllSelect(){
	var bischecked=$('#checkAll2').prop('checked');
    if (bischecked){
    	checkAlls();
    } else {
    	clearAll();
    }
}

function checkAlls(){
	$("input[id^='sel_']").each(function(i){
		$(this).prop('checked',true).attr('checked',true);
		userAdd($(this).attr("paramId"),$(this).attr("paramName"));
	});
}

function clearAll() {
	$("input[id^='sel_']").each(function(i){
		$(this).prop('checked',false).attr('checked',false);
		userRemove($(this).attr("paramId"),$(this).attr("paramName"));
	});
}


//点击checkbox事件
function clickCheckbox(data){
	var selectedInput=$(data);
	if($(data).attr("checked") == "checked"){
		userRemove($(data).attr("paramId"),$(data).attr("paramName"));
		selectedInput.attr("checked",false);
	}else{
		userAdd($(data).attr("paramId"),$(data).attr("paramName"));
		selectedInput.attr("checked",true);
	}
}


function userAdd(paramId, paramName){
	if($("#tab_"+paramId).length > 0){
		return;
	}
	$("#selectUser").append(
			'<button id="tab_'
					+ paramId
					+ '" class="btn btn-xs btn-primary glyphicon glyphicon-remove" style="margin-left:2px" onclick="userRemove(\''
					+ paramId
					+ '\',\''
					+ paramName
					+ '\');">'
					+ paramName + '</button>');
	var paramIdList = $("#paramIdList").val();
	if(paramIdList.indexOf(paramId) >= 0){
		return;
	}
	paramIdList=paramIdList+","+paramId;
	$("#paramIdList").val(paramIdList);
	
	isAllChecked();	
}

function userRemove(paramId, paramName){
	$("#tab_"+paramId).remove();
	$("input:checkbox[name=selected]").each(function() {
		if($(this).val().split(",")[0] == paramId){
			$("#sel_"+paramId).prop('checked',false);
		}
	});
	
	var paramIdList = $("#paramIdList").val();
	var paramIdListArray = paramIdList.split(",");
	var newIds = "";
	for(var i=0;i<paramIdListArray.length;i++){
		if(paramIdListArray[i] != ''){
			if(paramIdListArray[i]!=paramId){
				newIds += "," + paramIdListArray[i];
			}
		}
	}
	$("#paramIdList").val(newIds);
	
	isAllChecked();	
}