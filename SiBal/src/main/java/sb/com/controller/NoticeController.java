package sb.com.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import sb.com.service.NoticeService;
import sb.com.util.PageUtil;
import sb.com.vo.NoticeVo;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService nService;
	
	
	//공지사항 리스트
	@RequestMapping("/List")
	public void noticeList(@RequestParam(value="nowPage", required=false, 	defaultValue="1") int nowPage,
			HttpServletRequest request
		) {
		//1. 파라미터 요청
		// user가 보고싶은 페이지를 알아내기 => @RequestParam이용
		/*만약 파라미터가 넘어오지 않을 경우   다른 값으로 대체할 수 있다	
		형식>@RequestParam(value="키값", required=false, defaultValue=?) 데이터타입 변수명*/			
		
		//2.비즈니스로직수행 ->서비스위임
		
			//2-1.페이징처리에 필요한 자료
			PageUtil pInfo = nService.getPageInfo(nowPage);
		
			//2-2.목록에 뿌릴 자료
			ArrayList list = nService.getBoardList(pInfo);
		
		//3.모델    정보를 뷰에게 전달해야한다
		request.setAttribute("LIST", list); //게시물내용
		request.setAttribute("PINFO", pInfo);//페이징처리
		
		//4.뷰 => 목록보기 페이지 보여줌
	}
	
	//공지사항 상세보기
	@RequestMapping("/View")
	public ModelAndView noticeView(@RequestParam(value="oriNo") int oriNo, @RequestParam(value="nowPage") int nowPage) {
		System.out.println("noticeView진입");
		System.out.println("oriNo "+oriNo);
		NoticeVo vo = nService.viewNotice(oriNo);
		System.out.println("viewNotice 서비스종료");
		ModelAndView mv = new ModelAndView();
		mv.addObject("VIEW",vo);
		mv.addObject("nowPage",nowPage);
		mv.setViewName("notice/View");
		
		return mv;
	}
	
	//공지사항 글쓰기폼
	@RequestMapping("/writeForm")
	public void noticeWriteForm() {
		
	}
	
	//공지사항 글쓰기 처리
	@RequestMapping("/writeProc")
	public ModelAndView noticeWriteProc(NoticeVo vo,ModelAndView mv) {
		System.out.println("writeProc 진입");
		nService.insertNotice(vo);
		System.out.println("nService종료");
		
		RedirectView rv = new RedirectView("../notice/List.do");
		mv.setView(rv);
		return mv;
	}
	
	//조회수 처리
	@RequestMapping("/hitProc")
	public ModelAndView	noticeHitProc(ModelAndView mv, HttpServletRequest req, HttpSession session) {
		String  strOriNo= req.getParameter("oriNo");
		int     oriNo = Integer.parseInt(strOriNo);
		String  nowPage = req.getParameter("nowPage"); 
		nService.hitNotice(oriNo);
		RedirectView rv = new RedirectView("../notice/View.do");
		
		rv.addStaticAttribute("oriNo", oriNo);
		rv.addStaticAttribute("nowPage", nowPage);
		mv.setView(rv);
		return mv;
	}
	
	//공지사항 수정 폼
	@RequestMapping("/modifyForm")
	public ModelAndView noticeModifyForm(HttpServletRequest req, ModelAndView mv) {
		String strOriNo = req.getParameter("oriNo");
		int    oriNo    = Integer.parseInt(strOriNo);
		String nowPage  = req.getParameter("nowPage");
		System.out.println("modifyForm oriNo "+oriNo);
		NoticeVo vo = nService.modifyNotice(oriNo);
		
		System.out.println(vo.getNo());
		System.out.println(vo.getOriNo());
		System.out.println(vo.getTitle());
		System.out.println(vo.getContent());
		System.out.println(vo.getStartDate());
		System.out.println(vo.getEndDate());
		System.out.println(vo.getwDate());
		System.out.println(vo.getHit());
		System.out.println(vo.getIsshow());
		
		
		
		
		mv.addObject("DATA",vo);
		mv.addObject("nowPage",nowPage);
		mv.setViewName("notice/modifyForm");
		return mv;
		
	}
	
	//공지사항 글쓰기 처리
	@RequestMapping("/modifyProc")
	public void noticeModifyProc(ModelAndView mv, HttpServletRequest req) {
		
		
	}
	
	//글삭제 처리
	@RequestMapping("/deleteProc")
	public void noticeDeleteProc(){
		
	}
	
}
