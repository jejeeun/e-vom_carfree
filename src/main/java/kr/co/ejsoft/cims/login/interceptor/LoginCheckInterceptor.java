package kr.co.ejsoft.cims.login.interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.ejsoft.cims.member.model.MemberVO;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * User: Naeyoung Kim
 * Date: 2018-11-11
 */
@Component
public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	private final Logger logger = LoggerFactory.getLogger(LoginCheckInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		response.addHeader("X-FRAME-OPTIONS", "DENY");
		
		HttpSession session = request.getSession();
		
		MemberVO loginVO = (MemberVO) session.getAttribute("login");
		String token = request.getParameter("_csrf");
		String originToken = (String) session.getAttribute("CSRF_TOKEN");
		
		logger.debug("session값:" + loginVO);
		
		if(loginVO == null) {
			try {
				response.sendRedirect("/loginForm");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return false;
		}
		
//		if(token == null || !token.equals(originToken)) {
//			try {
//				response.sendRedirect("/loginForm");
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			return false;
//		}
		
		return true;
	}
}
