package sb.com.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import sb.com.vo.InformationVO;

public class InformationDAO extends SqlSessionDaoSupport{
	
	public int getTotalCount() {
		return (Integer)getSqlSession().selectOne("information.totalCount");
	}
	
	public ArrayList getInformationList(InformationVO vo) {
		return (ArrayList)getSqlSession().selectList("information.informationList",vo);
	}
	
	//조회수증가 쿼리
	public void updateHit(int No) {
		getSqlSession().update("information.updateHit",No);
	}
	
	//데이터 입력 쿼리실행 함수
	public void insertInformation(InformationVO vo,String kind) {
		SqlSession session = this.getSqlSession();
		
		if(kind.equals("info")) {
			session.insert("information.insertInformation", vo);
		}
		else if(kind.equals("imageInfo")){
			session.insert("information.insertimageInfo", vo);
		}
	}
	

}
