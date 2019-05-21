package sb.com.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class AirVO {
	private String airlineNm;
	private String arrAirportNm;
	private String arrPlandTime;
	private String depAirportNm;
	private String depPlandTime;
	private int economyCharge;
	private int no;
	private int cal;
	private String prestigeCharge;
	private String vihicleId;
	private String nick;
	
	public String getAirlineNm() {
		return airlineNm;
	}
	public void setAirlineNm(String airlineNm) {
		this.airlineNm = airlineNm;
	}
	public String getArrAirportNm() {
		return arrAirportNm;
	}
	public void setArrAirportNm(String arrAirportNm) {
		this.arrAirportNm = arrAirportNm;
	}
	public String getArrPlandTime() {
		return arrPlandTime;
	}
	public String getArrPlandTime2() {
		String result = arrPlandTime.substring(0,4)+"년"+arrPlandTime.substring(4,6)+"월"
						+arrPlandTime.substring(6,8)+"일"+"\n"+arrPlandTime.substring(8,10)+"시"
						+arrPlandTime.substring(10,12)+"분";
		
		return result;
	}
	public void setArrPlandTime(String arrPlandTime) {
		this.arrPlandTime = arrPlandTime;
	}
	public String getDepAirportNm() {
		return depAirportNm;
	}
	public void setDepAirportNm(String depAirportNm) {
		this.depAirportNm = depAirportNm;
	}
	public String getDepPlandTime() {
		return depPlandTime;
	}
	public String getDepPlandTime2() {
		String result = arrPlandTime.substring(0,4)+"년"+arrPlandTime.substring(4,6)+"월"
				+arrPlandTime.substring(6,8)+"일"+"\n"+arrPlandTime.substring(8,10)+"시"
				+arrPlandTime.substring(10,12)+"분";
			return result;
	}
	public void setDepPlandTime(String depPlandTime) {
		this.depPlandTime = depPlandTime;
	}
	public int getEconomyCharge() {
		return economyCharge;
	}
	public void setEconomyCharge(int economyCharge) {
		this.economyCharge = economyCharge;
	}
	public String getPrestigeCharge() {
		return prestigeCharge;
	}
	public void setPrestigeCharge(String prestigeCharge) {
		this.prestigeCharge = prestigeCharge;
	}
	public String getVihicleId() {
		return vihicleId;
	}
	public void setVihicleId(String vihicleId) {
		this.vihicleId = vihicleId;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCal() {
		return cal;
	}
	public void setCal(int cal) {
		this.cal = cal;
	}
	
	
}