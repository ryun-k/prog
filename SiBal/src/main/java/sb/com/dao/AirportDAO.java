package sb.com.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import sb.com.vo.AirVO;

public class AirportDAO extends SqlSessionDaoSupport{

	public void insertGo(AirVO vo) {
		SqlSession session = this.getSqlSession();
		session.insert("airport.insertGair", vo);
	}
	
	public void insertBack(AirVO vo) {
		SqlSession session = this.getSqlSession();
		session.insert("airport.insertBair", vo);
	}
	
	public ArrayList getGoList(AirVO vo) {
			return (ArrayList) getSqlSession().selectList("airport.goList",vo);
		}
	
	public ArrayList getBackList(AirVO vo) {
		return (ArrayList) getSqlSession().selectList("airport.backList",vo);
	}
	
	public void gdelProc(AirVO vo) {
		SqlSession session = this.getSqlSession();
		session.delete("airport.delGo", vo);
	}
	
	public void bdelProc(AirVO vo) {
		SqlSession session = this.getSqlSession();
		session.delete("airport.delBack", vo);
	}
	
	public void gcalProc(AirVO vo) {
		SqlSession session = this.getSqlSession();
		session.update("airport.calGo", vo);
	}
	
	public void bcalProc(AirVO vo) {
		SqlSession session = this.getSqlSession();
		session.update("airport.calBack", vo);
	}
}
