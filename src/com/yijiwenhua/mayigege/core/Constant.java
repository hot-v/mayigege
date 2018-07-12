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
				/**活动对象*/
				String SYS_ACTIVITY = "SYS_ACTIVITY";
				/**公司周边*/
				String SYS_PERIPHERY = "SYS_PERIPHERY";
			}
			public static interface Desc {
				/**公司对象描述*/
				String SYS_COMPANY_DESC = "网站封面";
				/**公司对象描述*/
				String SYS_CATEGROY_DESC = "服务项目";
				/**活动对象描述*/
				String SYS_ACTIVITY_DESC = "活动项目";
				/**公司周边*/
				String SYS_PERIPHERY_DESC = "公司周边图片";
			}
		}
	}
	

	public static interface SysConfig {
		/**活动案例*/
		String DESIGN_CASE = "design_case";
		/**活动案例*/
		String OUR_TEAM = "our_team";
		/**活动案例*/
		String SERVICE_ITEMS = "service_Items";
		/**活动案例*/
		String CONTACT_US = "contact_us";

		public static interface Categroy {
			/**网站前台*/
			String CATEGROY_WEBSITE = "webSite";
			
			/**平台职务管理*/
			String BACKEND_POSITION = "backend_position";
		}
	}
}
