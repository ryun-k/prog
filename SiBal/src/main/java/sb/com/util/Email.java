package sb.com.util;

import org.apache.commons.mail.HtmlEmail;

public class Email {
	
	public static void sendMail(String email, String subject, String msg)throws Exception{
		
		//mail server����
		String charSet= "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "nazzzang";
		String hostSMTPpwd = "bawr@1404";
		
		//������ ���
		String fromEmail = "nazzzang@naver.com";
		String fromName = "��й�ȣã��";
		
		//email����
		
		HtmlEmail mail = new HtmlEmail();
		mail.setDebug(true);
		mail.setCharset(charSet);
		mail.setSSLOnConnect(true);
		
		mail.setHostName(hostSMTP);
		mail.setSmtpPort(587);
		
		mail.setAuthentication(hostSMTPid, hostSMTPpwd);
		mail.setStartTLSEnabled(true);
		mail.addTo(email);
		mail.setFrom(fromEmail,fromName,charSet);
		mail.setSubject(subject);
		mail.setHtmlMsg(msg);
		mail.send();
	}
}
