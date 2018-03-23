package authentication;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class SecurityLoginService implements UserDetailsService{
	@Autowired
	SqlSession sqlsession;
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Map<String,Object> user=sqlsession.selectOne("springProject.member.securityLogin",username);
		UserDetails loginUser=null;
	
		List<GrantedAuthority> gaslist=new ArrayList<GrantedAuthority>();
		gaslist.add(new SimpleGrantedAuthority(user.get("AUTHORITY").toString()));
		loginUser=new SecurityLoginDTO(user.get("USERNAME").toString(),user.get("PASSWORD").toString(), 
				true, true, true, true, gaslist,
				user.get("NAME").toString(),user.get("ADDRESS").toString(),
				user.get("MAIL").toString(),user.get("BIRTH").toString(),
				user.get("PHONE").toString(),user.get("GENDER").toString(),
				user.get("AUTHORITY").toString(),user.get("PASS").toString());
		return loginUser;
	}
}