var saveSysActivityConfig = {
	caseName:[{rule:notBlank,msg:"活动名称 不能为空"},{rule:length,params:{min:0,max:50},msg:"活动名称 长度不在0-50范围"}],
	/*programmeId:[{rule:notBlank,msg:"Icon 不能为空"},{rule:integer,msg:"所属策划方案 必须是数字"}],*/
	activityPrice:[{rule:notBlank,msg:"活动价格 不能为空"},{rule:integer,msg:"活动价格 必须是数字"}],
	customerCompany:[{rule:notBlank,msg:"举办单位 不能为空"},{rule:length,params:{min:0,max:200},msg:"举办单位 长度不在0-200范围"}],
	categroyId:[{rule:notBlank,msg:"活动分类 不能为空"},{rule:integer,msg:"活动分类 必须是数字"}],
	startTime:[{rule:notBlank,msg:"开始时间 不能为空"},{rule:length,params:{min:0,max:19},msg:"开始时间 长度不在0-19范围"}],
	endTime:[{rule:notBlank,msg:"结束时间 不能为空"},{rule:length,params:{min:0,max:19},msg:"结束时间 长度不在0-19范围"}],
	teamName:[{rule:length,params:{min:0,max:50},msg:"团队名称 长度不在0-50范围"}],//{rule:notBlank,msg:"团队名称 不能为空"},
	teamSlogan:[{rule:length,params:{min:0,max:200},msg:"团队口号 长度不在0-200范围"}],
	activityAddress:[{rule:notBlank,msg:"活动地点 不能为空"},{rule:length,params:{min:0,max:200},msg:"活动地点 长度不在0-200范围"}],
	organizationNum:[{rule:notBlank,msg:"组织人数 不能为空"},{rule:integer,msg:"组织人数 必须是数字"}],
	covers:[{rule:notBlank,msg:"活动图片 不能为空"}],
	activityDesc:[{rule:length,params:{min:0,max:500},msg:"活动描述 长度不在0-500范围"}]
};
