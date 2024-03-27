//package com.myedumyselect.common.exception;
//
//import org.springframework.http.HttpStatus;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ControllerAdvice;
//import org.springframework.web.bind.annotation.ExceptionHandler;
//import org.springframework.web.bind.annotation.ResponseStatus;
//import org.springframework.web.servlet.NoHandlerFoundException;
//
//import lombok.extern.slf4j.Slf4j;
//
///* 해당 객체가 컨트롤러에서 발생하는 예외를 처리하는 존재임을 명시하는 용도로 사용*/
//@ControllerAdvice
//@Slf4j
//public class CommonExceptionAdvice {
//	/* @ExceptionHandler는 해당 메서드가 () 들어가는 예외 타입을 처리 */
//	@ExceptionHandler(Exception.class)
//	public String exceptionMethod(Exception ex, Model model) {
//		log.error("Exception ......" + ex.getMessage());
//		model.addAttribute("exception", ex);
//
//		return "error/error_page";
//	}
//
//	/* 매핑 정보나 파일을 찾지 못했을 경우에 대한 예외 처리. */
////	@ExceptionHandler(NoHandlerFoundException.class)
//	@ExceptionHandler(NoHandlerFoundException.class)
//	@ResponseStatus(HttpStatus.NOT_FOUND)
//	public String handle404(NoHandlerFoundException ex) {
//
//		return "error/custom404";
//	}
//	
////	@ExceptionHandler(NoHandlerFoundException.class)
////	@ResponseStatus(HttpStatus.BAD_REQUEST)
////	public String handle502(NoHandlerFoundException ex) {
////		
////		return "error/custom502";
////	}
////	
////	@ExceptionHandler(NoHandlerFoundException.class)
////	@ResponseStatus(HttpStatus.BAD_REQUEST)
////	public String handle400(NoHandlerFoundException ex) {
////		
////		return "error/custom400";
////	}
////	
////	@ExceptionHandler(NoHandlerFoundException.class)
////	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
////	public String handle500(NoHandlerFoundException ex) {
////		
////		return "error/custom500";
////	}
//}
