var saveSysConfigConfig = {
	desc:[{rule:notBlank,msg:"描述 不能为空"},{rule:length,params:{min:0,max:500},msg:"描述 长度不在0-500范围"}],
	keyname:[{rule:notBlank,msg:"变量名 不能为空"},{rule:length,params:{min:0,max:20},msg:"变量名 长度不在0-20范围"}],
	val:[{rule:notBlank,msg:"变量值 不能为空"},{rule:length,params:{min:0,max:20},msg:"变量值 长度不在0-20范围"}],
	category:[{rule:length,params:{min:0,max:50},msg:"分类 长度不在0-50范围"}],
	categoryDesc:[{rule:length,params:{min:0,max:100},msg:"分类描述 长度不在0-100范围"}],
	orderNo:[{rule:integer,msg:"排序 必须是数字"}]
};
