package kr.co.ejsoft.cims.common.model;

/**
 * User: Naeyoung Kim
 * Date: 2018-11-29
 */
public class ApiResponse<T> extends BaseModel {
	private ResponseHeader header;
	private T body;

	private ApiResponse(HeaderType headerType) {
		this.header = new ResponseHeader(headerType);
	}

	private ApiResponse(HeaderType headerType, T body) {
		this.header = new ResponseHeader(headerType);
		this.body = body;
	}

	public static<T> ApiResponse<T> success(T body) {
		return new ApiResponse<>(HeaderType.SUCCESS, body);
	}

	public static ApiResponse success() {
		return new ApiResponse<>(HeaderType.SUCCESS);
	}

	public static<T> ApiResponse<T> ofEmptyBody(HeaderType headerType) {
		return new ApiResponse<>(headerType);
	}

	public static<T> ApiResponse<T> of(HeaderType headerType, T body) {
		return new ApiResponse<>(headerType, body);
	}

	public ResponseHeader getHeader() {
		return header;
	}

	public T getBody() {
		return body;
	}
}
