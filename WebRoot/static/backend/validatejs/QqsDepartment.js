var saveQqsDepartmentConfig = {
	name:[{rule:notBlank,msg:"部门名称 不能为空"},{rule:length,params:{min:0,max:50},msg:"部门名称 长度不在1-50范围"}],
	header:[{rule:length,params:{min:0,max:50},msg:"部门负责人 长度不在1-50范围"}],
	contactPhone:[{rule:length,params:{min:0,max:50},msg:"联系电话 长度不在1-50范围"}],
	address:[{rule:length,params:{min:0,max:100},msg:"地址 长度不在1-100范围"}]
};
