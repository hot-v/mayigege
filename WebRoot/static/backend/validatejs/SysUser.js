var saveSysUserConfigAdd = {
	username:[{rule:notBlank,msg:"账号 不能为空"},{rule:regex,params:/^[1][345789][0-9]{9}$/,msg:"手机格式有误"},{rule:"userRule"}],
	password:[{rule:notBlank,msg:"密码 不能为空"},{rule:regex,params:/^[0-9a-zA-Z]{6,16}$/,msg:"密码由6-16位的数字和英文组成"}]
/*	fullname:[{rule:notBlank,msg:"姓名 不能为空"},{rule:length,params:{min:0,max:255},msg:"姓名 长度不在0-255范围"}],
	username:[{rule:notBlank,msg:"登录名 不能为空"},{rule:length,params:{min:0,max:255},msg:"登录名 长度不在0-255范围"},{rule:"userRule"}],
	email:[{rule:length,params:{min:0,max:255},msg:"邮箱 长度不在0-255范围"}],
	status:[{rule:integer,msg:"状态(0:已删除,1:启用,2:禁用) 必须是数字"}],
	isSuperadmin:[{rule:integer,msg:"类型(0:普通管理员,1:超级管理员) 必须是数字"}],
	remark:[{rule:length,params:{min:0,max:255},msg:"备注 长度不在0-255范围"}]*/
};
var saveSysUserConfigEdit = {
		password:[{rule:regex,params:/^[0-9a-zA-Z]{6,16}$/,msg:"密码由6-16位的数字和英文组成"}]
};
var saveSysUserPwd = {
	password:[{rule:notBlank,msg:"密码 不能为空"},{rule:regex,params:/^[0-9a-zA-Z]{6,16}$/,msg:"密码由6-16位的数字和英文组成"}]//,{rule:regex,params:"^[0-9a-zA-Z]{6,16}$",msg:"密码由6-16位的数字和英文组成"}
	/*oldPassword:[{rule:notBlank,msg:"原密码 不能为空"},{rule:regex,params:/^[0-9a-zA-Z]{6,16}$/,msg:"原密码由6-16位的数字和英文组成"}],
	confirmPassword:[{rule:notBlank,msg:"确认密码 不能为空"},{rule:regex,params:/^[0-9a-zA-Z]{6,16}$/,msg:"新密码由6-16位的数字和英文组成"},{rule:same,params:{ref:'password'},msg:"新密码与确认密码不一致"}]*/
};