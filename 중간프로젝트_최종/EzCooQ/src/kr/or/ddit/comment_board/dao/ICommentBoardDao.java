package kr.or.ddit.comment_board.dao;

import java.util.List;

import kr.or.ddit.comment_board.vo.CommentBoardVO;

public interface ICommentBoardDao {

	public int insertComment(CommentBoardVO comVO) throws Exception;

	List<CommentBoardVO> selectMyComment(String memId) throws Exception;

	public List<CommentBoardVO> displayCommentBoardAll(String boardNo) throws Exception;

	public CommentBoardVO getComment(String boardNo) throws Exception;

	public int updateCommentBoard(CommentBoardVO comVO) throws Exception;

	public int DeleteCommentBoard(String comNo) throws Exception;

}
