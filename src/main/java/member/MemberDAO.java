package member;

public interface MemberDAO {
	MemberVO idcheck(String id);
	int register(MemberVO member);
	MemberVO login(String id,String password);
}
