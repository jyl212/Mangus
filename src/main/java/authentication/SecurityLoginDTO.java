package authentication;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class SecurityLoginDTO extends User{
	String id;
	String pass;
	String name;
	String address;
	String mail;
	String birth;
	String phone;
	String gender;
	String role;
	String encpass;
	
	public SecurityLoginDTO(String id, String encpass, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities) {
		super(id, encpass, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
	}
	public SecurityLoginDTO(String id, String encpass, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities,String name, String address, String mail, String birth, String phone,
			String gender,String role,String pass) {
		super(id, encpass, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		this.name = name;
		this.address = address;
		this.mail = mail;
		this.birth = birth;
		this.phone = phone;
		this.gender = gender;
		this.role=role;
		this.pass=pass;
		System.out.println("작업완료");
	}
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
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pass=" + pass + ", name=" + name + ", address=" + address +", mail=" + mail + ", birth="
				+ birth + ", phone=" + phone + ", gender=" + gender + ", role="+role+ ", encpass=" + encpass+"]";
	}
	
}