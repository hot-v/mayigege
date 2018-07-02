var saveQqsEventConfig = {
	eventCode:[{rule:length,params:{min:0,max:10},msg:"事件代码 长度不在0-10范围"}],
	eventTpye:[{rule:length,params:{min:0,max:0},msg:"事件类型 长度不在0-0范围"}],
	level:[{rule:length,params:{min:0,max:0},msg:"级别 长度不在0-0范围"}],
	define:[{rule:length,params:{min:0,max:200},msg:"定义 长度不在0-200范围"}],
	dataType:[{rule:length,params:{min:0,max:50},msg:"数据类型 长度不在0-50范围"}],
	wornOperation:[{rule:length,params:{min:0,max:50},msg:"警情/操作 长度不在0-50范围"}],
	eventComments:[{rule:length,params:{min:0,max:500},msg:"事件代码说明 长度不在0-500范围"}],
	remark:[{rule:length,params:{min:0,max:500},msg:"备注 长度不在0-500范围"}]
};
