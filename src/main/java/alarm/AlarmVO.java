package alarm;

public class AlarmVO {
	int alarm_no;
	String alarm_time;
	String id;
	String yoil;
	String alarm_title;

	public AlarmVO(){
		
	}

	@Override
	public String toString() {
		return "AlarmVO [alarm_no=" + alarm_no + ", alarm_time=" + alarm_time + ", id=" + id + ", yoil=" + yoil
				+ ", alarm_title=" + alarm_title + "]";
	}

	public int getAlarm_no() {
		return alarm_no;
	}

	public void setAlarm_no(int alarm_no) {
		this.alarm_no = alarm_no;
	}

	public String getAlarm_time() {
		return alarm_time;
	}

	public void setAlarm_time(String alarm_time) {
		this.alarm_time = alarm_time;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getYoil() {
		return yoil;
	}

	public void setYoil(String yoil) {
		this.yoil = yoil;
	}

	public String getAlarm_title() {
		return alarm_title;
	}

	public void setAlarm_title(String alarm_title) {
		this.alarm_title = alarm_title;
	}
	
}
