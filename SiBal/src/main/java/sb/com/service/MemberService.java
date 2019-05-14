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
				System.out.println("������"+result.get("NICK"));
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
}
