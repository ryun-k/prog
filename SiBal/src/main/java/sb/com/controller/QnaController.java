package sb.com.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import sb.com.service.QnaService;
import sb.com.util.PageUtil;

@Controller
@RequestMapping("/qnaBoard")
public class QnaController {
	@Autowired
	private QnaService qService;
	
	@RequestMapping("/qnaList")
	public void qnaList(@RequestParam(value="nowPage", required=false, 	defaultValue="1") int nowPage, HttpServletRequest request){
		
		PageUtil pInfo = qService.getPageInfo(nowPage);
		
		ArrayList list = qService.getQnaList(pInfo);
		
		request.setAttribute("LIST", list);
		request.setAttribute("PINFO", pInfo);
		
	}
}
