package kr.or.ddit.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class EmailService{
	
	static final String USER = "gavethesun@naver.com";
	static final String PASSWORD = "javajava123";
	
	
	public static void mailSend(String mem_mail, String subject, String text) throws Exception {
		
		//받는사람, 메일제목, 내용 (map)
		String mail_EncodingType = "EUC-KR";
		
//		2. Property에 SMTP 서버 정보를 설정
//		(Property는 HashMap과 비슷한데 파일 입출력이 가능하다고 한다.)
		Properties prop = new Properties();
		String host = "smtp.naver.com";
		int port = 465; 
		
		// SMTP 서버명
		prop.put("mail.smtp.host", host);
		
		// SMTP 포트명
		prop.put("mail.smtp.port", port);
		
		// 권한 설정, SSL 연결
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", host);
		
		prop.put("mail.mime.charset", mail_EncodingType);
		
		
		// 세션 인스턴스화
		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator(){
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(USER, PASSWORD);
			}
		});
//		session.setDebug(true);
		
		try {
			if(!(mem_mail.equals(null) || subject.equals(null) || text.equals(null))){
				MimeMessage message = new MimeMessage(session);
				
				
				// 발신자
				message.setFrom(new InternetAddress(USER, "EzCooQ", "EUC-KR"));
				
				// 수신자 메일주소
				message.addRecipient(Message.RecipientType.TO,  new InternetAddress(mem_mail));
				
				// subject (메일 제목)
				message.setSubject(subject);
				
				// text (메일 내용)
				
				MimeMultipart multipart = new MimeMultipart("related");
				
				//본문파츠1
				BodyPart messageBodyPart = new MimeBodyPart();
				String htmlText = "<img width='360px' height='446px' src=\"http://www.safetimes.co.kr/news/photo/201802/62438_32712_4213.jpg\">"
						+ "<br> <h2>" + text + "</h2>";
				messageBodyPart.setContent(htmlText,"text/html; charset=EUC-KR");
			    multipart.addBodyPart(messageBodyPart);
			    
			    /*
			    //본문파츠2
			    BodyPart messageBodyPart2 = new MimeBodyPart();
	            DataSource fds = new FileDataSource("D:\\CGV_ticket_pdf.pdf");
	            messageBodyPart2.setDataHandler(new DataHandler(fds));
	            messageBodyPart2.setFileName("CGV_ticket_pdf.pdf");
	            multipart.addBodyPart(messageBodyPart2);
	            */
			    
	            //메일 세팅
	            message.setContent(multipart);

				// 메일 전송
				Transport.send(message);
				
				System.out.println("메세지 전송 완료");
			}else{
				System.out.println("오류 - 메일 제목 또는 내용을 받아올 수 없습니다");
				return;
			}
		}catch(AddressException e){
			e.printStackTrace();
		}catch(MessagingException e){
			e.printStackTrace();
		}
	}
	
}
