var saveQqsEquipmentModelConfig = {
	name:[{rule:length,params:{min:0,max:50},msg:"类型名称 长度不在0-50范围"}],
	brandId:[{rule:length,params:{min:0,max:100},msg:"设备厂商 长度不在0-100范围"}],
	equipmentModelId:[{rule:length,params:{min:0,max:100},msg:"设备类型(bjzj:报警主机,sxt:摄像头) 长度不在0-100范围"}],
	eventGroupId:[{rule:integer,msg:"事件代码组 必须是数字"}],
	controlFun:[{rule:length,params:{min:0,max:100},msg:"控制功能(多个以,分割) 长度不在0-100范围"}],
	deleted:[{rule:length,params:{min:0,max:0},msg:"是否删除(0:未删除,1:已删除) 长度不在0-0范围"}]
};


/**保存设备类型-预警主机信息*/
var saveEquipmentMainConfig = {
	name:[{rule:notBlank,msg:"类型名称不能为空"},{rule:length,params:{min:1,max:20},msg:"类型名称 长度不在1-20范围"},{rule:"modelRule"}],
	brandId:[{rule:notBlank,msg:"请选择设备厂商"}],
	serverAddress:[{rule:length,params:{min:0,max:20},msg:"服务器地址 长度不在0-20范围"}],
	port:[{rule:length,params:{min:0,max:6},msg:"端口 长度不在0-6范围"}],
	areaNum:[{rule:integer,params:{min:0,max:50},msg:"防区数量 必须是数字"},{rule:regex,params:/^[1-9][0-9]{0,2}/,msg:"输入1-999之间的数字"}]
};
