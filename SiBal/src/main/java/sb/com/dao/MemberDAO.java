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
	
	
	
	public ArrayList memberList() {
		System.out.println("DAO½ÇÇà");
		ArrayList result = (ArrayList)session.selectList("member.memberlist");
		return result;
//		return (ArrayList)getSqlSession().selectList("member.memberList");
		
	}

	public MemberVO test() {
		System.out.println("DAO");
		MemberVO vo = session.selectOne("member.test");
		return vo;
	}
	
	public HashMap loginProc(HashMap map) {
		System.out.println("DAO");
		HashMap result = session.selectOne("member.loginProc",map);
		return result;
	}
	
	public void signUpProc(MemberVO vo) {
		System.out.println("DAO"+vo.getId());
		SqlSession session = this.getSqlSession();
		System.out.println("DAO"+vo.getId());
		session.insert("member.signUp",vo);
	}
	
	public void signUpProc1(MemberVO vo) {
		SqlSession session = this.getSqlSession();
		session.insert("member.signUp1",vo);
	}
	
	public HashMap loginProc1(HashMap map) {
		System.out.println("DAO");
		HashMap result = session.selectOne("member.loginProc1",map);
		return result;
	}
	
}
