package kr.co.ejsoft.cims.common.util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Properties;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

public class FTPUtil {
	private Session session = null;
	private Channel channel = null;
	private ChannelSftp sftp = null;
	private ChannelExec exec = null;
	
	public ChannelSftp initLink(Properties properties) {
		try {
			JSch jsch = new JSch();
			
			String user = properties.getProperty("Globals.LinkUserName");
			String url = properties.getProperty("Globals.LinkHost");
			int port = Integer.parseInt(properties.getProperty("Globals.LinkPort"));
			String password = properties.getProperty("Globals.LinkPassword");
			
			session = jsch.getSession(user, url, port);
			session.setPassword(password);
			
			Properties config = new Properties();
			config.put("StrictHostKeyChecking", "no");
			session.setConfig(config);
			
			session.connect();
			
			channel = session.openChannel("sftp");
			channel.connect();
			
			sftp = (ChannelSftp) channel;
			
			return sftp;
		} catch(Exception e) {
			e.printStackTrace();
			
			if(sftp != null) { sftp.quit(); }
			if(channel != null) { channel.disconnect(); }
			if(session != null) { session.disconnect(); }

			return null;
		}
	}
	
	public ChannelSftp initDB(Properties properties) {
		try {
			JSch jsch = new JSch();
			
			String user = properties.getProperty("Globals.DBUserName");
			String url = properties.getProperty("Globals.DBHost");
			int port = Integer.parseInt(properties.getProperty("Globals.DBPort"));
			String password = properties.getProperty("Globals.DBPassword");
			
			session = jsch.getSession(user, url, port);
			session.setPassword(password);
			
			Properties config = new Properties();
			config.put("StrictHostKeyChecking", "no");
			session.setConfig(config);
			
			session.connect();
			
			channel = session.openChannel("sftp");
			channel.connect();
			
			sftp = (ChannelSftp) channel;
			
			return sftp;
		} catch(Exception e) {
			e.printStackTrace();
			
			if(sftp != null) { sftp.quit(); }
			if(channel != null) { channel.disconnect(); }
			if(session != null) { session.disconnect(); }
			
			return null;
		}
	}

	public String initLinkExec(Properties properties, String command) {
		try {
			JSch jsch = new JSch();
			
			String user = properties.getProperty("Globals.LinkUserName");
			String url = properties.getProperty("Globals.LinkHost");
			int port = Integer.parseInt(properties.getProperty("Globals.LinkPort"));
			String password = properties.getProperty("Globals.LinkPassword");
			
			session = jsch.getSession(user, url, port);
			session.setPassword(password);
			
			Properties config = new Properties();
			config.put("StrictHostKeyChecking", "no");
			session.setConfig(config);
			
			session.connect();
			
			channel = session.openChannel("exec");
			exec = (ChannelExec) channel;
			
			InputStream in = exec.getInputStream();
			
			exec.setCommand(command);
			exec.connect();
			
			BufferedReader reader = new BufferedReader(new InputStreamReader(in));
			StringBuffer sb = new StringBuffer();
			String line;
			
			while((line = reader.readLine()) != null && !line.split("")[0].equals("-")) {
				sb.append(line);
			}
			
			exec.disconnect();
			session.disconnect();
			
			return sb.toString();
		} catch(Exception e) {
			return null;
		}
	}
	
	public String initDBExec(Properties properties, String command) {
		try {
			JSch jsch = new JSch();
			
			String user = properties.getProperty("Globals.DBUserName");
			String url = properties.getProperty("Globals.DBHost");
			int port = Integer.parseInt(properties.getProperty("Globals.DBPort"));
			String password = properties.getProperty("Globals.DBPassword");
			
			session = jsch.getSession(user, url, port);
			session.setPassword(password);
			
			Properties config = new Properties();
			config.put("StrictHostKeyChecking", "no");
			session.setConfig(config);
			
			session.connect();
			
			channel = session.openChannel("exec");
			exec = (ChannelExec) channel;
			
			InputStream in = exec.getInputStream();
			
			exec.setCommand(command);
			exec.connect();
			
			BufferedReader reader = new BufferedReader(new InputStreamReader(in));
			StringBuffer sb = new StringBuffer();
			String line;
			
			while((line = reader.readLine()) != null && !line.split("")[0].equals("-")) {
				sb.append(line);
			}
			
			exec.disconnect();
			session.disconnect();
			
			return sb.toString();
		} catch(Exception e) {
			return null;
		}
	}
	
