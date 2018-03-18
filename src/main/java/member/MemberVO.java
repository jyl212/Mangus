package member;

public class MemberVO {
	String id;
	String password;
	String name;
	String address;
	String mail;
	String birth;
	String phone;
	
	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	char gender;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", address=" + address +", mail=" + mail + ", birth="
				+ birth + ", phone=" + phone + ", gender=" + gender + "]";
	}
	public MemberVO(String id, String password, String name, String address, String mail, String birth, String phone,
			char gender) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.address = address;
		this.mail = mail;
		this.birth = birth;
		this.phone = phone;
		this.gender = gender;
	}

	public MemberVO() {

	}
}
