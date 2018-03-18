package mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MailController {
	@Autowired
	Mail service;
	@RequestMapping("/mail/send.do")
	public String send(MailVO mail) {
		System.out.println(mail);
		String result=service.sendMail(mail.getSender(),mail.getReceiver(),mail.getTitle(),mail.getText());
		if(result.equals("Fail")) {
			return "mail/mailFail";
		}
		return "mail/mailOk";
	}
	@RequestMapping("/mail/index.do")
	public String index() {
		return "mail";
	}
}
