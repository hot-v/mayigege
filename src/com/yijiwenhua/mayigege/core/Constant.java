package com.yijiwenhua.mayigege.core;

public class Constant {
	public static interface SysUser {
		/**默认密码*/
		String DEFAULT_PASSWORD = "111111";
	}
	
	public static interface SysFile {
		/**文件上传最大值*/
		Long FILE_MAX_SIZE = 5242880L;
		
		/**文件引用对象*/
		public static interface RefObj {
			public static interface Keys {
				/**公司对象*/
				String SYS_COMPANY = "SYS_COMPANY";
				/**公司对象*/
				String SYS_CATEGROY = "SYS_CATEGROY";
			}
			public static interface Desc {
				/**公司对象描述*/
				String SYS_COMPANY_DESC = "网站封面";
				/**公司对象描述*/
				String SYS_CATEGROY_DESC = "服务项目";
			}
		}
	}
}
