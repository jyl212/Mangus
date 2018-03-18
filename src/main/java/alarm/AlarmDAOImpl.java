package alarm;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("alarmdao")
public class AlarmDAOImpl implements AlarmDAO {
	@Autowired
	SqlSession session;
	
	@Override
	public int alarmInsert(AlarmVO alarm) {
		System.out.println(alarm);
		return session.insert("springProject.alarm.insert",alarm);
	}

	@Override
	public List<AlarmVO> alarmList() {
		List<AlarmVO> alarmlist = session.selectList("springProject.alarm.list");
		if(alarmlist==null) {
			return null;
		}else {
			return alarmlist;
		}
		
	}

	@Override
	public int alarmUpdate(AlarmVO alarm) {
		
		return session.update("springProject.alarm.update",alarm);
	}

}