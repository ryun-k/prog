package sb.com.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import sb.com.service.MemberService;
import sb.com.util.Email;
import sb.com.util.FindUtil;
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
	
	//회원가입폼
	@RequestMapping("/signUp")
	public String SignUp() {
		return "member/signUp";
	}
	
	//회원가입처리
	@RequestMapping("/signUpProc")
	public ModelAndView signUpProc(MemberVO vo,ModelAndView mv) {
		mService.signUpProc(vo);
		RedirectView rv = new RedirectView("../member/loginForm.do");
		mv.setView(rv);
		return mv;
	}
	//회원정보수정
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(MemberVO vo,HttpSession session,ModelAndView mv) {
		String nick = (String)session.getAttribute("nick");
		vo.setNick(nick);
		MemberVO info = mService.memberInfo(vo);
		mv.addObject("INFO",info);
		mv.setViewName("member/modifyForm");
		return mv;
	}
	
	//회원정보 수정처리
	@RequestMapping("/modifyProc")
	public ModelAndView modifyProc(MemberVO vo,HttpSession session,ModelAndView mv) {
		mService.modifyProc(vo,session);
		mv.setViewName("member/loginForm");
		return mv;
	}
	
	//회원탈퇴폼
	@RequestMapping("/withdrawForm")
	public ModelAndView withdrawForm(MemberVO vo, HttpSession session,ModelAndView mv) {
		String nick = (String)session.getAttribute("nick");
		vo.setNick(nick);
		MemberVO info = mService.memberInfo(vo);
		mv.addObject("INFO",info);
		mv.setViewName("member/withdrawForm");
		return mv;
	}

	//탈퇴시뷰
	@RequestMapping("/withDraw")
	public String withDraw(HttpServletRequest request) {
		mService.logoutProc(request);
		return "member/withDraw";
	}
	//이메일 유효검사
	@RequestMapping("/checkEmail")
	public ModelAndView checkEmail(MemberVO vo) {
		//email이 가입된 것인지 확인
		System.out.println(vo.getEmail());
		MemberVO check = mService.pwCode(vo);
		System.out.println("check="+check.getEmail());
		RedirectView rv= null;
		ModelAndView mv = null;
		if(check.getEmail().equals("0")) {
			String msg="존재하지 않는 이메일입니다..";
			rv=new RedirectView("../member/loginForm.do");
			mv=new ModelAndView();
			mv.setView(rv);
			mv.addObject("MSG",msg);
			return mv;
		}else {
			
			rv=new RedirectView("../member/pwCode.do");
			mv=new ModelAndView();
			mv.addObject("email",check.getEmail());
		
			mv.setView(rv);
			return mv;
		}
		
	}

	//비밀번호 찾기 인증 코드
	@RequestMapping("/pwCode")
	public ModelAndView pwCode(MemberVO vo, HttpSession session) {
		RedirectView rv=new RedirectView();
		ModelAndView mv= new ModelAndView();
		
		String KeyCode=null;
	try {
		KeyCode = FindUtil.createkey();
	} catch (Exception e) {
		e.printStackTrace();
	}
	String subject = "비밀번호 찾기 인증코드 안내";
	
	String msg = "";
	msg += "<div align = 'center' style='border:1px solid black; font-family:verdana'>";
	msg += "<h1 style = 'color: blue;'> 비밀번호 찾기 인증 코드입니다..</h1>";
	msg += "<h3>비밀번호 찾기 페이지로 돌아가 인증코드</h3><h1> <strong>";
	msg += KeyCode+"</strong></h1><h3>를 입력해주세요.</h3></div><br/>	";
	
	try {
		Email.sendMail(vo.getEmail(),subject,msg);
	} catch (Exception e) {
		e.printStackTrace();
	}
	//vo에 키 코드를 저장시키고 폼에서 비교한다.
	vo.setCheck(KeyCode);
	
	mService.setCode(vo);
	return mv;
	}
	
	@RequestMapping("/modifyPw")
	public ModelAndView modifyPw(MemberVO vo) {
		
		mService.modifyPw(vo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/loginForm");
		return mv;
	}
	
	//이메일 중복체크
	@RequestMapping(value="/EmailCheck", method= RequestMethod.POST)
	public @ResponseBody String AjaxView(MemberVO vo) {
		System.out.println("ajax실행,email");
		
		String str="";
		int emailCk = mService.dupleCk(vo);
		if(emailCk==1) {
			str="NO";
		}else {
			str="YES";
		}
		return str;
	}
	
	//닉네임 중복 체크
	@RequestMapping(value="/NickCheck", method= RequestMethod.POST)
	public @ResponseBody String AjaxView1(MemberVO vo) {
		System.out.println("ajax실행,nick");
		
		String str="";
		int nickCk = mService.dupleCk(vo);
		System.out.println(nickCk);
		if(nickCk==1) {
			str="NO";
		}else {
			str="YES";
		}
		return str;
	}
	
	//회원탈퇴 비번 확인
	@RequestMapping(value="/withdrawProc", method=RequestMethod.POST)
	public @ResponseBody String WithdrawProc(MemberVO vo,HttpServletRequest request) {
		System.out.println("ajax연결,탈퇴처리"+vo.getEmail());
		
		String str="";
		int ok = mService.CheckProc(vo);
		if(ok==1) {
			mService.withdraw(vo,request);
			str="YES";
		}else {
			str="NO";
		}
		return str;
	}
	//로그인시 비번 확인과 로그인 처리.
	@RequestMapping(value="/CheckProc", method=RequestMethod.POST)
	public @ResponseBody String CheckProc(MemberVO vo,HttpSession session) {
		System.out.println("ajax연결,로그인처리"+vo.getEmail());
		String str="";
		int ok = mService.CheckProc(vo);
		if(ok==1) {
			mService.loginProc(vo,session);
			String strStatus = (String)session.getAttribute("status");
			int status = Integer.parseInt(strStatus);
			if(status==1) {
				str="YES1";
			}else if(status==0){
				str="YES2";
			}
		}else {
			str="NO";
		}
		return str;
	}
	
	//카카오 이메일로 이미 가입되어있는지 확인
	@RequestMapping(value="/CheckKakao", method=RequestMethod.POST)
	public @ResponseBody String CheckKakao(MemberVO vo) {
	System.out.println("ajax실행,카카오");
		
	String str="";
	int ok = mService.CheckKakao(vo);
	if(ok==1) {
		str="YES";
	}else {
		System.out.println("0반환");
		//가입시킨다.
		mService.signUpProc(vo);
		str="NO";
	}
	return str;
	}
	
	//카카오로 로그인처리
	@RequestMapping(value="/KakaoLogin", method=RequestMethod.POST)
	public @ResponseBody String KakaoLogin(MemberVO vo,HttpSession session) {
		System.out.println("ajaxt실행,카카오 로그인");
		String str="";
		int ok = mService.KakaoLogin(vo);
		if(ok==1) {
			//로그인실행
			mService.kakaostatus(vo,session);
			String strStatus = (String)session.getAttribute("status");
			int status = Integer.parseInt(strStatus);
			if(status==1) {
				str="YES1";
			}else if(status==0) {
				str="YES2";
			}
		}else {
			str="NO";
		}
		return str;
	}
}
