package sb.com.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import sb.com.vo.AirVO;
import sb.com.service.AirportService;
import sb.com.util.ApiExplorer;
import sb.com.util.MyUtils;

@Controller
@RequestMapping("/airport")

public class AirportController {
	@Autowired
	private AirportService aService;
	
	@RequestMapping("/airportForm")
	public String airportForm() {
		return "/airport/airportForm";
	}
	
	// 편도 조회
	@RequestMapping(value="/pAir", method = RequestMethod.POST)
	public String pgoAir(AirVO airVO, Model model) throws Exception{
		Map<String, String> result = MyUtils.getAirportId();
		String depAirportId = result.get(airVO.getDepAirportNm());
		String arrAirportId = result.get(airVO.getArrAirportNm());
		String depPlandTime = airVO.getDepPlandTime();
		List<AirVO> go = ApiExplorer.getAirportJson(depAirportId, arrAirportId, depPlandTime);
		
		model.addAttribute("go", go);
		return "airport/pAir";
	}
//================================================================================================================
	
	// 왕복에서 가는날 조회
	@RequestMapping(value="/wgoAir", method = RequestMethod.POST)
	public String wgoAir(AirVO airVO, Model model) throws Exception{
		Map<String, String> result = MyUtils.getAirportId();
		String depAirportId = result.get(airVO.getDepAirportNm());
		String arrAirportId = result.get(airVO.getArrAirportNm());
		String depPlandTime = airVO.getDepPlandTime();
		String arrPlandTime = airVO.getArrPlandTime();
		
		List<AirVO> go = ApiExplorer.getAirportJson(depAirportId, arrAirportId, depPlandTime);
		
		model.addAttribute("go", go);
		return "airport/wgoAir";
	}
	
	@RequestMapping(value="/wbackAir")
	public ModelAndView wbackAir(AirVO airVO, ModelAndView mv, HttpSession session) throws Exception{
		String depAirportNm2 = (String) session.getAttribute("depAirportNm");
		String arrAirportNm2 = (String) session.getAttribute("arrAirportNm");
		String depPlandTime2 = (String) session.getAttribute("depPlandTime");
		
		System.out.println(depAirportNm2);
		System.out.println(arrAirportNm2);
		System.out.println(depPlandTime2);
		
		airVO.setDepAirportNm(depAirportNm2);
		airVO.setArrAirportNm(arrAirportNm2);
		airVO.setDepPlandTime(depPlandTime2);
		
		Map<String, String> result = MyUtils.getAirportId();
		String depAirportId = result.get(airVO.getDepAirportNm());
		String arrAirportId = result.get(airVO.getArrAirportNm());
		String depPlandTime = airVO.getDepPlandTime();
		
//		List<AirVO> back = ApiExplorer.getAirportJson(arrAirportId, depAirportId , depPlandTime);
		String back = ApiExplorer.getAirportData(arrAirportId, depAirportId , depPlandTime);
		
		session.removeAttribute("depAirportNm");
		session.removeAttribute("arrAirportNm");
		session.removeAttribute("depPlandTime");
		
		aService.insertBack(airVO, session);
		// 뷰
		RedirectView rv = new RedirectView("../airport/wbackProc");
		mv.setView(rv);
		return mv;
		
	}
//================================================================================================================

	// 편도 예매정보 입력
	@RequestMapping("/pgoProc")
	public ModelAndView pgoProc(AirVO vo, HttpSession session) {
		System.out.println("rConfirm()컨트롤러함수 호출성공");
		ModelAndView mv = new ModelAndView();
		
		aService.insertGo(vo, session);
		// 뷰
		RedirectView rv = new RedirectView("../airport/rConfirm.do");
		mv.setView(rv);
		return mv;
	}
//================================================================================================================
	
	// 왕복정보 입력시 가는길 입력
	@RequestMapping(value="/wgoProc")
	public ModelAndView wgoProc(AirVO vo, HttpSession session, HttpServletRequest req) {
		
		System.out.println("rConfirm()컨트롤러함수 호출성공");
		ModelAndView mv = new ModelAndView("/airport/wbackAir");		
		//mv.addObject("depAirportNm", vo.getDepAirportNm());
		//mv.addObject("arrAirportNm", vo.getArrAirportNm());
		//mv.addObject("arrPlandTime", vo.getArrPlandTime());
		aService.insertGo(vo, session);
		// 뷰
		session.setAttribute("depAirportNm", vo.getDepAirportNm());
		session.setAttribute("arrAirportNm", vo.getArrAirportNm());
		session.setAttribute("depPlandTime", vo.getDepPlandTime());
		
		
		RedirectView rv = new RedirectView("../airport/wbackAir.do");
		mv.setView(rv);
		return mv;
	}
	
	// 왕복정보 입력시 오는길 입력
		@RequestMapping("/wbackProc")
		public ModelAndView wbackProc(AirVO vo, HttpSession session, ModelAndView mv, HttpServletRequest req) {
			
			System.out.println("rConfirm()컨트롤러함수 호출성공");
			
			aService.insertBack(vo, session);
			// 뷰
			RedirectView rv = new RedirectView("../airport/rConfirm.do");
			mv.setView(rv);
			return mv;
		}
	
//================================================================================================================
	//예매 목록 보기
	@RequestMapping("/rConfirm")
	public void rResult(HttpServletRequest request) {
		
		ArrayList list = aService.getrList();
		
		request.setAttribute("LIST", list);
		
		
	}

//	@RequestMapping("/rConfirm")
//	public String rConfirm() {
//		return "/airport/rConfirm";
//	}

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
