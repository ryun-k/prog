package sb.com.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheck extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("nick");
		
		if(id==null || id.length()==0) {
			// 로그인이 안된 경우
			response.sendRedirect("../page/check.do");
			
			return false;
		}else {
			// 로그인이 된 경우
			return true;
		}
	}

}
