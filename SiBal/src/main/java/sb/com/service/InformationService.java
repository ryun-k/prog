package sb.com.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import sb.com.dao.InformationDAO;
import sb.com.util.PageUtil;
import sb.com.vo.InformationVO;

public class InformationService {
	@Autowired
	private InformationDAO iDAO;
	
	public PageUtil getPageInfo(int nowPage) {
		
		int totalCount = iDAO.getTotalCount();
		
		PageUtil pageInfo = new PageUtil(nowPage,totalCount,5,5);
		return pageInfo;
		
	}
	
	public ArrayList getInformationList(PageUtil pInfo) {
		
		int start = (pInfo.getNowPage()-1) * pInfo.getListCount()+1;
		int end   = start + pInfo.getListCount() -1;
		
		InformationVO vo = new InformationVO();
		vo.setStart(start);
		vo.setEnd(end);
		
		ArrayList list = iDAO.getInformationList(vo);
		return list;
	}
	
	//데이터입력 실행함수 호출
	public void inserInformation(InformationVO vo,
		HttpSession session,ArrayList list) {

//		String writer = (String)session.getAttribute("UID");
//		vo.setWriter(writer);
		
		iDAO.insertInformation(vo, "info");
		
		for(int i=0; i<list.size(); i++) {

			vo.setOriNo(vo.getNo());
			HashMap map =(HashMap)list.get(i);	
			vo.setPath((String)map.get("path"));
			vo.setOriName((String)map.get("oriName"));
			vo.setSaveName((String)map.get("saveName"));
			vo.setLen((Long)map.get("len"));
			
			iDAO.insertInformation(vo, "imageInfo");
		}
		
	}
	
	
	//조회수 증가 요청 처리함수
	public void updateHit(int No, HttpSession session) {

		boolean isHit = false; 
		ArrayList hitList = (ArrayList)session.getAttribute("HIT");
		
		if(hitList==null || hitList.size()==0) { 
			isHit = true;
			hitList = new ArrayList(); 
			hitList.add(No);
			session.setAttribute("HIT",hitList);
		}
		else if( !hitList.contains(No) ){
			isHit = true;
			hitList.add(No);
			session.setAttribute("HIT",hitList);
		}
		else { 
			isHit = false; 
		}
		
		if(isHit == true) {
			iDAO.updateHit(No);
		}
	}
}
