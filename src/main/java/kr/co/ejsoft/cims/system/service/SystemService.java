package kr.co.ejsoft.cims.system.service;



import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Properties;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.stereotype.Service;

import kr.co.ejsoft.cims.common.model.Page;
import kr.co.ejsoft.cims.common.model.SearchRequest;
import kr.co.ejsoft.cims.common.util.FTPUtil;
import kr.co.ejsoft.cims.common.util.LogUtil;
import kr.co.ejsoft.cims.member.model.MemberVO;
import kr.co.ejsoft.cims.system.dao.SystemDAO;
import kr.co.ejsoft.cims.system.model.BoardVO;
import kr.co.ejsoft.cims.system.model.CommonCodeVO;
import kr.co.ejsoft.cims.system.model.FileVO;
import kr.co.ejsoft.cims.system.model.GroupCode;
import kr.co.ejsoft.cims.system.model.InterfaceVO;
import kr.co.ejsoft.cims.system.model.ResourceInfo;

@Service
@EnableCaching
public class SystemService {




	@Autowired
	private SystemDAO systemDAO;
	
	@Resource(name = "properties")
	private Properties properties;

	public Map<String, Map<String, CommonCodeVO>> getCommonCodeMap() {
		List<CommonCodeVO> commonCodeList = Optional.ofNullable(systemDAO.selectCommonCodeList()).orElseGet(ArrayList::new);;
		Map<String, Map<String, CommonCodeVO>> commonCodeMap = new HashMap<>();
		commonCodeList.forEach(commonCode -> {
			commonCodeMap.computeIfAbsent(commonCode.getGroupCd(), groupCd -> new HashMap<>());
			commonCodeMap.get(commonCode.getGroupCd()).put(commonCode.getCommonCd(), commonCode);
		});
		return commonCodeMap;
	}

	public Map<String, CommonCodeVO> getCommonCodeMapByGroupCd(GroupCode groupCd) {
		return Optional.ofNullable(getCommonCodeMap().get(groupCd.getGroupCode())).orElseGet(HashMap::new);
	}

	public CommonCodeVO getCommonCodeByCommonCd(GroupCode groupCd, String commonCd) {
		return Optional.ofNullable(getCommonCodeMapByGroupCd(groupCd).get(commonCd)).orElseGet(CommonCodeVO::new);
	}

	public List<BoardVO> getMainNoticeList() {
		return systemDAO.selectMainNoticeList();
	}

	public List<CommonCodeVO> selectGroupCodeList(CommonCodeVO commonCodeVO)throws Exception{
		return systemDAO.selectGroupCodeList(commonCodeVO);
	}
	
	public List<CommonCodeVO> selectDetailCodeList(CommonCodeVO commonCodeVO)throws Exception{
		return systemDAO.selectDetailCodeList(commonCodeVO);
	}

	public int groupCheck(String groupCd){
		return systemDAO.groupCheck(groupCd);
	}
	
	public void updateGroupCode(CommonCodeVO commoncodeVO){
		systemDAO.updateGroupCode(commoncodeVO);
	}
	
	public void insertGroupCode(CommonCodeVO commoncodeVO){
		systemDAO.insertGroupCode(commoncodeVO);
	}
	
	public int detailCheck(CommonCodeVO commoncodeVO){
		return systemDAO.detailCheck(commoncodeVO);
	}
	
	public void updateDetailCode(CommonCodeVO commoncodeVO){
		systemDAO.updateDetailCode(commoncodeVO);
	}
	
	public void insertDetailCode(CommonCodeVO commoncodeVO){
		systemDAO.insertDetailCode(commoncodeVO);
	}

	public int groupDeleteCheck(CommonCodeVO commoncodeVO){
		return systemDAO.groupDeleteCheck(commoncodeVO);
	}
	
	public void deleteCode(CommonCodeVO commoncodeVO){
		systemDAO.deleteCode(commoncodeVO);
	}
	
