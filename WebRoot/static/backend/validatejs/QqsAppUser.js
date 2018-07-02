var saveQqsAppUserConfig = {
	name:[{rule:length,params:{min:0,max:20},msg:"客户名称 长度不在0-20范围"}],
	phone:[{rule:notBlank,msg:"客户手机号(作为用户账号) 不能为空"},{rule:length,params:{min:0,max:20},msg:"客户手机号(作为用户账号) 长度不在0-20范围"}],
	pwd:[{rule:length,params:{min:0,max:50},msg:"客户密码 长度不在0-50范围"}],
	bindState:[{rule:integer,msg:"绑定状态(0:未绑定,1:已绑定) 必须是数字"}],
	bindTime:[{rule:date,msg:"绑定合同时间 必须是日期"}],
	registerTime:[{rule:date,msg:"注册时间 必须是日期"}],
	deleted:[{rule:integer,msg:"删除状态(0.未删除;1.已删除) 必须是数字"}]
};

//app用户绑定客户验证
var qqsAppUserBindCustConfig = {
	id:[{rule:notBlank,msg:"APP用户ID 不能为空"},{rule:integer,msg:"APP用户ID 必须是数字"}]
};