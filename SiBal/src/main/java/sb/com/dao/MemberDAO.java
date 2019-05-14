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
	
	//�α��� ���� ����
	public HashMap loginProc(HashMap map) {
		System.out.println("DAO");
		HashMap result = session.selectOne("member.loginProc",map);
		return result;
	}

	//ȸ������ ���� ����
	public void signUpProc(MemberVO vo) {
		SqlSession session = this.getSqlSession();
		session.insert("member.signUp",vo);
	}
	
	//������� ���� ����
	public MemberVO memberInfo(MemberVO vo) {
		SqlSession session = this.getSqlSession();
		MemberVO info = session.selectOne("member.memberInfo",vo);
		return info;
	}
}