	public Page<MemberVO> getMemberInfoPage(SearchRequest search) {
		search.setRecordSize(15);
		int totalListCount = systemDAO.selectMemberListCnt(search);
		Page<MemberVO> memberInfoPage = new Page<>(totalListCount, search.getRecordSize());
		List<MemberVO> memberInfos = new ArrayList<>();
		if(totalListCount != 0) {
			memberInfoPage.setCurrentPageNo(search.getPageNo());
			memberInfos = Optional.ofNullable(systemDAO.selectMemberList(memberInfoPage, search)).orElseGet(ArrayList::new);
		}
		memberInfoPage.setPageList(memberInfos);
		return memberInfoPage;
	}
	
	public int selectMemberListCnt(SearchRequest search) {
		return systemDAO.selectMemberListCnt(search);
	}
	
	public int deleteMember(String userId){
		return systemDAO.deleteMember(userId);
	}
	
	public int idCheck(String loginId){
		return systemDAO.idCheck(loginId);
	}
	
	public String userIdMax(){
		return systemDAO.userIdMax();
	}
	
	public int insertMember(MemberVO memberVO){
		memberVO.setBirthdate(memberVO.getBirthdate().replaceAll("\\.", ""));
		return systemDAO.insertMember(memberVO);
	}

	public MemberVO selectMemberDetail(SearchRequest search){
		return systemDAO.selectMemberDetail(search);
	}
	
	public int updateMember(MemberVO memberVO){
		return systemDAO.updateMember(memberVO);
	}
	
	public int updateMemberPwd(MemberVO memberVO){
		return systemDAO.updateMemberPwd(memberVO);
	}

	public void updateDefaultPassword(MemberVO memberVO){
		systemDAO.updateDefaultPassword(memberVO);
	}
	
	public Page<BoardVO> getNoticeInfoPage(SearchRequest search) {
		search.setRecordSize(15);
		int totalListCount = systemDAO.selectNoticeListCnt(search);
		Page<BoardVO> noticeInfoPage = new Page<>(totalListCount, search.getRecordSize());
		List<BoardVO> noticeInfos = new ArrayList<>();
		if(totalListCount > 0) {
			noticeInfoPage.setCurrentPageNo(search.getPageNo());
			noticeInfos = Optional.ofNullable(systemDAO.selectNoticeList(noticeInfoPage, search)).orElseGet(ArrayList::new);
		}
		noticeInfoPage.setPageList(noticeInfos);
		return noticeInfoPage;
	}
	
	public int deleteBoard(String postNo){
		return systemDAO.deleteBoard(postNo);
	}

	public void deleteFileInfo(int postNo) {
		systemDAO.deleteFileInfo(postNo);
	}

	public int selectMaxPostNo() {
		Integer result = systemDAO.selectMaxPostNo();
		return result == null ? 0 : result;
	}
	
	public void insertBoard(BoardVO boardVO){
		systemDAO.insertBoard(boardVO);
	}
	
	public void upHit(String postNo){
		systemDAO.upHit(postNo);
	}
	
	public BoardVO detailBoard(String postNo){
		return systemDAO.detailBoard(postNo);
	}
	
	public void updateBoard(BoardVO boardVO){
		systemDAO.updateBoard(boardVO);
	}

	public String selectMaxFileSeq() {
		return systemDAO.selectMaxFileSeq();
	}

	public void insertFileInfo(FileVO fileVO) {
		systemDAO.insertFileInfo(fileVO);
	}

	public FileVO selectFileInfo(String fileNm) {
		return systemDAO.selectFileInfo(fileNm);
	}

	public Page<InterfaceVO> getInterfaceInfoPage(SearchRequest search) {
		search.setRecordSize(15);
		int totalListCount = systemDAO.selectInterfaceListCnt(search);
		Page<InterfaceVO> interfaceInfoPage = new Page<>(totalListCount, search.getRecordSize());
		List<InterfaceVO> interfaceInfos = new ArrayList<>();
		if(totalListCount > 0) {
			interfaceInfoPage.setCurrentPageNo(search.getPageNo());
			interfaceInfos = Optional.ofNullable(systemDAO.selectInterfaceList(interfaceInfoPage, search)).orElseGet(ArrayList::new);
		}
		interfaceInfoPage.setPageList(interfaceInfos);
		return interfaceInfoPage;
	}

