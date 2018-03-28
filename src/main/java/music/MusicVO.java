package music;

import org.springframework.web.multipart.MultipartFile;

public class MusicVO {
	MultipartFile[] filesrc;
	String file_name;
	String genre;
	String artist;
	String id;
	int count;
	String list;
	String title;
	String photo;
	
	
	public MusicVO() {
		super();
	}
	
	

	public MusicVO(String file_name, String id) {
		super();
		this.file_name = file_name;
		this.id = id;
	}



	public MusicVO(String file_name, String genre, String artist, String id, int count, String list, String title) {
		super();
		this.file_name = file_name;
		this.genre = genre;
		this.artist = artist;
		this.id = id;
		this.count = count;
		this.list = list;
		this.title = title;
	}
	
	
	public MusicVO(String file_name, String genre, String artist, int count, String list, String title, String photo) {
		super();
		this.file_name = file_name;
		this.genre = genre;
		this.artist = artist;
		this.count = count;
		this.list = list;
		this.title = title;
		this.photo = photo;
	}



	public MusicVO(MultipartFile[] filesrc, String file_name, String genre, String artist, String id, int count,
			String list, String title) {
		super();
		this.filesrc = filesrc;
		this.file_name = file_name;
		this.genre = genre;
		this.artist = artist;
		this.id = id;
		this.count = count;
		this.list = list;
		this.title = title;
	}
	
	public String getPhoto() {
		return photo;
	}



	public void setPhoto(String photo) {
		this.photo = photo;
	}



	public MultipartFile[] getFilesrc() {
		return filesrc;
	}
	public void setFilesrc(MultipartFile[] filesrc) {
		this.filesrc = filesrc;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getList() {
		return list;
	}
	public void setList(String list) {
		this.list = list;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Override
	public String toString() {
		return "MusicVO [filesrc=" + filesrc + ", file_name=" + file_name + ", genre=" + genre + ", artist="
				+ artist + ", id=" + id + ", count=" + count + ", list=" + list + ", title=" + title + "]";
	}
	
}


