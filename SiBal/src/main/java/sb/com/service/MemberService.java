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
			HashMap map = new HashMap();
			map.put("email", vo.getEmail());
			map.put("pw",vo.getPw());
			
			HashMap result = mDAO.loginProc(map);
			if(result ==null || result.size()==0) {
				System.out.println("������");
			}else {
				session.setAttribute("nick", result.get("NICK"));
				System.out.println("nick����="+result.get("NICK"));
			}
		}

		//�α׾ƿ� ó��
		public void logoutProc(HttpServletRequest request) {
			request.getSession().removeAttribute("nick");
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
		
		//ȸ�� Ż�� , status�� �ٲ��ְ� ���ǵ� ���δ�.
		public void withdraw(MemberVO vo,HttpServletRequest request) {
			mDAO.withdraw(vo);
			request.getSession().removeAttribute("nick");
			System.out.println(vo.getStatus());
		}
}