	public Page<InterfaceVO> getInterfaceDetailInfoPage(SearchRequest search) {
		search.setRecordSize(15);
		int totalListCount = systemDAO.selectInterfaceDetailListCnt(search);
		Page<InterfaceVO> interfaceDetailInfoPage = new Page<>(totalListCount, search.getRecordSize());
		List<InterfaceVO> interfaceDetailInfos = new ArrayList<>();
		if(totalListCount > 0) {
			interfaceDetailInfoPage.setCurrentPageNo(search.getPageNo());
			interfaceDetailInfos = Optional.ofNullable(systemDAO.selectInterfaceDetailList(interfaceDetailInfoPage, search)).orElseGet(ArrayList::new);
		}
		interfaceDetailInfoPage.setPageList(interfaceDetailInfos);
		return interfaceDetailInfoPage;
	}
	
	public Map<String, ResourceInfo> getResourceUsageInfo() throws Exception {
		Map<String, ResourceInfo> resultMap = new HashMap<>();
		
		String cpuStatusCommand = "top -b -n1 | grep -Po '[0-9.]+ id' | awk '{ print 100-$1 }'";
		String memoryTotalCommand = "cat /proc/meminfo | grep MemTotal | awk '{ print $2; }'";			// 단위 KB
		String memoryFreeCommand = "cat /proc/meminfo | grep MemFree | awk '{ print $2; }'";			// 단위 KB
		String hddTotalCommand = "df -P | grep -v ^Filesystem | awk '{sum += $2} END { print sum; }'";	// 단위 KB
		String hddUsedCommand = "df -P | grep -v ^Filesystem | awk '{sum += $3} END { print sum; }'";	// 단위 KB
		
		String prodCpuStatus = initProdExec(cpuStatusCommand);
		String prodMemoryTotalStatus = initProdExec(memoryTotalCommand);
		String prodMemoryFreeStatus = initProdExec(memoryFreeCommand);
		String prodHDDTotalStatus = initProdExec(hddTotalCommand);
		String prodHDDUsedStatus = initProdExec(hddUsedCommand);
		
		ResourceInfo resourceProd = calculateResourceInfo(prodCpuStatus, prodMemoryTotalStatus, prodMemoryFreeStatus
															, prodHDDTotalStatus, prodHDDUsedStatus);

		FTPUtil ftpDB = new FTPUtil();
		
		String dbCpuStatus = ftpDB.initDBExec(properties, cpuStatusCommand);
		String dbMemoryTotalStatus = ftpDB.initDBExec(properties, memoryTotalCommand);
		String dbMemoryFreeStatus = ftpDB.initDBExec(properties, memoryFreeCommand);
		String dbHDDTotalStatus = ftpDB.initDBExec(properties, hddTotalCommand);
		String dbHDDUsedStatus = ftpDB.initDBExec(properties, hddUsedCommand);
		
		ResourceInfo resourceDB = calculateResourceInfo(dbCpuStatus, dbMemoryTotalStatus, dbMemoryFreeStatus
															, dbHDDTotalStatus, dbHDDUsedStatus);
		
		FTPUtil ftpLink = new FTPUtil();
		String linkCpuStatus = ftpLink.initLinkExec(properties, cpuStatusCommand);
		String linkMemoryTotalStatus = ftpLink.initLinkExec(properties, memoryTotalCommand);
		String linkMemoryFreeStatus = ftpLink.initLinkExec(properties, memoryFreeCommand);
		String linkHDDTotalStatus = ftpLink.initLinkExec(properties, hddTotalCommand);
		String linkHDDUsedStatus = ftpLink.initLinkExec(properties, hddUsedCommand);
		
		ResourceInfo resourceLink = calculateResourceInfo(linkCpuStatus, linkMemoryTotalStatus, linkMemoryFreeStatus
															, linkHDDTotalStatus, linkHDDUsedStatus);

		resultMap.put("prodResourceInfo", resourceProd);
		resultMap.put("dbResourceInfo", resourceDB);
		resultMap.put("linkResourceInfo", resourceLink);
		
		return resultMap;
	}
	
