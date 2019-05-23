package sb.com.service;

import java.util.ArrayList;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sb.com.dao.AdminDAO;
import sb.com.util.PageUtil;
import sb.com.vo.AdminVo;
import sb.com.vo.AirVO;

@Service
public class AdminService {
	@Autowired
	private AdminDAO adDAO;
	
	// 목록보기 페이징
	public PageUtil getPageInfo(int nowPage) {
		
		int totalCount = adDAO.getTotalCount();
		
		PageUtil pageInfo = new PageUtil(nowPage,totalCount,10,5);
		return pageInfo;
		
	}
	
	// 목록보기
	public ArrayList AdminList(PageUtil pInfo) {
		
		int start = (pInfo.getNowPage()-1) * pInfo.getListCount()+1;
		int end   = start + pInfo.getListCount() -1;
		
		AdminVo vo = new AdminVo();
		vo.setStart(start);
		vo.setEnd(end);
		
		ArrayList list = adDAO.adminList(vo);
		return list;
	}
	
	// 검색결과 카운트
	public PageUtil searchPage(AdminVo vo, int nowPage) {
		int searchCount = adDAO.searchCount(vo);
		
		PageUtil pageInfo = new PageUtil(nowPage,searchCount,10,5);
		return pageInfo;
	}
	
	// 검색하기
	public ArrayList searchList(PageUtil pInfo, String target, String word) {
		
		int start = (pInfo.getNowPage()-1) * pInfo.getListCount()+1;
		int end   = start + pInfo.getListCount() -1;
		
		AdminVo vo = new AdminVo();
		vo.setStart(start);
		vo.setEnd(end);
		vo.setTarget(target);
		vo.setWord(word);
				
		ArrayList searchList = adDAO.searchList(vo);
		
		return searchList;
	}
	
	// 상세보기
	public AdminVo detail(int no){
		AdminVo vo = adDAO.detail(no);
		return vo;
	}
	
	// 가는날 조회
	public ArrayList detailGair(AirVO vo) {
		ArrayList list = adDAO.detailGair(vo);
		return list;
	}
	
	// 오는날 조회
	public ArrayList detailBair(AirVO vo) {
		ArrayList list = adDAO.detailBair(vo);
		return list;
	}
	
	// 수정하기
	public void detailUpdate(AdminVo vo) {
		adDAO.detailUpdate(vo);
	}
}
