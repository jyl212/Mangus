package mail;

public class MailVO {
	String sender;
	String receiver;
	String title;
	String text;
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	@Override
	public String toString() {
		return "MailVO [sender=" + sender + ", receiver=" + receiver + ", title=" + title + ", text=" + text + "]";
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
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
	public MailVO(String sender, String receiver, String title, String text) {
		super();
		this.sender = sender;
		this.receiver = receiver;
		this.title = title;
		this.text = text;
	}
	public MailVO() {
		
	}
}
