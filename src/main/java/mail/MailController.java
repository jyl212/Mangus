package mail;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import authentication.SecurityLoginDTO;
import member.MemberVO;

@Controller
public class MailController {
	@Autowired
	Mail logic;
	@Autowired
	MailService service;
	
	@RequestMapping("/mail/send.do")
	public String send(MailVO mail,@RequestParam String userpassword,@RequestParam String userid) {
		String seq=userid+(Integer.parseInt(service.getCount(userid))+1);
		String result=logic.sendMail(mail.getSender(),mail.getReceiver(),mail.getTitle(),mail.getText(),userpassword,seq);
		MailVO2 data=new MailVO2(mail.getReceiver(),mail.getTitle(),mail.getText(),userid,"N","읽지 않음",seq);
		int dbresult=service.send(data);
		if(result.equals("Fail")|dbresult!=1) {
			return "mail/mailFail";
		}
		return "mail/mailOk";
	}
	@RequestMapping("/mail/index.do")
	public ModelAndView index(String rev) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("rev",rev);
		mav.setViewName("mail");
		return mav;
	}
	@RequestMapping("/mail/mailOpenCheck.do")
	public void mailCheck(@RequestParam String seq) {
		if(service.getread(seq).equals("N")) {
			int result=service.update(seq);
		}
	}
	@RequestMapping("/mail/mailList.do")
	public ModelAndView mailList(HttpServletRequest request) {
		HttpSession session=request.getSession();
		ModelAndView mav=new ModelAndView();
		SecurityLoginDTO member=(SecurityLoginDTO)session.getAttribute("user");
		mav.addObject("list",service.list(member.getId()));
		mav.setViewName("mail/sendlist");
		return mav;
	}
	@RequestMapping("/mail/delete.do")
	public String mailDelete(@RequestParam String seq) {
		int result=service.delete(seq);
		if(result==1) {
			return "redirect:/mail/mailList.do";
		}
		return "mail/deleteFail";
	}
	@RequestMapping("/mail/read.do")
	public ModelAndView mailRead(@RequestParam String mail_seq) {
		ModelAndView mav=new ModelAndView();
		MailVO2 data=service.read(mail_seq);
		mav.addObject("mail",data);
		mav.setViewName("mail/read");
		return mav;
	}
}
