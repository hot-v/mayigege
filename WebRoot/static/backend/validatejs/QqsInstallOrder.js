var saveQqsInstallOrderConfig = {
	installSn:[{rule:length,params:{min:0,max:50},msg:"安装编号 长度不在0-50范围"}],
	contractId:[{rule:integer,msg:"合同ID 必须是数字"}],
	custId:[{rule:integer,msg:"客户代号 必须是数字"}],
	custUserName:[{rule:length,params:{min:0,max:60},msg:"客户名称 长度不在0-60范围"}],
	contactPerson:[{rule:length,params:{min:0,max:20},msg:"联系人 长度不在0-20范围"}],
	contactPhone:[{rule:length,params:{min:0,max:40},msg:"联系人电话 长度不在0-40范围"}],
	installAddress:[{rule:length,params:{min:0,max:255},msg:"安装地址 长度不在0-255范围"}],
	installUserId:[{rule:integer,msg:"安装人ID 必须是数字"}],
	installUserPhone:[{rule:length,params:{min:0,max:50},msg:"安装人联系电话 长度不在0-50范围"}],
	installTime:[{rule:date,msg:"安装时间 必须是日期"}],
	intallCompleteTime:[{rule:date,msg:"安装完成时间 必须是日期"}],
	installStatus:[{rule:integer,msg:"装机状态(0:待安装,1:已安装) 必须是数字"}],
	deleted:[{rule:integer,msg:"删除状态(0.未删除;1.已删除) 必须是数字"}]
};
