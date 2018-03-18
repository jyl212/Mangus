package sms;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("smsdao")
public class SmsDAOImpl implements SmsDAO{
	@Autowired
	SqlSession session;

	@Override
	public List<GroupVO> glist(String id) {
		
		return session.selectList("springProject.sms.phone_glist",id);
	}

	@Override
	public List<PhoneVO> plist(String title_code) {
		
		return session.selectList("springProject.sms.phone_phone_list",title_code);
	}

	@Override
	public int gInsert(GroupVO group) {
		
		return session.insert("springProject.sms.gInsert", group);
	}

	@Override
	public int pInsert(PhoneVO phone) {
		
		return session.insert("springProject.sms.pInsert", phone);
	}

	@Override
	public int gDelete(String title_code) {
		
		return session.delete("springProject.sms.gDelete", title_code);
	}

	@Override
	public int pDelete(String phone) {
		
		return session.delete("springProject.sms.pDelete", phone);
	}

	
	
}
