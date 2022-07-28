package kr.co.ejsoft.cims.common.model;

/**
 * User: Naeyoung Kim
 * Date: 2018-12-23
 */
public class ResponseHeader extends BaseModel {
	private int resultCode;
	private String resultMessage;

	ResponseHeader(HeaderType headerType) {
		this.resultCode = headerType.getResultCode();
		this.resultMessage = headerType.getResultMessage();
	}

	public int getResultCode() {
		return resultCode;
	}

	public String getResultMessage() {
		return resultMessage;
	}
}
