package music;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MusicDAOImpl implements MusicDAO{
	
	@Autowired
	SqlSession session;

	@Override
	public int insert(MusicVO music) {
		
		return session.insert("springProject.music.insert", music);
	}

	@Override
	public List<MusicVO> selectMusicList_T(String id) {
		
		return session.selectList("springProject.music.selectMusicList_T",id);
	}

	@Override
	public List<MusicVO> selectMusicList_F(String id) {
		
		return session.selectList("springProject.music.selectMusicList_F",id);
	}

	@Override
	public List<MusicVO> selectLikeMusic(String id) {
		
		return session.selectList("springProject.music.selectLikeMusic",id);
	}

	@Override
	public int updateMusicList_T(MusicVO music) {
		
		return session.update("springProject.music.updateMusicList_T",music);
	}

	@Override
	public int updateMusicList_F(MusicVO music) {
		
		return session.update("springProject.music.updateMusicList_F",music);
	}

	@Override
	public int updateCountMusic(MusicVO music) {
		
		return session.update("springProject.music.updateCountMusic",music);
	}

	@Override
	public int delete(MusicVO music) {
		
		return session.delete("springProject.music.delete",music);
	}

	@Override
	public String selectCountMusic(MusicVO music) {
		
		return session.selectOne("springProject.music.selectCountMusic",music);
		
	}
	
	
	
}
