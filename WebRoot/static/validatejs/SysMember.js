var saveSysMemberConfig = {
	username:[{rule:length,params:{min:0,max:20},msg:"用户名 长度不在0-20范围"}],
	sex:[{rule:length,params:{min:0,max:1},msg:"性别 长度不在0-1范围"}],
	face:[{rule:length,params:{min:0,max:50},msg:"头像 长度不在0-50范围"}],
	positionId:[{rule:length,params:{min:0,max:50},msg:"所属职务 长度不在0-50范围"}],
	level:[{rule:integer,msg:"等级 必须是数字"}],
	mobile:[{rule:length,params:{min:0,max:20},msg:"电话 长度不在0-20范围"}],
	email:[{rule:length,params:{min:0,max:50},msg:"邮箱 长度不在0-50范围"}],
	createTime:[{rule:length,params:{min:0,max:19},msg:"创建时间 长度不在0-19范围"}]
};
