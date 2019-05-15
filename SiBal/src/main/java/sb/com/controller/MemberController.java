package sb.com.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import sb.com.service.MemberService;
import sb.com.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService mService; 
	
	//�α�����
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "member/loginForm";
	}
	//�α���ó��
	@RequestMapping("/loginProc")
	public ModelAndView loginProc(MemberVO vo, HttpSession session) {
		mService.loginProc(vo,session);
		ModelAndView mv = new ModelAndView();
		RedirectView rv = new RedirectView();
		mv.setView(rv);
		return mv;
	}
	//�α׾ƿ���
	@RequestMapping("/logoutForm")
	public void logoutForm() {
	}
	//�α׾ƿ�ó��
	@RequestMapping("/logoutProc")
	public ModelAndView logoutProc(HttpServletRequest request) {
		mService.logoutProc(request);
		ModelAndView mv = new ModelAndView();
		RedirectView rv = new RedirectView("../member/logoutForm.do");
		mv.setView(rv);
		return mv;
	}
	
	//ȸ��������.
	@RequestMapping("/signUp")
	public String SignUp() {
		return "member/signUp";
	}
	
	//ȸ������ó��
	@RequestMapping("/signUpProc")
	public ModelAndView signUpProc(MemberVO vo,ModelAndView mv) {
		mService.signUpProc(vo);
		RedirectView rv = new RedirectView("../member/loginForm.do");
		mv.setView(rv);
		return mv;
	}
	//ȸ����������
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(MemberVO vo,HttpSession session,ModelAndView mv) {
		String nick = (String)session.getAttribute("nick");
		vo.setNick(nick);
		MemberVO info = mService.memberInfo(vo);
		mv.addObject("INFO",info);
		mv.setViewName("member/modifyForm");
		return mv;
	}
	
	//ȸ������ ����ó��
	@RequestMapping("/modifyProc")
	public ModelAndView modifyProc(MemberVO vo,HttpSession session,ModelAndView mv) {
		mService.modifyProc(vo,session);
		mv.setViewName("member/loginForm");
		return mv;
	}
	
	//ȸ��Ż�� ��
	@RequestMapping("/withdrawForm")
	public ModelAndView withdrawForm(MemberVO vo, HttpSession session,ModelAndView mv) {
		String nick = (String)session.getAttribute("nick");
		vo.setNick(nick);
		MemberVO info = mService.memberInfo(vo);
		mv.addObject("INFO",info);
		mv.setViewName("member/withdrawForm");
		return mv;
	}
	//ȸ��Ż�� ó��
	@RequestMapping("/withdrawProc")
	public ModelAndView withdrawProc(MemberVO vo,HttpSession session,ModelAndView mv,HttpServletRequest request) {
		String nick = (String)session.getAttribute("nick");
		vo.setNick(nick);
		mService.withdraw(vo,request);
		mv.setViewName("member/loginForm");
		return mv;
	}
}
