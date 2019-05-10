package sb.com.dao;

import java.util.ArrayList;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import sb.com.vo.QnaVo;

public class QnaDAO extends SqlSessionDaoSupport{
	
	public int getTotalCount() {
		return (Integer)getSqlSession().selectOne("qnaBoard.totalCount");
	}
	
	public ArrayList getQnaList(QnaVo vo) {
		return (ArrayList)getSqlSession().selectList("qnaBoard.qnaList");
	}
}
