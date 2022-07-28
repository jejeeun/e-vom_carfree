package kr.co.ejsoft.cims.login.dao;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

import kr.co.ejsoft.cims.member.model.MemberVO;

@Mapper
public interface LoginDAO {
	MemberVO login(MemberVO vo);
	
	Integer updatePWErrorCnt(MemberVO vo);

	MemberVO findAccount(MemberVO vo);

	MemberVO findPassword(MemberVO vo);

	MemberVO certification(MemberVO vo);

	Integer modifyMyInfo(MemberVO vo);

	Integer modifyPassword(MemberVO vo);

	Integer updateAccessDt(MemberVO vo);

	Integer updateAdminPassword(MemberVO vo);
}
