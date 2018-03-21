package schedule;

public class ScheduleVO {
	int schedule_no;
	String id;
	String schedule_title;
	String schedule_location;
	String schedule_memo;
	String alarm_flag;
	String startdate;
	String starttime;
	String enddate;
	String endtime;

	public ScheduleVO(){
		
	}
	
	
	public ScheduleVO(int schedule_no, String id, String schedule_title, String schedule_location, String schedule_memo,
			String alarm_flag, String startdate, String starttime, String enddate, String endtime) {
		super();
		this.schedule_no = schedule_no;
		this.id = id;
		this.schedule_title = schedule_title;
		this.schedule_location = schedule_location;
		this.schedule_memo = schedule_memo;
		this.alarm_flag = alarm_flag;
		this.startdate = startdate;
		this.starttime = starttime;
		this.enddate = enddate;
		this.endtime = endtime;
	}


	@Override
	public String toString() {
		return "ScheduleVO [schedule_no=" + schedule_no + ", id=" + id + ", schedule_title=" + schedule_title
				+ ", schedule_location=" + schedule_location + ", schedule_memo=" + schedule_memo + ", alarm_flag="
				+ alarm_flag + ", startdate=" + startdate + ", starttime=" + starttime + ", enddate=" + enddate
				+ ", endtime=" + endtime + "]";
	}


	public int getSchedule_no() {
		return schedule_no;
	}

	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
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

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	
	

	
}