	public String initProdExec(String command) throws Exception {
		Process process = null;
		Runtime runtime = Runtime.getRuntime();
		StringBuffer sb = new StringBuffer();
		BufferedReader reader = null;
		String line;
		
		try {
//			그냥 command 입력하면 명령어 전체가 잘 안들음!
//			process = runtime.exec(command);
			process = runtime.exec(new String[] {"bash", "-l", "-c", command});
			
			reader = new BufferedReader(new InputStreamReader(process.getInputStream(), "UTF-8"));
			
			while((line = reader.readLine()) != null && !line.split("")[0].equals("-")) {
				sb.append(line);
			}
			
			process.waitFor();
		} catch(Exception e) {
			e.printStackTrace();
			
			StringWriter error = new StringWriter();
			e.printStackTrace(new PrintWriter(error));
			
			LogUtil.logWrite(properties, error.toString());
		}
		
		return sb.toString();
	}
	
	public ResourceInfo calculateResourceInfo(String cpuStatus, String memoryTotalStatus, String memoryFreeStatus
													, String hddTotalStatus, String hddUsedStatus) {
		cpuStatus = cpuStatus == null || cpuStatus.equals("") ? "0" : cpuStatus;
		memoryTotalStatus = memoryTotalStatus == null || memoryTotalStatus.equals("") ? "100" : memoryTotalStatus;
		memoryFreeStatus = memoryFreeStatus == null || memoryFreeStatus.equals("") ? "100" : memoryFreeStatus;
		hddTotalStatus = hddTotalStatus == null || hddTotalStatus.equals("") ? "100" : hddTotalStatus;
		hddUsedStatus = hddUsedStatus == null || hddUsedStatus.equals("") ? "0" : hddUsedStatus;
		
		ResourceInfo resource = new ResourceInfo();
		resource.setCpuUsage(Double.parseDouble(cpuStatus));
		resource.setMemoryUsage((1 - Double.parseDouble(memoryFreeStatus) / Double.parseDouble(memoryTotalStatus)) * 100);
		resource.setHddUsage((Double.parseDouble(hddUsedStatus) / Double.parseDouble(hddTotalStatus))*100);
		
		resource.setCpuUsage(Math.round(resource.getCpuUsage()*10)/10.0);
		resource.setMemoryUsage(Math.round(resource.getMemoryUsage()*10)/10.0);
		resource.setHddUsage(Math.round(resource.getHddUsage()*10)/10.0);
		
//		System.out.println("===============================");
//		System.out.println("cpu : " + resource.getCpuUsage());
//		System.out.println("memory : " + resource.getMemoryUsage());
//		System.out.println("hdd : " + resource.getHddUsage());
//		System.out.println("===============================");
		
		return resource;
	}

