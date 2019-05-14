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
	//첨부파일 쿼리실행 함수
	public ArrayList getImageInfo(int oriNo) {
		return (ArrayList)getSqlSession().selectList("information.imageInfo", oriNo);
	}
	
	public InformationVO getInformationView(int No) {
		return (InformationVO)getSqlSession().selectOne("information.informationView",No);
	}

	
	//검색키워드를 반영한 쿼리실행함수
	public ArrayList getSearchList(InformationVO vo) {   
		return (ArrayList)getSqlSession().selectList("information.informationsearchList",vo);
	}
	
	//검색에 따른 총 게시물수조회 쿼리실행 함수
	public int getSearchCount(InformationVO vo){
		int count = getSqlSession().selectOne("information.informationsearchCount",vo);
		return count;
	}
	
	//첨부파일정보 삭제 쿼리실행함수
	public void deleteInfo(int No) {
		getSqlSession().delete("information.informationdeleteInfo", No);
	}
	
	public void updateInformation(InformationVO vo) {
		getSqlSession().update("information.updateInformation",vo);
	}
	
	
	
}
