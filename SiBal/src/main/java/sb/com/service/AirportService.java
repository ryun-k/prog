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
		String nick = "Hyoung";
		vo.setNick(nick);
		System.out.println(vo.getNick());
		aDAO.insertGo(vo, "go");
	}
	
	public void insertBack(AirVO vo, HttpSession session) {
		System.out.println("DAO호출성공");
		String nick = "Hyoung";
		vo.setNick(nick);
		aDAO.insertBack(vo, "back");
	}
	
	public ArrayList getrList() {
		
		AirVO vo = new AirVO();
		
		ArrayList list = aDAO.getrList(vo);
		return list;
		
	}
}
