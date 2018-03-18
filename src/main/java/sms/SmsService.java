package sms;

import java.util.List;


public interface SmsService {
	
	//조회
	List<GroupVO> glist(String id);
	List<PhoneVO> plist(String title_code);
	
	//추가
	int gInsert(GroupVO group);
	int pInsert(PhoneVO phone);
	
	//삭제
	int gDelete(String title_code);
	int pDelete(String phone);
	
}
