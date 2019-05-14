package sb.com.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import sb.com.vo.AirVO;
import sb.com.util.ApiExplorer;
import sb.com.util.MyUtils;

@Controller

public class AirportController {

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
	
	@RequestMapping("/airport/rConfirm")
	public String rConfirm() {
		return "/airport/rConfirm";
	}
}
