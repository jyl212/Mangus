package authentication;

import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import member.MemberVO;

public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
	@Autowired
	SecurityLoginService securityService;
	private ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse res,
			Authentication authdata)
			throws IOException, ServletException {
		SecurityLoginDTO dto = (SecurityLoginDTO)authdata.getPrincipal();
		String url = "/springProject/index.do";
		Collection<GrantedAuthority> authlist= dto.getAuthorities();
		Iterator<GrantedAuthority> authlistit = authlist.iterator();
		while(authlistit.hasNext()) {
			GrantedAuthority authority = authlistit.next();
			url = "/springProject/index.do";
		}
		HttpSession session=req.getSession();
		dto.setId(authdata.getName().toString());
		session.setAttribute("user", dto);
		res.sendRedirect(url);
	}

}
