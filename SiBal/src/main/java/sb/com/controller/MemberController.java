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
	
	//로그인폼
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "member/loginForm";
	}
	//로그인처리
	@RequestMapping("/loginProc")
	public ModelAndView loginProc(MemberVO vo, HttpSession session) {
		System.out.println("loginProc");
		mService.loginProc(vo,session);
		ModelAndView mv = new ModelAndView();
		RedirectView rv = new RedirectView("../member/loginForm.do");
		mv.setView(rv);
		return mv;
	}
	//로그아웃폼
	@RequestMapping("/logoutForm")
	public void logoutForm() {
	}
	//로그아웃처리
	@RequestMapping("/logoutProc")
	public ModelAndView logoutProc(HttpServletRequest request) {
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
	
	//회원가입처리
	@RequestMapping("/signUpProc")
	public ModelAndView signUpProc(MemberVO vo) {
		mService.signUpProc(vo);
		ModelAndView mv = new ModelAndView();
		RedirectView rv = new RedirectView("../member/loginForm.do");
		mv.setView(rv);
		return mv;
	}
	//회원정보수정
	@RequestMapping("/modifyForm")
	public ModelAndView modifyform(MemberVO vo,HttpSession session) {
		String nick = (String)session.getAttribute("nick");
		vo.setNick(nick);
		MemberVO info = mService.memberInfo(vo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("INFO",info);
		mv.setViewName("member/modifyForm");
		return mv;
	}
}
