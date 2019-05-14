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
	public HashMap loginProc(HashMap map) {
		HashMap result = session.selectOne("member.loginProc",map);
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
		System.out.println("DAO="+vo.getNick());
		System.out.println("DAO="+vo.getPw());
		session.update("member.withdraw",vo);
	}
}
