package kr.or.ddit.comment_board.dao;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.comment_board.vo.CommentBoardVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class CommentBoardDaoImpl implements ICommentBoardDao{

	private static ICommentBoardDao cDao;
	private SqlMapClient smc;
	
	public CommentBoardDaoImpl() throws Exception{
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static ICommentBoardDao getInstance() throws Exception{
		if(cDao == null) {
			cDao = new CommentBoardDaoImpl();
		}
		return cDao;
	}

	@Override
	public int insertComment(CommentBoardVO comVO) throws Exception {

		int cnt = 0;
		
		Object obj = smc.insert("comment.insertComment", comVO);
		
		if(obj == null) {
			cnt = 1;
			System.out.println("댓글 인서트");
		}
		
		return cnt;
	}

	@Override
	public List<CommentBoardVO> selectMyComment(String memId) throws Exception {
		return smc.queryForList("comment.selectMyComment", memId);
	}

	@Override
	public List<CommentBoardVO> displayCommentBoardAll(String boardNo) throws Exception {
		return smc.queryForList("comment.dispalyCommentBoardAll", boardNo);
	}

	@Override
	public CommentBoardVO getComment(String boardNo) throws Exception{
		CommentBoardVO comVO = (CommentBoardVO) smc.queryForObject("comment.getComment", boardNo);
		return comVO;
	}

	@Override
	public int updateCommentBoard(CommentBoardVO comVO) throws Exception {
		int update = smc.update("comment.updateCommentBoard", comVO);
		return update;
	}

	@Override
	public int DeleteCommentBoard(String comNo) throws Exception {
		int delete = smc.delete("comment.DeleteCommentBoard", comNo);
		return delete;
	}
}
