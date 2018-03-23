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
		System.out.println("loadUserByUsername");
		Map<String,Object> user=sqlsession.selectOne("springProject.member.securityLogin",username);
		System.out.println("user===>"+user);
		UserDetails loginUser=null;
	
		List<GrantedAuthority> gaslist=new ArrayList<GrantedAuthority>();
		gaslist.add(new SimpleGrantedAuthority(user.get("AUTHORITY").toString()));
		System.out.println("id==>"+user.get("USERNAME").toString()+"password=>"+user.get("PASSWORD").toString());
	/*	>{PASSWORD=gnt!skdi#0573, MAIL=jyl212@naver.com, ADDRESS=서울 강북구 수유동 468-146 ㅁㅁㅁㅁ,
				PHONE=01055592820, USERNAME=jyl212, GENDER=F, BIRTH=950212, NAME=이주영, AUTHORITY=ROLE_USER}*/
		loginUser=new SecurityLoginDTO(user.get("USERNAME").toString(),user.get("PASSWORD").toString(), 
				true, true, true, true, gaslist,
				user.get("NAME").toString(),user.get("ADDRESS").toString(),
				user.get("MAIL").toString(),user.get("BIRTH").toString(),
				user.get("PHONE").toString(),user.get("GENDER").toString(),
				user.get("AUTHORITY").toString());
		System.out.println("test4");
		System.out.println("loginuser==>"+loginUser);
		return loginUser;
	}
}