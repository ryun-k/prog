package sb.com.dao;

import java.util.ArrayList;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import sb.com.vo.AdminVo;
import sb.com.vo.AirVO;

public class AdminDAO extends SqlSessionDaoSupport{
	
	// 목록보기 페이징
	public int getTotalCount() {
		return (Integer)getSqlSession().selectOne("admin.totalCount");
	}
	
	// 목록보기
	public ArrayList adminList(AdminVo vo) {
		return (ArrayList)getSqlSession().selectList("admin.list",vo);
	}
	
	// 검색결과 카운트
	public int searchCount(AdminVo vo) {
		int count = (Integer)getSqlSession().selectOne("admin.searchCount",vo);
		return count;
	}
	
	// 검색하기
	public ArrayList searchList(AdminVo vo) {
		return (ArrayList) getSqlSession().selectList("admin.searchList",vo);
	}
	
	// 상세보기
	public AdminVo detail(int no) {
		return (AdminVo)getSqlSession().selectOne("admin.detail",no);
	}
	
	// 가는날 조회
	public ArrayList detailGair(AirVO vo) {
		return (ArrayList) getSqlSession().selectList("admin.detailGair",vo);
	}
	
	
}
