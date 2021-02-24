package kr.or.ddit.board.service;

import java.util.List;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PagingVO;

public interface IBoardService {

	public int insertRecipe(BoardVO boardVO);

	public List<BoardVO> dispalyBoardAll();
	
	public List<BoardVO> selectMyBoard(String memId);

	public BoardVO getBoard(String boardNo);
	
	

	public int updateViewCnt(String boardNo);

	public List<BoardVO> dispalyPayBoardAll();

	public List<BoardVO> getHighRankRecipe();


	public List<BoardVO> displayBoardByPaging(PagingVO pagingVO);
	
	public List<BoardVO> displayUserBoardByPaging(PagingVO pagingVO);


	public int updateLikeCnt(String boardLike);

	public int updateRecipe(BoardVO boardVO);

	public int DeleteBoard(String boardNo);

	public List<BoardVO> searchRecipe(String searchText);

	public int countBoard();

	public int countPayBoard();

}
