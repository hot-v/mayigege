var saveQqsOrgConfig = {
	orgName:[{rule:notBlank,msg:"类型名称不能为空"},{rule:length,params:{min:1,max:30},msg:"机构名称 长度不在1-30范围"},{rule:"orgRule"}],
	parent_name:[{rule:notBlank,msg:"请选择所属上级机构"}],
	fullName:[{rule:length,params:{min:0,max:30},msg:"机构全称 长度不在0-30范围"}],
	nickName:[{rule:length,params:{min:0,max:20},msg:"机构简称 长度不在0-20范围"}],
	address:[{rule:length,params:{min:0,max:200},msg:"地址 长度不在0-1范围"}],
	serviceTel:[{rule:length,params:{min:0,max:60},msg:"服务电话 长度不在0-20范围"}]
};

var updateQqsOrgConfig = {
	orgName:[{rule:notBlank,msg:"类型名称不能为空"},{rule:length,params:{min:1,max:30},msg:"机构名称 长度不在1-30范围"},{rule:"orgRule"}],
	fullName:[{rule:length,params:{min:0,max:30},msg:"机构全称 长度不在0-30范围"}],
	nickName:[{rule:length,params:{min:0,max:20},msg:"机构简称 长度不在0-20范围"}],
	address:[{rule:length,params:{min:0,max:200},msg:"地址 长度不在0-1范围"}],
	serviceTel:[{rule:length,params:{min:0,max:60},msg:"服务电话 长度不在0-20范围"}]
};

var setPositionQqsOrgConfig = {
	/*orgName:[{rule:length,params:{min:0,max:60},msg:"机构名称 长度不在0-60范围"}],
	parent:[{rule:integer,msg:"上级机构ID 必须是数字"}],
	classCode:[{rule:length,params:{min:0,max:24},msg:"类别代码 长度不在0-24范围"}],
	classLevel:[{rule:integer,msg:"类别级别 必须是数字"}],
	terminated:[{rule:integer,msg:"末端标志 必须是数字"}],
	fullName:[{rule:length,params:{min:0,max:60},msg:"机构全称 长度不在0-60范围"}],
	disabled:[{rule:integer,msg:"是否禁用 必须是数字"}],
	orgCode:[{rule:length,params:{min:0,max:20},msg:"机构编号 长度不在0-20范围"}],
	nickName:[{rule:length,params:{min:0,max:20},msg:"机构简称 长度不在0-20范围"}],
	type:[{rule:integer,msg:"机构类型:1:总机构,2:子机构3,区域 必须是数字"}],
	address:[{rule:length,params:{min:0,max:200},msg:"地址 长度不在0-200范围"}],
	serviceTel:[{rule:length,params:{min:0,max:60},msg:"服务电话 长度不在0-60范围"}],*/
	id:[{rule:notBlank,msg:"机构ID 不能为空"},{rule:integer,msg:"机构ID 必须是数字"}]
};
