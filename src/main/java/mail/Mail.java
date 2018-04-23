package mail;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.stereotype.Service;

@Service
public class Mail {
	public String sendMail(final String senderid, String revid, String title, String text,String password,String seq) {
		String result = "";

		String web=senderid.split("@")[1];
		if(web.equals("naver.com")) {
			result=NaverMail(senderid,revid,title,text,password,seq);
		}else if(web.equals("gmail.com")) {
			result=Gmail(senderid, revid, title, text, password,seq);
		}else if(web.equals("daum.net")) {
			result=DaumMail(senderid, revid, title, text, password,seq);
		}
		return result;
	}
	
	public String NaverMail(final String senderid, String revid, String title, String text,String password,String seq) {
		String result;
		Properties props = System.getProperties();

		props.put("mail.smtp.host", "smtp.naver.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.starttls.enable", "ture");
		props.put("mail.smtp.auth", "true");
		String id=senderid.split("@")[0];
		Authenticator auth=new MyAuthentication(id,password);
		Session session = Session.getDefaultInstance(props,auth);
		Message mimeMessage = new MimeMessage(session);
		
		try {
			mimeMessage.setFrom(new InternetAddress(senderid));
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(revid));
			mimeMessage.setSubject(title);
			MimeMultipart multipart = new MimeMultipart("related");
			BodyPart messageBodyPart = new MimeBodyPart();
			String imgtext="<img src=\"http://127.0.0.1:8088/springProject/mail/mailOpenCheck.do?seq="+seq+"\" style=\"width:0px;height:0px;\"/>\n<p>"+text+"</p>";
			messageBodyPart.setContent(imgtext, "text/html");
			multipart.addBodyPart(messageBodyPart);
			mimeMessage.setContent(multipart);
			Transport.send(mimeMessage);
			result = "OK";
		} catch (AddressException e) {
			e.printStackTrace();
			result = "Fail";
		} catch (MessagingException e) {
			e.printStackTrace();
			result = "Fail";
		}
		return result;
	}
	
	public String Gmail(final String senderid, String revid, String title, String text,String password,String seq) {
		java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
		String result;
		String SMTP_HOST_NAME = "gmail-smtp.l.google.com";
		
		Properties props = System.getProperties();
		props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.starttls.enable","true");
        props.put("mail.smtp.host", SMTP_HOST_NAME);
        props.put("mail.smtp.auth", "true");
        
		Authenticator auth=new MyAuthentication(senderid,password);
		Session session = Session.getDefaultInstance(props,auth);
		Message mimeMessage = new MimeMessage(session);
		
		try {
			mimeMessage.setFrom(new InternetAddress(senderid));
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(revid));
			mimeMessage.setSubject(title);
			MimeMultipart multipart = new MimeMultipart("related");
			BodyPart messageBodyPart = new MimeBodyPart();
			String imgtext="<img src=\"http://127.0.0.1:8088/springProject/mail/mailOpenCheck.do?seq="+seq+"\" style=\"width:0px;height:0px;\"/>\n<p>"+text+"</p>";
			messageBodyPart.setContent(imgtext, "text/html");
			multipart.addBodyPart(messageBodyPart);
			mimeMessage.setContent(multipart);
			Transport.send(mimeMessage);
			result = "OK";
		} catch (AddressException e) {
			e.printStackTrace();
			result = "Fail";
		} catch (MessagingException e) {
			e.printStackTrace();
			result = "Fail";
		}
		return result;
	}
	public String DaumMail(final String senderid, String revid, String title, String text,String password,String seq) {
		String result;
		Properties props = System.getProperties();

		props.put("mail.smtp.host", "smtp.daum.net");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		String id=senderid.split("@")[0];
		Authenticator auth=new MyAuthentication(id,password);
		Session session = Session.getDefaultInstance(props,auth);
		Message mimeMessage = new MimeMessage(session);
		
		try {
			mimeMessage.setFrom(new InternetAddress(senderid));
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(revid));
			mimeMessage.setSubject(title);
			MimeMultipart multipart = new MimeMultipart("related");
			BodyPart messageBodyPart = new MimeBodyPart();
			String imgtext="<img src=\"http://127.0.0.1:8088/springProject/mail/mailOpenCheck.do?seq="+seq+"\" style=\"width:0px;height:0px;\"/>\n<p>"+text+"</p>";
			messageBodyPart.setContent(imgtext, "text/html");
			multipart.addBodyPart(messageBodyPart);
			mimeMessage.setContent(multipart);
			Transport.send(mimeMessage);
			result = "OK";
		} catch (AddressException e) {
			e.printStackTrace();
			result = "Fail";
		} catch (MessagingException e) {
			e.printStackTrace();
			result = "Fail";
		}
		return result;
	}
}
