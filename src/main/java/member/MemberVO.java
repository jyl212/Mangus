package member;

public class MemberVO {
	String id;
	String pass;
	String name;
	String address;
	String mail;
	String birth;
	String phone;
	String encpass;
	
	public String getEncpass() {
		return encpass;
	}

	public void setEncpass(String encpass) {
		this.encpass = encpass;
	}

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

	String gender;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pass=" + pass + ", name=" + name + ", address=" + address +", mail=" + mail + ", birth="
				+ birth + ", phone=" + phone + ", gender=" + gender + ", encpass=" + encpass + "]";
	}
	public MemberVO(String id, String pass, String name, String address, String mail, String birth, String phone,
			String gender,String encpass) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.address = address;
		this.mail = mail;
		this.birth = birth;
		this.phone = phone;
		this.gender = gender;
		this.encpass=encpass;
	}

	public MemberVO() {

	}
}
