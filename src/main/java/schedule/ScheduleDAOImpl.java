package schedule;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("scheduledao")
public class ScheduleDAOImpl implements ScheduleDAO {
	@Autowired
	SqlSession session;
	
	@Override
	public int scheduleInsert(ScheduleVO schedule) {
		System.out.println(schedule);
		return session.insert("springProject.schedule.insert",schedule);
	}

	@Override
	public List<ScheduleVO> scheduleList() {
		List<ScheduleVO> schedulelist = session.selectList("springProject.schedule.list");
		return schedulelist;
	}

	@Override
	public ScheduleVO scheduleInfo(int schedule_no) {
		ScheduleVO scheduleinfo = session.selectOne("springProject.schedule.selectvo", schedule_no);
		return scheduleinfo;
	}

	@Override
	public int scheduleUpdate(ScheduleVO schedule) {
		return session.update("springProject.schedule.update",schedule);
	}

	@Override
	public List<ScheduleVO> todayschedule(String mTime,String id) {
		Map<String, String> value = new HashMap<String,String>();
		value.put("mTime", mTime);
		value.put("id", id);
		return session.selectList("springProject.schedule.todayList",value);
	}
}