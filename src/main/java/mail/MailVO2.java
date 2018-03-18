package mail;

public class MailVO2 {
	String rev;
	String title;
	String text;
	String id;
	String read;
	String send_date;
	String read_date;
	String mail_seq;
	
	public String getRev() {
		return rev;
	}
	public void setRev(String rev) {
		this.rev = rev;
	}
	public String getMail_seq() {
		return mail_seq;
	}
	public void setMail_seq(String mail_seq) {
		this.mail_seq = mail_seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRead() {
		return read;
	}
	public void setRead(String read) {
		this.read = read;
	}
	public String getSend_date() {
		return send_date;
	}
	public void setSend_date(String send_date) {
		this.send_date = send_date;
	}
	public String getRead_date() {
		return read_date;
	}
	public void setRead_date(String read_date) {
		this.read_date = read_date;
	}
	public MailVO2() {
		
	}
	public MailVO2(String rev, String title, String text, String id, String read, String read_date,String mail_seq) {
		super();
		this.rev = rev;
		this.title = title;
		this.text = text;
		this.id = id;
		this.read = read;
		this.read_date = read_date;
		this.mail_seq=mail_seq;
	}
	public MailVO2(String rev, String title, String text, String id, String read, String send_date, String read_date,
			String mail_seq) {
		super();
		this.rev = rev;
		this.title = title;
		this.text = text;
		this.id = id;
		this.read = read;
		this.send_date = send_date;
		this.read_date = read_date;
		this.mail_seq = mail_seq;
	}
}
