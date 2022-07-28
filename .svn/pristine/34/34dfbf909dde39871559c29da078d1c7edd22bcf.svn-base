package kr.co.ejsoft.cims.carfree.controller;

import java.nio.charset.StandardCharsets;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.common.collect.Lists;

import kr.co.ejsoft.cims.carfree.model.CarFreeInfo;
import kr.co.ejsoft.cims.carfree.service.CarFreeService;
import kr.co.ejsoft.cims.common.crypto.EcbUtils;
import kr.co.ejsoft.cims.common.crypto.padding.ZeroPadding;
import kr.co.ejsoft.cims.common.enums.ExceptionEnum;
import kr.co.ejsoft.cims.common.response.ApiException;

/**
 * Author: JeeunLee, HA Date: 2021.09.30
 */
@RestController
public class CarFreeController {
	private final Logger logger = LoggerFactory.getLogger(CarFreeController.class);
	
	@Resource(name = "properties")
	private Properties properties;
	
	@Autowired
	private CarFreeService carFreeService;
	
	//LEA ECB 객체호출(256-key bit)
	private EcbUtils ecbUtils = new EcbUtils(new ZeroPadding(32).pad("01056760325".getBytes(StandardCharsets.UTF_8)));
	
  	/** * 대구 요일제 API  * 
  	 * @param carFreeInfo - POST 요청 데이터
  	 * @return  ResponseEntity<HashMap<String, Object>>
  	 * @throws CARFREE_01, CARFREE_02, CARFREE_03
  	 * */ 
	@RequestMapping(value = "/carfree/daegu")
	public ResponseEntity<HashMap<String, Object>> detectNoDriveCar(@RequestBody CarFreeInfo carFreeInfo) throws  Exception{	
		long startT = System.currentTimeMillis();
		HashMap<String, Object> carFreeSendInfo = new HashMap<String, Object>();	
		
		String linkedSn = carFreeInfo.getLinkedSn();
		String linkedTm = carFreeInfo.getLinkedTm();
		String reqTm = carFreeInfo.getReqTm();
		String reqDay = carFreeInfo.getReqDay();
		//String carNoCnt = carFreeInfo.getCarNoCnt();
	
		if(linkedSn == "" || linkedTm ==  "" || reqTm ==  "" || reqDay ==  "" 
				|| linkedSn == null || linkedTm ==  null || reqTm ==  null || reqDay ==  null) {
			throw new ApiException(ExceptionEnum.CARFREE_01);												//유효하지 않은 요청
			
		}else if(!getDayOfweek(reqTm).equals(reqDay)){
			throw new ApiException(ExceptionEnum.CARFREE_02);												//유효하지 않은 자원
			
		}else if(Integer.parseInt(reqTm) > Integer.parseInt(new SimpleDateFormat("yyyyMMdd").format(Calendar.getInstance().getTime()))){
			throw new ApiException(ExceptionEnum.CARFREE_03);												//유효하지 않은 자원
			
		}else {
			carFreeSendInfo.put("LINKED_SN", linkedSn);																	//연계일련번호
			carFreeSendInfo.put("LINKED_TM", linkedTm);																	//연계일자(yyyyMMddHHmmss)
			carFreeSendInfo.put("REQ_TM", reqTm);																			//요청일자(yyyyMMddHHmmss)
			carFreeSendInfo.put("REQ_DAY", reqDay);																		//요청요일
		}
		
		List<CarFreeInfo> catchList = getCatchCarList(getReqCarList(carFreeInfo), carFreeInfo, 999);		
		
		carFreeSendInfo.put("DETECT_NO_CNT", String.valueOf(catchList.size()));							//검지건수
		carFreeSendInfo.put("DETECT_LIST", getDetectList(catchList, carFreeInfo));							//적발 차량 정보 리스트
		
		long endT = System.currentTimeMillis();
		long exhausted = (endT-startT);
		System.out.println("수행 시간: "+exhausted+"ms");
		
		return new ResponseEntity<>(carFreeSendInfo , HttpStatus.OK);
	}
	
