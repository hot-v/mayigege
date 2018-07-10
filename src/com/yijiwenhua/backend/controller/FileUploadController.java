package com.yijiwenhua.backend.controller;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.likegene.framework.core.QueryFilter;
import com.likegene.framework.util.SettingUtil;
import com.yijiwenhua.backend.service.SysFileService;
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
	
	@Autowired
	private SysFileService sysFileService;

	/**
	 * 图片上传
	 * 
	 * @Desc
	 * @author lvliang
	 * @date 2017-4-19
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/uploadImg.json", method = RequestMethod.POST)
	@ResponseBody
	public ResponseData uploadImg(HttpServletRequest request, @RequestParam("imgFile") MultipartFile imgFile) {
		try {
			String folder = request.getParameter("folder");
			if(null == folder||"".equals(folder)){
				folder = "uploadFile";
			}
			// 获取上传文件
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
			String filePath = request.getRealPath("/")+SettingUtil.getSetting("uploadfilesavepath", String.class) + fileName;
			File newFile = new File(filePath);
			if (!newFile.getParentFile().exists()){
				newFile.getParentFile().mkdirs();
			}
			byte[] fileByte = imgFile.getBytes();
			FileUtils.writeByteArrayToFile(new File(filePath), fileByte);

			Map<String, String> map = new HashMap<String, String>();
			map.put("fileName", originalFilename);
			map.put("ext", ext);
			map.put("src", SettingUtil.getSetting("files.contextpath", String.class) + fileName);
			map.put("filePath", filePath);
			return new ResponseData(true, map);
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseData.FAILED_NO_DATA;
		}
	}
	
	
	/**
	 * 删除图片操作
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/deleteImg.json")
	@ResponseBody
	public ResponseData deleteImg(ModelMap model, HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("imgPath") String imgPath,
			@RequestParam("id") String id) {
		try {
			if (null == imgPath || "".equals(imgPath)) {
				return ResponseData.FAILED_NO_DATA;
			}
			File f = new File(request.getRealPath("/") + imgPath);
			if (f.exists()) {
				f.delete();
			}
			if(!StringUtils.isBlank(id)){
				QueryFilter filter = new QueryFilter();
				filter.setStatementKey(SysFileService.DELETE_BY_REFID);
				filter.put("refId", id);
				filter.put("path", imgPath);
				sysFileService.delete(filter);
			}
			return ResponseData.SUCCESS_NO_DATA;
		} catch (Exception e) {
		}
		return ResponseData.SUCCESS_NO_DATA;
	}

}
