package sb.com.service;

import java.io.IOException;

import org.apache.log4j.Logger;

import sb.com.vo.GraphVO;

public class GraphService {

	protected Logger log = Logger.getLogger(this.getClass());
	
	//파이그래프 그리기
	public int makeGraph(GraphVO vo) {
		int no = vo.getNo();
		log.info("그래프 그리기1");
		Runtime run = Runtime.getRuntime();
		try {
			switch (no){
			case 0:
				run.exec("${pageContext.request.contextPath}/exeFile/jeju_2018_01.exe");
				break;
				
			case 1:
				run.exec("${pageContext.request.contextPath}/exeFile/jeju_2018_02.exe");
				break;
				
			case 2:
				run.exec("${pageContext.request.contextPath}/exeFile/jeju_2018_03.exe");
				break;
			case 3:
				run.exec("${pageContext.request.contextPath}/exeFile/jeju_2018_04.exe");
				break;
			case 4:
				run.exec("${pageContext.request.contextPath}/exeFile/jeju_2018_05.exe");
				break;
			case 5:
				run.exec("${pageContext.request.contextPath}/exeFile/jeju_2018_06.exe");
				break;
			case 6:
				run.exec("${pageContext.request.contextPath}/exeFile/jeju_2018_07.exe");
				break;
			case 7:
				run.exec("${pageContext.request.contextPath}/exeFile/jeju_2018_08.exe");
				break;
			case 8:
				run.exec("${pageContext.request.contextPath}/exeFile/jeju_2018_09.exe");
				break;
			case 9:
				run.exec("${pageContext.request.contextPath}/exeFile/jeju_2018_10.exe");
				break;
			case 10:
				run.exec("${pageContext.request.contextPath}/exeFile/jeju_2018_11.exe");
				break;
			case 11:
				run.exec("${pageContext.request.contextPath}/exeFile/jeju_2018_12.exe");
				break;
			case 12:
				run.exec("${pageContext.request.contextPath}/exeFile/jeju_2019_01.exe");
				break;
			case 13:
				run.exec("${pageContext.request.contextPath}/exeFile/jeju_2019_02.exe");
				break;
			case 14:
				run.exec("${pageContext.request.contextPath}/exeFile/jeju_2019_03.exe");
				break;
			case 15:
				run.exec("${pageContext.request.contextPath}/exeFile/jeju_2019_04.exe");
				break;
				}
		} catch (IOException e) {
			
		}
		
		return no;
	}
	
	
}
