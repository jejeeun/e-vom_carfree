package kr.co.ejsoft.cims.common.model;

import java.util.List;

import org.apache.commons.lang3.StringUtils;

/**
 * User: Naeyoung Kim
 * Date: 2018-12-03
 */
public class SearchRequest extends BaseModel {
	
	public static final String DATA_NONE = "NONE";
	
	private String startDate;
	private String endDate;
	private String cityId;
	private String siteId;
	private String cameraId;
	private String cameraStatus;
	private String laneId;
	private List<String> laneIdList;
	private String owner;
	private String carMngNo;
	private String carRegNo;
	private String carSerNo;
	private String disclosureType;
	private String disclosureDt;
	private String seasonNo;
	private String searchUrl;
	private String callNo;
	private String shotDt;
	private String keyword;
	private String searchName;				// 회원정보 관리 - 회원명
	private int searchCondition;			// 공지사항 관리 - 검색항목
	private String searchKeyword;			// 공지사항 관리 - 검색키워드
	private String userId;
	private String type;					// CSV 연계 이력 조회 - 유형
	private String btId;					// CSV 연계 이력 조회 - 배치아이디
	private String startStDt;				// CSV 연계 이력 조회 - 연계 시작일 시작시간
	private String endStDt;					// CSV 연계 이력 조회 - 연계 시작일 종료시간
	private String startEdDt;				// CSV 연계 이력 조회 - 연계 종료일 시작시간
	private String endEdDt;					// CSV 연계 이력 조회 - 연계 종료일 종료시간
	private String adminDspsYn;				// 행정처분처리 - 처분여부
	private String emisGrade;				// 행정처분처리 - 배출등급
	private String sendGb;					// 행정처분처리 - 전송형태(수신형태)
	private String sendType;				// 행정처분처리 - 전송형태(수신형태) - 상세페이지 이동용
	private String replyYn;					// 행정처분처리 - 송신여부
	private String standard;				// 행정처분처리 - 유예자료적용기준
	private String adminDspsDate;			// 행정처분처리 - 행정처분마감일자
	private String documentNo;				// 유예신청관리 - 문서번호
	private String alignment;				// 정렬 기준(v1.6 ~ ) - 각 목록 페이지 컬럼
	private String order;					// 정렬 순서(v1.6 ~ ) - ASC : 오름차순, DESC : 내림차순
	private String duplicateYn;				// 현황 및 통계(v1.6 ~ ) - 중복제거
	
	private int recordSize;
	private int pageNo = 1;

	public String getStartDate() {
		return startDate;
	}

