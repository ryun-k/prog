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
		String nick = (String)session.getAttribute("nick");
		vo.setNick(nick);
		aDAO.insertGo(vo);
	}
	
	public void insertBack(AirVO vo, HttpSession session) {
		String nick = (String)session.getAttribute("nick");
		vo.setNick(nick);
		aDAO.insertBack(vo);
	}
	
	public ArrayList getGoList(HttpSession session) {
		AirVO vo = new AirVO();
		String nick = (String)session.getAttribute("nick");
		vo.setNick(nick);
		ArrayList list = aDAO.getGoList(vo);
		return list;
	}
	public ArrayList getBackList(HttpSession session) {
		
		AirVO vo = new AirVO();
		String nick = (String)session.getAttribute("nick");
		vo.setNick(nick);
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
	
	public void gcalcalProc(AirVO vo) {
		aDAO.gcalcalProc(vo);
	}
	
	public void bcalcalProc(AirVO vo) {
		aDAO.bcalcalProc(vo);
	}
}
