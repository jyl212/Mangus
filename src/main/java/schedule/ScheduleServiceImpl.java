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
		System.out.println(schedule+"serviceservicesssssssssssssssssssssssssss");
		return dao.scheduleInsert(schedule);
	}

	@Override
	public List<ScheduleVO> scheduleList() {
		return dao.scheduleList();
	}


}