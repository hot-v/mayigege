var saveQqsInstallEquipmentConfig = {
	installOrderId:[{rule:integer,msg:"装机单ID 必须是数字"}],
	uniqueIdentifier:[{rule:length,params:{min:0,max:50},msg:"设备唯一标识码 长度不在0-50范围"}]
};
