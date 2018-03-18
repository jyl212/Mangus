package music;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class MusicVO {
	
	private String filename;
	private String photo;
	private String genre;
	private String artist;
	private int count;
	private String list;
	private String id;
	private MultipartFile files[];
	
	public MusicVO(){
		
	}

	public MusicVO(String filename, String photo, String genre, String artist, int count, String list, String id,
			MultipartFile[] files) {
		super();
		this.filename = filename;
		this.photo = photo;
		this.genre = genre;
		this.artist = artist;
		this.count = count;
		this.list = list;
		this.id = id;
		this.files = files;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public MultipartFile[] getFiles() {
		return files;
	}

	public void setFiles(MultipartFile[] files) {
		this.files = files;
	}
	@Override
	public String toString() {
		return "MusicVO [filename=" + filename + ", photo=" + photo + ", genre=" + genre + ", artist=" + artist
				+ ", count=" + count + ", list=" + list + ", id=" + id + ", files=" + Arrays.toString(files) + "]";
	}

	
	
	
}
