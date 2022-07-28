package kr.co.ejsoft.cims.system.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import kr.co.ejsoft.cims.common.model.SearchRequest;
import kr.co.ejsoft.cims.common.util.FileUtils;
import kr.co.ejsoft.cims.common.util.GlobalDeclaration;
import kr.co.ejsoft.cims.common.util.LogUtil;
import kr.co.ejsoft.cims.member.model.MemberVO;
import kr.co.ejsoft.cims.system.model.BoardVO;
import kr.co.ejsoft.cims.system.model.CommonCodeVO;
import kr.co.ejsoft.cims.system.model.FileVO;
import kr.co.ejsoft.cims.system.service.SystemService;

@Controller
@RequestMapping("/system")
public class SystemController {
	
	@Autowired
	private SystemService systemService;
	
	@Resource(name = "multipartResolver")
	private CommonsMultipartResolver multipartResolver;
	
	@Resource(name = "properties")
	private Properties properties;
	
	@RequestMapping(value = "/code")
	public String systemForm(Model model, CommonCodeVO commonCodeVO) throws Exception {
		List<CommonCodeVO> groupCodeList = systemService.selectGroupCodeList(commonCodeVO);
		
		model.addAttribute("groupCodeListCnt", groupCodeList == null ? 0 : groupCodeList.size());
		model.addAttribute("groupCodeList", groupCodeList);
		
		return "/system/commonCode";
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectDetailCode", method = RequestMethod.POST)
	public Map<Object, Object> commonDetail(@RequestBody CommonCodeVO commonCodeVO) throws Exception {
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		List<CommonCodeVO> detailCodeList = systemService.selectDetailCodeList(commonCodeVO);
		
		if(detailCodeList != null && detailCodeList.size() > 0) {
			for(int i=0;i<detailCodeList.size();i++) {
				detailCodeList.get(i).setRnum((i+1) + "");
			}
		}
		     
		map.put("detailCodeList", detailCodeList);
		 
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/searchCode")
	public Map<String, Object> searchCode(@RequestBody Map<String, String> paramMap) throws Exception {
		HashMap<String, Object> hmap = new HashMap<>();
		CommonCodeVO commonCodeVO = new CommonCodeVO();
		
		String groupKeyword = paramMap.get("groupKeyword");
		String commonKeyword = paramMap.get("commonKeyword");
		
		if(groupKeyword != null && groupKeyword.trim() != "") {
			groupKeyword = URLDecoder.decode(groupKeyword);
		}
		if(commonKeyword != null && commonKeyword.trim() != "") {
			commonKeyword = URLDecoder.decode(commonKeyword);
		}
		
		commonCodeVO.setGroupKeyword(groupKeyword);
		commonCodeVO.setCommonKeyword(commonKeyword);
		
		List<CommonCodeVO> groupCodeList = systemService.selectGroupCodeList(commonCodeVO);
		
		if(groupCodeList != null && groupCodeList.size() > 0) {
			for(int i=0;i<groupCodeList.size();i++) {
				groupCodeList.get(i).setRnum((i+1) + ""); 
			}
		}
		
		List<CommonCodeVO> commonCodeList = null;
		
		if(groupCodeList != null && groupCodeList.size() > 0) {
			commonCodeVO.setGroupCd(groupCodeList.get(0).getGroupCd());
			commonCodeList = systemService.selectDetailCodeList(commonCodeVO);
			
			if(commonCodeList != null && commonCodeList.size() > 0) {
				for(int i=0;i<commonCodeList.size();i++) {
					commonCodeList.get(i).setRnum((i+1) + "");
				}
				
			}
		}
		
		hmap.put("groupCodeList", groupCodeList);
		hmap.put("detailCodeList", commonCodeList);
		
		return hmap;
	}
	
	@ResponseBody
	@RequestMapping(value = "/saveGroupCode", method = RequestMethod.POST)
	public Map<Object, Object> save(@RequestBody Map<String, Object> paramMap) throws Exception{
		Map<Object, Object> map = new HashMap<Object, Object>();
	
		String [] groupcd = paramMap.get("groupCd").toString().trim().replaceAll("\\[", "").replaceAll("\\]","").split(",");
		String [] cdname = paramMap.get("cdName").toString().trim().replaceAll("\\[", "").replaceAll("\\]","").split(",");
		String [] userId = paramMap.get("userId").toString().trim().replaceAll("\\[", "").replaceAll("\\]","").split(",");
		String [] data1 = paramMap.get("data1").toString().trim().replaceAll("\\[", "").replaceAll("\\]","").split(",");
		String [] data2 = paramMap.get("data2").toString().trim().replaceAll("\\[", "").replaceAll("\\]","").split(",");
		String [] data3 = paramMap.get("data3").toString().trim().replaceAll("\\[", "").replaceAll("\\]","").split(",");
		String [] data4 = paramMap.get("data4").toString().trim().replaceAll("\\[", "").replaceAll("\\]","").split(",");
		String [] data5 = paramMap.get("data5").toString().trim().replaceAll("\\[", "").replaceAll("\\]","").split(",");
		String [] data6 = paramMap.get("data6").toString().trim().replaceAll("\\[", "").replaceAll("\\]","").split(",");
		String [] data7 = paramMap.get("data7").toString().trim().replaceAll("\\[", "").replaceAll("\\]","").split(",");
		String [] data8 = paramMap.get("data8").toString().trim().replaceAll("\\[", "").replaceAll("\\]","").split(",");
		String [] data9 = paramMap.get("data9").toString().trim().replaceAll("\\[", "").replaceAll("\\]","").split(",");
		String [] useGb = paramMap.get("useGb").toString().trim().replaceAll("\\[", "").replaceAll("\\]","").split(",");
		
		List<String> scores = new ArrayList<String> ();
		
		for(int i=0;i<groupcd.length;i++) {
			CommonCodeVO commonVO = new CommonCodeVO();
			
			commonVO.setGroupCd(groupcd[i].trim());
			commonVO.setCdName(cdname[i].trim());
			commonVO.setUserId(userId[i].trim());
			commonVO.setData1(data1[i].trim());
			commonVO.setData2(data2[i].trim());
			commonVO.setData3(data3[i].trim());
			commonVO.setData4(data4[i].trim());
			commonVO.setData5(data5[i].trim());
			commonVO.setData6(data6[i].trim());
			commonVO.setData7(data7[i].trim());
			commonVO.setData8(data8[i].trim());
			commonVO.setData9(data9[i].trim());
			commonVO.setUseGb(useGb[i].trim());
			
//			그룹코드 중복 존재 여부 확인
			int b = systemService.groupCheck(commonVO.getGroupCd());
			
			if(b > 0 && commonVO.getUseGb().equals("U")) {			// update
				systemService.updateGroupCode(commonVO);
			} else if(b == 0 && commonVO.getUseGb().equals("I")) {	// insert
				systemService.insertGroupCode(commonVO);
			} else {
				scores.add(commonVO.getGroupCd());
				map.put("et", scores); 
			}
		}
		
		map.put("data", "저장 되었습니다.");
	
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/saveDetailCode" , method = RequestMethod.POST)
	public Map<Object, Object> saveDetail(@RequestBody Map<String, Object> paramMap)throws Exception{
		Map<Object, Object> map = new HashMap<Object, Object>();
			
		String[] groupcd = paramMap.get("groupCd").toString().trim().replaceAll("\\[", "").replaceAll("\\]","").split(",");
		String[] commoncd = paramMap.get("commonCd").toString().trim().replaceAll("\\[", "").replaceAll("\\]","").split(",");
		String[] cdname = paramMap.get("cdName").toString().trim().replaceAll("\\[", "").replaceAll("\\]","").split(",");
		String[] userId = paramMap.get("userId").toString().trim().replaceAll("\\[", "").replaceAll("\\]","").split(",");
		String[] data1 = paramMap.get("data1").toString().trim().replaceAll("\\[", "").replaceAll("\\]","").split(",");
		String[] data2 = paramMap.get("data2").toString().trim().replaceAll("\\[", "").replaceAll("\\]","").split(",");
		String[] data3 = paramMap.get("data3").toString().trim().replaceAll("\\[", "").replaceAll("\\]","").split(",");
		String[] data4 = paramMap.get("data4").toString().trim().replaceAll("\\[", "").replaceAll("\\]","").split(",");
		String[] data5 = paramMap.get("data5").toString().trim().replaceAll("\\[", "").replaceAll("\\]","").split(",");
		String[] data6 = paramMap.get("data6").toString().trim().replaceAll("\\[", "").replaceAll("\\]","").split(",");
		String[] data7 = paramMap.get("data7").toString().trim().replaceAll("\\[", "").replaceAll("\\]","").split(",");
		String[] data8 = paramMap.get("data8").toString().trim().replaceAll("\\[", "").replaceAll("\\]","").split(",");
		String[] data9 = paramMap.get("data9").toString().trim().replaceAll("\\[", "").replaceAll("\\]","").split(",");
		String[] useGb = paramMap.get("useGb").toString().trim().replaceAll("\\[", "").replaceAll("\\]","").split(",");
		
		List<String> scores = new ArrayList<String> ();
		
		for(int i=0;i<groupcd.length;i++){
			CommonCodeVO commonVO = new CommonCodeVO();
			commonVO.setGroupCd(groupcd[i].trim());
			commonVO.setCommonCd(commoncd[i].trim());
			commonVO.setCdName(cdname[i].trim());
			commonVO.setUserId(userId[i].trim());
			commonVO.setData1(data1[i].trim());
			commonVO.setData2(data2[i].trim());
			commonVO.setData3(data3[i].trim());
			commonVO.setData4(data4[i].trim());
			commonVO.setData5(data5[i].trim());
			commonVO.setData6(data6[i].trim());
			commonVO.setData7(data7[i].trim());
			commonVO.setData8(data8[i].trim());
			commonVO.setData9(data9[i].trim());
			commonVO.setUseGb(useGb[i].trim());
			
//			세부코드 중복 존재 여부 확인
			int b = systemService.detailCheck(commonVO);

			if(b > 0 && commonVO.getUseGb().equals("Y")){
				systemService.updateDetailCode(commonVO);
			} else if(b > 0 && commonVO.getUseGb().equals("N")) {
				scores.add(commonVO.getGroupCd());
				map.put("et", scores); 
			} else {
				systemService.insertDetailCode(commonVO);
			}
		}
		map.put("data", "저장 되었습니다.");
		
		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/deleteCode", method = RequestMethod.POST)
	public Map<Object, Object> deletecommon(@RequestBody CommonCodeVO commoncodeVO) throws Exception {
		if(commoncodeVO.getCommonCd() == null || commoncodeVO.getCommonCd().trim().length() == 0) {
			commoncodeVO.setCommonCd("00000");
		}
		
		String[] groupCd = commoncodeVO.getGroupCd().split(",");
		String[] commonCd = commoncodeVO.getCommonCd().split(",");
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		List<String> scores = new ArrayList<String>();
		
		for(int i=0;i<groupCd.length;i++) {
			commoncodeVO.setGroupCd((groupCd[i]));
			
			if(!commoncodeVO.getGroupCd().contains("on")) {
				if(commoncodeVO.getCommonCd().equals("00000")) {
					int a = systemService.groupDeleteCheck(commoncodeVO);
					if(a > 0) {
						scores.add(commoncodeVO.getCdName());
						map.put("et", scores);
						
						return map;
					} 
					systemService.deleteCode(commoncodeVO);
				} else {
					for(int j=0;j<commonCd.length;j++) {
						commoncodeVO.setCommonCd(commonCd[j]);
						systemService.deleteCode(commoncodeVO);
					}
				}
			}
		}
		
		map.put("data", "삭제 되었습니다.");
			
		return map;
	}
	
	@RequestMapping(value = "/member")
	public String memberList(Model model, @ModelAttribute SearchRequest search) throws Exception {
		model.addAttribute("searchInfo", search);
		model.addAttribute("memberInfoPage", systemService.getMemberInfoPage(search));
		
		return "/system/memberList";
	}
	
	@RequestMapping(value = "/memberRegister")
	public String memberRegistForm(Model model, @ModelAttribute SearchRequest search) throws Exception{
		model.addAttribute("searchInfo", search);
		
		return "/system/memberRegister";
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteMember")
	public Map<String, Object> deleteMember(HttpServletRequest request, @RequestBody String userIdStr) throws Exception {
		Map<String, Object> hmap = new HashMap<>();
		MemberVO loginVO = (MemberVO) request.getSession().getAttribute("login");
		
		userIdStr = URLDecoder.decode(userIdStr, "UTF-8");
		String tempStr = userIdStr == null ? null : userIdStr.substring(userIdStr.indexOf("=") + 1);
		String tempUserId = tempStr == null ? null : tempStr.substring(0, tempStr.indexOf("&"));
		String[] userIdArray = tempUserId == null ? null : tempUserId.split(",");
		
		try{
			if(userIdArray != null) {
				for(int i=0;i<userIdArray.length;i++){
					if(!userIdArray[i].equals(loginVO.getUserId())) {
						int deleteOK = systemService.deleteMember(userIdArray[i]);
						
						if(deleteOK != 0) {
							hmap.put("success", "Y");
						}
					}
				}
			}
		} catch(Exception e) { 
			e.printStackTrace();
			
			StringWriter error = new StringWriter();
			e.printStackTrace(new PrintWriter(error));
			
			LogUtil.logWrite(properties, error.toString());
		}
		
		return hmap;
	}
	
	@ResponseBody
	@RequestMapping("/idCheck")
	public Map<Object, Object> idcheck(@RequestBody String userId) {
		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		count = systemService.idCheck(userId);
		map.put("cnt", count);
		 
		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/registMember")
	public Map<String, Object> memberRegist(MemberVO memberVO){
		Map<String, Object> hmap = new HashMap<>();
		int result = systemService.insertMember(memberVO);
		hmap.put("insertOK", result > 0);
		return hmap;
	}
	
	@RequestMapping(value = "/memberDetail")
	public String memberDetail(Model model, @ModelAttribute SearchRequest search) throws Exception {
		model.addAttribute("searchInfo", search);
		model.addAttribute("memberCnt", systemService.selectMemberListCnt(search));
		model.addAttribute("memberVO", systemService.selectMemberDetail(search));
		
		return "/system/memberDetail";
	}
	 
	@ResponseBody
	@RequestMapping(value = "/defaultPassword")
	public void defaultPassword(@RequestBody MemberVO memberVO, Model model) {
		systemService.updateDefaultPassword(memberVO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/updateMember")
	public Map<String, Object> modifyMember(MemberVO memberVO, Model model){
		Map<String, Object> hmap = new HashMap<>();
		int updateOK = 0;
		int updatePwdOK = 0;
		
		memberVO.setBirthdate(memberVO.getBirthdate().replaceAll("\\.", ""));
		if(memberVO.getPwd().equals("")) {
			updateOK = systemService.updateMember(memberVO);
		} else {
			updatePwdOK = systemService.updateMemberPwd(memberVO);
		}
		
		hmap.put("updateOK", updateOK + updatePwdOK > 0);
		return hmap;
	}

	@RequestMapping(value = "/notice")
	public String list(Model model, @ModelAttribute SearchRequest search) throws Exception {
		model.addAttribute("searchInfo", search);
		model.addAttribute("noticeInfoPage", systemService.getNoticeInfoPage(search));
		
		return "/system/notice";
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteBoardList", method = RequestMethod.POST)
	public Map<String, Object> deleteBoard(Model model, HttpServletRequest request, @RequestParam String btn, @RequestParam String btn2) throws Exception {
		Map<String, Object> hmap = new HashMap<>();
		
		String postNo = "";
		String[] check = btn.split(",");
		String[] str = btn2.split(",");
		int result = 0;
		
		try{
			for(int i=0;i<check.length;i++) {
				postNo = check[i];
				result += systemService.deleteBoard(postNo);
			}
			
			if(btn2 != null && !btn2.equals("")) {
				for(int i=0;i<str.length;i++) {
					postNo = str[i].split("=")[0];
					String uploadPath = properties.getProperty("Globals.NoticeFilePath") + str[i].split("=")[1];
					
					try { FileUtils.deleteFile(uploadPath); } catch(Exception e) { }	// 파일 삭제
					
					systemService.deleteFileInfo(postNo == "" ? 0 : Integer.parseInt(postNo));
				}
			}
		} catch(Exception e) { 
			e.printStackTrace();
			
			StringWriter error = new StringWriter();
			e.printStackTrace(new PrintWriter(error));
			
			LogUtil.logWrite(properties, error.toString());
		}
		
		hmap.put("deleteOK", result > 0);
		
		return hmap;
	}
	
	@RequestMapping(value = "/noticeRegister")
	public String registForm(Model model, @ModelAttribute SearchRequest search) {
		model.addAttribute("searchInfo", search);
		
		return "/system/noticeRegist";
	}
	
	@ResponseBody
	@RequestMapping("/registBoard")
	public HashMap<String, Object> registBoard(HttpSession session, BoardVO boardVO, Model model, HttpServletRequest request) throws Exception {
		HashMap<String, Object> hmap = new HashMap<>();
		
		boardVO.setPostNo((systemService.selectMaxPostNo() + 1) + "");
		boardVO.setPostStDate(boardVO.getPostStDate().replaceAll("\\.",""));
		boardVO.setPostEdDate(boardVO.getPostEdDate().replaceAll("\\.",""));
		
		systemService.insertBoard(boardVO);
		
		return hmap;
	}
	
	@RequestMapping(value = "/noticeDetail")
	public String noticeDetail(Model model, @ModelAttribute SearchRequest search,
								@RequestParam String postNo,@RequestParam String userName,
								HttpServletRequest request, HttpServletResponse response
								) {
		systemService.upHit(postNo);
		
		BoardVO boardVO = systemService.detailBoard(postNo);
		
		String postStDate = boardVO.getPostStDate();
		String postEdDate = boardVO.getPostEdDate();
		
		if(postStDate != null && postStDate.trim().length() > 0) {
			boardVO.setPostStDate(postStDate.substring(0, 4) + "." + postStDate.substring(4, 6) + "." + postStDate.substring(6, 8));
		}
		
		if(postEdDate != null && postEdDate.trim().length() > 0) {
			boardVO.setPostEdDate(postEdDate.substring(0, 4) + "." + postEdDate.substring(4, 6) + "." + postEdDate.substring(6, 8));
		}
		
		model.addAttribute("searchInfo", search);
		model.addAttribute("boardInfo", boardVO);
		model.addAttribute("userName", userName);
		
		return "/system/noticeDetail";
	}
	
	@ResponseBody
	@RequestMapping("/updateBoard")
	public HashMap<String, Object> updateBoard(HttpSession session, BoardVO boardVO, Model model, HttpServletRequest request) throws Exception {
		HashMap<String, Object> hmap = new HashMap<>();
		
		boardVO.setPostStDate(boardVO.getPostStDate().replace(".",""));
		boardVO.setPostEdDate(boardVO.getPostEdDate().replace(".",""));
		
		systemService.updateBoard(boardVO);
		
		return hmap;
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteBoard")
	public Map<String, Object> detailDeleteBoard(Model model, HttpServletRequest request, BoardVO boardVO) throws Exception {
		Map<String, Object> hmap = new HashMap<>();
		
		try { 
			model.addAttribute("postNo", boardVO.getPostNo());
			model.addAttribute("filePath", boardVO.getFilePath());
			
			fileDelete(model, request);
		} catch (Exception e) { 
			e.printStackTrace();
			
			StringWriter error = new StringWriter();
			e.printStackTrace(new PrintWriter(error));
			
			LogUtil.logWrite(properties, error.toString());
		}
		
		hmap.put("deleteOK", systemService.deleteBoard(boardVO.getPostNo()) > 0);
		
		return hmap;
	}
	
	@ResponseBody
	@RequestMapping("/fileUpload")
	public HashMap<String, Object> fileUpload(Model model, HttpServletRequest request, MultipartFile file, 
												@RequestParam(value="loginId") String loginId,
												@RequestParam(value="postNo", required=false) String postNo) throws Exception {
		HashMap<String, Object> hmap = new HashMap<>();
		
		String uploadPath = properties.getProperty("Globals.NoticeFilePath");
		String originalFileName = file.getOriginalFilename() == null ? "" : file.getOriginalFilename();

		int position = originalFileName.equals("") ? 0 : originalFileName.lastIndexOf(".");
		String formatName = originalFileName.equals("") ? "" : originalFileName.substring(position + 1);
		String savedName = GlobalDeclaration.DATE_TIME_FORMAT_YYYYMMDDHHMMSS.format(new Date()) + "." + formatName;
		
		String filePath = "";
		try {
			filePath = FileUtils.uploadFile(uploadPath, file, savedName);		// 파일 업로드 하고 파일 경로 리턴
		} catch(Exception e) { }
		
		int postNoInt = postNo == null ? systemService.selectMaxPostNo() : Integer.parseInt(postNo);
		String fileSeq = systemService.selectMaxFileSeq();
		int attachfileSeq = Integer.parseInt(fileSeq == null ? "0" : fileSeq) + 1;
		
		FileVO fileVO = new FileVO();
		fileVO.setPostNo(postNoInt);
		fileVO.setAttachfileSeq(attachfileSeq);
		fileVO.setFileName(savedName);
		fileVO.setOrignFileNm(Optional.ofNullable(file.getOriginalFilename()).orElse("").substring(0, position));
		fileVO.setFileExtes(formatName);
		fileVO.setFilePath(filePath);
		fileVO.setRegId(loginId);
		
		systemService.insertFileInfo(fileVO);
		
		return hmap;
	}
	
	@ResponseBody
	@RequestMapping("/fileDelete")
	public HashMap<String, Object> fileDelete(Model model, HttpServletRequest request) throws Exception {
		HashMap<String, Object> hmap = new HashMap<>();
		
		int postNo = Integer.parseInt(request.getParameter("postNo") == null ? "0" : request.getParameter("postNo"));
		String uploadPath = properties.getProperty("Globals.NoticeFilePath") + request.getParameter("filePath");
		
		try { FileUtils.deleteFile(uploadPath); } catch(Exception e) { }	// 파일 삭제
		
		systemService.deleteFileInfo(postNo);
		
		return hmap;
	}
	
	@RequestMapping(value = "/fileDownload")
	public void fileDownload(FileVO fileVO, HttpServletRequest request, HttpServletResponse response) throws IOException{
		String orignFileName = "";
		String filePath = "";
		if(fileVO.getFilePath() == null || fileVO.getFilePath() == "") {
			filePath = systemService.selectFileInfo(fileVO.getFileName()).getFilePath();
		} else if(fileVO.getFilePath() != null && fileVO.getFilePath() != "") {
			filePath = fileVO.getFilePath();
		}
		
		if(fileVO.getOrignFileNm() == null || fileVO.getOrignFileNm() == "") {
			orignFileName = systemService.selectFileInfo(fileVO.getFileName()).getOrignFileNm();
		} else if(fileVO.getOrignFileNm() != null && fileVO.getOrignFileNm() != "") {
			orignFileName = fileVO.getOrignFileNm();
		}
		
		File file = new File(properties.getProperty("Globals.NoticeFilePath") + filePath);
		
		response.setContentType("application/download;charset=utf-8");
		response.setContentLength((int) file.length());
		
		String userAgent = request.getHeader("User-Agent");
		boolean ie = userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1;
		
		String fileName = "";
		if(ie) {
			fileName = URLEncoder.encode(orignFileName + "." + fileVO.getFileExtes(), "utf-8");
		} else {
			fileName = new String((orignFileName + "." + fileVO.getFileExtes()).getBytes("utf-8"), "iso-8859-1");
		}
		response.setHeader("Content-Disposition", "attachment;filename=\"" + fileName + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		OutputStream out = response.getOutputStream();
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
		} finally {
			if(fis != null) {
				try { fis.close(); } catch(Exception e) { }
			}
		}
		out.flush();
	}
	
	@RequestMapping("/interfaceList")
	public String interfaceList(Model model, @ModelAttribute SearchRequest search) {
		model.addAttribute("searchInfo", search);
		model.addAttribute("interfaceInfoPage", systemService.getInterfaceInfoPage(search));
		
		return "/system/interfaceList";
	}
	
	@RequestMapping("/interfaceDetailList")
	public String interfaceDetailList(Model model, @ModelAttribute SearchRequest search,
										@RequestParam(value="listPage") int listPage) {
		model.addAttribute("searchInfo", search);
		model.addAttribute("listPage", listPage);
		model.addAttribute("interfaceDetailInfoPage", systemService.getInterfaceDetailInfoPage(search));

		return "/system/interfaceDetailList";
	}
	
	@RequestMapping("/configurationList")
	public String configurationList(Model model) throws Exception {
		model.addAttribute("resourceUsageInfo", systemService.getResourceUsageInfo());
		model.addAttribute("dbTableInfo", systemService.getDBTableInfo());
		return "/system/configurationSerch";
	}
	
//	@RequestMapping("/configurationList")
//	public String configurationList(Model model) {
//		HashMap<String, ConfigurationVO> execMap = systemService.exec("");
//		model.addAttribute("execMap", execMap);
//		return "/system/configurationSerch";
//	}
	
}














