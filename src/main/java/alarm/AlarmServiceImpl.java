package alarm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class AlarmServiceImpl implements AlarmService {
	@Autowired
	@Qualifier("alarmdao")
	AlarmDAO dao;
	
	@Override
	public int alarmInsert(AlarmVO alarm) {
		return dao.alarmInsert(alarm);
	}

	@Override
	public List<AlarmVO> alarmList() {
		
		return dao.alarmList();
	}

	@Override
	public int alarmUpdate(AlarmVO alarm) {
		
		return dao.alarmUpdate(alarm);
	}
}