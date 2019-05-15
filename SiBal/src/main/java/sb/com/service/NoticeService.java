package sb.com.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import sb.com.dao.NoticeDAO;
import sb.com.util.PageUtil;
import sb.com.vo.NoticeVo;

public class NoticeService {
	@Autowired
	private NoticeDAO nDAO;
	
	//페이징처리 실행함수
	public PageUtil getPageInfo(int nowPage) {
		//총 데이터 개수 구하자
		int totalCount = nDAO.getTotalCount();
		System.out.println("totalCount "+totalCount);
		PageUtil pageInfo = new PageUtil(nowPage,totalCount,5,5);
		return pageInfo;
	}
	
	//목록을 구하는 함수
	public ArrayList getBoardList(PageUtil  pInfo){

		int start = (pInfo.getNowPage()-1) * pInfo.getListCount()+1;
		int end   = start + pInfo.getListCount() -1;
		
		NoticeVo vo = new NoticeVo();
		vo.setStart(start);
		vo.setEnd(end);
		
		ArrayList list = nDAO.getNoticeList(vo);
		return list;
	}
	
	//insert
	public void insertNotice(NoticeVo vo) {
		System.out.println("insertNotice()");
		nDAO.insertNotice(vo);
	}
	
	//view
	public void viewNotice(int oriNo) {
		System.out.println("viewNotice");
		nDAO.getView(oriNo);
	}
	
	//modify
	public void modifyNotice(NoticeVo vo,int oriNo) {
		System.out.println("modifyNotice");
		nDAO.modifyNotice(vo, oriNo);
	}
	
	//hit
	public void hitNotice(int oriNo) {
		System.out.println("hitNotice");
		nDAO.hitNotice(oriNo);
	}
	
	//delete
	public void deleteNotice(int oriNo) {
		System.out.println("deleteNotice");
		nDAO.getView(oriNo);
	}
}
