var saveSysUserConfig = {
	fullname:[{rule:notBlank,msg:"用户名称 不能为空"},{rule:length,params:{min:0,max:20},msg:"用户名称 长度不在0-20范围"}],
	username:[{rule:notBlank,msg:"登录账号 不能为空"},{rule:length,params:{min:0,max:20},msg:"登录账号 长度不在0-20范围"}],
	password:[{rule:notBlank,msg:"登录密码 不能为空"},{rule:length,params:{min:0,max:20},msg:"登录密码 长度不在0-20范围"}],
	isSuperadmin:[{rule:notBlank,msg:"用户类型 不能为空"}],
	remark:[{rule:length,params:{min:0,max:255},msg:"备注 长度不在0-255范围"}],
	isDisabled:[{rule:notBlank,msg:"用户状态 不能为空"},]
};
