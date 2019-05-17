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
		
			
			MemberVO result = mDAO.loginProc(vo);
			if(result ==null) {
				System.out.println("������");
			}else {
				session.setAttribute("UID", result.getEmail());
				session.setAttribute("nick", result.getNick());
				session.setAttribute("status", result.getStatus());
				System.out.println(session.getAttribute("status"));
			}
		}

		//로그아웃 처리
		public void logoutProc(HttpServletRequest request) {
			request.getSession().removeAttribute("nick");
			request.getSession().removeAttribute("UID");
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
		
		//회원정보 수정처리, 닉네임의 세션을 새로 바꿔준 닉네임으로 변경,
		public void modifyProc(MemberVO vo,HttpSession session) {
			 mDAO.modifyProc(vo);
			 session.setAttribute("nick", vo.getNick());
		}
		
		
		
		//비번찾기 인증코드 발송을 위한 이메일확인 작업
		public MemberVO pwCode(MemberVO vo) {
			MemberVO code=mDAO.pwCode(vo);
			return code;
		}
		
		//인증코드저장
		public void setCode(MemberVO vo) {
			mDAO.setCode(vo);
		}
		
		//인증코드 작성후 비번 새로 지정하기
		public void modifyPw(MemberVO vo) {
			mDAO.modifyPw(vo);
		}
		
		//ajax 이메일과 닉네임 중복 확인
		public int dupleCk(MemberVO vo) {
			int str=mDAO.dupleCk(vo);
			return str;
		}
		
		//로그인,탈퇴시 비번 확인
		public	int CheckProc(MemberVO vo) {
			int str= mDAO.CheckProc(vo);
			return str;
		}
		//회원 탈퇴 , status를 바꿔주고 세션도 죽인다.
		public void withdraw(MemberVO vo,HttpServletRequest request) {
			mDAO.withdraw(vo);
			request.getSession().removeAttribute("nick");
			System.out.println(vo.getStatus());
		}
}
