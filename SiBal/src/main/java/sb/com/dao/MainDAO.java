package sb.com.dao;

import java.util.ArrayList;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import sb.com.vo.InformationVO;

public class MainDAO extends SqlSessionDaoSupport {
	
	public ArrayList getTripist(InformationVO vo) {
		return (ArrayList)getSqlSession().selectList("maininfo.trip",vo);
	}
	public ArrayList getTripist1(InformationVO vo) {
		return (ArrayList)getSqlSession().selectList("maininfo.trip1",vo);
	}
	
}
