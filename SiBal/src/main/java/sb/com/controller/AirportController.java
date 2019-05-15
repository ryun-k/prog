package sb.com.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import sb.com.vo.AirVO;
import sb.com.service.AirportService;
import sb.com.util.ApiExplorer;
import sb.com.util.MyUtils;

@Controller
public class AirportController {
	@Autowired
	private AirportService aService;

	@RequestMapping("/airport/airportForm")
	public String airportForm() {
		return "/airport/airportForm";
	}
	
	@RequestMapping(value="/airport/airport", method = RequestMethod.POST)
	public String airport(AirVO airVO, Model model) throws Exception{
		Map<String, String> result = MyUtils.getAirportId();
		String depAirportId = result.get(airVO.getDepAirportNm());
		String arrAirportId = result.get(airVO.getArrAirportNm());
		String depPlandTime = airVO.getDepPlandTime();
		String arrPlandTime = airVO.getArrPlandTime();
		List<AirVO> go = ApiExplorer.getAirportJson(depAirportId, arrAirportId, depPlandTime);
		List<AirVO> back = ApiExplorer.getAirportJson(arrAirportId,depAirportId , arrPlandTime);
		
		model.addAttribute("go", go);
		model.addAttribute("back", back);
		return "/airport/airport";
	}
	
	@RequestMapping("/airport/rProc")
	public ModelAndView rProc(AirVO vo, HttpSession session, ModelAndView mv) {
		System.out.println("rConfirm()컨트롤러함수 호출성공");
		
		aService.insertBoard(vo, session);
		//뷰
		RedirectView rv = new RedirectView("../airport/rConfirm.do");
		mv.setView(rv);
		return mv;
	}
	
	@RequestMapping("/airport/rConfirm")
	public String rConfirm() {
		return "/airport/rConfirm";
	}
	
}

//페이지 하나짜리

//@RequestMapping(value="/airport/airport", method = RequestMethod.POST)
//public String airport(AirVO airVO, Model model) throws Exception{
//	Map<String, String> result = MyUtils.getAirportId();
//	String depAirportId = result.get(airVO.getDepAirportNm());
//	String arrAirportId = result.get(airVO.getArrAirportNm());
//	String depPlandTime = airVO.getDepPlandTime();
//	String arrPlandTime = airVO.getArrPlandTime();
//	List<AirVO> go = ApiExplorer.getAirportJson(depAirportId, arrAirportId, depPlandTime);
//	List<AirVO> back = ApiExplorer.getAirportJson(arrAirportId,depAirportId , arrPlandTime);
//	
//	model.addAttribute("go", go);
//	model.addAttribute("back", back);
//	return "/airport/airport";
//}

//페이지 이중분할

//@RequestMapping(value="/airport/arrair", method = RequestMethod.POST)
//public String arrair(AirVO airVO, Model model) throws Exception{
//	Map<String, String> result = MyUtils.getAirportId();
//	String depAirportId = result.get(airVO.getDepAirportNm());
//	String arrAirportId = result.get(airVO.getArrAirportNm());
//	String depPlandTime = airVO.getDepPlandTime();
//	String arrPlandTime = airVO.getArrPlandTime();
//	List<AirVO> go = ApiExplorer.getAirportJson(depAirportId, arrAirportId, depPlandTime);
//	
//	model.addAttribute("go", go);
//	return "/airport/arrair";
//}
//
//@RequestMapping(value="/airport/depair", method = RequestMethod.POST)
//public String airport(AirVO airVO, Model model) throws Exception{
//	Map<String, String> result = MyUtils.getAirportId();
//	String depAirportId = result.get(airVO.getDepAirportNm());
//	String arrAirportId = result.get(airVO.getArrAirportNm());
//	String depPlandTime = airVO.getDepPlandTime();
//	String arrPlandTime = airVO.getArrPlandTime();
//	List<AirVO> back = ApiExplorer.getAirportJson(arrAirportId,depAirportId , arrPlandTime);
//	
//	model.addAttribute("back", back);
//	return "/airport/depair";
//}
