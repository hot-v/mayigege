var saveQqsWarningDealConfig = {
	acceptPerson:[{rule:length,params:{min:0,max:20},msg:"接受人 长度不在0-20范围"}],
	acceptTime:[{rule:date,msg:"接受时间 必须是日期"}],
	dealStatus:[{rule:length,params:{min:0,max:1},msg:"处理状态(0已处理,1已处理) 长度不在0-1范围"}],
	dealPerson:[{rule:length,params:{min:0,max:50},msg:"处理人 长度不在0-50范围"}],
	dealSuggestion:[{rule:length,params:{min:0,max:4000},msg:"处理意见 长度不在0-4000范围"}],
	dealTime:[{rule:date,msg:"处理时间 必须是日期"}],
	policeStatus:[{rule:length,params:{min:0,max:1},msg:"真警状态(0.真警,1误报) 长度不在0-1范围"}],
	policeReason:[{rule:length,params:{min:0,max:4000},msg:"police_reason 长度不在0-4000范围"}],
	policeTime:[{rule:date,msg:"出警时间 必须是日期"}],
	policePerson:[{rule:length,params:{min:0,max:50},msg:"出警人 长度不在0-50范围"}]
};
