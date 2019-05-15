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
