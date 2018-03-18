package member;

public interface MemberSercive {
	MemberVO idcheck(String id);
	int register(MemberVO member);
	MemberVO login(String id,String password);
}
