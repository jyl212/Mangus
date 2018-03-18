package sms;


public class PhoneVO {
	public String title;
	public String phone;
	public String name;
	public String title_code;
	
	public PhoneVO(){
		
	}
	
	

	public PhoneVO(String phone, String name, String title_code) {
		super();
		this.phone = phone;
		this.name = name;
		this.title_code = title_code;
	}



	public PhoneVO(String title, String phone, String name, String title_code) {
		super();
		this.title = title;
		this.phone = phone;
		this.name = name;
		this.title_code = title_code;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle_code() {
		return title_code;
	}

	public void setTitle_code(String title_code) {
		this.title_code = title_code;
	}

	
	
	
}
