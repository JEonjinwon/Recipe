package kr.or.ddit.board.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PagingVO;
import kr.or.ddit.util.SqlMapClientFactory;


public class BoardDaoImpl implements IBoardDao{

	private static IBoardDao rDao;
	private SqlMapClient smc;
	
	public BoardDaoImpl() throws Exception{
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IBoardDao getInstance() throws Exception {
		if(rDao == null) {
			rDao = new BoardDaoImpl();
		}
		return rDao;
	}

	@Override
	public int insertRecipe(BoardVO boardVO) throws Exception {
		String MemId = boardVO.getMemId();
		int cnt = 0;
		
		if(MemId.equals("admin")) { //유료 레시피 작성 
			Object obj = smc.insert("recipe.insertPayRecipe", boardVO);
			if(obj==null) {
				cnt = 1;
			}
		}else {//유저레시피 작성
			
			Object obj = smc.insert("recipe.insertRecipe", boardVO);
			if(obj==null) {
				cnt = 1;
			}
		}
		
		return cnt;
	}

	@Override
	public List<BoardVO> displayBoardAll() throws Exception {
		
		List<BoardVO> boardList = new ArrayList<>();
		boardList = smc.queryForList("recipe.dispayBoardAll");
		
		
		
		return boardList;
	}

	@Override
	public BoardVO getBoard(String boardNo) throws Exception {
		
		BoardVO bv = (BoardVO) smc.queryForObject("recipe.getBoard", boardNo);
		return bv;
	}

	@Override
	public int updateViewCnt(String boardNo) throws Exception {
		return smc.update("recipe.updateViewCnt", boardNo);
	}


	@Override
	public List<BoardVO> displayPayBoardAll() throws Exception {
		List<BoardVO> boardList = new ArrayList<>();
		boardList = smc.queryForList("recipe.dispayPayBoardAll");
		return boardList;
	}


	@Override
	public List<BoardVO> displayBoardByPaging(PagingVO pagingVO) throws Exception {
		List<BoardVO> boList = new ArrayList<>();
		boList = smc.queryForList("recipe.getPayBoardByPaging",pagingVO);
		return boList;
	}
	@Override
	public List<BoardVO> displayUserBoardByPaging(PagingVO pagingVO) throws Exception {
		List<BoardVO> boList = new ArrayList<>();
		boList = smc.queryForList("recipe.getUserBoardByPaging",pagingVO);
		return boList;
	}

	@Override
	public int updateLikeCnt(String boardLike) throws Exception {

		
		int bbv = (int) smc.update("recipe.updateLikeCnt", boardLike);
		
		return bbv;
	}

	@Override
	public int updateRecipe(BoardVO boardVO) throws Exception {
		
		String MemId = boardVO.getMemId();
		int cnt = 0;
		
		if(MemId.equals("admin")) { //유료 레시피 작성 
			Object obj = smc.insert("recipe.updateRecipe", boardVO);
			if(obj==null) {
				cnt = 1;
			}
		}else {//유저레시피 작성
			
			Object obj = smc.insert("recipe.updateRecipe", boardVO);
			if(obj==null) {
				cnt = 1;
			}
		}
		System.out.println("다오 까지 옴");
		return cnt;
	}

	@Override
	public List<BoardVO> selectMyBoard(String memId) throws Exception {
		return smc.queryForList("recipe.selectMyBoard", memId);
	}

	@Override
	public int deleteBoard(String boardNo) throws Exception {
		int boardDelete = smc.delete("recipe.deleteBoard", boardNo);
		return boardDelete;
	}
	
	@Override
	public List<BoardVO> getHighRankRecipe() throws SQLException {
		List<BoardVO> boardList = new ArrayList<>();
		boardList = smc.queryForList("recipe.getHighRankRecipe");
		return boardList;
	}

	@Override
	public List<BoardVO> searchRecipe(String searchText) throws Exception {
		List<BoardVO> boardList = new ArrayList<>();
		
		boardList = smc.queryForList("recipe.searchRecipe",searchText);
		return boardList;
	}

	@Override
	public int countBoard() throws Exception {
		return (int) smc.queryForObject("recipe.countRecipe");
	}

	@Override
	public int countPayBoard() throws Exception {
		return (int) smc.queryForObject("recipe.countPayRecipe");
	}

}
