package kr.co.ejsoft.cims.common.util;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileUtils {
	public static String uploadFile(String uploadPath, MultipartFile file, String savedName) throws Exception {
		String savedPath = calcPath(uploadPath);
		File target = new File(uploadPath + savedPath, savedName);
		FileCopyUtils.copy(file.getBytes(), target);
		return savedPath + File.separator + savedName;
	}
	
	public static String uploadFileInfo(String uploadPath, MultipartFile file) throws Exception {
		String savedName = file.getOriginalFilename();
		String savedPath = calcPath(uploadPath);
		
		File target = new File(uploadPath + savedPath, savedName);
		FileCopyUtils.copy(file.getBytes(), target);
		
		return uploadPath + savedPath;
	}
	
	public static boolean deleteFile(String uploadPath) {
		return new File(uploadPath.replace('/', File.separatorChar)).delete();
	}
	
	public static boolean deleteFileInfo(String uploadPath) {
		return new File(uploadPath.replace('/', File.separatorChar)).delete();
	}

	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		makeDir(uploadPath, yearPath, monthPath);
		return monthPath;
	}

	private static void makeDir(String uploadPath, String... paths) {
		if (new File(paths[paths.length - 1]).exists()) {
			return;
		}
		for (String path : paths) {
			File dirPath = new File(uploadPath + path);
			if (!dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}
}
