package sb.com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import sb.com.service.NoticeService;
import sb.com.vo.NoticeVo;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
//	private NoticeService nService;
	
	
	//공지사항 리스트
	@RequestMapping("/List")
	public void noticeList() {
		
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
	public void noticeWriteProc() {
		
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
