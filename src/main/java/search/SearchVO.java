package search;

public class SearchVO {
	
	private String keyword;
	private String newstitle;
	private String newslink;
	
	public SearchVO() {
		super();
	}
	
	public SearchVO(String keyword, String newstitle, String newslink) {
		super();
		this.keyword = keyword;
		this.newstitle = newstitle;
		this.newslink = newslink;
	}

	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getNewstitle() {
		return newstitle;
	}
	public void setNewstitle(String newstitle) {
		this.newstitle = newstitle;
	}
	public String getNewslink() {
		return newslink;
	}
	public void setNewslink(String newslink) {
		this.newslink = newslink;
	}

	

}
