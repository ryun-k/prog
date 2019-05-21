package sb.com.service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import sb.com.dao.MemberDAO;
import sb.com.vo.MemberVO;


public class MemberService {

	protected Logger log = Logger.getLogger(this.getClass());
		@Autowired
		private MemberDAO mDAO;
		
		//로그인처리
		public void loginProc(MemberVO vo, HttpSession session) {
		
			
			MemberVO result = mDAO.loginProc(vo);
			if(result ==null) {
				log.info("값없음");
			}else {
				session.setAttribute("UID", result.getEmail());
				session.setAttribute("nick", result.getNick());
				session.setAttribute("status", result.getStatus());
				log.info(session.getAttribute("status"));
			}
		}

		//로그아웃 처리
		public void logoutProc(HttpServletRequest request) {
			request.getSession().invalidate();
		}
		
		//회원가입 처리
		public void signUpProc(MemberVO vo) {
			 mDAO.signUpProc(vo);
			
		}
		
		//회원정보 불러오기
		public MemberVO memberInfo(MemberVO vo) {
			log.info(vo.getNick());
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
			request.getSession().invalidate();
			log.info(vo.getStatus());
		}
		//카카오이메일로 가입되었는지 확인
		public int CheckKakao(MemberVO vo) {
			int str = mDAO.CheckKakao(vo);
			return str;
		}
		//카카오로 로그인하기
		public int KakaoLogin(MemberVO vo) {
			int str = mDAO.KakaoLogin(vo);
			return str;
		}
		//카카오 회원 권한확인
public void kakaostatus(MemberVO vo, HttpSession session) {
		
			MemberVO result = mDAO.kakaostatus(vo);
			if(result ==null) {
				log.info("값없음");
			}else {
				session.setAttribute("UID", result.getEmail());
				session.setAttribute("nick", result.getNick());
				session.setAttribute("status", result.getStatus());
				log.info(session.getAttribute("status"));
			}
		}
}
