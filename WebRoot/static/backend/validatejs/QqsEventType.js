var saveQqsEventTypeConfig = {
	category:[{rule:length,params:{min:0,max:50},msg:"事件类别 长度不在0-50范围"}],
	pid:[{rule:notBlank,msg:"父类别ID 不能为空"},{rule:integer,msg:"父类别ID 必须是数字"}]
};
