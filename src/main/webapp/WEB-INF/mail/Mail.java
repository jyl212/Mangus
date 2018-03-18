package mail;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

@Service
public class Mail {
	public String sendMail(final String senderid, String revid, String title, String text) {
		String result = "";
		Properties props = System.getProperties();

		props.put("mail.smtp.host", "smtp.naver.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.starttls.enable", "ture");
		props.put("mail.smtp.auth", "true");
		
		Authenticator auth=new MyAuthentication();
		Session session = Session.getDefaultInstance(props,auth);
		Message mimeMessage = new MimeMessage(session);
		
		try {
			mimeMessage.setFrom(new InternetAddress(senderid));
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(revid));
			mimeMessage.setSubject(title);
			mimeMessage.setText(text);
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
