var saveQqsAppVersionManagerConfig = {
	appType:[{rule:notBlank,msg:"请选择程序类型"}],
	appChildType:[{rule:notBlank,msg:"请选择子程序"}],
	version:[{rule:notBlank,msg:"版本号 不能为空"},{rule:regex,params:/\d+(\.\d+){0,2}/,msg:"版本号格式不正确，请输入如:1.1或1.1.1格式的版本号"},{rule:length,params:{min:0,max:20},msg:"版本号 长度不在0-20范围"}],
	mainActivity:[{rule:notBlank,msg:"请输入主窗体"}],
	description:[{rule:notRegex,params:/[`~!@#$%^&*()_+<>?:"{}\/'[\]]/,msg:"描述不能出现`~!@#$%^&*()_+<>?:\"{}\/'[\]等特殊符号"},{rule:length,params:{min:0,max:65535},msg:"升级描述 长度不在0-65535范围"}],
	sourcePath:[{rule:length,params:{min:0,max:200},msg:"source_path 长度不在0-200范围"}],
	isNotifyEveryone:[{rule:integer,msg:"是否通知所有人(0:不通知;1:通知) 必须是数字"}],
	createTime:[{rule:date,msg:"创建时间 必须是日期"}],
	createUser:[{rule:integer,msg:"create_user 必须是数字"}]
};
