package sb.com.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import sb.com.service.MainService;
import sb.com.util.PageUtil;

@Controller
public class MaininfoController {
	
	@Autowired
	private MainService mService;
	
	@RequestMapping("/sbtrip")
	public void trip(HttpServletRequest request) {
		System.out.println("trip");
		ArrayList list = mService.getTripList();
		ArrayList list1 = mService.getTripList1();
		
		request.setAttribute("LIST", list); //게시물내용
		request.setAttribute("LIST1", list1); //게시물내용
	}
	
}
