package kr.co.ejsoft.cims.login.service;

import kr.co.ejsoft.cims.login.dao.LoginDAO;

import kr.co.ejsoft.cims.member.model.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

	@Autowired
	private LoginDAO loginDAO;

	public MemberVO login(MemberVO vo) {
		return loginDAO.login(vo);
	}
	
	public void updatePWErrorCnt(MemberVO vo) {
		loginDAO.updatePWErrorCnt(vo);
	}

	public MemberVO certification(MemberVO vo) {
		return loginDAO.certification(vo);
	}

	public MemberVO findAccount(MemberVO vo) {
		return loginDAO.findAccount(vo);
	}

	public MemberVO findPassword(MemberVO vo) {
		return loginDAO.findPassword(vo);
	}

	public void modifyMyInfo(MemberVO vo) {
		loginDAO.modifyMyInfo(vo);
	}
	
	public void modifyPassword(MemberVO vo) {
		loginDAO.modifyPassword(vo);
	}

	public void updateAccessDt(MemberVO vo) {
		loginDAO.updateAccessDt(vo);
	}

	public int updateAdminPassword(MemberVO vo) {
		return loginDAO.updateAdminPassword(vo);
	}
}
