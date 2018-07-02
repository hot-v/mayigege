var saveQqsWarningConfig = {
	eventCode:[{rule:length,params:{min:0,max:10},msg:"事件代码 长度不在0-10范围"}],
	equipmentCode:[{rule:length,params:{min:0,max:50},msg:"设备编码 长度不在0-50范围"}],
	supplier:[{rule:length,params:{min:0,max:10},msg:"供应商 长度不在0-10范围"}],
	eventStatus:[{rule:length,params:{min:0,max:0},msg:"报警状态(0:报警;1恢复) 长度不在0-0范围"}],
	createTime:[{rule:date,msg:"创建时间 必须是日期"}],
	remark:[{rule:length,params:{min:0,max:500},msg:"备注 长度不在0-500范围"}]
};
