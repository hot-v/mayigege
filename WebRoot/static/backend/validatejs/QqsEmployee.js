var saveQqsEmployeeConfig = {
	empNo:[{rule:integer,msg:"员工编号 必须是数字"}],
	name:[{rule:length,params:{min:0,max:50},msg:"员工姓名 长度不在0-50范围"}],
	deptId:[{rule:integer,msg:"部门ID 必须是数字"}],
	deptName:[{rule:length,params:{min:0,max:100},msg:"部门名称 长度不在0-100范围"}],
	orgName:[{rule:length,params:{min:0,max:100},msg:"机构名称 长度不在0-100范围"}],
	positionId:[{rule:integer,msg:"职位ID 必须是数字"}],
	positionName:[{rule:length,params:{min:0,max:100},msg:"职位名称 长度不在0-100范围"}],
	userId:[{rule:integer,msg:"用户编号 必须是数字"}],
	orgId:[{rule:integer,msg:"机构ID 必须是数字"}]
};
