package alarm;

import java.util.List;

public interface AlarmDAO {
	int alarmInsert(AlarmVO alarm);
	List<AlarmVO> alarmList();
	int alarmUpdate(AlarmVO alarm);
}
