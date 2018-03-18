package music;

import java.util.List;

public interface CommentDAO {
	
	int insert(MusicVO comment);
	
	List<MusicVO> selectComment(String prd_no);
	
}