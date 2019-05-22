package sb.com.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sb.com.service.GraphService;
import sb.com.vo.GraphVO;

@Controller
@RequestMapping("/graph")
public class GraphController {

	protected Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private GraphService gService;
	
	//파이그래프 그리기
	@RequestMapping(value="/pie",method=RequestMethod.POST)
	public @ResponseBody int loadGraph(GraphVO vo) {
		log.info("ajax실행,그래프");
		
		int ok = gService.makeGraph(vo);
		
		
		 return ok;
	}
	
}
