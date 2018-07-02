var saveQqsThirdPlatformConfig = {
	address:[{rule:notBlank,msg:"地址 不能为空"},{rule:length,params:{min:0,max:200},msg:"地址 长度不在0-200范围"}],
	contactsPerson:[{rule:notBlank,msg:"平台联系人 不能为空"},{rule:length,params:{min:0,max:50},msg:"平台联系人 长度不在0-50范围"}],
	contactsPhone:[{rule:notBlank,msg:"平台联系电话 不能为空"},{rule:regex,params:/^((0\d{2,3}-\d{7,8})|([1][34578][0-9]{9}))$/,msg:"平台联系电话 格式有误"}],
	installPerson:[{rule:notBlank,msg:"安装联系人 不能为空"},{rule:length,params:{min:0,max:50},msg:"安装联系人 长度不在0-50范围"}],
	installPhone:[{rule:notBlank,msg:"安装联系电话  不能为空"},{rule:regex,params:/^((0\d{2,3}-\d{7,8})|([1][34578][0-9]{9}))$/,msg:"安装联系电话 格式有误"}],
};
