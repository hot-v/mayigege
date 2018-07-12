var saveSysUserConfig = {
	fullname:[{rule:length,params:{min:0,max:255},msg:"姓名 长度不在0-255范围"}],
	username:[{rule:notBlank,msg:"账号 不能为空"},{rule:length,params:{min:0,max:255},msg:"账号 长度不在0-255范围"}],
	password:[{rule:notBlank,msg:"密码(MD5加密后) 不能为空"},{rule:length,params:{min:0,max:255},msg:"密码(MD5加密后) 长度不在0-255范围"}],
	createTime:[{rule:length,params:{min:0,max:19},msg:"创建时间 长度不在0-19范围"}],
	isSuperadmin:[{rule:length,params:{min:0,max:0},msg:"类型(0:普通管理员,1:超级管理员) 长度不在0-0范围"}],
	remark:[{rule:length,params:{min:0,max:255},msg:"备注 长度不在0-255范围"}],
	isDisabled:[{rule:length,params:{min:0,max:0},msg:"启用禁用(0:启用,1:禁用) 长度不在0-0范围"}]
};
