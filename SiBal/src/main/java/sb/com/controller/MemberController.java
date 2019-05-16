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
	
	//�α�����
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "member/loginForm";
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

	//Ż��� ��
	@RequestMapping("/withDraw")
	public String withDraw(HttpServletRequest request) {
		mService.logoutProc(request);
		return "member/withDraw";
	}
	//�̸��� ��ȿ�˻�
	@RequestMapping("/checkEmail")
	public ModelAndView checkEmail(MemberVO vo) {
		//email�� ���ԵȰ����� Ȯ��
		System.out.println(vo.getEmail());
		MemberVO check = mService.pwCode(vo);
		System.out.println("check="+check.getEmail());
		RedirectView rv= null;
		ModelAndView mv = null;
		if(check.getEmail().equals("0")) {
			String msg="�������� �ʴ� �̸����Դϴ�.";
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

	//��й�ȣ ã�� �����ڵ�
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
	String subject = "��й�ȣ ã�� �����ڵ� �ȳ�";
	
	String msg = "";
	msg += "<div align = 'center' style='border:1px solid black; font-family:verdana'>";
	msg += "<h1 style = 'color: blue;'> ��й�ȣ ã�� ���� �ڵ��Դϴ�..</h1>";
	msg += "<h3>��й�ȣ ã�� �������� ���ư� �����ڵ�</h3><h1> <strong>";
	msg += KeyCode+"</strong></h1><h3>�� �Է����ּ���.</h3></div><br/>	";
	
	try {
		Email.sendMail(vo.getEmail(),subject,msg);
	} catch (Exception e) {
		e.printStackTrace();
	}
	//vo�� Ű �ڵ带 �����Ű�� ������ ���Ѵ�.
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
	
	//�̸��� �ߺ� üũ
	@RequestMapping(value="/EmailCheck", method= RequestMethod.POST)
	public @ResponseBody String AjaxView(MemberVO vo) {
		System.out.println("ajax����,email");
		
		String str="";
		int emailCk = mService.dupleCk(vo);
		if(emailCk==1) {
			str="NO";
		}else {
			str="YES";
		}
		return str;
	}
	
	//�г��� �ߺ� üũ
	@RequestMapping(value="/NickCheck", method= RequestMethod.POST)
	public @ResponseBody String AjaxView1(MemberVO vo) {
		System.out.println("ajax����,nick");
		
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
	
	//ȸ��Ż�� ��� Ȯ��
	@RequestMapping(value="/withdrawProc", method=RequestMethod.POST)
	public @ResponseBody String WithdrawProc(MemberVO vo,HttpServletRequest request) {
		System.out.println("ajax����,Ż��ó��"+vo.getEmail());
		
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
	//�α��ν� ��� Ȯ�ΰ� �α��� ó��.
	@RequestMapping(value="/CheckProc", method=RequestMethod.POST)
	public @ResponseBody String CheckProc(MemberVO vo,HttpSession session) {
		System.out.println("ajax����,�α���ó��"+vo.getEmail());
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

}
