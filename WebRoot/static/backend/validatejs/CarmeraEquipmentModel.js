var saveCarmeraEquipmentModelConfig = {
	//name:[{rule:length,params:{min:0,max:50},msg:"类型名称 长度不在0-50范围"}],
	//equipmentModelId:[{rule:length,params:{min:0,max:100},msg:"设备类型ID 长度不在0-100范围"}],
	//brandId:[{rule:length,params:{min:0,max:100},msg:"品牌ID 长度不在0-100范围"}]
	name:[{rule:notBlank,msg:"设备型号 不能为空"},{rule:length,params:{min:1,max:50},msg:"设备型号 长度不在1-50范围"},{rule:"modelRule"}]

};
