package schedule;

import java.util.List;

public interface ScheduleService {
	int scheduleInsert(ScheduleVO schedule);
	List<ScheduleVO> scheduleList();
	ScheduleVO scheduleInfo(int schedule_no);
	int scheduleUpdate(ScheduleVO schedule);
	List<ScheduleVO> todayschedule(String mTime, String id);
}
