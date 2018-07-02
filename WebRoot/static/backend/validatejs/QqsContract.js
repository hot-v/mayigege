var saveQqsContractConfig = {
	contractNo:[{rule:notBlank,msg:"合同编号 不能为空"}],
	contractName:[{rule:notBlank,msg:"合同名称 不能为空"}],
	contactPhone:[{rule:regex,params:/^((0\d{2,3}-\d{7,8})|([1][345789][0-9]{9}))$/,msg:"联系电话  格式有误"}],
	amount:[{rule:notBlank,msg:"金额 不能为空"},{rule:regex,params:/^([1-9][0-9]{0,7}|0)(\.[0-9]{1,2})?$/,msg:"金额   格式不正确"}],
	beginDate:[{rule:notBlank,msg:"签订日期  不能为空"}],
	endDate:[{rule:notBlank,msg:"到期日期  不能为空"}],
	paramCustName:[{rule:notBlank,msg:"客户   不能为空"}],
};