	public Map<String, Object> getDBTableInfo() {
		Map<String, Object> hmap = new HashMap<>();
		hmap.put("fileDelCycleInfo", systemDAO.selectFileDelCycleInfo());
		hmap.put("dbUsageStatus", systemDAO.selectDBUsageStatus());
		hmap.put("dbTableUsageStatus", systemDAO.selectDBTableUsageStatus());
		return hmap;
	}
		
//	public HashMap<String, ConfigurationVO> exec(String command) {
//		HashMap<String, ConfigurationVO> execMap = new HashMap<>();
//		
//		FTPUtil ftp = new FTPUtil();
//		
//		String OpercpuInfo = ftp.initCommandOper("top -b -n2 -p 1 | fgrep \"Cpu(s)\" | tail -1 | awk -F'id,' -v prefix=\"$prefix\" '{ split($1, vs, \",\"); v=vs[length(vs)]; sub(\"%\", \"\", v); printf \"%s%.f%\\n\", prefix, 100 - v }'");
//		String OpermemoryInfo = ftp.initCommandOper("free | grep Mem | awk '{print sprintf(\"%.2f%\",$3/$2*100)}'");
//		String OpertotalInfo = ftp.initCommandOper("df -P | grep -v ^Filesystem | awk '{sum += $2} END { print sum; }'");
//		String OperuserInfo = ftp.initCommandOper("df -P | grep -v ^Filesystem | awk '{sum += $3} END { print sum; }'");
//		
//		int Opertotal = Integer.parseInt(OpertotalInfo.trim());
//		int Operuser = Integer.parseInt(OperuserInfo.trim());
//		double Operrate = (double) ((double)Operuser / (double)Opertotal) * 100;
//		
//		String OperdispPattern = "0.##";
//		DecimalFormat  form = new DecimalFormat(OperdispPattern);
//		
//		ConfigurationVO oper = new ConfigurationVO();
//		oper.setCpu(OpercpuInfo);
//		oper.setMemory(OpermemoryInfo);
//		oper.setOperrate(form.format(Operrate));
//		
//		execMap.put("operInfo", oper);
//		
//		String DBcpuInfo = ftp.initCommandDb(properties, "top -b -n2 -p 1 | fgrep \"Cpu(s)\" | tail -1 | awk -F'id,' -v prefix=\"$prefix\" '{ split($1, vs, \",\"); v=vs[length(vs)]; sub(\"%\", \"\", v); printf \"%s%.f%\\n\", prefix, 100 - v }'");
//		String DBmemoryInfo = ftp.initCommandDb(properties, "free | grep Mem | awk '{print sprintf(\"%.2f%\",$3/$2*100)}'");
//		String DBtotalInfo = ftp.initCommandDb(properties, "df -P | grep -v ^Filesystem | awk '{sum += $2} END { print sum; }'");
//		String DBuserInfo = ftp.initCommandDb(properties, "df -P | grep -v ^Filesystem | awk '{sum += $3} END { print sum; }'");
//		
//		int DBtotal = Integer.parseInt(DBtotalInfo.trim());
//		int DBuser = Integer.parseInt(DBuserInfo.trim());
//		double DBrate = (double) ((double)DBuser / (double)DBtotal) * 100;
//		
//		String DBdispPattern = "0.##";
//		DecimalFormat DBform = new DecimalFormat(DBdispPattern);
//		
//		ConfigurationVO db = new ConfigurationVO();
//		db.setCpu(DBcpuInfo);
//		db.setMemory(DBmemoryInfo);
//		db.setDbrate(DBform.format(DBrate));
//		
//		execMap.put("dbInfo", db);
//
//		String LinkcpuInfo = ftp.initCommandDb(properties, "top -b -n2 -p 1 | fgrep \"Cpu(s)\" | tail -1 | awk -F'id,' -v prefix=\"$prefix\" '{ split($1, vs, \",\"); v=vs[length(vs)]; sub(\"%\", \"\", v); printf \"%s%.f%\\n\", prefix, 100 - v }'");
//		String LinkmemoryInfo = ftp.initCommandDb(properties, "free | grep Mem | awk '{print sprintf(\"%.2f%\",$3/$2*100)}'");
//		String LinktotalInfo = ftp.initCommandDb(properties, "df -P | grep -v ^Filesystem | awk '{sum += $2} END { print sum; }'");
//		String LinkuserInfo = ftp.initCommandDb(properties, "df -P | grep -v ^Filesystem | awk '{sum += $3} END { print sum; }'");
//		
//		int Linktotal = Integer.parseInt(LinktotalInfo.trim());
//		int Linkuser = Integer.parseInt(LinkuserInfo.trim());
//		double Linkrate = (double) ((double)Linkuser / (double)Linktotal) * 100;
//		
//		String LinkdispPattern = "0.##";
//		DecimalFormat  Linkform = new DecimalFormat(LinkdispPattern);
//		
//		ConfigurationVO link = new ConfigurationVO();
//		link.setCpu(LinkcpuInfo);
//		link.setMemory(LinkmemoryInfo);
//		link.setLinkrate(Linkform.format(Linkrate));	// hdd
//		
//		execMap.put("linkInfo", link);
//		
//		return execMap;
//	}
	
}