	public void disconnect() {
		if(exec != null) { exec.disconnect(); }
		if(sftp != null) { sftp.quit(); }
		if(channel != null) { channel.disconnect(); }
		if(session != null) { session.disconnect(); }
	}
	
//    public static String  initCommandOper(String command) {
//    	Process process = null;
//        Runtime runtime = Runtime.getRuntime();
//        StringBuffer successOutput = new StringBuffer();
//        StringBuffer errorOutput = new StringBuffer();
//        BufferedReader successBufferReader = null;
//        BufferedReader errorBufferReader = null;
//        String msg = null;
//        String result = "";
// 
//        ArrayList<String> cmdList = new ArrayList<String>();
// 
//        cmdList.add("/bin/sh");
//        cmdList.add("-c");
//        
//        cmdList.add(command);
//        String[] array = cmdList.toArray(new String[cmdList.size()]);
// 
//        try {
//            process = runtime.exec(array);
// 
//            successBufferReader = new BufferedReader(new InputStreamReader(process.getInputStream(), "EUC-KR"));
// 
//            while ((msg = successBufferReader.readLine()) != null) {
//                successOutput.append(msg + System.getProperty("line.separator"));
//            }
// 
//            errorBufferReader = new BufferedReader(new InputStreamReader(process.getErrorStream(), "EUC-KR"));
//            while ((msg = errorBufferReader.readLine()) != null) {
//                errorOutput.append(msg + System.getProperty("line.separator"));
//            }
// 
//            process.waitFor();
// 
//            if (process.exitValue() == 0) {
//            	System.out.println("성공");
//                System.out.println(successOutput.toString());
//                result = successOutput.toString();
//
//            } else {
//            	System.out.println("비정상 종료");
//                System.out.println(successOutput.toString());
//
//            }
// 
//            if (isNotBlank(errorOutput.toString())) {
//            	System.out.println("오류");
//                System.out.println(successOutput.toString());
//
//            }
// 
//        } catch (IOException e) {
//        	e.printStackTrace();
//        } catch (InterruptedException e) {
//        	e.printStackTrace();
//        } finally {
//            try {
//                process.destroy();
//                if (successBufferReader != null) successBufferReader.close();
//                if (errorBufferReader != null) errorBufferReader.close();
//
//            } catch (IOException e1) {
//            	e1.printStackTrace();
//            }
//        }
//        return result;
//    }
//
//	private static boolean isNotBlank(String string) {
//		return false;
//	}
//
//	public String initCommandDb(Properties properties, String command) {
//		String result = "";
//		try {
//            JSch jsch = new JSch();
//           
//            String user = properties.getProperty("Globals.DBUserName");
//			String url = properties.getProperty("Globals.DBHost");
//			int port = Integer.parseInt(properties.getProperty("Globals.DBPort"));
//			String password = properties.getProperty("Globals.DBPassword");
//            
//			session = jsch.getSession(user, url, port);
//            session.setPassword(password);
//         
//            java.util.Properties config = new java.util.Properties();
//            config.put("StrictHostKeyChecking", "no");
//            session.setConfig(config);
//            session.connect();
//         
//            ChannelExec channelExec = (ChannelExec) channel;
//            channelExec = (ChannelExec) session.openChannel("exec");
//            channel = session.openChannel("exec");
//			
//            InputStream in = channelExec.getInputStream();
//			channelExec.setCommand(command);	
//			channelExec.connect();
//			
//			BufferedReader reader = new BufferedReader(new InputStreamReader(in));
//			String line;
//			StringBuffer sb = new StringBuffer();
//
//			while ((line = reader.readLine()) != null) {
//				System.out.println(line + "\n");
//				sb.append(line + "\n");
//				
////				int exitStatus = channelExec.getExitStatus();
////				channelExec.disconnect();
////				session.disconnect();
////				if (exitStatus < 0) {
////					System.out.println("Done, but exit status not set!");
////				} else if (exitStatus > 0) {
////					System.out.println("Done, but with error!");
////				} else {
////					System.out.println("Done!");
////				}
//			}
//			result = sb.toString();
//        } catch(Exception e) {
//			e.printStackTrace();
//			
//			if(sftp != null) { sftp.quit(); }
//			if(channel != null) { channel.disconnect(); }
//			if(session != null) { session.disconnect(); }
//
//		}
//		return result;
//	}
//	
//	public String initCommandCfep(Properties properties, String command) {
//		String result = "";
//		try {
//			JSch jsch = new JSch();
//			
//			String user = properties.getProperty("Globals.LinkUserName");
//			String url = properties.getProperty("Globals.LinkHost");
//			int port = Integer.parseInt(properties.getProperty("Globals.LinkPort"));
//			String password = properties.getProperty("Globals.LinkPassword");
//			
//			session = jsch.getSession(user, url, port);
//            session.setPassword(password);
//         
//            java.util.Properties config = new java.util.Properties();
//            config.put("StrictHostKeyChecking", "no");
//            session.setConfig(config);
//            session.connect();
//         
//            ChannelExec channelExec = (ChannelExec) channel;
//            channelExec = (ChannelExec) session.openChannel("exec");
//            channel = session.openChannel("exec");
//			
//            InputStream in = channelExec.getInputStream();
//			channelExec.setCommand(command);	
//			channelExec.connect();
//			
//			BufferedReader reader = new BufferedReader(new InputStreamReader(in));
//			String line;
//			StringBuffer sb = new StringBuffer();
//
//			while ((line = reader.readLine()) != null) {
//				System.out.println(line + "\n");
//				sb.append(line + "\n");
//				
////				int exitStatus = channelExec.getExitStatus();
////				channelExec.disconnect();
////				session.disconnect();
////				if (exitStatus < 0) {
////					System.out.println("Done, but exit status not set!");
////				} else if (exitStatus > 0) {
////					System.out.println("Done, but with error!");
////				} else {
////					System.out.println("Done!");
////				}
//			}
//			result = sb.toString();
//        }catch(Exception e) {
//			e.printStackTrace();
//			
//			if(sftp != null) { sftp.quit(); }
//			if(channel != null) { channel.disconnect(); }
//			if(session != null) { session.disconnect(); }
//
//		}
//		return result;
//	}
	
}

