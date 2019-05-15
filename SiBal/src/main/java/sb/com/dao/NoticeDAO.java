package sb.com.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
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
	public void insertNotice(NoticeVo vo) {
		SqlSession session = this.getSqlSession();
		System.out.println("dao시작");
		
		System.out.println("getNo"+vo.getNo());
		System.out.println("getTitle"+vo.getTitle());
		System.out.println("getContent"+vo.getContent());
		System.out.println("getStartDate"+vo.getStartDate());
		System.out.println("getEndDate"+vo.getEndDate());
		System.out.println("getIsshow"+vo.getIsshow());
		
		session.insert("notice.insert",vo);
		System.out.println("dao종료");
	}
	
	//상세보기
	public NoticeVo getView(int oriNo) {
		System.out.println("oriNo "+oriNo);
		return (NoticeVo)getSqlSession().selectOne("notice.noticeView",oriNo);
	}
	
	
	//조회수증가
	public void hitNotice(int oriNo) {
		getSqlSession().update("notice.updatehit",oriNo);
	}
	
	//글수정폼
	public NoticeVo modifyNotice(int oriNo) {
		return (NoticeVo)getSqlSession().selectOne("notice.modifyForm",oriNo);
	}
	
	//글수정
	public void updateNotice(NoticeVo vo) {
		getSqlSession().update("notice.modifyProc",vo);
	}
	
	
	//글삭제
	public void deleteNotice(int oriNo) {
		getSqlSession().delete("notice.deleteNotice",oriNo);
	}
}
