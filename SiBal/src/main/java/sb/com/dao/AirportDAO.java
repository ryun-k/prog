package sb.com.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import sb.com.vo.AirVO;

public class AirportDAO extends SqlSessionDaoSupport{

	public void insertGo(AirVO vo,String kind) {
		SqlSession session = this.getSqlSession();
		
		if(kind.equals("go")) {//출발지 입력이라면
		session.insert("airport.insertGair", vo);
		}
	}
	
	public void insertBack(AirVO vo,String kind) {
		SqlSession session = this.getSqlSession();
		
		if(kind.equals("back")) {//출발지 입력이라면
		session.insert("airport.insertBair", vo);
		}
	}
	
	//목록 조회 쿼리실행 함수
		public ArrayList getrList(AirVO vo) {
			return (ArrayList) getSqlSession().selectList("airport.gList",vo);
		}
}
