package sb.com.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import sb.com.service.GraphService;

@Controller
@RequestMapping("/graph")
public class GraphController {

	protected Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private GraphService gService;
	
	//파이그래프 그리기
	@RequestMapping("/pie")
	public void loadGraph() {
		gService.makeGraph();
		 log.info("그래프 ");
	}
	
	//샘플 데이터 불러오기
	@RequestMapping("/sample")
	public void loadSample() {
		gService.makeSample();
		log.info("샘플");
	}
}
