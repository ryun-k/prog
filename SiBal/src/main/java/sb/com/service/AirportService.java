package sb.com.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import sb.com.dao.AirportDAO;
import sb.com.vo.AirVO;

public class AirportService {
	@Autowired
	private AirportDAO aDAO;
	
	public void insertBoard(AirVO vo, HttpSession session) {
		System.out.println("DAO호출성공");
		aDAO.insertBoard(vo, "go");
		aDAO.insertBoard(vo, "back");
	}
}
