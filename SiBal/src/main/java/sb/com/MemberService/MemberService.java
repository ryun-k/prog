package sb.com.MemberService;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sb.com.MemberDAO.MemberDAO;
import sb.com.MemberVO.MemberVO;


public class MemberService {

		@Autowired
		private MemberDAO mDAO;
		
		public ArrayList memberList() {
			ArrayList list = mDAO.memberList();
			System.out.println("service실행");
			return list;
		}
		
		public MemberVO test() {
			MemberVO result  = mDAO.test();
			System.out.println("service");
			return result;
			
		}
		
		public void loginProc(MemberVO vo, HttpSession session) {
			
			HashMap map = new HashMap();
			map.put("id", vo.getId());
			map.put("pw",vo.getPw());
			
			HashMap result = mDAO.loginProc(map);
			if(result ==null || result.size()==0) {
				System.out.println("값없음");
			}else {
				session.setAttribute("UID", result.get("ID"));
				session.setAttribute("UNICK", result.get("NICK"));
				System.out.println("값있음"+result.get("NICK"));
			}
		}
		
		public void logoutProc(HttpServletRequest request) {
			request.getSession().removeAttribute("UID");
		}
		
		public void signUpProc(MemberVO vo) {
			System.out.println("service");
			mDAO.signUpProc(vo);
		}
}
