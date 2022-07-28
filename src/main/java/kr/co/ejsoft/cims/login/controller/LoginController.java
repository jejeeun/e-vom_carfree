package kr.co.ejsoft.cims.login.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Properties;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.ejsoft.cims.common.constants.CimsConstants;
import kr.co.ejsoft.cims.common.model.SearchRequest;
import kr.co.ejsoft.cims.common.util.CookieUtil;
import kr.co.ejsoft.cims.common.util.DateUtil;
import kr.co.ejsoft.cims.common.util.GlobalDeclaration;
import kr.co.ejsoft.cims.common.util.LogUtil;
import kr.co.ejsoft.cims.login.service.LoginService;
import kr.co.ejsoft.cims.member.model.MemberVO;
import kr.co.ejsoft.cims.system.model.BoardVO;
import kr.co.ejsoft.cims.system.service.SystemService;

@Controller
public class LoginController {
	private final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private LoginService loginService;
	
	@Autowired
	private SystemService systemService;
	
	@Resource(name = "properties")
	private Properties properties;

	/**
	 * 로그인페이지 가기.
	 *
	 * @param
	 * @return "/main/loginForm.jsp"
	 * @throws
	 */
	@RequestMapping(path = "loginForm", method = RequestMethod.GET)
	public String loginPage() {
		return "login/loginForm";
	}

	@RequestMapping(path = "login", method = RequestMethod.POST)
	public String login(Model model, MemberVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String saveid = request.getParameter("saveid");
		Cookie myCookie = new Cookie("id", vo.getLoginId());

		MemberVO vo1 = loginService.login(vo);

		if(vo1 == null) {
			model.addAttribute("msg", "ID");
			
			return "/login/loginForm";
		} else if(vo1.getPwErrorCnt() == 5) {
			model.addAttribute("msg", "error");
			
			return "/login/loginForm";
		} else if(!vo1.getPwd().equals(vo.getPwd())) {
			vo1.setPwErrorCnt(vo1.getPwErrorCnt() + 1);
			loginService.updatePWErrorCnt(vo1);
			
			model.addAttribute("msg", "PW");
			model.addAttribute("errorCnt", vo1.getPwErrorCnt() + 1);
			
			return "/login/loginForm";
		}
		
		vo1.setPwErrorCnt(0);
		loginService.updatePWErrorCnt(vo1);
		
		vo1.setPwd("");
		createSesssion(request.getSession(),vo1);
		
		if(saveid != null) {
			myCookie.setMaxAge(300);
		} else {
			myCookie.setMaxAge(0); // 쿠키의 expiration 타임을 0으로 하여 없앤다.
		}

		myCookie.setPath("/"); // 모든 경로에서 삭제 되었음을 알린다.
		response.addCookie(myCookie);

		CookieUtil.addCookie(response, CimsConstants.COOKIE_MEMBER_NAME, URLEncoder.encode(vo1.getUserName(), "UTF-8"));
		CookieUtil.addCookie(response, CimsConstants.COOKIE_MEMBER_LOGIN_TIME, URLEncoder.encode(DateUtil.getNowDateTime(GlobalDeclaration.DATE_TIME_FORMAT_YYYYMMDD_HHMMSS), "UTF-8"));
		CookieUtil.addCookie(response, CimsConstants.COOKIE_MEMBER_AREA, URLEncoder.encode(properties.getProperty("Globals.Area"), "UTF-8"));

		loginService.updateAccessDt(vo);
		
		LogUtil.logDelete(properties);
		
		if(vo1.getPwChangeYn() != null && vo1.getPwChangeYn().equals("N")) {
			LogUtil.logWrite(properties, vo1.getLoginId() + " 관리자 계정 최초 로그인 - 패스워드 변경 필요");
			model.addAttribute("loginVO", vo1);
			return "login/changePassword";
		} else {
			LogUtil.logWrite(properties, vo1.getLoginId() + " 계정 로그인");
			return "login/login";
		}
	}

	@RequestMapping(path = "logout", method = RequestMethod.POST)
	public String logout(HttpSession session, MemberVO vo) throws Exception {
		LogUtil.logDelete(properties);
		LogUtil.logWrite(properties, vo.getLoginId() + " 계정 로그아웃");
		session.invalidate();
		return "redirect:/loginForm";
	}

