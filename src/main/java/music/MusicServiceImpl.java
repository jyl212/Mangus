package music;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MusicServiceImpl implements MusicService{
	
	@Autowired
	CommentDAO dao;

	@Override
	public int insert(MusicVO comment) {
		
		return dao.insert(comment);
	}

	@Override
	public List<MusicVO> selectComment(String prd_no) {
		
		return dao.selectComment(prd_no);
	}

	
}
