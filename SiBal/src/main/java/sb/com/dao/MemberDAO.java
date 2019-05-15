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
	
	//�α��� ���� ����
	public MemberVO loginProc(MemberVO vo) {
		MemberVO result = session.selectOne("member.loginProc",vo);
		return result;
	}

	//ȸ������ ���� ����
	public void signUpProc(MemberVO vo) {
		session.insert("member.signUp",vo);
	}
	
	//������� ���� ����
	public MemberVO memberInfo(MemberVO vo) {
		MemberVO info = session.selectOne("member.memberInfo",vo);
		return info;
	}
	
	//�������� ���� ����
	public void modifyProc(MemberVO vo) {
		session.update("member.infoModify",vo);
	}
	
	//ȸ��Ż�� ���� ����
	public void withdraw(MemberVO vo) {
		System.out.println("DAO="+vo.getNick());
		System.out.println("DAO="+vo.getPw());
		session.update("member.withdraw",vo);
	}
	
	//�߼��̸��� Ȯ������ ����
	public MemberVO pwCode(MemberVO vo) {
		System.out.println("DAO="+vo.getEmail());
		MemberVO code = session.selectOne("member.pwCode",vo);
		return code;
	}
	
	//�����ڵ� �������� ����
	public void setCode(MemberVO vo) {
		session.insert("member.setCode",vo);
	}
	
	//��� ������ ���� ����
	public void modifyPw(MemberVO vo) {
		session.update("member.modifyPw",vo);
		
	}
}
