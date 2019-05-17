package sb.com.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import sb.com.vo.MemberVO;

public class MemberDAO extends SqlSessionDaoSupport{
	@Autowired
	SqlSessionTemplate session;
	
	//로그인 쿼리 실행
	public MemberVO loginProc(MemberVO vo) {
		MemberVO result = session.selectOne("member.loginProc",vo);
		return result;
	}

	//회원가입 쿼리 실행
	public void signUpProc(MemberVO vo) {
		session.insert("member.signUp",vo);
	}
	
	//멤버정보 쿼리 실행
	public MemberVO memberInfo(MemberVO vo) {
		MemberVO info = session.selectOne("member.memberInfo",vo);
		return info;
	}
	
	//정보수정 쿼리 실행
	public void modifyProc(MemberVO vo) {
		session.update("member.infoModify",vo);
	}
	
	//회원탈퇴 쿼리 실행
	public void withdraw(MemberVO vo) {
		System.out.println("DAO="+vo.getPw());
		session.update("member.withdraw",vo);
	}
	
	//발송이메일 확인쿼리 실행
	public MemberVO pwCode(MemberVO vo) {
		System.out.println("DAO="+vo.getEmail());
		MemberVO code = session.selectOne("member.pwCode",vo);
		return code;
	}
	
	//인증코드 저장쿼리 실행
	public void setCode(MemberVO vo) {
		session.insert("member.setCode",vo);
	}
	
	//비번 재지정 쿼리 실행
	public void modifyPw(MemberVO vo) {
		session.update("member.modifyPw",vo);
	}
	
	//중복이메일,닉네임 확인 쿼리 실행
	public int dupleCk(MemberVO vo) {
		int str = session.selectOne("member.dupleCk",vo);
		return str;
	}
	
	//로그인,회원탈퇴 본인 확인 쿼리 실행
	public int CheckProc(MemberVO vo) {
		int str = session.selectOne("member.CheckProc",vo);
		return str;
	}
	
	//가입된 카카오 이메일 확인 쿼리 실행
	public int CheckKakao(MemberVO vo) {
		int str = session.selectOne("member.CheckKakao",vo);
		return str;
	}
	
	//카카오 로그인 쿼리 실행
	public int KakaoLogin(MemberVO vo) {
		int str = session.selectOne("member.KakaoLogin",vo);
		return str;
	}
	
	//카카오 권한 확인 쿼리 실행
	public MemberVO kakaostatus(MemberVO vo) {
		MemberVO result = session.selectOne("member.kakaostatus",vo);
		return result;
	}
}
