package sms;


public class GroupVO {
	public String title_code;
	public String title;
	public String id;
	
	public GroupVO(){
		
	}

	public GroupVO(String title_code, String title, String id) {
		super();
		this.title_code = title_code;
		this.title = title;
		this.id = id;
	}

	public String getTitle_code() {
		return title_code;
	}

	public void setTitle_code(String title_code) {
		this.title_code = title_code;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
	
	
	
}
