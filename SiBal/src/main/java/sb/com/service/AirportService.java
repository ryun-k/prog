package sb.com.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import sb.com.dao.AirportDAO;
import sb.com.vo.AirVO;

public class AirportService {
	@Autowired
	private AirportDAO aDAO;
	
	public void insertGo(AirVO vo, HttpSession session) {
		System.out.println("DAO호출성공");
		aDAO.insertGo(vo, "go");
	}
	
	public void insertBack(AirVO vo, HttpSession session) {
		System.out.println("DAO호출성공");
		aDAO.insertBack(vo, "back");
	}
}
