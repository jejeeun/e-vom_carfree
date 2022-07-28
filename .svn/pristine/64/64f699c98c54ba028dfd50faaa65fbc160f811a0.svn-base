package kr.co.ejsoft.cims.carfree.dao;



import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.ejsoft.cims.carfree.model.CarFreeInfo;

/**
 * User: Jeeun Lee
 */

@Mapper
public interface CarFreeDAO {
	/*요일제 - 적발 차량 검지*/
	public List<CarFreeInfo> catchCarList(CarFreeInfo carFreeInfo);
	
	/*요일제 - 요청 정보 로그 남기기*/
	public int insertCarFreeRequest(Map<String, Object> logMap);
	
	/*요일제 - 응답 정보 로그 남기기*/
	public int insertCarFreeResponse(Map<String, Object> logMap);
}
