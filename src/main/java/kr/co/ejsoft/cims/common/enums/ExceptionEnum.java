package kr.co.ejsoft.cims.common.enums;

import lombok.Getter;
import lombok.ToString;

import java.time.LocalDateTime;

import org.springframework.http.HttpStatus;

@Getter
@ToString
public enum ExceptionEnum {
    RUNTIME_EXCEPTION(HttpStatus.BAD_REQUEST, "E0001"),
    ACCESS_DENIED_EXCEPTION(HttpStatus.UNAUTHORIZED, "E0002"),
    INTERNAL_SERVER_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, "E0003"),
	
	CARFREE_01(HttpStatus.BAD_REQUEST, "F0001","Bad Request."),
	CARFREE_02(HttpStatus.BAD_REQUEST, "F0002","Different From Each Other(Verify ReqTm, ReqDay)."),
	CARFREE_03(HttpStatus.NOT_FOUND, "F0002","ReqTm Not Found."),
	
	//잘못된 적발 단위 설정 시
	CARFREE_10(HttpStatus.BAD_REQUEST, "F0010", "Unexpected Error"),
	
	//DB Log Request Insert 오류 
	CARFREE_20(HttpStatus.BAD_REQUEST, "F0020", "Unexpected Error"),
	
	//DB Log Response Insert 오류
	CARFREE_21(HttpStatus.BAD_REQUEST, "F0021", "Unexpected Error");
	

    private final HttpStatus status;
    private final String code;
    private String message;

    ExceptionEnum(HttpStatus status, String code) {
        this.status = status;
        this.code = code;
    }

    ExceptionEnum(HttpStatus status, String code, String message) {
        this.status = status;
        this.code = code;
        this.message = message;
    }
}