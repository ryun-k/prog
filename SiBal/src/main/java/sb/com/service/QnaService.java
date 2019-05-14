package sb.com.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sb.com.dao.QnaDAO;
import sb.com.util.PageUtil;
import sb.com.vo.QnaVo;

@Service
public class QnaService {
	@Autowired
	private QnaDAO qDAO;
	
	// 목록보기 페이징
	public PageUtil getPageInfo(int nowPage) {
		
		int totalCount = qDAO.getTotalCount();
		
		PageUtil pageInfo = new PageUtil(nowPage,totalCount,5,5);
		return pageInfo;
		
	}
	
	// 목록보기
	public ArrayList getQnaList(PageUtil pInfo) {
		
		int start = (pInfo.getNowPage()-1) * pInfo.getListCount()+1;
		int end   = start + pInfo.getListCount() -1;
		
		QnaVo vo = new QnaVo();
		vo.setStart(start);
		vo.setEnd(end);
		
		ArrayList list = qDAO.getQnaList(vo);
		return list;
	}
	// 질문 입력
	public void insertQ(HttpSession session,QnaVo vo) {
//		String id = (String)session.getAttribute("UID");
//		vo.setId(id);
		qDAO.insertQ(vo);
	}
	
	// 조회수 증가
	public void updateHit(int oriNo, HttpSession session) {
		boolean isHit = false; 
		ArrayList hitList = (ArrayList)session.getAttribute("HIT");
		
		if(hitList==null || hitList.size()==0) {
			isHit = true; 
			hitList = new ArrayList();
			hitList.add(oriNo); 
			session.setAttribute("HIT", hitList);
		}else if(!hitList.contains(oriNo)) {
			isHit = true; 
			hitList.add(oriNo); 
			session.setAttribute("HIT", hitList);
		}else {
			isHit= false;
		}
		if(isHit == true) {
			qDAO.updateHit(oriNo);
		}
	}
	
	// 상세보기
	public QnaVo getQnaView(int oriNo){
		QnaVo vo = qDAO.getQnaView(oriNo);
		return vo;
	}
	
	// 답변하기
	public void insertA(HttpSession session, QnaVo vo) {
//		String id = (String)session.getAttribute("UID");
//		vo.setId(id);
		
		vo.getRef();
		vo.setStep(vo.getStep()+1);
		vo.setDepth(vo.getDepth()+1);
		vo.setpNo(vo.getNo());
		// 관련글이 같고 순서번호가 1증가 시킨 값과 같거나 큰 데이터들의 순서번호를 모두 1증가시킨다.
		qDAO.updateStep(vo);
		qDAO.insertA(vo);
	}
	
	// 수정하기
	public void  updateQna(QnaVo vo) {
		qDAO.updateQna(vo);
	}
	
	// 삭제하기
	public void deleteQna(int oriNo) {
		qDAO.deleteQna(oriNo);	
	}
	
}
