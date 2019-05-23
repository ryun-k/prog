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
	public void qnaList(@RequestParam(value="nowPage", required=false, 	defaultValue="1") int nowPage, HttpServletRequest req){
		
		PageUtil pInfo = qService.getPageInfo(nowPage);
		ArrayList list = qService.getQnaList(pInfo);
		
		req.setAttribute("LIST", list);
		req.setAttribute("PINFO", pInfo);
		
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
	
	// 상세보기 (댓글리스트 추가)
	@RequestMapping("/qnaView")
	public ModelAndView qnaView(@RequestParam(value="nowPage") int nowPage, @RequestParam(value="oriNo") int oriNo ,
			@RequestParam(value="reNowPage", required=false, defaultValue="1") int reNowPage, 
			ModelAndView mv) {
		
		QnaVo vo = qService.getQnaView(oriNo);
		
		PageUtil pInfo = qService.repPageInfo(reNowPage,oriNo);
		ArrayList list = qService.repList(pInfo,oriNo);
		
		mv.addObject("LIST", list);
		mv.addObject("PINFO", pInfo);
		mv.addObject("oriNo", oriNo);
		mv.addObject("VIEW",vo);
		mv.addObject("nowPage",nowPage);
		mv.addObject("reNowPage",reNowPage);
		
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
		qService.insertA(session,vo);
		RedirectView rv = new RedirectView("../qnaBoard/qnaList.do");
		mv.setView(rv);
		return mv;
	}
	
	// 수정하기 폼
	@RequestMapping("/qnaModifyForm")
	public ModelAndView  modifyForm(HttpServletRequest req, ModelAndView mv) {
		String strOriNo = req.getParameter("oriNo");
		int    oriNo    = Integer.parseInt(strOriNo);
		String nowPage  = req.getParameter("nowPage");
		
		QnaVo vo= qService.getQnaView(oriNo);
		
		mv.addObject("VIEW",vo);
		mv.addObject("nowPage",nowPage);
		mv.setViewName("qnaBoard/qnaModifyForm");	
		return mv;
	}
	
	// 수정하기
	@RequestMapping("/qnaModifyProc")
	public ModelAndView  modifyProc(HttpServletRequest req, ModelAndView mv, QnaVo vo) {
		String strOriNo = req.getParameter("oriNo");
		int    oriNo    = Integer.parseInt(strOriNo);
		String nowPage  = req.getParameter("nowPage");
		
		qService.updateQna(vo);
		RedirectView rv = new RedirectView("../qnaBoard/qnaView.do");
		mv.addObject("VIEW",vo);
		mv.addObject("oriNo",oriNo);
		mv.addObject("nowPage",nowPage);
		mv.setView(rv);	
		return mv;
	}
	
	// 삭제하기
	@RequestMapping("/deleteProc")
	public ModelAndView  deleteProc(HttpServletRequest req, ModelAndView mv) {
		String strOriNo = req.getParameter("oriNo");
		int    oriNo    = Integer.parseInt(strOriNo);
		String nowPage  = req.getParameter("nowPage");
		
		qService.deleteQna(oriNo);
		RedirectView rv = new RedirectView("../qnaBoard/qnaList.do");
		mv.addObject("oriNo",oriNo);
		mv.addObject("nowPage",nowPage);
		mv.setView(rv);	
		return mv;
	}
	
	// 검색하기
	@RequestMapping("/qnaSearch")
	public ModelAndView qnaSearch(HttpServletRequest req, ModelAndView mv) {
		String target = req.getParameter("target");
		String word = req.getParameter("word");
		String strNowPage = req.getParameter("nowPage");
		int nowPage = 1;
	
		if(strNowPage==null || strNowPage.length()==0) {
			nowPage =1;
		}else {
			nowPage = Integer.parseInt(strNowPage);
		}
		
		QnaVo vo = new QnaVo();
		vo.setTarget(target);
		vo.setWord(word);
		
		PageUtil pInfo = qService.getSearchPage(vo, nowPage);
		ArrayList list = qService.getSearchList(pInfo,target,word);
		
		mv.addObject("target",target);
		mv.addObject("word",word);
		mv.addObject("LIST",list);
		mv.addObject("PINFO",pInfo);
		
		mv.setViewName("qnaBoard/qnaSearch");
		return mv;
	}
	
	// 댓글 입력
	@RequestMapping("/repWrite")
	public ModelAndView repWrite(@RequestParam(value="reNowPage") int reNowPage ,@RequestParam(value="nowPage") int nowPage,
			@RequestParam(value="oriNo") int oriNo ,ModelAndView mv, QnaVo vo, HttpSession session) {
			
		qService.repInsert(session,vo);
		RedirectView rv = new RedirectView("../qnaBoard/qnaView.do");
		mv.addObject("oriNo", oriNo);
		mv.addObject("nowPage",nowPage);
		mv.addObject("reNowPage",reNowPage);
		mv.setView(rv);
		return mv;
	}
	
	// 대댓글 입력
	@RequestMapping("/repRepWrite")
	public ModelAndView repRepWrite(@RequestParam(value="reNowPage") int reNowPage, @RequestParam(value="nowPage") int nowPage,
			@RequestParam(value="oriNo") int oriNo ,ModelAndView mv, QnaVo vo, HttpSession session,
			HttpServletRequest req) {
		String strReDepth = req.getParameter("reDepth");
		int reDepth = Integer.parseInt(strReDepth);
		String strReNo = req.getParameter("reNo");
		int reNo = Integer.parseInt(strReNo);
		
		vo.setReNo(reNo);
		vo.setReDepth(reDepth);
		
		qService.repRepInsert(session,vo);
		RedirectView rv = new RedirectView("../qnaBoard/qnaView.do");
		mv.addObject("oriNo", oriNo);
		mv.addObject("nowPage",nowPage);
		mv.addObject("reNowPage",reNowPage);
		mv.setView(rv);
		return mv;
	}
	
	// 수정하기
	@RequestMapping("/repUpdate")
	public ModelAndView  repUpdate(HttpServletRequest req, ModelAndView mv, QnaVo vo) {
		String strOriNo = req.getParameter("oriNo");
		int    oriNo    = Integer.parseInt(strOriNo);
		String strReNo = req.getParameter("reNo");
		int    reNo    = Integer.parseInt(strReNo);
		String nowPage  = req.getParameter("nowPage");
		String reNowPage  = req.getParameter("reNowPage");
		
		vo.setReNo(reNo);
		
		qService.repUpdate(vo);
		RedirectView rv = new RedirectView("../qnaBoard/qnaView.do");
		mv.addObject("oriNo",oriNo);
		mv.addObject("reNowPage",reNowPage);
		mv.addObject("nowPage",nowPage);
		mv.setView(rv);	
		return mv;
	}
	
	// 삭제하기
	@RequestMapping("/repDelete")
	public ModelAndView  repDelete(HttpServletRequest req, ModelAndView mv, QnaVo vo) {
		String strOriNo = req.getParameter("oriNo");
		int    oriNo    = Integer.parseInt(strOriNo);
		String strReNo = req.getParameter("reNo");
		int    reNo    = Integer.parseInt(strReNo);
		String reNowPage  = req.getParameter("reNowPage");
		String nowPage  = req.getParameter("nowPage");
		String strRePNo  = req.getParameter("rePNo");
		int    rePNo    = Integer.parseInt(strRePNo);
		
		vo.setReNo(reNo);
		vo.setRePNo(rePNo);
		
		qService.repDelete(vo);
		RedirectView rv = new RedirectView("../qnaBoard/qnaView.do");
		mv.addObject("oriNo",oriNo);
		mv.addObject("reNowPage",reNowPage);
		mv.addObject("nowPage",nowPage);
		mv.setView(rv);	
		return mv;
	}
	
	
}
