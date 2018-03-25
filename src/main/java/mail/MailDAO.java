package mail;

import java.util.List;

public interface MailDAO {
	int send(MailVO2 data);
	List<MailVO2> list(String id);
	int delete(String seq);
	int update(String seq);
	String getCount(String id);
	String getread(String seq);
	MailVO2 read(String mail_seq);
}