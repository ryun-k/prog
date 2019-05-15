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
	
	//게시물 수정 쿼리실행 함수
	public void updateQna(QnaVo vo) {
		getSqlSession().update("qnaBoard.updateQna",vo);
	}
	
	public void deleteQna(int no) {
		getSqlSession().delete("qnaBoard.deleteQna",no);
	}
}
