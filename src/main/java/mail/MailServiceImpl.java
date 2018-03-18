package mail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService{
	@Autowired
	@Qualifier("maildao")
	MailDAO dao;
	
	@Override
	public int send(MailVO2 data) {
		return dao.send(data);
	}

	@Override
	public List<MailVO2> list(String id) {
		return dao.list(id);
	}

	@Override
	public int delete(String seq) {
		return dao.delete(seq);
	}
	@Override
	public int update(String seq) {
		return dao.update(seq);
	}

	@Override
	public String getCount(String id) {
		return dao.getCount(id);
	}

	@Override
	public String getread(String seq) {
		return dao.getread(seq);
	}
}
