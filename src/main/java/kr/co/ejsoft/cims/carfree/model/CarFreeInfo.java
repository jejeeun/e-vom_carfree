package kr.co.ejsoft.cims.carfree.model;

import java.util.HashMap;


import java.util.List;


import com.fasterxml.jackson.databind.annotation.JsonNaming;
import kr.co.ejsoft.cims.common.util.CustomUpperSnakeCaseStrategy;
import lombok.Data;

/**
 * User: JeeunLee, HA Date: 2021.09.30
 */
@Data
@JsonNaming(CustomUpperSnakeCaseStrategy.class)
public class CarFreeInfo {
	private String linkedSn;															//연계일련번호
	private String linkedTm;														//연계일자(yyyyMMddHHmmss)
	private String reqTm;															//요청일자(yyyyMMddHHmmss)
	private String reqDay;															//요청요일
	private String carNoCnt;														//차량번호 개수
	private List<HashMap<String, List<String>>> carNoList;		//차량번호리스트
	
	private String carRegNo;														//차량번호
	private String detectDate;														//검지일(yyyyMMdd)
	private String detectTime;														//검지시간(HHmmss)
	private String detectLocationNm;											//검지위치
	private String siteLat;															//검지위치 위도
	private String siteLng;															//검지위치 경도
	
	private List<String> reqCarList;												//요청 차량 리스트
	private String startTm;															//ShotDt 시작시간
	private String endTm;															//ShotDt 끝시간
	private List<String> logCarList;

}
