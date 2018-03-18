package sms;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class SmsServiceImpl implements SmsService{
	@Autowired
	@Qualifier("smsdao")
	SmsDAO dao;

	@Override
	public List<GroupVO> glist(String id) {
		
		return dao.glist(id);
	}

	@Override
	public List<PhoneVO> plist(String title_code) {
		
		return dao.plist(title_code);
	}

	@Override
	public int gInsert(GroupVO group) {
		
		return dao.gInsert(group);
	}

	@Override
	public int pInsert(PhoneVO phone) {
		
		return dao.pInsert(phone);
	}

	@Override
	public int gDelete(String title_code) {
		
		return dao.gDelete(title_code);
	}

	@Override
	public int pDelete(String phone) {
		
		return dao.pDelete(phone);
	}
	
}
