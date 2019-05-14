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

import sb.com.service.QnaService;
import sb.com.util.PageUtil;
import sb.com.vo.QnaVo;

@Controller
@RequestMapping("/qnaBoard")
public class QnaController {
	@Autowired
	private QnaService qService;
	
	// 목록보기
	@RequestMapping("/qnaList")
	public void qnaList(@RequestParam(value="nowPage", required=false, 	defaultValue="1") int nowPage, HttpServletRequest request){
		
		PageUtil pInfo = qService.getPageInfo(nowPage);
		
		ArrayList list = qService.getQnaList(pInfo);
		
		request.setAttribute("LIST", list);
		request.setAttribute("PINFO", pInfo);
		
	}
	// 질문하기 폼
	@RequestMapping("/qWriteForm")
	public void qWriterForm() {
		
		
	}
	
	// 질문하기
	@RequestMapping("/qWriteProc")
	public ModelAndView qWriteProc(ModelAndView mv, QnaVo vo, HttpSession session) {
		qService.insertQ(session,vo);
		RedirectView rv = new RedirectView("../qnaBoard/qnaList.do");
		mv.setView(rv);
		return mv;
	}
	
	// 조회수 증가
	@RequestMapping("/hitProc")
	public ModelAndView	boardHitProc(ModelAndView mv, HttpServletRequest req, HttpSession session) {
		String  strOriNo= req.getParameter("oriNo");
		int     oriNo = Integer.parseInt(strOriNo);
		String  nowPage = req.getParameter("nowPage"); 
		qService.updateHit(oriNo, session);
		RedirectView rv = new RedirectView("../qnaBoard/qnaView.do");
		
		rv.addStaticAttribute("oriNo", oriNo);
		rv.addStaticAttribute("nowPage", nowPage);
		mv.setView(rv);
		return mv;
	}
	
	// 상세보기
	@RequestMapping("/qnaView")
	public ModelAndView qnaView(@RequestParam(value="oriNo") int oriNo, @RequestParam(value="nowPage") int nowPage, ModelAndView mv) {
		QnaVo vo = qService.getQnaView(oriNo);
		
		mv.addObject("VIEW",vo);
		mv.addObject("nowPage",nowPage);
		
		mv.setViewName("/qnaBoard/qnaView");
		return mv;
	}
	
	// 답변하기 폼
		@RequestMapping("/aWriteForm")
		public void aWriterForm() {
		}
	
	// 답변하기
		@RequestMapping("/aWriteProc")
		public ModelAndView aWriteProc(ModelAndView mv, QnaVo vo, HttpSession session) {
			System.out.println(vo.getOriNo());
			qService.insertA(session,vo);
			RedirectView rv = new RedirectView("../qnaBoard/qnaList.do");
			mv.setView(rv);
			return mv;
		}
}
