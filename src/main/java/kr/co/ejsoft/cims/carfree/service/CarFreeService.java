package kr.co.ejsoft.cims.carfree.service;

import java.util.List;
import java.util.Map;
import java.util.Properties;



import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ejsoft.cims.carfree.dao.CarFreeDAO;
import kr.co.ejsoft.cims.carfree.model.CarFreeInfo;

/**
 * User: Jeeun Lee
 */

@Service
public class CarFreeService {

	@Autowired
	private CarFreeDAO carFreeDAO;
	
	/*요일제 - 적발 차량 검지*/
	public List<CarFreeInfo> catchCarList(CarFreeInfo carFreeInfo) {
		return carFreeDAO.catchCarList(carFreeInfo);
	}
	
	/*요일제 - 요청 정보 로그 남기기*/
	public int insertCarFreeRequest(Map<String, Object> logMap) {
	    int count = 0;
	    // return row count.
	    count += carFreeDAO.insertCarFreeRequest(logMap);
	    
	    return count;
	}
	
	/*요일제 - 응답 정보 로그 남기기*/
	public int insertCarFreeResponse(Map<String, Object> logMap) {
	    int count = 0;
	    // return row count.
	    count += carFreeDAO.insertCarFreeResponse(logMap);
	    
	    return count;
	}
}


