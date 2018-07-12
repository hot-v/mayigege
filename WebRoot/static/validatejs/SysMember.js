var saveSysMemberConfig = {
	username:[{rule:notBlank,msg:"成员名称 不能为空"},{rule:length,params:{min:0,max:20},msg:"成员名称 长度不在0-20范围"}],
	sex:[{rule:notBlank,msg:"性别 不能为空"},{rule:length,params:{min:0,max:1},msg:"性别 长度不在0-1范围"}],
	face:[{rule:notBlank,msg:"成员头像 不能为空"}],
	positionId:[{rule:notBlank,msg:"所属职务 不能为空"}],
	level:[{rule:integer,msg:"等级 必须是数字"}],
	mobile:[{rule:notBlank,msg:"联系电话 不能为空"},{rule:length,params:{min:0,max:20},msg:"电话 长度不在0-20范围"}],
	email:[{rule:length,params:{min:0,max:50},msg:"邮箱 长度不在0-50范围"}]
};
