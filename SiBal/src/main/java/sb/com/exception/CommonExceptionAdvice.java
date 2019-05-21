//package sb.com.exception;
//
//import org.apache.commons.logging.Log;
//import org.apache.commons.logging.LogFactory;
//import org.apache.log4j.Logger;
//import org.springframework.http.HttpStatus;
//import org.springframework.web.bind.annotation.ControllerAdvice;
//import org.springframework.web.bind.annotation.ExceptionHandler;
//import org.springframework.web.bind.annotation.ResponseStatus;
//import org.springframework.web.servlet.NoHandlerFoundException;
//
//@ControllerAdvice
//
//public class CommonExceptionAdvice {
//	protected Log log = LogFactory.getLog(Logger.class);
//	
//	@ExceptionHandler(NoHandlerFoundException.class)
//	@ResponseStatus(HttpStatus.NOT_FOUND)
//	public String handler404(NoHandlerFoundException ex) {
//		log.error("=================404error안내===================");
//		log.error(ex);
//		log.info(ex);
//		return "page/error404";
//	}
//	@ExceptionHandler(Exception.class)
//	public String execpt(Exception ex) {
//			log.error("=================500error안내===================");
//			log.error(ex);
//			log.info(ex);
//		return "page/error500";
//	}
//}
