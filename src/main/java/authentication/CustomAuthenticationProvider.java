package authentication;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.User;

public class CustomAuthenticationProvider implements AuthenticationProvider{
	@Autowired
	SecurityLoginService securityService;
	private ShaPasswordEncoder encoder=new ShaPasswordEncoder(256);
	@Override
	public Authentication authenticate(Authentication data) throws AuthenticationException {
		String username=data.getName();
		String pwd=data.getCredentials().toString();
		Object obj=data.getPrincipal();
		User user=(User)securityService.loadUserByUsername(username);
		boolean state=encoder.isPasswordValid(user.getPassword(),pwd,null);
		UsernamePasswordAuthenticationToken authUser=null;
		if(state) {
			authUser=new UsernamePasswordAuthenticationToken(user, pwd,user.getAuthorities());
		}
		return authUser;
	}
	@Override
	public boolean supports(Class<?> arg0) {
		return true;
	}
}