package sb.com.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import sb.com.vo.AirVO;

public class AirportDAO extends SqlSessionDaoSupport{

	public void insertBoard(AirVO vo,String kind) {
		SqlSession session = this.getSqlSession();
		
		if(kind.equals("go")) {//출발지 입력이라면
		session.insert("airport.insertGair", vo);
		}
		else if(kind.equals("back")){
		session.insert("airport.insertBair", vo);	
		}
	}
}
