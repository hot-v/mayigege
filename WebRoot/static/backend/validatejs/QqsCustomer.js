var saveQqsCustomerConfig = {
	/*custId:[{rule:integer,msg:"客户代号 必须是数字"}],
	zoneId:[{rule:integer,msg:"区域ID 必须是数字"}],
	icode:[{rule:length,params:{min:0,max:20},msg:"内部编码 长度不在0-20范围"}],
	scode:[{rule:length,params:{min:0,max:20},msg:"标准编码 长度不在0-20范围"}],
	custName:[{rule:length,params:{min:0,max:60},msg:"客户名称 长度不在0-60范围"}],
	pycode:[{rule:length,params:{min:0,max:60},msg:"客户别名 长度不在0-60范围"}],
	nickName:[{rule:length,params:{min:0,max:60},msg:"客户简称 长度不在0-60范围"}],
	disabled:[{rule:integer,msg:"是否禁用 必须是数字"}],
	contactPhone:[{rule:length,params:{min:0,max:40},msg:"联系人号码 长度不在0-40范围"}],
	contactPerson:[{rule:length,params:{min:0,max:20},msg:"联系人姓名 长度不在0-20范围"}],
	address:[{rule:length,params:{min:0,max:80},msg:"客户地址 长度不在0-80范围"}],
	mobileNo:[{rule:length,params:{min:0,max:40},msg:"移动电话 长度不在0-40范围"}],
	orgId:[{rule:integer,msg:"机构ID 必须是数字"}]*/
	custName:[{rule:notBlank,msg:"客户名称 不能为空"},{rule:length,params:{min:0,max:50},msg:"客户名称 长度不能大于50"}],
	custNameQqa:[{rule:notBlank,msg:"联系人名称 不能为空"},{rule:length,params:{min:0,max:20},msg:"联系人名称 长度不能大于20"}],
	custAddressQqa:[{rule:notBlank,msg:"联系人地址 不能为空"},{rule:length,params:{min:0,max:80},msg:"联系人地址 长度不能大于80"}],
	custPhoneQqa:[{rule:notBlank,msg:"联系人号码 不能为空"},{rule:regex,params:/^((0\d{2,3}-\d{7,8})|([1][345789][0-9]{9}))$/,msg:"联系人号码 格式有误"}],
	lng:[{rule:notBlank,msg:"经度 不能为空"}],
	lat:[{rule:notBlank,msg:"纬度 不能为空"}],
};


var saveQqsCustomerConfigEdit = {
		custNameQqa:[{rule:notBlank,msg:"联系人名称 不能为空"},{rule:length,params:{min:0,max:20},msg:"联系人名称 长度不能大于20"}],
		custAddressQqa:[{rule:notBlank,msg:"联系人地址 不能为空"},{rule:length,params:{min:0,max:80},msg:"联系人地址 长度不能大于80"}],
		custPhoneQqa:[{rule:notBlank,msg:"联系人号码 不能为空"},{rule:regex,params:/^[1][34578][0-9]{9}$/,msg:"联系人号码 格式有误"}],
		lng:[{rule:notBlank,msg:"经度 不能为空"}],
		lat:[{rule:notBlank,msg:"纬度 不能为空"}],
	};