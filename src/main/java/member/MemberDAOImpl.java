package member;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("memberdao")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	SqlSession session;
	
	@Override
	public MemberVO idcheck(String id) {
		return session.selectOne("springProject.member.check",id);
	}
	@Override
	public int register(MemberVO member) {
		return session.insert("springProject.member.insert",member);
	}
	@Override
	public MemberVO login(String id, String password) {
		Map<String,String> values=new HashMap<>();
		values.put("id",id);
		values.put("password",password);
		return session.selectOne("springProject.member.login",values);
	}
}