package mail;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("maildao")
public class MailDAOImpl implements MailDAO{
	@Autowired
	SqlSession session;
	
	@Override
	public int send(MailVO2 data) {
		return session.insert("springProject.mail.send",data);
	}

	@Override
	public List<MailVO2> list(String id) {
		return session.selectList("springProject.mail.list",id);
	}

	@Override
	public int delete(String seq) {
		return session.delete("springProject.mail.delete",seq);
	}

	@Override
	public int update(String seq) {
		Map<String,String> data=new HashMap<String,String>();
		data.put("seq",seq);
		data.put("read","Y");
		return session.update("springProject.mail.update",data);
	}

	@Override
	public String getCount(String id) {
		return session.selectOne("springProject.mail.count",id).toString();
	}

	@Override
	public String getread(String seq) {
		return session.selectOne("springProject.mail.readch",seq);
	}

}
