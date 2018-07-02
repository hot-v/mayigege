var saveQqsEquipmentConfig = {
	contractId:[{rule:notBlank,msg:"合同ID 不能为空"},{rule:integer,msg:"合同ID 必须是数字"}],
	lineNo:[{rule:notBlank,msg:"序号 不能为空"},{rule:integer,msg:"序号 必须是数字"}],
	classId:[{rule:integer,msg:"类型ID 必须是数字"}],
	assetCardId:[{rule:integer,msg:"卡片ID 必须是数字"}],
	className:[{rule:length,params:{min:0,max:100},msg:"类型名称 长度不在0-100范围"}],
	keyDefence:[{rule:length,params:{min:0,max:200},msg:"地址码/序列号 长度不在0-200范围"}],
	position:[{rule:length,params:{min:0,max:200},msg:"安装位置 长度不在0-200范围"}],
	orgId:[{rule:integer,msg:"机构ID 必须是数字"}],
	isinstall:[{rule:length,params:{min:0,max:1},msg:"安装状态:0.已安装,1未安装 长度不在0-1范围"}],
	installTime:[{rule:date,msg:"安装时间 必须是日期"}],
	installUserId:[{rule:integer,msg:"安装人 必须是数字"}],
	brandId:[{rule:length,params:{min:0,max:100},msg:"品牌ID 长度不在0-100范围"}],
	modelId:[{rule:integer,msg:"设备类型ID 必须是数字"}]
};
