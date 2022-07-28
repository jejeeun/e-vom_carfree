package kr.co.ejsoft.cims.common.model;

/**
 * User: Naeyoung Kim
 * Date: 2018-12-23
 */
public enum HeaderType {
	SUCCESS(0, "성공"),
	SERVER_ERROR(1000, "서버 에러"),
	DATA_MAKING_ERROR(1001, "데이터 생성 오류"),
	DATA_ALREADY_EXIST(2000, "데이터가 이미 존재합니다."),
	DATA_NOT_EXIST(2001, "해당 조건의 데이터가 존재하지 않습니다."),
	ALREADY_PAST_DEADLINE(3000, "이미 마감된 건입니다.");

	private int resultCode;
	private String resultMessage;

	HeaderType(int resultCode, String resultMessage) {
		this.resultCode = resultCode;
		this.resultMessage = resultMessage;
	}

	public int getResultCode() {
		return resultCode;
	}

	public String getResultMessage() {
		return resultMessage;
	}
}
