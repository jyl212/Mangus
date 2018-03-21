package schedule;

import java.util.List;

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
}