package sb.com.dao;

import java.util.ArrayList;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import sb.com.vo.NoticeVo;

public class NoticeDAO extends SqlSessionDaoSupport{
	
	//글 갯수 카운팅
	public int getTotalCount() {
		return (Integer)getSqlSession().selectOne("notice.totalcount");
	}
	
	
	//글 목록조회
	public ArrayList getNoticeList(NoticeVo vo) {
		return (ArrayList)getSqlSession().selectList("notice.noticeList", vo);
	}
	
	//글 쓰기
	
	
	//상세보기
	
	
	//글삭제
}
