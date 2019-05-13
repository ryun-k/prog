package sb.com.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import sb.com.service.InformationService;
import sb.com.util.FileUtil;
import sb.com.util.PageUtil;
import sb.com.vo.InformationVO;

@Controller
@RequestMapping("/information")
public class InformationController {
	
	@Autowired
	private InformationService iService; 
	
	//리스트
	@RequestMapping("/informationList")
	public void informationList(
		@RequestParam(value="nowPage", required=false, 	defaultValue="1") int nowPage,
			HttpServletRequest request) {
		
		PageUtil pInfo = iService.getPageInfo(nowPage);
		
		ArrayList list = iService.getInformationList(pInfo);
		
		request.setAttribute("LIST", list);
		request.setAttribute("PINFO", pInfo);
	}
	
	//상세보기 조회수 
	@RequestMapping("/hitProc")
	public ModelAndView	informationHitProc(ModelAndView mv,
			HttpServletRequest req,HttpSession session) {
		
		String  strNo= req.getParameter("No");
		int     No = Integer.parseInt(strNo);
		String  nowPage = req.getParameter("nowPage"); //릴레이용
		
		iService.updateHit(No, session);
		
		RedirectView rv = new RedirectView("../information/informationView.do");
		
		rv.addStaticAttribute("No", No);
		rv.addStaticAttribute("nowPage", nowPage);
		mv.setView(rv);
		return mv;
	}
	
	//글쓰기 폼보기
	@RequestMapping("/informationWriteForm")
	public String informationWriteForm() throws Exception{

		return "/information/informationWriteForm";
	}
	
	//글쓰기-2) 글쓰기
	@RequestMapping("/informationWriteProc")
	public ModelAndView informationWriteProc(InformationVO vo, HttpSession session, ModelAndView mv){
		System.out.println("fileWriteProc()컨트롤러함수 호출성공");
		//1.파라미터 받기
		
		//2.비즈니스로직을 서비스위임
		/*서버로 데이터가 전송되면 업로드 파일은 임시 폴더에 자동 저장된다.
		  해당 컨트롤러 실행이 끝나면 이  파일은 자동 삭제된다.*/
		//파일을 정보를 알아낸다
		
		//파일을 만들때에는 어디(폴더)에 무슨 이름으로 만들것인지 지정해야 한다
		//new File(어디에, 무슨이름);
		//폴더명은   다운로드일경우에는 원하는 폴더를 지정
		//참고      폴더명은  만약에 web에서 보여줄 목적이라면 getRealPath()를 이용해서 만들어야 한다
		
		
		/*알아낸 파일정보를 토대로하여 임시 저장된 파일을 임시폴더에서 복사해서*/
		String path = "D:\\uploads";
		//String path = "D:\\test\\upload";
		
		//업로드된 파일이 여러개일경우에는
		//파일의 정보가 배열에 기억되므로  배열을 이용해서 각 파일의 정보를 받아야 한다
		
		//파일의 정보를 하나라 묶기 위한 변수
		ArrayList list = new ArrayList();
		
		for( int i=0; i<vo.getFiles().length ;i++) {
			//파일이름을 알아내기
			String oriName = vo.getFiles()[i].getOriginalFilename();
			
			//파일이 업로드 되지 않을 경우   다음 파일을 업로드해라..
			if( oriName==null || oriName.length()==0 ) {
				continue;
			}
			
			String saveName = FileUtil.renameTo(path, oriName);
			
			try {
				File file = new File(path, saveName);
		
			   	//강제로 특정폴더에 실제 업로드(복사)시켜 줘야 한다
				//.transferTo()를 이용해서 복사
				vo.getFiles()[i].transferTo(file);
			
				//위의 코드까지는 하나의 파일이 업로드된 상태이다
				//업로드된 파일은 정보를 Map()으로 묶자
				HashMap map = new HashMap();
				map.put("path", path);	//저장된 경로
				map.put("oriName", oriName);//원래이름
				map.put("saveName", saveName);//저장된이름
				map.put("len", file.length());//파일크기
			
				list.add(map);
				
			} catch (Exception e) {
				System.out.println("파일복사에러 = " + e);
			}
			
		}//for
		System.out.println("컨트롤러 list개수="+list.size());
		
		
		System.out.println("insert문실행 전 no="+vo.getNo());
		iService.inserInformation(vo, session, list);
		System.out.println("insert문실행 후 no="+vo.getNo());
		
		//3.모델
		//4.뷰: 리다이렉트 : 목록보기
		RedirectView rv = new RedirectView("../information/informationList.do");
	    //필요시 리다이렉트뷰에도 파라미터를 추가하여 보낼 수 있다
		//rv.addStaticAttribute(name, value);
		                       //("downloadFile", new File(~,~))~~~~~~~~~~~~   
		
		
		
		mv.setView(rv);
		return mv;
	}
	
	
}
