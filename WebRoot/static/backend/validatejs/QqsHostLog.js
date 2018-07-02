var saveQqsHostLogConfig = {
	id:[{rule:integer,msg:"id 必须是数字"}],
	orgId:[{rule:integer,msg:"公司id 必须是数字"}],
	uniqueIdentifier:[{rule:length,params:{min:0,max:50},msg:"设备唯一标识码 长度不在0-50范围"}],
	isOnline:[{rule:length,params:{min:0,max:0},msg:"是否在线(0:在线;1断开) 长度不在0-0范围"}],
	currentStatus:[{rule:length,params:{min:0,max:0},msg:"当前状态(1:布防;2:撤防;3:留守;4:旁路;5:暂无) 长度不在0-0范围"}],
	otherStatus:[{rule:length,params:{min:0,max:300},msg:"主机其他状态(用;分开) 长度不在0-300范围"}],
	hostStyle:[{rule:length,params:{min:0,max:0},msg:"主机模式(0:正常模式;1:测试模式) 长度不在0-0范围"}],
	hostTime:[{rule:date,msg:"当前主机时间 必须是日期"}],
	createTime:[{rule:date,msg:"创建时间 必须是日期"}]
};
