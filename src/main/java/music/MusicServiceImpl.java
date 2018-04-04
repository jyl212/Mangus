package music;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MusicServiceImpl implements MusicService{
	
	@Autowired
	MusicDAO dao;

	@Override
	public int insert(MusicVO music) {
		// TODO Auto-generated method stub
		return dao.insert(music);
	}

	@Override
	public List<MusicVO> selectMusicList_T(String id) {
		// TODO Auto-generated method stub
		return dao.selectMusicList_T(id);
	}

	@Override
	public List<MusicVO> selectMusicList_F(String id) {
		// TODO Auto-generated method stub
		return dao.selectMusicList_F(id);
	}

	@Override
	public List<MusicVO> selectLikeMusic(String id) {
		// TODO Auto-generated method stub
		return dao.selectLikeMusic(id);
	}

	@Override
	public int updateMusicList_T(MusicVO music) {
		// TODO Auto-generated method stub
		return dao.updateMusicList_T(music);
	}

	@Override
	public int updateMusicList_F(MusicVO music) {
		// TODO Auto-generated method stub
		return dao.updateMusicList_F(music);
	}

	@Override
	public String updateCountMusic(MusicVO music) {
		
		dao.updateCountMusic(music);
		String result = dao.selectCountMusic(music);
		
		return result;
	}

	@Override
	public int delete(MusicVO music) {
		// TODO Auto-generated method stub
		return dao.delete(music);
	}


	
	

	
}
