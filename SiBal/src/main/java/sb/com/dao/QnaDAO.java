package sb.com.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import sb.com.vo.QnaVo;

public class QnaDAO extends SqlSessionDaoSupport{
	
	// 목록보기 페이징
	public int getTotalCount() {
		return (Integer)getSqlSession().selectOne("qnaBoard.totalCount");
	}
	
	// 목록보기
	public ArrayList getQnaList(QnaVo vo) {
		return (ArrayList)getSqlSession().selectList("qnaBoard.qnaList",vo);
	}
	
	// 질문입력
	public void insertQ(QnaVo vo) {
		SqlSession session = this.getSqlSession();
		session.insert("qnaBoard.insertQ",vo);
	}
	
	// 조회수 증가
	public void updateHit(int oriNo) {
		getSqlSession().update("qnaBoard.updateHit",oriNo);
	}
	
	// 상세보기
	public QnaVo getQnaView(int no) {
		return (QnaVo)getSqlSession().selectOne("qnaBoard.qnaView",no);
	}
	
	// 답변입력
	public void insertA(QnaVo vo) {
		SqlSession session = this.getSqlSession();
		session.insert("qnaBoard.insertA",vo);
		
	}
	// 스텝증가
	public void updateStep(QnaVo vo) {
		getSqlSession().update("qnaBoard.updateStep",vo);
	}
	
	// 수정하기
	public void updateQna(QnaVo vo) {
		getSqlSession().update("qnaBoard.updateQna",vo);
	}
	
	// 삭제하기
	public void deleteQna(int no) {
		getSqlSession().delete("qnaBoard.deleteQna",no);
	}
	
	// 검색결과 카운트
	public int getSearchCount(QnaVo vo) {
		int count = (Integer)getSqlSession().selectOne("qnaBoard.searchCount",vo);
		return count;
	}
	
	// 검색하기
	public ArrayList getSearchList(QnaVo vo) {
		return (ArrayList) getSqlSession().selectList("qnaBoard.searchList",vo);
	}
	
	// 댓글 카운트
	public int repCount(int oriNo) {
		int count=  (Integer)getSqlSession().selectOne("qnaBoard.repCount",oriNo);
		return count;
	}
	
	// 댓글 리스트
	public ArrayList repList(QnaVo vo) {
		return (ArrayList)getSqlSession().selectList("qnaBoard.repList",vo);
	}
	
	// 댓글입력
	public void repInsert(QnaVo vo) {
		SqlSession session = this.getSqlSession();
		session.insert("qnaBoard.repInsert",vo);
	}

	// 대댓글입력
	public void repRepInsert(QnaVo vo) {
		SqlSession session = this.getSqlSession();
		session.insert("qnaBoard.repRepInsert",vo);
	}
	
	// 대댓글입력시 re_check 업데이트
	public void repCheckUpdate(QnaVo vo) {
		getSqlSession().update("qnaBoard.repCheckUpdate",vo);
	}
	
	// 수정하기
	public void repUpdate(QnaVo vo) {
		getSqlSession().update("qnaBoard.repUpdate",vo);
	}
	
	// 삭제할때 부모 댓글 check 확인
	public String repRepselect(QnaVo vo) {
		String check = (String)getSqlSession().selectOne("qnaBoard.repRepselect",vo);
		return check;
	}
	
	// re_check= 'N' 일때 수정하기
	public void repDelete2(QnaVo vo) {
		getSqlSession().update("qnaBoard.repDelete2",vo);
	}
	
	// re_check= 'Y' 일때 삭제하기
	public void repDelete(QnaVo vo) {
		getSqlSession().delete("qnaBoard.repDelete",vo);
	}
	
	// 맨 아래 댓글 삭제시 re_check 업데이트
	public void repDeleteCup(QnaVo vo) {
		getSqlSession().update("qnaBoard.repDeleteCup",vo);
	}
	
}
