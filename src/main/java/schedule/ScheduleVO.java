package schedule;

public class ScheduleVO {
	int schedule_no;
	String schedule_date;
	String id;
	String schedule_title;
	String schedule_location;
	String schedule_memo;
	String alarm_flag;

	public ScheduleVO(){
		
	}
	
	
	public ScheduleVO(int schedule_no, String schedule_date, String id, String schedule_title, String schedule_location,
			String schedule_memo, String alarm_flag) {
		super();
		this.schedule_no = schedule_no;
		this.schedule_date = schedule_date;
		this.id = id;
		this.schedule_title = schedule_title;
		this.schedule_location = schedule_location;
		this.schedule_memo = schedule_memo;
		this.alarm_flag = alarm_flag;
	}


	public int getSchedule_no() {
		return schedule_no;
	}


	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}


	public String getSchedule_date() {
		return schedule_date;
	}


	public void setSchedule_date(String schedule_date) {
		this.schedule_date = schedule_date;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getSchedule_title() {
		return schedule_title;
	}


	public void setSchedule_title(String schedule_title) {
		this.schedule_title = schedule_title;
	}


	public String getSchedule_location() {
		return schedule_location;
	}


	public void setSchedule_location(String schedule_location) {
		this.schedule_location = schedule_location;
	}


	public String getSchedule_memo() {
		return schedule_memo;
	}


	public void setSchedule_memo(String schedule_memo) {
		this.schedule_memo = schedule_memo;
	}


	public String getAlarm_flag() {
		return alarm_flag;
	}


	public void setAlarm_flag(String alarm_flag) {
		this.alarm_flag = alarm_flag;
	}


	@Override
	public String toString() {
		return "ScheduleVO [schedule_no=" + schedule_no + ", schedule_date=" + schedule_date + ", id=" + id
				+ ", schedule_title=" + schedule_title + ", schedule_location=" + schedule_location + ", schedule_memo="
				+ schedule_memo + ", alarm_flag=" + alarm_flag + "]";
	}

	
}
