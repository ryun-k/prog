package sb.com.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import sb.com.dao.AirportDAO;
import sb.com.vo.AirVO;

public class AirportService {
	@Autowired
	private AirportDAO aDAO;
	
	public void insertGo(AirVO vo, HttpSession session) {
		System.out.println("DAO호출성공");
		String nick = "가와";
		vo.setNick(nick);
		aDAO.insertGo(vo, "go");
	}
	
	public void insertBack(AirVO vo, HttpSession session) {
		System.out.println("DAO호출성공");
		String nick = "가와";
		vo.setNick(nick);
		aDAO.insertBack(vo, "back");
	}
	
	public ArrayList getGoList() {
		
		AirVO vo = new AirVO();
		
		ArrayList list = aDAO.getGoList(vo);
		return list;
	}
	public ArrayList getBackList() {
		
		AirVO vo = new AirVO();
		
		ArrayList list = aDAO.getBackList(vo);
		return list;
	}
}
