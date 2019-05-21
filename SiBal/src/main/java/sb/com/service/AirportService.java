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
		aDAO.insertGo(vo);
	}
	
	public void insertBack(AirVO vo, HttpSession session) {
		System.out.println("DAO호출성공");
		String nick = "Hyoung";
		vo.setNick(nick);
		aDAO.insertBack(vo);
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
	
	public void gdelProc(AirVO vo) {
		aDAO.gdelProc(vo);
	}
	
	public void bdelProc(AirVO vo) {
		aDAO.bdelProc(vo);
	}
	
	public void gcalProc(AirVO vo) {
		aDAO.gcalProc(vo);
	}
	
	public void bcalProc(AirVO vo) {
		aDAO.bcalProc(vo);
	}
}
