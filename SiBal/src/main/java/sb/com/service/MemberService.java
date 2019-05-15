package sb.com.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sb.com.dao.MemberDAO;
import sb.com.vo.MemberVO;


public class MemberService {

		@Autowired
		private MemberDAO mDAO;
		
		//로그인처리
		public void loginProc(MemberVO vo, HttpSession session) {
			HashMap map = new HashMap();
			map.put("email", vo.getEmail());
			map.put("pw",vo.getPw());
			
			HashMap result = mDAO.loginProc(map);
			if(result ==null || result.size()==0) {
				System.out.println("값없음");
			}else {
				session.setAttribute("nick", result.get("NICK"));
				System.out.println("nick있음="+result.get("NICK"));
			}
		}

		//로그아웃 처리
		public void logoutProc(HttpServletRequest request) {
			request.getSession().removeAttribute("nick");
		}
		
		//회원가입 처리
		public void signUpProc(MemberVO vo) {
			mDAO.signUpProc(vo);
		}
		
		//회원정보 불러오기
		public MemberVO memberInfo(MemberVO vo) {
			System.out.println(vo.getNick());
			MemberVO info =mDAO.memberInfo(vo);
			return info;
		}
		
		//회원정보 수정처리,닉네임의 세션을 새로 바꿔준 닉네임으로 변경,
		public void modifyProc(MemberVO vo,HttpSession session) {
			 mDAO.modifyProc(vo);
			 session.setAttribute("nick", vo.getNick());
		}
		
		//회원 탈퇴 , status를 바꿔주고 세션도 죽인다.
		public void withdraw(MemberVO vo,HttpServletRequest request) {
			mDAO.withdraw(vo);
			request.getSession().removeAttribute("nick");
			System.out.println(vo.getStatus());
		}
}
