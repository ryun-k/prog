package sb.com.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
		System.out.println("DAO");
		HashMap result = session.selectOne("member.loginProc",map);
		return result;
	}

	//회원가입 쿼리 실행
	public void signUpProc(MemberVO vo) {
		SqlSession session = this.getSqlSession();
		session.insert("member.signUp",vo);
	}
	
	//멤버정보 쿼리 실행
	public MemberVO memberInfo(MemberVO vo) {
		SqlSession session = this.getSqlSession();
		MemberVO info = session.selectOne("member.memberInfo",vo);
		return info;
	}
}
