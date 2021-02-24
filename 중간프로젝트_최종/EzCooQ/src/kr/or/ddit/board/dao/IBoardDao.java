package kr.or.ddit.board.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PagingVO;

public interface IBoardDao {

	/**
	 * BoardVO에 담긴 자료를 DB에 INSERT하는 메서드
	 * @param DB에 INSERT할 자료가 저장된 boardVO 객체
	 * @return DB 작업이 성공하면 1이상의 값이 반환되고 실패하면 0이 반환
	 * @throws Exception
	 */
	public int insertRecipe(BoardVO boardVO) throws Exception;

	/**
	 * DB의 RP_BOARD 테이블의 전체 레코드를 가져와서 List에 담아 반환
	 * @return BoardVO 객체를 담고 있는 List 객체
	 * @throws Exception
	 */
	public List<BoardVO> displayBoardAll() throws Exception;

	/**
	 * 본인 작성글 불러오기
	 * @return
	 * @throws Exception
	 */
	public List<BoardVO> selectMyBoard(String memId) throws Exception;
	/**
	 * 주어진 제목이 존재하는지 여부를 알아내는 메서드
	 * @param boardTitle
	 * @return 해당 제목이 존재하면 true, 없으면 false
	 * @throws Exception
	 */
	public BoardVO getBoard(String boardNo) throws Exception;

	public int updateViewCnt(String boardNo) throws Exception;



	public List<BoardVO> displayPayBoardAll() throws Exception;


	public List<BoardVO> displayBoardByPaging(PagingVO pagingVO) throws Exception;
	
	public List<BoardVO> displayUserBoardByPaging(PagingVO pagingVO) throws Exception;

	public int updateLikeCnt(String boardLike) throws Exception;

	public int updateRecipe(BoardVO boardVO) throws Exception;
	
	public List<BoardVO> getHighRankRecipe() throws SQLException;

	public int deleteBoard(String boardNo) throws Exception;

	public List<BoardVO> searchRecipe(String searchText) throws Exception;

	public int countBoard() throws Exception;

	public int countPayBoard() throws Exception;


}
