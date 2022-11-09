package com.awoo.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {

	//개발자는 에러 메세지를 확인
	@ExceptionHandler(Exception.class)
	public String globalException(Exception e) {
		System.out.println(e.getMessage());
		return "error/error";
	}

}

