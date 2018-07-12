var saveSysContactConfig = {
	username:[{rule:length,params:{min:0,max:50},msg:"咨询人 长度不在0-50范围"}],
	mobile:[{rule:length,params:{min:0,max:20},msg:"咨询人-联系方式 长度不在0-20范围"}],
	email:[{rule:length,params:{min:0,max:50},msg:"咨询人-邮箱 长度不在0-50范围"}],
	title:[{rule:length,params:{min:0,max:200},msg:"咨询标题 长度不在0-200范围"}],
	content:[{rule:length,params:{min:0,max:65535},msg:"咨询内容 长度不在0-65535范围"}],
	isProcessed:[{rule:length,params:{min:0,max:1},msg:"是否处理(0:否、1:是) 长度不在0-1范围"}],
	createTime:[{rule:length,params:{min:0,max:19},msg:"咨询时间 长度不在0-19范围"}],
	procResult:[{rule:length,params:{min:0,max:65535},msg:"处理结果 长度不在0-65535范围"}],
	procUserId:[{rule:integer,msg:"处理人 必须是数字"}],
	procTime:[{rule:length,params:{min:0,max:19},msg:"处理时间 长度不在0-19范围"}]
};