	public String getQueryStartDate() {
		String startDate = this.startDate.replaceAll("[.]|[-]|[:]| ", "");
		return StringUtils.rightPad(startDate, 14, "0");
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public String getQueryEndDate() {
		String endDate = this.endDate.replaceAll("[.]|[-]|[:]| ", "");
		if (endDate.length() == 12) {
			return endDate + "59";
		} else if (endDate.length() == 10) {
			return endDate + "5959";
		} else if (endDate.length() == 8) {
			return endDate + "235959";
		}
		return StringUtils.rightPad(startDate, 14, "0");
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	public String getCityId() {
		return cityId;
	}
	
	public void setCityId(String cityId) {
		this.cityId = cityId;
	}

	public String getSiteId() {
		return siteId;
	}

	public void setSiteId(String siteId) {
		this.siteId = siteId;
	}

	public String getCameraId() {
		return cameraId;
	}

	public void setCameraId(String cameraId) {
		this.cameraId = cameraId;
	}

	public String getCameraStatus() {
		return cameraStatus;
	}

	public void setCameraStatus(String cameraStatus) {
		this.cameraStatus = cameraStatus;
	}

	public String getLaneId() {
		return laneId;
	}

	public void setLaneId(String laneId) {
		this.laneId = laneId;
	}

	public List<String> getLaneIdList() {
		return laneIdList;
	}

	public void setLaneIdList(List<String> laneIdList) {
		this.laneIdList = laneIdList;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}
	
	public String getCarMngNo() {
		return carMngNo;
	}
	
	public void setCarMngNo(String carMngNo) {
		this.carMngNo = carMngNo;
	}

	public String getCarRegNo() {
		return carRegNo;
	}

	public void setCarRegNo(String carRegNo) {
		this.carRegNo = carRegNo;
	}

	public String getCarSerNo() {
		return carSerNo;
	}

	public void setCarSerNo(String carSerNo) {
		this.carSerNo = carSerNo;
	}

	public String getDisclosureType() {
		return disclosureType;
	}

	public void setDisclosureType(String disclosureType) {
		this.disclosureType = disclosureType;
	}
	
	public String getDisclosureDt() {
		return disclosureDt;
	}
	
	public void setDisclosureDt(String disclosureDt) {
		this.disclosureDt = disclosureDt;
	}

	public String getSeasonNo() {
		return seasonNo;
	}
	
	public void setSeasonNo(String seasonNo) {
		this.seasonNo = seasonNo;
	}

	public String getSearchUrl() {
		return searchUrl;
	}
	
	public void setSearchUrl(String searchUrl) {
		this.searchUrl = searchUrl;
	}
	
	public String getCallNo() {
		return callNo;
	}
	
	public void setCallNo(String callNo) {
		this.callNo = callNo;
	}
	
	public String getShotDt() {
		return shotDt;
	}
	
	public void setShotDt(String shotDt) {
		this.shotDt = shotDt;
	}
	
	public String getKeyword() {
		return keyword;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String getSearchName() {
		return searchName;
	}
	
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	
	public int getSearchCondition() {
		return searchCondition;
	}
	
	public void setSearchCondition(int searchCondition) {
		this.searchCondition = searchCondition;
	}
	
	public String getSearchKeyword() {
		return searchKeyword;
	}
	
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public String getBtId() {
		return btId;
	}
	
	public void setBtId(String btId) {
		this.btId = btId;
	}
	
	public String getStartStDt() {
		return startStDt;
	}
	
	public void setStartStDt(String startStDt) {
		this.startStDt = startStDt;
	}
	
	public String getEndStDt() {
		return endStDt;
	}
	
	public void setEndStDt(String endStDt) {
		this.endStDt = endStDt;
	}
	
	public String getStartEdDt() {
		return startEdDt;
	}
	
	public void setStartEdDt(String startEdDt) {
		this.startEdDt = startEdDt;
	}
	
	public String getEndEdDt() {
		return endEdDt;
	}
	
	public void setEndEdDt(String endEdDt) {
		this.endEdDt = endEdDt;
	}
	
	public String getAdminDspsYn() {
		return adminDspsYn;
	}
	
	public void setAdminDspsYn(String adminDspsYn) {
		this.adminDspsYn = adminDspsYn;
	}
	
	public String getEmisGrade() {
		return emisGrade;
	}
	
	public void setEmisGrade(String emisGrade) {
		this.emisGrade = emisGrade;
	}
	
	public String getSendGb() {
		return sendGb;
	}
	
	public void setSendGb(String sendGb) {
		this.sendGb = sendGb;
	}
	
	public String getSendType() {
		return sendType;
	}
	
	public void setSendType(String sendType) {
		this.sendType = sendType;
	}
	
	public String getReplyYn() {
		return replyYn;
	}
	
	public void setReplyYn(String replyYn) {
		this.replyYn = replyYn;
	}
	
	public String getStandard() {
		return standard;
	}
	
	public void setStandard(String standard) {
		this.standard = standard;
	}
	
	public String getAdminDspsDate() {
		return adminDspsDate;
	}
	
	public void setAdminDspsDate(String adminDspsDate) {
		this.adminDspsDate = adminDspsDate;
	}
	
	public String getDocumentNo() {
		return documentNo;
	}
	
	public void setDocumentNo(String documentNo) {
		this.documentNo = documentNo;
	}
	
	public String getAlignment() {
		return alignment;
	}
	
	public void setAlignment(String alignment) {
		this.alignment = alignment;
	}
	
	public String getOrder() {
		return order;
	}
	
	public void setOrder(String order) {
		this.order = order;
	}
	
	public String getDuplicateYn() {
		return duplicateYn;
	}
	
	public void setDuplicateYn(String duplicateYn) {
		this.duplicateYn = duplicateYn;
	}

	public int getRecordSize() {
		return recordSize;
	}

	public void setRecordSize(int recordSize) {
		this.recordSize = recordSize;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
}
