package mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthentication extends Authenticator {
	PasswordAuthentication account;
	
	public MyAuthentication() {
		String id="jyl212";
		String pw="gnt!skdi#0573";
		account=new PasswordAuthentication(id,pw);
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		return account;
	}
}
