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
	
	// 가는날 조회 폼
	@RequestMapping("/airportForm")
	public String airportForm() {
		return "/airport/airportForm";
	}
	
	// 가는날 조회
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
	
	// 오는날 조회 폼
	@RequestMapping("/airportForm2")
	public String airportForm2() {
		return "/airport/airportForm2";
	}
	
	// 오늘날 조회
	@RequestMapping(value="/aAir", method = RequestMethod.POST)
	public String pbackAir(AirVO airVO, Model model) throws Exception{
		Map<String, String> result = MyUtils.getAirportId();
		String depAirportId = result.get(airVO.getDepAirportNm());
		String arrAirportId = result.get(airVO.getArrAirportNm());
		String depPlandTime = airVO.getDepPlandTime();
		List<AirVO> back = ApiExplorer.getAirportJson(depAirportId, arrAirportId, depPlandTime);
		
		model.addAttribute("back", back);
		return "airport/aAir";
	}

	// 가는날 예약정보 입력
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
	
	// 오는날 예약정보 입력
	@RequestMapping("/pbackProc")
	public ModelAndView pbackProc(AirVO vo, HttpSession session) {
		System.out.println("rConfirm()컨트롤러함수 호출성공");
		ModelAndView mv = new ModelAndView();
		
		aService.insertBack(vo, session);
		// 뷰
		RedirectView rv = new RedirectView("../airport/rConfirm.do");
		mv.setView(rv);
		return mv;
	}

	//예매 목록 보기
	@RequestMapping("/rConfirm")
	public void rResult(HttpServletRequest request) {
		
		ArrayList list = aService.getGoList();
		ArrayList list1 = aService.getBackList();
		
		request.setAttribute("LIST", list);
		request.setAttribute("LIST1", list1);
		
	}
	
	//예매 취소(가는날)
	@RequestMapping("/gDelete")
	public ModelAndView gdelProc(AirVO vo) {
		ModelAndView mv = new ModelAndView();	
		
		aService.gdelProc(vo);
		
		RedirectView rv = new RedirectView("../airport/rConfirm.do");
		mv.setView(rv);
		return mv;
	}
	
	//예매 취소(가는날)
		@RequestMapping("/bDelete")
		public ModelAndView bdelProc(AirVO vo) {
			ModelAndView mv = new ModelAndView();	
			
			aService.bdelProc(vo);
			
			RedirectView rv = new RedirectView("../airport/rConfirm.do");
			mv.setView(rv);
			return mv;
		}
		
		//가는날 결제
		@RequestMapping("/gCal")
		public ModelAndView gcalProc(AirVO vo) {
			ModelAndView mv = new ModelAndView();	
			
			aService.gcalProc(vo);
			
			RedirectView rv = new RedirectView("../airport/rConfirm.do");
			mv.setView(rv);
			return mv;
		}
		
		//가는날 결제
		@RequestMapping("/bCal")
		public ModelAndView bcalProc(AirVO vo) {
			ModelAndView mv = new ModelAndView();	
			
			aService.bcalProc(vo);
			
			RedirectView rv = new RedirectView("../airport/rConfirm.do");
			mv.setView(rv);
			return mv;
		}
		
		//가는날 결제취소
		@RequestMapping("/gCalCal")
		public ModelAndView gcalcalProc(AirVO vo) {
			ModelAndView mv = new ModelAndView();	
			
			aService.gcalcalProc(vo);
			
			RedirectView rv = new RedirectView("../airport/rConfirm.do");
			mv.setView(rv);
			return mv;
		}
		
		//오는날 결제취소
		@RequestMapping("/bCalCal")
		public ModelAndView bcalcalProc(AirVO vo) {
			ModelAndView mv = new ModelAndView();	
			
			aService.bcalcalProc(vo);
			
			RedirectView rv = new RedirectView("../airport/rConfirm.do");
			mv.setView(rv);
			return mv;
		}
	
}
