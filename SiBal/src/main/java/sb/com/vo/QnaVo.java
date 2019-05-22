package sb.com.vo;

import java.sql.Date;

public class QnaVo {
	
	private int no;
	private int pNo;
	private String title;
	private String content;
	private String id;
	private Date wDate;
	private int hit;
	private int rNo; // rownum
	private int ref;
	private int step;
	private int depth;
	
	private int start;
	private int end;
	
	private int oriNo;
	private int nowPage;
	
	private String target;
	private String word;
	
	// 댓글용
	
	private int reNo;
	private int reQNo;
	private int rePNo;
	private String reContent;
	private Date reWDate;
	private int reDepth;
	private int reRef;
	
	private int reRNo;
	private int reNowPage;
	
	private String reCheck;
	
	
	public String getReCheck() {
		return reCheck;
	}
	public void setReCheck(String reCheck) {
		this.reCheck = reCheck;
	}
	public int getReNowPage() {
		return reNowPage;
	}
	public void setReNowPage(int reNowPage) {
		this.reNowPage = reNowPage;
	}
	public int getRePNo() {
		return rePNo;
	}
	public void setRePNo(int rePNo) {
		this.rePNo = rePNo;
	}
	public int getReNo() {
		return reNo;
	}
	public void setReNo(int reNo) {
		this.reNo = reNo;
	}
	public int getReQNo() {
		return reQNo;
	}
	public void setReQNo(int reQNo) {
		this.reQNo = reQNo;
	}
	public String getReContent() {
		return reContent;
	}
	
	public String getBrReContent() {
		String result="";
		if(reContent!=null && reContent.length()!=0) {
			result = reContent.replace("\r\n", "<br/>");
		}
		return result;
	}
	
	public void setReContent(String reContent) {
		this.reContent = reContent;
	}
	public Date getReWDate() {
		return reWDate;
	}
	public void setReWDate(Date reWDate) {
		this.reWDate = reWDate;
	}
	public int getReDepth() {
		return reDepth;
	}
	public void setReDepth(int reDepth) {
		this.reDepth = reDepth;
	}
	public int getReRef() {
		return reRef;
	}
	public void setReRef(int reRef) {
		this.reRef = reRef;
	}
	public int getReRNo() {
		return reRNo;
	}
	public void setReRNo(int reRNo) {
		this.reRNo = reRNo;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	
	
	
	public int getOriNo() {
		return oriNo;
	}
	public void setOriNo(int oriNo) {
		this.oriNo = oriNo;
	}
	public int getrNo() {
		return rNo;
	}
	public void setrNo(int rNo) {
		this.rNo = rNo;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	
	public String getBrContent() {
		String result="";
		if(content!=null && content.length()!=0) {
			result = content.replace("\r\n", "<br/>");
		}
		return result;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getwDate() {
		return wDate;
	}
	public void setwDate(Date wDate) {
		this.wDate = wDate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	
}
