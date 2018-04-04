package music;

import java.util.List;

public interface MusicService {
	
	int insert(MusicVO music); // 노래등록
	
	List<MusicVO> selectMusicList_T(String id); // 리스트 포함
	List<MusicVO> selectMusicList_F(String id); // 리스트 미포함
	List<MusicVO> selectLikeMusic(String id); // 자주듣는 노래
	
	int updateMusicList_T(MusicVO music); // 리스트 포함
	int updateMusicList_F(MusicVO music); // 리스트 미포함
	
	String updateCountMusic(MusicVO music); // 노래 카운트 증가
	
	int delete(MusicVO music); //노래 삭제
}
