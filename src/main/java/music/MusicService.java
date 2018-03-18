package music;

import java.util.List;

public interface MusicService {
	
	int insert(MusicVO comment);
	
	List<MusicVO> selectComment(String prd_no);
}
