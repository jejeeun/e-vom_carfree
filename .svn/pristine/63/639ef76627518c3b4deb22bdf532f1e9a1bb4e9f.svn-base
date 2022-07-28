package kr.co.ejsoft.cims.common.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;

import org.apache.commons.io.FilenameUtils;

public class LogUtil {
	
//	로그 파일 작성
	public static void logWrite(Properties properties, String log) throws Exception {
		String logPath = properties.getProperty("Globals.LogPath");
		File logFolder = new File(logPath);
		if(!logFolder.exists()) {
			try { logFolder.mkdir(); } catch(Exception e) { e.printStackTrace(); }
		}
		
//		처음 파일 생성 시 소유자 - root:root
		File logFile = new File(logPath + "/" + GlobalDeclaration.DATE_FORMAT_YYYYMMDD.format(new Date()) + "Log.txt");
		
//		처음 파일 생성 시에 소유자 변경
		String owner = properties.getProperty("Globals.OwnerGroup");
		if(!logFile.exists() && (owner != null && !owner.equals(""))) {
			Runtime.getRuntime().exec("chown " + owner + " " + logPath + "/" + logFile.getName());
		}
		
		BufferedWriter bw = new BufferedWriter(new FileWriter(logFile, true));
		
		try {
			bw.write(GlobalDeclaration.TIME_FORMAT_HH_MM_SS.format(new Date()) + " >>> " + log);
			bw.newLine();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			bw.close();
		}
	}
	
//	로그 파일 삭제
	public static void logDelete(Properties properties) {
		File logFolder = new File(properties.getProperty("Globals.LogPath"));
		if(!logFolder.exists()) {
			try { logFolder.mkdir(); } catch(Exception e) { e.printStackTrace(); }
		}
		
//		이전 로그 파일 삭제
		String deleteTermStr = properties.getProperty("Global.LogFileDeleteTerm");
		int deleteTerm = 30;
		try { deleteTerm = Integer.parseInt(deleteTermStr); } catch(Exception e) { }
		
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1 * deleteTerm);
		long deleteDate = cal.getTime().getTime();
		
		File[] logFileList = logFolder.listFiles();
		for(File logFile : logFileList) {
//			마지막 수정일자가 로그 파일 삭제 기준 날짜보다 이전이면 삭제
			if(FilenameUtils.getExtension(logFile.getName()).equals("txt") && logFile.lastModified() < deleteDate) {
				logFile.delete();
			}
		}
		
	}
	
}
