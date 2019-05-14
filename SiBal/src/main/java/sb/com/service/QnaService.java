package sb.com.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sb.com.dao.QnaDAO;
import sb.com.util.PageUtil;
import sb.com.vo.QnaVo;

@Service
public class QnaService {
	@Autowired
	private QnaDAO qDAO;
	
	public PageUtil getPageInfo(int nowPage) {
		
		int totalCount = qDAO.getTotalCount();
		
		PageUtil pageInfo = new PageUtil(nowPage,totalCount,5,5);
		return pageInfo;
		
	}
	
	public ArrayList getQnaList(PageUtil pInfo) {
		
		int start = (pInfo.getNowPage()-1) * pInfo.getListCount()+1;
		int end   = start + pInfo.getListCount() -1;
		
		QnaVo vo = new QnaVo();
		vo.setStart(start);
		vo.setEnd(end);
		
		ArrayList list = qDAO.getQnaList(vo);
		return list;
	}
}
