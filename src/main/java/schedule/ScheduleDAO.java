package schedule;

import java.util.List;

public interface ScheduleDAO {
	int scheduleInsert(ScheduleVO schedule);
	List<ScheduleVO> scheduleList();
	ScheduleVO scheduleInfo(int schedule_no);
	int scheduleUpdate(ScheduleVO schedule);
}
