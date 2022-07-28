package kr.co.ejsoft.cims.system.dao;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.ejsoft.cims.common.model.Page;
import kr.co.ejsoft.cims.common.model.SearchRequest;
import kr.co.ejsoft.cims.member.model.MemberVO;
import kr.co.ejsoft.cims.system.model.BoardVO;
import kr.co.ejsoft.cims.system.model.CommonCodeVO;
import kr.co.ejsoft.cims.system.model.DBTableUsageInfo;
import kr.co.ejsoft.cims.system.model.FileVO;
import kr.co.ejsoft.cims.system.model.InterfaceVO;



@Mapper
public interface SystemDAO {
	
	List<CommonCodeVO> selectCommonCodeList();

	List<BoardVO> selectMainNoticeList();
	
	List<CommonCodeVO> selectGroupCodeList(CommonCodeVO commonCodeVO) throws Exception;
	
	List<CommonCodeVO> selectDetailCodeList(CommonCodeVO commonCodeVO)throws Exception;
	
	Integer groupCheck(String groupCd);
	
	Integer updateGroupCode(CommonCodeVO commoncodeVO);
	
	Integer insertGroupCode(CommonCodeVO commoncodeVO);
	
	Integer detailCheck(CommonCodeVO commoncodeVO);
	
	Integer updateDetailCode(CommonCodeVO commoncodeVO);
	
	Integer insertDetailCode(CommonCodeVO commoncodeVO);
	
	Integer groupDeleteCheck(CommonCodeVO commoncodeVO);
	
	Integer deleteCode(CommonCodeVO commoncodeVO);

	Integer selectMemberListCnt(@Param("search") SearchRequest search);
	
	List<MemberVO> selectMemberList(@Param("page") Page page, @Param("search") SearchRequest search);
	
	Integer deleteMember(String userId);
	
	Integer idCheck(String loginId);
	
	String userIdMax();
	
	Integer insertMember(MemberVO memberVO);
	
	MemberVO selectMemberDetail(@Param("search") SearchRequest search);
	
	Integer updateDefaultPassword(MemberVO memberVO);
	
	Integer updateMember(MemberVO memberVO);
	
	Integer updateMemberPwd(MemberVO memberVO);

	Integer selectNoticeListCnt(@Param("search") SearchRequest search);
	
	List<BoardVO> selectNoticeList(@Param("page") Page page, @Param("search") SearchRequest search);
	
	Integer deleteBoard(String postNo);
	
	Integer deleteFileInfo(Integer postNo);

	Integer selectMaxPostNo();
	
	Integer insertBoard(BoardVO boardVO);

	Integer upHit(String postNo);
	
	BoardVO detailBoard(String postNo);
	
	Integer updateBoard(BoardVO boardVO);

	String selectMaxFileSeq();

	Integer insertFileInfo(FileVO fileVO);

	FileVO selectFileInfo(String fileNm);

	Integer selectInterfaceListCnt(@Param("search") SearchRequest search);
	
	List<InterfaceVO> selectInterfaceList(@Param("page") Page page, @Param("search") SearchRequest search);

	Integer selectInterfaceDetailListCnt(@Param("search") SearchRequest search);
	
	List<InterfaceVO> selectInterfaceDetailList(@Param("page") Page page, @Param("search") SearchRequest search);
	
	CommonCodeVO selectFileDelCycleInfo();
	
	String selectDBUsageStatus();

	List<DBTableUsageInfo> selectDBTableUsageStatus();
	
}
