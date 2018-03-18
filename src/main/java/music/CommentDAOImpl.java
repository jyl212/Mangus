package music;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDAOImpl implements CommentDAO{
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public int insert(MusicVO comment) {

		//int result = sqlSession.insert("bigdatashop.product.comment.insert", comment);
		
		return 0;
	}

	@Override
	public List<MusicVO> selectComment(String prd_no) {
		
		//List<MusicVO> commentList = 
		//		sqlSession.selectList("bigdatashop.product.comment.commentList",prd_no);
		
		return null;
	}
	
	

}
