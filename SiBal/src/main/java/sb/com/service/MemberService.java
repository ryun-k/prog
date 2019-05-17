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
		
		//�α���ó��
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

		//�α׾ƿ� ó��
		public void logoutProc(HttpServletRequest request) {
			request.getSession().removeAttribute("nick");
			request.getSession().removeAttribute("UID");
		}
		
		//ȸ������ ó��
		public void signUpProc(MemberVO vo) {
			mDAO.signUpProc(vo);
		}
		
		//ȸ������ �ҷ�����
		public MemberVO memberInfo(MemberVO vo) {
			System.out.println(vo.getNick());
			MemberVO info =mDAO.memberInfo(vo);
			return info;
		}
		
		//ȸ������ ����ó��,�г����� ������ ���� �ٲ��� �г������� ����,
		public void modifyProc(MemberVO vo,HttpSession session) {
			 mDAO.modifyProc(vo);
			 session.setAttribute("nick", vo.getNick());
		}
		
		
		
		//���ã�� �����ڵ� �߼��� ���� �̸���Ȯ�� �۾�
		public MemberVO pwCode(MemberVO vo) {
			MemberVO code=mDAO.pwCode(vo);
			return code;
		}
		
		//�����ڵ�����
		public void setCode(MemberVO vo) {
			mDAO.setCode(vo);
		}
		
		//�����ڵ� �ۼ��� ��� ���� �����ϱ�
		public void modifyPw(MemberVO vo) {
			mDAO.modifyPw(vo);
		}
		
		//ajax �̸��ϰ� �г��� �ߺ� Ȯ��
		public int dupleCk(MemberVO vo) {
			int str=mDAO.dupleCk(vo);
			return str;
		}
		
		//�α���,Ż��� ��� Ȯ��
		public	int CheckProc(MemberVO vo) {
			int str= mDAO.CheckProc(vo);
			return str;
		}
		//ȸ�� Ż�� , status�� �ٲ��ְ� ���ǵ� ���δ�.
		public void withdraw(MemberVO vo,HttpServletRequest request) {
			mDAO.withdraw(vo);
			request.getSession().removeAttribute("nick");
			System.out.println(vo.getStatus());
		}
}
