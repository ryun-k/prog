package sb.com.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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
	public void noticeView() {
		
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
	public void noticeHitProc() {
		
	}
	
	//공지사항 수정 폼
	@RequestMapping("/modifyForm")
	public void noticeModifyForm() {
		
	}
	
	//공지사항 글쓰기 처리
	@RequestMapping("/modifyProc")
	public void noticeModifyProc() {
		
	}
	
	//글삭제 처리
	@RequestMapping("/deleteProc")
	public void noticeDeleteProc(){
		
	}
	
}
