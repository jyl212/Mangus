package member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	private ShaPasswordEncoder encoder=new ShaPasswordEncoder(256);
	@Autowired
	MemberSercive service;
	
	@RequestMapping("/member/signup.do")
	public String index() {
		return "/member/signup";
	}
	@RequestMapping(value="/member/login.do",method=RequestMethod.POST)
	public String login(@RequestParam String id,@RequestParam String password,HttpServletRequest request) {
		MemberVO member=service.login(id, password);
		if(member==null) {
			return "/member/login";
		}else {
			HttpSession session=request.getSession();
			session.setAttribute("user",member);
		}
		return "redirect:../index.do";
	}
	@RequestMapping(value="/member/login",method=RequestMethod.GET)
	public String login() {
		return "/member/login";
	}
	@RequestMapping(value="/member/idcheck.do",method=RequestMethod.GET)
	@ResponseBody
	public String idcheck(@RequestParam String id) {
		MemberVO vo=service.idcheck(id);
		String result="";
		if(vo!=null) {
			result="0";
		}else {
			result="1";
		}
		return result;
	}
	@RequestMapping("/member/register.do")
	public String Register(MemberVO member) {
		String dbpass=encoder.encodePassword(member.getPass(),null);
		member.setEncpass(dbpass);
		int result=service.register(member);
		if(result==1) {
			return "/member/joinOk";
		}
		return null;
	}
	@RequestMapping("/member/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session!=null){
			session.invalidate();
		}
		return "redirect:../index.do";
	}
}
