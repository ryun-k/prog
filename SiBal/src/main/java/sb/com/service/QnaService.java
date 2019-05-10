package sb.com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sb.com.dao.QnaDAO;
import sb.com.util.PageUtil;

@Service
public class QnaService {
	@Autowired
	private QnaDAO qDAO;
	
	public PageUtil getPageInfo(int nowPage) {
		int totalCount = qDAO.getTotalCount();
		
		PageUtil pageInfo = new PageUtil(nowPage,totalCount,3,5);
		return pageInfo;
		
	}
}
