package sb.com.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import sb.com.dao.MainDAO;
import sb.com.util.PageUtil;
import sb.com.vo.InformationVO;

public class MainService {
	@Autowired
	private MainDAO mDAO;
	
	public ArrayList getTripList() {
		
		InformationVO vo = new InformationVO();
		
		ArrayList list = mDAO.getTripist(vo);
		return list;
	}
	public ArrayList getTripList1() {
		
		InformationVO vo = new InformationVO();
		
		ArrayList list1 = mDAO.getTripist1(vo);
		return list1;
	}
}
