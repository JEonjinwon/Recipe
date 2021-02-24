package kr.or.ddit.comment_board.service;

import java.util.List;

import kr.or.ddit.comment_board.vo.CommentBoardVO;

public interface ICommentBoardService {

	public List<CommentBoardVO> selectMyComment(String memId);

	public int insertComment(CommentBoardVO comVO);

	public List<CommentBoardVO> displayCommentBoardAll(String boardNo);

	public CommentBoardVO getComment(String boardNo);

	public int updateCommentBoard(CommentBoardVO comVO);

	public int DeleteCommentBoard(String comNo);

}
