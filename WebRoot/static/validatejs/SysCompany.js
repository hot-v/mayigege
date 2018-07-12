var saveSysCompanyConfig = {
	name:[{rule:notBlank,msg:"公司名称 不能为空"},{rule:length,params:{min:0,max:50},msg:"公司名称 长度不在0-50范围"}],
	address:[{rule:notBlank,msg:"公司地址 不能为空"},{rule:length,params:{min:0,max:200},msg:"公司地址 长度不在0-200范围"}],
	logo:[{rule:notBlank,msg:"公司logo 不能为空"}],
	covers:[{rule:notBlank,msg:"网站封面 不能为空"}],
	peripherys:[{rule:notBlank,msg:"公司周边 不能为空"}],
	mobile:[{rule:notBlank,msg:"公司电话 不能为空"},{rule:length,params:{min:0,max:20},msg:"电话 长度不在0-20范围"}],
	email:[{rule:notBlank,msg:"公司邮箱 不能为空"},{rule:length,params:{min:0,max:50},msg:"邮箱 长度不在0-50范围"}],
	desc:[{rule:notBlank,msg:"公司描述 不能为空"},{rule:length,params:{min:0,max:65535},msg:"公司描述 长度不在0-65535范围"}]
};
