package schedule;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class ScheduleServiceImpl implements ScheduleService {
	@Autowired
	@Qualifier("scheduledao")
	ScheduleDAO dao;
	
	@Override
	public int scheduleInsert(ScheduleVO schedule) {
		return dao.scheduleInsert(schedule);
	}

	@Override
	public List<ScheduleVO> scheduleList() {
		return dao.scheduleList();
	}

	@Override
	public ScheduleVO scheduleInfo(int schedule_no) {
		return dao.scheduleInfo(schedule_no);
	}

	@Override
	public int scheduleUpdate(ScheduleVO schedule) {
		return dao.scheduleUpdate(schedule);
	}


}