	@RequestMapping(path = "*/logout", method = RequestMethod.POST)
	public String logout1(HttpSession session, MemberVO vo) throws Exception {
		LogUtil.logDelete(properties);
		LogUtil.logWrite(properties, vo.getLoginId() + " 계정 로그아웃");
		session.invalidate();
		return "redirect:/loginForm";
	}
	
	@RequestMapping(path = "/changePassword")
	public String changePassword(RedirectAttributes attr, MemberVO vo) {
		int result = loginService.updateAdminPassword(vo);
		if(result > 0) {
			attr.addFlashAttribute("msg", "changePasswordOK");
			return "redirect:/loginForm";
		} else {
			attr.addFlashAttribute("msg", "changePasswordNO");
			return "login/changePassword";
		}
	}

	@RequestMapping(path = "findAccountForm")
	public String findAccountForm() throws Exception {
		return "/login/findAccount";
	}

	@RequestMapping(path = "findAccount")
	public String findAccount(MemberVO vo, Model model) throws Exception {
		MemberVO mo = loginService.findAccount(vo);
		
		if(mo == null) {
			model.addAttribute("msg", "fail");
		} else {
			model.addAttribute("msg", "success");
			model.addAttribute("id", mo.getLoginId());
		}
		return "login/findAccount";
	}

	@RequestMapping(path = "findPasswordForm")
	public String findPasswordForm() throws Exception {
		return "/login/findPassword";
	}

	@RequestMapping(path = "findPassword")
	public String findPassword(MemberVO vo, Model model) throws Exception {
		logger.debug("계정:"+vo.getLoginId());
		logger.debug("성명:"+vo.getUserName());
		logger.debug("생년월일:"+vo.getBirthdate());
		logger.debug("email:"+vo.getEmail());
		MemberVO mo = loginService.findPassword(vo);
		
		if(mo == null) {
			model.addAttribute("msg", "fail");	
		} else {
			model.addAttribute("msg", "success");
			model.addAttribute("pwd", mo.getPwd());
		}
		
		return "login/findPassword";
	}

	@RequestMapping(path = "/certificationForm")
	public String certificationPage() throws Exception {
		return "login/certification";
	}

	@RequestMapping(path = "/myInforManagment")
	public String certification(Model model, HttpServletRequest request, MemberVO memberVO) throws Exception {
		MemberVO loginVO = (MemberVO) request.getSession().getAttribute("login");
		
		MemberVO certificateVO = loginService.certification(memberVO);
		
		if(certificateVO == null) {
			model.addAttribute("msg", "loginNO");
			return "/login/certification";
		} else if(!certificateVO.getLoginId().equals(loginVO.getLoginId())) {
			model.addAttribute("msg", "notSameId");
			return "/login/certification";
		} else {
			model.addAttribute("member", certificateVO);
			return "/login/myInforManagment";
//			return "redirect:/myInforManagment";
		}
	}
	
	@RequestMapping(path = "/myinfoModify", method = RequestMethod.POST)
	public String changePwd(Model model, MemberVO vo) throws Exception {
		if(vo.getNewPwd().equals("")){
			loginService.modifyMyInfo(vo);
		} else {
			loginService.modifyPassword(vo);
			vo.setPwd(vo.getNewPwd());
		}
		
		if(loginService.certification(vo) == null) {
			return "login/certification";
		}

		model.addAttribute("member", loginService.certification(vo));
		model.addAttribute("msg","sucess");

		return "/login/myInforManagment";
	}
	
	@RequestMapping(path = "/login/myNotice")
	public String myNotice(Model model, @ModelAttribute SearchRequest search) throws Exception {
		model.addAttribute("searchInfo", search);
		model.addAttribute("noticeInfoPage", systemService.getNoticeInfoPage(search));
		
		return "/login/myNotice";
	}
	
	@RequestMapping(path = "/login/myNoticeDetail")
	public String noticeDetail(Model model, @ModelAttribute SearchRequest search,
								@RequestParam String postNo, @RequestParam String userName) throws UnsupportedEncodingException{
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
		
		return "/login/myNoticeDetail";
	}

	public void createSesssion(HttpSession session, MemberVO vo) {
		session.setAttribute("login",vo);
		 // 세션 유지시간 1시간
	    session.setMaxInactiveInterval(60*60);
	    session.setAttribute("CSRF_TOKEN", UUID.randomUUID().toString());
	}
}



