package sb.com.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import sb.com.service.AdminService;
import sb.com.util.PageUtil;
import sb.com.vo.AdminVo;
import sb.com.vo.AirVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adService;
	
	// 회원 목록
	@RequestMapping("/list")
	public void adminList(@RequestParam(value="nowPage", required=false, 	defaultValue="1") int nowPage, HttpServletRequest req){
		
		PageUtil pInfo = adService.getPageInfo(nowPage);
		ArrayList list = adService.AdminList(pInfo);
		
		req.setAttribute("LIST", list);
		req.setAttribute("PINFO", pInfo);
		
	}
	
	// 회원 검색하기
	@RequestMapping("/search")
	public ModelAndView search(HttpServletRequest req, ModelAndView mv) {
		String target = req.getParameter("target");
		String word = req.getParameter("word");
		String strNowPage = req.getParameter("nowPage");
		int nowPage = 1;
	
		if(strNowPage==null || strNowPage.length()==0) {
			nowPage =1;
		}else {
			nowPage = Integer.parseInt(strNowPage);
		}
		
		AdminVo vo = new AdminVo();
		vo.setTarget(target);
		vo.setWord(word);
		
		PageUtil pInfo = adService.searchPage(vo, nowPage);
		ArrayList list = adService.searchList(pInfo,target,word);
		
		mv.addObject("target",target);
		mv.addObject("word",word);
		mv.addObject("LIST",list);
		mv.addObject("PINFO",pInfo);
		
		mv.setViewName("admin/search");
		return mv;
	}
	// 회원 상세보기
	@RequestMapping("/detail")
	public ModelAndView detail(@RequestParam(value="nowPage") int nowPage, @RequestParam(value="no") int no , ModelAndView mv,
			@RequestParam(value="nick") String nick) {
		
		AdminVo vo = adService.detail(no);
		AirVO aVo = new AirVO();
		aVo.setNick(nick);
		ArrayList aList = adService.detailGair(aVo);
 		
		mv.addObject("no", no);
		mv.addObject("VIEW",vo);
		mv.addObject("nowPage",nowPage);
		mv.addObject("ALIST",aList);
		
		mv.setViewName("/admin/detail");
		return mv;
	}
}
