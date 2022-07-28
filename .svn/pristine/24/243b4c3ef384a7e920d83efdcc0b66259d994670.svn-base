package kr.co.ejsoft.cims.common.response;

import kr.co.ejsoft.cims.common.response.ApiException;

import kr.co.ejsoft.cims.common.response.ApiExceptionEntity;
import kr.co.ejsoft.cims.carfree.controller.CarFreeController;
import kr.co.ejsoft.cims.common.enums.ExceptionEnum;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ControllerAdvice;

import javax.servlet.http.HttpServletRequest;
import java.nio.file.AccessDeniedException;

@ControllerAdvice
public class ApiExceptionAdvice {
	private final Logger logger = LoggerFactory.getLogger(CarFreeController.class);
	
    @ExceptionHandler({ApiException.class})
    public ResponseEntity<ApiExceptionEntity> apiExceptionHandler(HttpServletRequest request, final ApiException e) {
    	logger.info(e.getClass().getName());
    	logger.error("ApiException", e);
        //e.printStackTrace();
        return ResponseEntity
                .status(e.getError().getStatus())
                .body(ApiExceptionEntity.builder()
                        .errorCode(e.getError().getCode())
                        .errorMessage(e.getError().getMessage())
                        .build());
    }

    @ExceptionHandler({RuntimeException.class})
    public ResponseEntity<ApiExceptionEntity> runtimeExceptionHandler(HttpServletRequest request, final RuntimeException e) {
    	logger.info(e.getClass().getName());
    	logger.error("API Exception(RuntimeException)", e);
        
        return ResponseEntity
                .status(ExceptionEnum.RUNTIME_EXCEPTION.getStatus())
                .body(ApiExceptionEntity.builder()
                        .errorCode(ExceptionEnum.RUNTIME_EXCEPTION.getCode())
                        .errorMessage(e.getMessage())
                        .build());
    }

    @ExceptionHandler({AccessDeniedException.class})
    public ResponseEntity<ApiExceptionEntity> accessDeniedExceptionHandler(HttpServletRequest request, final AccessDeniedException e) {
    	logger.info(e.getClass().getName());
    	logger.error("API Exception(AccessDeniedException)", e);

        return ResponseEntity
                .status(ExceptionEnum.ACCESS_DENIED_EXCEPTION.getStatus())
                .body(ApiExceptionEntity.builder()
                        .errorCode(ExceptionEnum.ACCESS_DENIED_EXCEPTION.getCode())
                        .errorMessage(e.getMessage())
                        .build());
    }

    @ExceptionHandler({Exception.class})
    public ResponseEntity<ApiExceptionEntity> unExpectedExceptionHandler(HttpServletRequest request, final Exception e) {
    	logger.info(e.getClass().getName());
    	logger.error("API Exception(UnExpected Exception)", e);
    	

        return ResponseEntity
                .status(ExceptionEnum.INTERNAL_SERVER_ERROR.getStatus())
                .body(ApiExceptionEntity.builder()
                        .errorCode(ExceptionEnum.INTERNAL_SERVER_ERROR.getCode())
                        .errorMessage(e.getMessage())
                        .build());
    }
}