package sb.com.controller;

import java.util.ArrayList;

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
	
	@RequestMapping("/memberList")
	public ModelAndView MemberList() {
		ArrayList list = mService.memberList();
		ModelAndView mv = new ModelAndView();
		mv.addObject("LIST",list);
		mv.setViewName("/member/memberList");
		System.out.println("memberlist();");
		return mv;
	}
	@RequestMapping("/test")
	public ModelAndView test() {
		System.out.println("test");
		MemberVO vo= mService.test();
		ModelAndView mv = new ModelAndView();
		mv.addObject("VIEW",vo);
		mv.setViewName("/member/test");
		System.out.println(vo.getId());
		return mv;
	}
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "member/loginForm";
	}
	@RequestMapping("/loginProc")
	public ModelAndView loginProc(MemberVO vo, HttpSession session) {
		System.out.println("loginProc");
		mService.loginProc(vo,session);
		ModelAndView mv = new ModelAndView();
		RedirectView rv = new RedirectView("../member/loginForm.do");
		mv.setView(rv);
		System.out.println(session.getId());
		return mv;
	}
	@RequestMapping("/logoutForm")
	public void logoutForm() {
		
	}
	
	@RequestMapping("/logoutProc")
	public ModelAndView logoutProc(HttpServletRequest request) {
		System.out.println("logoutProc");
		mService.logoutProc(request);
		ModelAndView mv = new ModelAndView();
		RedirectView rv = new RedirectView("../member/logoutForm.do");
		mv.setView(rv);
		return mv;
	}
	
	//회원가입폼.
	@RequestMapping("/signUp")
	public String SignUp() {
		return "member/signUp";
	}
	//회원가입 처리
	@RequestMapping("/signUpProc")
	public ModelAndView SignUpProc(MemberVO vo) {
		System.out.println("signUpProc");
		mService.signUpProc(vo);
		ModelAndView mv = new ModelAndView();
		RedirectView rv = new RedirectView("../member/loginProc.do");
		mv.setView(rv);
		return mv;
	}
	
	//회원가입처리1
	@RequestMapping("/signUpProc1")
	public ModelAndView signUpProc1(MemberVO vo) {
		mService.signUpProc1(vo);
		ModelAndView mv = new ModelAndView();
		RedirectView rv = new RedirectView("../member/loginForm.do");
		mv.setView(rv);
		return mv;
	}
	
	@RequestMapping("/loginProc1")
	public ModelAndView loginProc1(MemberVO vo, HttpSession session) {
		System.out.println("loginProc1");
		mService.loginProc1(vo,session);
		ModelAndView mv = new ModelAndView();
		RedirectView rv = new RedirectView("../member/loginForm.do");
		mv.setView(rv);
		System.out.println(session.getId());
		return mv;
	}
}
