package member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberSercive {
	@Autowired
	@Qualifier("memberdao")
	MemberDAO dao;
	
	@Override
	public MemberVO idcheck(String id) {
		return dao.idcheck(id);
	}
	@Override
	public int register(MemberVO member) {
		return dao.register(member);
	}
	@Override
	public MemberVO login(String id, String password) {
		return dao.login(id, password);
	}
}