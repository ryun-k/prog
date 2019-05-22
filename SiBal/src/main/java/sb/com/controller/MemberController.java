package sb.com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import sb.com.service.MemberService;
import sb.com.util.Email;
import sb.com.util.FindUtil;
import sb.com.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {

	protected Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private MemberService mService;

	// 로그인폼
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "member/loginForm";
	}

	// 로그아웃폼
	@RequestMapping("/logoutForm")
	public void logoutForm() {
		log.info("로그아웃");
	}

	// 로그아웃처리
	@RequestMapping("/logoutProc")
	public String  logoutProc(HttpServletRequest request) {
		mService.logoutProc(request);

		return "redirect:logoutForm.do";
	}

	// 회원가입폼
	@RequestMapping("/signUp")
	public String SignUp() {
		return "member/signUp";
	}

	// 회원가입처리
	@RequestMapping("/signUpProc")
	public ModelAndView signUpProc(MemberVO vo, ModelAndView mv) {
		mService.signUpProc(vo);
		RedirectView rv = new RedirectView("../member/loginForm.do");
		mv.setView(rv);
		return mv;
	}

	// 회원정보수정
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(MemberVO vo, HttpSession session, ModelAndView mv) {
		String nick = (String) session.getAttribute("nick");
		vo.setNick(nick);
		MemberVO info = mService.memberInfo(vo);
		mv.addObject("INFO", info);
		mv.setViewName("member/modifyForm");
		return mv;
	}

	// 회원정보 수정처리
	@RequestMapping("/modifyProc")
	public ModelAndView modifyProc(MemberVO vo, HttpSession session, ModelAndView mv, RedirectView rv) {
		mService.modifyProc(vo, session);
		rv = new RedirectView("../member/infoForm.do");
		mv.setView(rv);
		return mv;
	}

	// 회원정보보기
	@RequestMapping("/infoForm")
	public ModelAndView InfoForm(MemberVO vo, HttpSession session, ModelAndView mv) {
		String nick = (String) session.getAttribute("nick");
		vo.setNick(nick);
		MemberVO info = mService.memberInfo(vo);
		mv.addObject("INFO", info);
		mv.setViewName("member/infoForm");
		return mv;
	}

	// 회원탈퇴폼
	@RequestMapping("/withdrawForm")
	public ModelAndView withdrawForm(MemberVO vo, HttpSession session, ModelAndView mv) {
		String nick = (String) session.getAttribute("nick");
		vo.setNick(nick);
		MemberVO info = mService.memberInfo(vo);
		mv.addObject("INFO", info);
		mv.setViewName("member/withdrawForm");
		return mv;
	}

	// 탈퇴시뷰
	@RequestMapping("/withDraw")
	public String withDraw(HttpServletRequest request) {
		mService.logoutProc(request);
		return "member/withDraw";
	}

	// 이메일 유효검사
	@RequestMapping("/checkEmail")
	public ModelAndView checkEmail(MemberVO vo) {
		// email이 가입된 것인지 확인
		log.info(vo.getEmail());
		MemberVO check = mService.pwCode(vo);
		log.info("check=" + check.getEmail());
		RedirectView rv = null;
		ModelAndView mv = null;
		if (check.getEmail().equals("0")) {
			//String msg="존재하지 않는 이메일입니다..";
			rv = new RedirectView("../member/loginForm.do");
			mv = new ModelAndView();
			mv.setView(rv);
			//mv.addObject("MSG",msg);
			return mv;
		} else {

			rv = new RedirectView("../member/findCode.do");
			mv = new ModelAndView();
			mv.addObject("email", vo.getEmail());

			mv.setView(rv);
			return mv;
		}

	}

	// 비밀번호 찾기 인증 코드
	@RequestMapping("/findCode")
	public ModelAndView findCode(MemberVO vo, HttpSession session) {
		log.info(vo.getEmail());
		RedirectView rv = new RedirectView();
		ModelAndView mv = new ModelAndView();
		String email = vo.getEmail();
		String KeyCode = null;
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
		msg += KeyCode + "</strong></h1><h3>를 입력해주세요.</h3></div><br/>	";

		try {
			Email.sendMail(vo.getEmail(), subject, msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// vo에 키 코드를 저장시키고 폼에서 비교한다.
		vo.setCheck(KeyCode);
		mService.setCode(vo);
		mv.addObject("INFO", email);
		return mv;
	}

	// 로그아웃 상태에서의 비번 찾기
	@RequestMapping("/findPw")
	public ModelAndView findPw(MemberVO vo) {
		log.info("비번설정완료");
		mService.modifyPw(vo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/loginForm");
		return mv;
	}

	// 비밀번호 변경 인증 코드
	@RequestMapping("/pwCode")
	public ModelAndView pwCode(MemberVO vo, HttpSession session) {
		log.info(vo.getEmail());
		RedirectView rv = new RedirectView();
		ModelAndView mv = new ModelAndView();
		String email = null;
		email = vo.getEmail();
		String KeyCode = null;
		try {
			KeyCode = FindUtil.createkey();
		} catch (Exception e) {
			e.printStackTrace();
		}
		String subject = "비밀번호 변경하기 인증코드 안내";

		String msg = "";
		msg += "<div align = 'center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h1 style = 'color: blue;'> 비밀번호 변경하기 인증 코드입니다..</h1>";
		msg += "<h3>비밀번호 변경하기 페이지로 돌아가 인증코드</h3><h1> <strong>";
		msg += KeyCode + "</strong></h1><h3>를 입력해주세요.</h3></div><br/>	";

		try {
			Email.sendMail(vo.getEmail(), subject, msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// vo에 키 코드를 저장시키고 폼에서 비교한다.
		vo.setCheck(KeyCode);
		mService.setCode(vo);

		mv.addObject("INFO", email);
		return mv;
	}

	// 로그인상태에서의 비번 변경
	@RequestMapping("/modifyPw")
	public ModelAndView modifyPw(MemberVO vo, RedirectView rv) {

		mService.modifyPw(vo);
		ModelAndView mv = new ModelAndView();
		rv = new RedirectView("../member/infoForm.do");
		mv.setView(rv);
		return mv;
	}

	// 이메일 중복체크
	@RequestMapping(value = "/EmailCheck", method = RequestMethod.POST)
	public @ResponseBody String AjaxView(MemberVO vo) {
		log.info("ajax실행,email");
		String str = "";
		int emailCk = mService.dupleCk(vo);
		if (emailCk == 1) {
			str = "NO";
		} else {
			str = "YES";
		}
		return str;
	}

	// 닉네임 중복 체크
	@RequestMapping(value = "/NickCheck", method = RequestMethod.POST)
	public @ResponseBody String AjaxView1(MemberVO vo) {
		log.info("ajax실행,nick");

		String str = "";
		int nickCk = mService.dupleCk(vo);
		log.info(nickCk);
		if (nickCk == 1) {
			str = "NO";
		} else {
			str = "YES";
		}
		return str;
	}

	// 회원탈퇴 비번 확인
	@RequestMapping(value = "/withdrawProc", method = RequestMethod.POST)
	public @ResponseBody String WithdrawProc(MemberVO vo, HttpServletRequest request) {
		log.info("ajax연결,탈퇴처리" + vo.getEmail());
		String str = "";
		int ok = mService.CheckProc(vo);
		if (ok == 1) {
			mService.withdraw(vo, request);
			str = "YES";
		} else {
			str = "NO";
		}
		return str;
	}

	// 로그인시 비번 확인과 로그인 처리.
	@RequestMapping(value = "/CheckProc", method = RequestMethod.POST)
	public @ResponseBody String CheckProc(MemberVO vo, HttpSession session) {
		log.info("ajax연결,로그인처리" + vo.getEmail());
		String str = "";
		int ok = mService.CheckProc(vo);
		if (ok == 1) {
			mService.loginProc(vo, session);
			String strStatus = (String) session.getAttribute("status");
			int status = Integer.parseInt(strStatus);
			if (status == 1) {
				str = "YES1";
			} else if (status == 0) {
				str = "YES2";
			}
		} else {
			str = "NO";
		}
		return str;
	}

	// 카카오 이메일로 이미 가입되어있는지 확인
	@RequestMapping(value = "/CheckKakao", method = RequestMethod.POST)
	public @ResponseBody String CheckKakao(MemberVO vo) {
		log.info("ajax실행,카카오");
		String str = "";
		int ok = mService.CheckKakao(vo);
		if (ok == 1) {
			str = "YES";
		} else {
			log.info("0반환");
			// 가입시킨다.
			mService.signUpProc(vo);
			str = "NO";
		}
		return str;
	}

	// 카카오로 로그인처리
	@RequestMapping(value = "/KakaoLogin", method = RequestMethod.POST)
	public @ResponseBody String KakaoLogin(MemberVO vo, HttpSession session) {
		log.info("ajax실행,카카오로그인");
		String str = "";
		int ok = mService.KakaoLogin(vo);
		if (ok == 1) {
			// 로그인실행
			mService.kakaostatus(vo, session);
			String strStatus = (String) session.getAttribute("status");
			int status = Integer.parseInt(strStatus);
			if (status == 1) {
				str = "YES1";
			} else if (status == 0) {
				str = "YES2";
			}
		} else {
			str = "NO";
		}
		return str;
	}
	
	@RequestMapping(value="/codeValid", method=RequestMethod.POST)
	public @ResponseBody String CodeValid(MemberVO vo) {
		log.info("ajax실행,인증코드 유효검사");
		String str="";
		int ok= mService.codeValid(vo);
		if (ok==1) {
			//코드가 유효
			str = "YES";
		}else {
			//잘못된 인증번호
			str = "NO";
		}
		return str;
	}
	

	@RequestMapping("/test100")
	public void test100() {
		
	}
}
