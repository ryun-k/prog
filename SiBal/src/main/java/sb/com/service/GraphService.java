package sb.com.service;

import java.io.IOException;

import org.apache.log4j.Logger;

public class GraphService {

	protected Logger log = Logger.getLogger(this.getClass());
	
	//파이그래프 그리기
	public void makeGraph() {
		log.info("그래프 그리기1");
		Runtime run = Runtime.getRuntime();
		try {
			log.info("그래프 그리기");
			run.exec("d:\\python\\jeju_test.exe");
		} catch (IOException e) {
			log.info(e);
		}
		
	}
	
	//샘플데이터 불러보기
	public void makeSample() {
		log.info("샘플불러오기");
		Runtime run = Runtime.getRuntime();
		try {
			run.exec("d:\\python\\dist\\requests3_1.exe");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