  	/** * 요청 차량 번호 리스트  * 
  	 * @param carFreeInfo - 요청 데이터
  	 * @return  List<string>
  	 * @throws CARFREE_01, CARFREE_20
  	 * */ 
  	public List<String> getReqCarList(CarFreeInfo carFreeInfo) {
  		List<String> reqCarList = new ArrayList<String>();
  		
		Map<String, Object> carMap;
		List<Map<String, Object>> logCarList = new ArrayList<Map<String, Object>>();
		Map<String, Object> logMap = new HashMap<String, Object>();
  		 
  		if(carFreeInfo.getCarNoList().size() == 0) {
  			throw new ApiException(ExceptionEnum.CARFREE_01);												//유효하지 않은 요청
  			
  		}else {
  			String carRegNo = "";	
  			for(HashMap<String, List<String>> car : carFreeInfo.getCarNoList()) {
  				StringBuilder stringBuilder = new StringBuilder(); 
  				for (String hexa : car.get("CAR_NO")) { 
  					stringBuilder.append(hexa); 
  				}
  				//차량번호 복호화
  				carRegNo = ecbUtils.decrypt(EcbUtils.hexToByteArray(stringBuilder.toString())).trim();
  				reqCarList.add(carRegNo);
  				
  				//set DB data
  				carMap = new HashMap<String, Object>();
  				carMap.put("carNo", stringBuilder.toString());
  				carMap.put("carRegNo", carRegNo);
  				logCarList.add(carMap);
  			}
  			
  			//데이터 insert 시 한번에 insert할 데이터 양
  			String insertSizeStr = properties.getProperty("Globals.InsertSize");
  			insertSizeStr = insertSizeStr == null ? "10000" : insertSizeStr;
  			int insertSize = Integer.parseInt(insertSizeStr);
  			
	  		//set DB data
	  		logMap.put("linkedSn", carFreeInfo.getLinkedSn());
	  		logMap.put("linkedTm", carFreeInfo.getLinkedTm());
	  		logMap.put("reqTm", carFreeInfo.getReqTm());
	  		logMap.put("reqDay", carFreeInfo.getReqDay());
  			
  			int logCarSize = logCarList.size();
  			if( logCarSize>insertSize) {
  				int repeat = logCarSize/insertSize;
  				int remainder = logCarSize%insertSize;
  				
  	  			for(int i=0;i<=repeat;i++) {
  	  	  			
  		   			if(i != repeat) {
  		   					logMap.put("logCarList", logCarList.subList(i*insertSize, (i+1)*insertSize));
  		   			}else {
  		   					logMap.put("logCarList",  logCarList.subList(repeat*insertSize, repeat*insertSize+remainder));
  		   			}
  		   			
  	  	  			try {
  	  	  				logger.debug("CarFree Request DB Insert Start [Sequence: "+ (i+1) +"]");
  	  	  	  			int insertOk = carFreeService.insertCarFreeRequest(logMap);
  	  	  	  			
  	  	  				//DB Log Request Insert
  	  					if(insertOk > 0) {
  	  						logger.debug("CarFree Request DB Insert End [Sequence: "+ (i+1) +"]");
  	  					}else {
  	  						logger.debug("CarFree Request DB Insert End [Sequence: "+ (i+1) +"]");
  	  						throw new ApiException(ExceptionEnum.CARFREE_20);
  	  					}
  	  	  			} catch(Exception e){
  	  	  				throw e;
  	  	  			}
  	  			}
  			}else {
  					logMap.put("logCarList", logCarList);
	  	  			try {
  	  	  				logger.debug("CarFree Request DB Insert Start");
  	  	  	  			int insertOk = carFreeService.insertCarFreeRequest(logMap);
  	  	  	  			
  	  	  				//DB Log Request Insert
  	  					if(insertOk > 0) {
  	  						logger.debug("CarFree Request DB Insert End");
  	  					}else {
  	  						logger.debug("CarFree Request DB Insert End");
  	  						throw new ApiException(ExceptionEnum.CARFREE_20);
  	  					}
  	  	  			} catch(Exception e){
  	  	  				throw e;
  	  	  			}
  			}

  		}
  	
  		return reqCarList;
	}

  	/** * 적발 차량 번호 리스트  * 
  	 * @param reqCarList - 요청 차량 리스트, carFreeInfo - 요청 데이터, divisor - 데이터 처리 단위<1000
  	 * @return  List<CarFreeInfo>
  	 * @throws CARFREE_10, CARFREE_21
  	 * */ 
  	public List<CarFreeInfo> getCatchCarList(List<String> reqCarList, CarFreeInfo carFreeInfo,  int divisor) {
  		if(divisor > 999) throw new ApiException(ExceptionEnum.CARFREE_10);
  		
  		String reqTm = carFreeInfo.getReqTm();
		carFreeInfo.setStartTm(reqTm+"000000");		//적발 시작 시간
		carFreeInfo.setEndTm(reqTm+"235959");		//적발 종료 시간
  		
		List<CarFreeInfo> catchList = new ArrayList<>();
  		for(List<String> set : Lists.partition(reqCarList, divisor)) {
  			//divisor로 차량대수 나눠서 service호출 
  			carFreeInfo.setReqCarList(set);
  			//합치기
  			catchList.addAll(carFreeService.catchCarList(carFreeInfo));
  		}
  		return catchList;
	}
  	
