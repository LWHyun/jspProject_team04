package bean;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailCheck {
	private static EmailCheck instance;
	
	private EmailCheck() {}
	
	public static EmailCheck getInstance() {
		if(instance == null) {
			instance = new EmailCheck();
		}
		return instance;
	}
	
	// 메일 보내고 인증번호 반환
	public String sendEmail(String mem_email) {
		//인증코드 생성
		String host = "http://localhost:8181/j20220904/";		
		String from = "rmaksgnacu@gmail.com";
		String to = mem_email;
		String code = String.valueOf((int)(Math.random()*888888)+111111);
		
		//사용자에게 보낼 메시지
		String subject = "[신사몰] 이메일 인증 인증번호 안내 드립니다.";
		String content = "<div style=\"width: 750px; margin: 0 auto; line-height: 1; color: #000; font-family:'맑은고딕', 'MalgunGothic', 'Malgun Gothic', Dotum;\">"
				+"<div style=\"min-height: 422px; padding: 68px 34px 79px; border: 1px solid #999; \">\r\n"
				+ "			<h2 style=\"margin: 0; padding: 0; font-size: 28px; color: #000; font-weight: bold; line-height:1; letter-spacing: -2.8px;\">[신사몰] 이메일 인증 인증번호 안내 드립니다.</h2>\r\n"
				+ "			<p style=\"padding:0; margin: 31px 0 0; font-size: 15px; line-height:25px; letter-spacing: -1.5px;\">\r\n"
				+ "				고객님의 소중한 개인정보보호를 위하여 이메일 인증을 진행 합니다. <br>\r\n"
				+ "				아래 인증번호를 <span style=\"font-weight: bold;\">인증번호란에 입력하고 ‘확인’ 버튼을 클릭하시면 인증이 완료</span>됩니다.\r\n"
				+ "			</p>\r\n"
				+ "			<div style=\"margin-top: 42px; font-size: 0;\">\r\n"
				+ "				<span style=\"display: inline-block; margin-top: 2px; font-size: 20px; font-weight: bold; vertical-align: top; letter-spacing: -2px\">인증번호</span>\r\n"
				+ "				<span style=\"display: inline-block; margin-left: 6px; font-size: 22px; font-weight: bold; vertical-align: top; letter-spacing: -1.1px; color: #ee1c25\">"+code+"</span>\r\n"
				+ "			</div>\r\n"
				+ "		</div>"
				+ "</div>";

		Properties p = new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com");
		p.put("mail.smtp.port", "465"); //TLS 587, SSL 465
		p.put("mail.smtp.starttls.enable", "true");
		p.put("defaultEncoding", "utf-8");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465"); 
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.sockerFactory.fallback", "false");

		
		try {
			Authenticator auth = Gmail.getInstance();
			Session ses = Session.getInstance(p, auth);
			ses.setDebug(true);
			MimeMessage msg = new MimeMessage(ses);
			msg.setSubject(subject);
			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr);
			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(content, "text/html; charset=UTF8");
			Transport.send(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return code;
	
	}
}
