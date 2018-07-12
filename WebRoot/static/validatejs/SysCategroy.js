var saveSysCategroyConfig = {
	icon:[{rule:notBlank,msg:"Icon 不能为空"}],
	covers:[{rule:notBlank,msg:"项目图片 不能为空"}],
	serviceName:[{rule:notBlank,msg:"服务名称 不能为空"},{rule:length,params:{min:0,max:50},msg:"服务名称 长度不在0-50范围"}],
	serviceDesc:[{rule:length,params:{min:0,max:500},msg:"服务描述 长度不在0-500范围"}]
};
