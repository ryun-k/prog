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
		
		String  stroriNo= req.getParameter("oriNo");
		int     oriNo = Integer.parseInt(stroriNo);
		String  nowPage = req.getParameter("nowPage"); //릴레이용
		
		iService.updateHit(oriNo, session);
		
		RedirectView rv = new RedirectView("../information/informationView.do");
		
		rv.addStaticAttribute("oriNo", oriNo);
		rv.addStaticAttribute("nowPage", nowPage);
		mv.setView(rv);
		return mv;
	}
	
	//상세보기 싫어요 
		@RequestMapping("/noGoodProc")
		public ModelAndView	informationNoGoodProc(ModelAndView mv,
				HttpServletRequest req,HttpSession session) {
			
			String  stroriNo= req.getParameter("oriNo");
			int     oriNo = Integer.parseInt(stroriNo);
			String  nowPage = req.getParameter("nowPage"); //릴레이용
			
			iService.updateNoGood(oriNo, session);
			
			RedirectView rv = new RedirectView("../information/informationView.do");
			
			rv.addStaticAttribute("oriNo", oriNo);
			rv.addStaticAttribute("nowPage", nowPage);
			mv.setView(rv);
			return mv;
		}
		//상세보기 좋아요 
		@RequestMapping("/goodProc")
		public ModelAndView	informationGoodProc(ModelAndView mv,
				HttpServletRequest req,HttpSession session) {
			
			String  stroriNo= req.getParameter("oriNo");
			int     oriNo = Integer.parseInt(stroriNo);
			String  nowPage = req.getParameter("nowPage"); //릴레이용
			
			iService.updateGood(oriNo, session);
			
			RedirectView rv = new RedirectView("../information/informationView.do");
			
			rv.addStaticAttribute("oriNo", oriNo);
			rv.addStaticAttribute("nowPage", nowPage);
			mv.setView(rv);
			return mv;
		}
		
	
	//3.상세보기 
	@RequestMapping("/informationView")
	public ModelAndView informationView(@RequestParam(value="oriNo") int oriNo,
			@RequestParam(value="nowPage") int nowPage) {
		InformationVO  vo = iService.getInformationView(oriNo);
		
		ArrayList list = iService.getImageInfo(oriNo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("VIEW",vo);//누가 어떤 제목과 내용으로 언제..
		mv.addObject("LIST",list);//첨부파일목록
		mv.addObject("nowPage",nowPage); //릴레이용
		
		
		mv.setViewName("/information/informationView");
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
		
		String path = "C:\\Users\\hong\\git\\prog\\SiBal\\src\\main\\webapp\\imgs";
		ArrayList list = new ArrayList();
		
		for( int i=0; i<vo.getFiles().length ;i++) {
			String oriName = vo.getFiles()[i].getOriginalFilename();
			
			if( oriName==null || oriName.length()==0 ) {
				continue;
			}
			
			String saveName = FileUtil.renameTo(path, oriName);
			
			try {
				File file = new File(path, saveName);
		
				vo.getFiles()[i].transferTo(file);
			
				HashMap map = new HashMap();
				map.put("path", path);	//저장된 경로
				System.out.println("path="+path);
				map.put("oriName", oriName);//원래이름
				System.out.println("oriName="+oriName);
				map.put("saveName", saveName);//저장된이름
				System.out.println("saveName="+saveName);
				map.put("len", file.length());//파일크기
				System.out.println("len="+file.length());
			
				list.add(map);
				
			} catch (Exception e) {
				System.out.println("파일복사에러 = " + e);
			}
			
		}//for
		System.out.println("컨트롤러 list개수="+list.size());
		
		
		System.out.println("insert문실행 전 no="+vo.getNo());
		iService.inserInformation(vo, session, list);
		System.out.println("insert문실행 후 no="+vo.getNo());
		
		RedirectView rv = new RedirectView("../information/informationList.do");
		
		mv.setView(rv);
		return mv;
	}
	
	@RequestMapping("/informationSearch")
	public ModelAndView informationSearch(HttpServletRequest request, ModelAndView mv) {

		String target= request.getParameter("target");
		String word  = request.getParameter("word");
		
		
		String strNowPage = request.getParameter("nowPage");
		int	nowPage = 1;
		
		if(strNowPage==null || strNowPage.length()==0) {
			nowPage = 1;
		}
		else {
			nowPage = Integer.parseInt(strNowPage);
		}
		
		InformationVO  vo= new InformationVO();
		vo.setTarget(target);
		vo.setWord(word);
		System.out.println( "vo.getTarget()="+vo.getTarget());
		System.out.println( "vo.getWord()  ="+vo.getWord());
		System.out.println( "nowPage ="+nowPage);
		
		PageUtil pInfo = iService.getSearchPage(vo, nowPage);

		ArrayList list = iService.getSearchList(pInfo,target,word);
		
		
		mv.addObject("target", target);
		mv.addObject("word", word);
		mv.addObject("LIST", list);
		mv.addObject("PINFO", pInfo);
		
		mv.setViewName("information/informationSearch");
		return mv;
	}
	
	//수정폼
	@RequestMapping("/informationUpdateForm")
	public ModelAndView  informationUpdateForm(HttpServletRequest request, ModelAndView mv) {
		String stroriNo = request.getParameter("oriNo");
		int    oriNo    = Integer.parseInt(stroriNo);
		String nowPage  = request.getParameter("nowPage");
		
		InformationVO  vo = iService.getInformationView(oriNo); 
		
		mv.addObject("VIEW",vo);
		mv.addObject("nowPage",nowPage);

		mv.setViewName("information/informationUpdateForm");	
		return mv;
	}
	
	//4.수정하기
	@RequestMapping("/informationUpdateProc")
	public ModelAndView informationUpdateProc(InformationVO vo,ModelAndView mv, RedirectView rv) {

		System.out.println("vo.getOriNo()="+vo.getOriNo());
		System.out.println("vo.getNowPage()="+vo.getNowPage());

		boolean isUpload = false; 
		
		for(int i=0; i<vo.getFiles().length ;i++) {

			String tempName = vo.getFiles()[i].getOriginalFilename();
			if( tempName!=null && tempName.length()!=0) {

				isUpload = true;

				break;
			}
		}
			
		String path = "D:\\uploads";
		ArrayList fileList = new ArrayList(); 
				
		if(isUpload) {
			for( int i=0; i<vo.getFiles().length ;i++) {			
				String oriName = vo.getFiles()[i].getOriginalFilename();
						
				if( oriName==null || oriName.length()==0 ) {
					continue;
				}
				
				String saveName = FileUtil.renameTo(path, oriName);			
				File file = new File(path, saveName);
		
				try {
					vo.getFiles()[i].transferTo(file);
				} catch (Exception e) {
					System.out.println("수정폼 파일업로드관련 에러="+e);
					e.printStackTrace();
				}
			
				HashMap map = new HashMap();
				map.put("path", path);	//저장된 경로
				map.put("oriName", oriName);//원래이름
				map.put("saveName", saveName);//저장된이름
				map.put("len", file.length());//파일크기
			
				fileList.add(map);
			}//for
		}//if	
				
		iService.updateInformation(vo);	
		
		if(isUpload == true) {

			ArrayList list = iService.getImageInfo(vo.getOriNo());
			
			if( list !=null && list.size()!=0 ) {//첨부파일이 있으면
				for(int i=0; i<list.size() ;i++) {//첨부파일의 개수만큼하기위한 
					InformationVO tempVo= (InformationVO)list.get(i);

		File tempFile= new File(path,tempVo.getSaveName());	
					
					tempFile.delete();		
				}
			}
			
			iService.deleteInfo(vo.getOriNo());
	
			
			for(int i=0; i<fileList.size() ;i++) {
				InformationVO vo1 = new InformationVO();
				vo1.setOriNo( vo.getOriNo() );
				vo1.setPath( path );
				
				HashMap tempMap = (HashMap)fileList.get(i);

				vo1.setOriName((String)tempMap.get("oriName"));//원래이름
				vo1.setSaveName((String)tempMap.get("saveName"));//저장된이름
				vo1.setLen((java.lang.Long)tempMap.get("len"));//파일크기
				
				iService.insertImageInfo(vo1);
			}//for
			
		}
		
		rv.setUrl("../information/informationView.do");
		rv.addStaticAttribute("oriNo"  , vo.getOriNo()  );
		rv.addStaticAttribute("nowPage", vo.getNowPage());
		mv.setView(rv);
		return mv;
	}
	@RequestMapping("/informationDelete")
	public ModelAndView informationDelete(@RequestParam(value="oriNo") int oriNo, ModelAndView mv) {
		
		InformationVO vo=new InformationVO();
		vo.setOriNo(oriNo);
		System.out.println("vo.getOriNo()="+vo.getOriNo());
		int cnt = iService.informationDelete(vo);
		
		RedirectView rv = null;
		System.out.println("컨트롤러 cnt="+cnt);
		if(cnt==0) { //상세보기(삭제실패시)
			System.out.println("cnt==0");
			rv = new RedirectView("../information/informationView.do");
			rv.addStaticAttribute("oriNo",   vo.getOriNo());
			rv.addStaticAttribute("nowPage", vo.getNowPage()); //릴레이용
		}
		else {
			//목록보기(삭제성공시)
			System.out.println("cnt!=0");
			rv = new RedirectView("../information/informationList.do");
		}
		mv.setView(rv);
		return mv; 
	}
}