  	/** * 적발 차량 정보 리스트  * 
  	 * @param catchList - 적발 차량 번호 리스트, carFreeInfo- 요청 데이터
  	 * @return  List<HashMap<String, Object>>
  	 * @throws 
  	 * */ 
  	public List<HashMap<String, Object>> getDetectList(List<CarFreeInfo> catchList, CarFreeInfo carFreeInfo) {
  		List<HashMap<String, Object>> detectList = new ArrayList<HashMap<String, Object>>();
  		
		Map<String, Object> carMap;
		List<Map<String, Object>> logCatchList = new ArrayList<Map<String, Object>>();
		Map<String, Object> logMap = new HashMap<String, Object>();
  		
		String carRegNo = "";
  		for(CarFreeInfo list : catchList) {
  			HashMap<String, Object> carInfo = new HashMap<String, Object>();
  			
  			carRegNo = list.getCarRegNo().trim();
			byte[] encryptedCarNo = ecbUtils.encrypt(carRegNo);
			String detectTime = list.getDetectTime();
			String detectDate = list.getDetectDate();
			String detectLocationNm = list.getDetectLocationNm();
			String siteLat = list.getSiteLat();
			String siteLng = list.getSiteLng();
			
			//set JSON data
			carInfo.put("CAR_NO", EcbUtils.byteArrayToHexArray(encryptedCarNo));					//차량번호
			carInfo.put("DETECT_DATE", detectDate);																//검지일(yyyyMMdd)
			carInfo.put("DETECT_TIME", detectTime);																	//검지시간(HHmmss)
			carInfo.put("DETECT_LOCATION_NM", detectLocationNm);										//검지위치 지점명
			carInfo.put("SITE_LAT", siteLat);																				//검지위치 위도
			carInfo.put("SITE_LNG", siteLng);																			//검지위치 경도		
			detectList.add(carInfo);
		
			//set DB data
			carMap = new HashMap<String, Object>();
			carMap.put("carNo", EcbUtils.byteArrayToHex(encryptedCarNo));							//차량번호
			carMap.put("carRegNo", carRegNo);																		//복호화 차량번호
			carMap.put("detectTime",  detectTime);																	//검지시간(HHmmss)
			carMap.put("detectLocationNm",  detectLocationNm);												//검지위치 지점명
			carMap.put("siteLat",  siteLat);																				//검지위치 위도
			carMap.put("siteLng",  siteLng);																				//검지위치 경도	
			logCatchList.add(carMap);
			
		}
  		
		//데이터 insert 시 한번에 insert할 데이터 양
		String insertSizeStr = properties.getProperty("Globals.InsertSize");
		insertSizeStr = insertSizeStr == null ? "10000" : insertSizeStr;
		int insertSize = Integer.parseInt(insertSizeStr);
		
	  	//set DB data
		logMap.put("linkedSn", carFreeInfo.getLinkedSn());
		logMap.put("linkedTm", carFreeInfo.getLinkedTm());
		logMap.put("detectDate", carFreeInfo.getReqTm());														//검지일(yyyyMMdd)
			
		int logCatchSize = logCatchList.size();
		if(logCatchSize != 0) {
			
			if(logCatchSize > insertSize) {
				int repeat = logCatchSize/insertSize;
				int remainder = logCatchSize%insertSize;
				
		  		for(int i=0;i<=repeat;i++) {
		   			if(i != repeat) {
		   				logMap.put("logCatchList", logCatchList.subList(i*insertSize, (i+1)*insertSize));
		   			}else {
		   				logMap.put("logCatchList",  logCatchList.subList(repeat*insertSize, repeat*insertSize+remainder));
		   			}
		   			
			  		try {
		  	  			logger.debug("CarFree Response DB Insert Start [Sequence: "+ (i+1) +"]");
		  	  			int insertOk = carFreeService.insertCarFreeResponse(logMap);
		  	  			
		  	  			//DB Log Request Insert
		  				if(insertOk > 0) {
		  					logger.debug("CarFree Response DB Insert End [Sequence: "+ (i+1) +"]");
		  				}else {
		  					logger.debug("CarFree Response DB Insert End [Sequence: "+ (i+1) +"]");
		  					throw new ApiException(ExceptionEnum.CARFREE_21);
		  				}
		  	  		} catch(Exception e){
		  	  			throw e;
		  	  		}
		  		}
			}else {
				logMap.put("logCatchList", logCatchList);
		  		try {
		  			logger.debug("CarFree Response DB Insert Start");
	  	  			int insertOk = carFreeService.insertCarFreeResponse(logMap);
	  	  			
	  	  			//DB Log Request Insert
	  				if(insertOk > 0) {
	  					logger.debug("CarFree Response DB Insert End");
	  				}else {
	  					logger.debug("CarFree Response DB Insert End");
	  					throw new ApiException(ExceptionEnum.CARFREE_21);
	  				}
	  	  		} catch(Exception e){
	  	  			throw e;
	  	  		}
			}
		}
  		
  		return detectList;
	}

  
  	/** * 날짜로 요일 구하기 * 
  	 * @param date - 요일 구할 날짜 
  	 * @return  string
  	 * @throws ParseException 
  	 * */ 
  	public String getDayOfweek(String date) throws ParseException{ 
  		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd"); 
  		String[] week = {"일","월","화","수","목","금","토"}; 
  		Calendar cal = Calendar.getInstance(); 
  		Date getDate; 

  		getDate = format.parse(date); 
  		cal.setTime(getDate); 
  		int w = cal.get(Calendar.DAY_OF_WEEK)-1; 
  		
  		//System.out.println(week[w]);
  		return  week[w];
  	}

	
}
