package com.yijiwenhua.backend.controller;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yijiwenhua.mayigege.core.AppContextHolder;
import com.yijiwenhua.mayigege.core.Constant;
import com.yijiwenhua.mayigege.core.ResponseData;
import com.yijiwenhua.mayigege.utils.DateUtils;
import com.yijiwenhua.mayigege.utils.DateUtils.DateStyle;

/**
 * 用于文件上传controller
 * 
 * @author cuixiang
 * @since 2017-04-19
 */
@Controller
@RequestMapping("/uploadFile")
public class FileUploadController extends BaseController {

	/**
	 * 图片上传
	 * 
	 * @Desc
	 * @author cuixiang
	 * @date 2017-4-19
	 */
	@RequestMapping(value = "/uploadImg.json", method = RequestMethod.POST)
	@ResponseBody
	public ResponseData uploadImg(HttpServletRequest request, @RequestParam("imgFile") MultipartFile imgFile) {
		// 获取当前登陆用户
		/*SysUser user = AppContextHolder.getCurrentUser();
		if (user == null) {
			return new ResponseData(false, "用户未登录");
		}*/
		try {
			String folder = request.getParameter("folder");
			if(null == folder||"".equals(folder)){
				folder = "uploadFile";
			}
			// 获取上传文件
			//MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			//MultipartFile imgFile = multipartRequest.getFile("file");
			if (null == imgFile) {
				return new ResponseData(false,"请选择上传文件");
			}
			if (imgFile.getSize() > Constant.SysFile.FILE_MAX_SIZE) {
				return new ResponseData(false, "图片超过限制大小（5MB）");
			}
			// 文件全名
			String originalFilename = imgFile.getOriginalFilename();
			// 文件后缀
			String ext = originalFilename.substring(originalFilename.indexOf(".")+1);
			// 获取不重复文件名
			String fileName = DateUtils.formatDatetime(new Date(), DateStyle.YYYYMMDDHHMMSS) + "." + ext.toLowerCase();
			// 获取文件保存路径
			//String filePath = AppContextHolder.getFileSavePath() + folder +"/"+ fileName;
			String filePath = "E:/data/files/mayigege" +"/"+ fileName;
			File newFile = new File(filePath);
			if (!newFile.getParentFile().exists()){
				newFile.getParentFile().mkdirs();
			}
			byte[] fileByte = imgFile.getBytes();
			FileUtils.writeByteArrayToFile(new File(filePath), fileByte);

			Map<String, String> map = new HashMap<String, String>();
			map.put("fileName", originalFilename);
			map.put("src", folder +"/"+ fileName);
			map.put("filePath", filePath);
			return new ResponseData(true, map);
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseData.FAILED_NO_DATA;
		}
	}

}
