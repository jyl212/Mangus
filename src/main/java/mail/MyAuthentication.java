package mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthentication extends Authenticator {
	PasswordAuthentication account;
	
	public MyAuthentication(String id,String pw) {
		account=new PasswordAuthentication(id,pw);
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		return account;
	}
}
