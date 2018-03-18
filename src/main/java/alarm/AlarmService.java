package alarm;

import java.util.List;

public interface AlarmService {
	int alarmInsert(AlarmVO alarm);
	List<AlarmVO> alarmList();
	int alarmUpdate(AlarmVO alarm);
}
