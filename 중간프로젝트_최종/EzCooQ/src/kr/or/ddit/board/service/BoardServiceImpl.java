package kr.or.ddit.board.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.board.dao.BoardDaoImpl;
import kr.or.ddit.board.dao.IBoardDao;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PagingVO;

public class BoardServiceImpl implements IBoardService {
	
	private IBoardDao rDao;
	private static IBoardService service;
	
	public BoardServiceImpl() {
		try{
			rDao = BoardDaoImpl.getInstance();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public static IBoardService getInstance() {
		if(service == null) {
			service = new BoardServiceImpl();
		}
		return service;
	}

	@Override
	public int insertRecipe(BoardVO boardVO) {
		
		int save = 0;
		
		try {
			save = rDao.insertRecipe(boardVO);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return save;
	}

	@Override
	public List<BoardVO> dispalyBoardAll() {
		List<BoardVO> boardList = new ArrayList<>();
		try {
			boardList = rDao.displayBoardAll();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}

	@Override
	public BoardVO getBoard(String boardNo) {

		BoardVO bv = new BoardVO();
		
		try {
			bv = rDao.getBoard(boardNo);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return bv;
	}


	@Override
	public int updateViewCnt(String boardNo) {
		int bv = 0;
		
		try {
			bv = rDao.updateViewCnt(boardNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bv;
	}


	@Override
	public List<BoardVO> dispalyPayBoardAll() {
		List<BoardVO> boardList = new ArrayList<>();
		try {
			boardList = rDao.displayPayBoardAll();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}


	@Override
	public List<BoardVO> displayBoardByPaging(PagingVO pagingVO) {
		List<BoardVO> boList = new ArrayList<>();
		try {
			boList = rDao.displayBoardByPaging(pagingVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return boList;
	}
	@Override
	public List<BoardVO> displayUserBoardByPaging(PagingVO pagingVO) {
		List<BoardVO> boList = new ArrayList<>();
		try {
			boList = rDao.displayUserBoardByPaging(pagingVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return boList;
	}


	@Override
	public int updateLikeCnt(String boardLike) {
		
		int bbv = 0;
		
		try {
			bbv = rDao.updateLikeCnt(boardLike);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return bbv;
	}

	@Override
	public int updateRecipe(BoardVO boardVO) {

		int update = 0;
		
		try {
			update = rDao.updateRecipe(boardVO);
			System.out.println("서비스 까지 옴");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return update;
	}

	@Override
	public List<BoardVO> selectMyBoard(String memId) {
		try {
			return rDao.selectMyBoard(memId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ArrayList<BoardVO>();
	}

	@Override
	public int DeleteBoard(String boardNo) {

		int delete = 0;
		
		try{
			delete = rDao.deleteBoard(boardNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return delete;
	}

	@Override
	public List<BoardVO> getHighRankRecipe() {
		List<BoardVO> boardList = new ArrayList<>();
		try {
			boardList = rDao.getHighRankRecipe();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return boardList;
	}

	@Override
	public List<BoardVO> searchRecipe(String searchText) {
		List<BoardVO> boardList = new ArrayList<>();
		try {
			boardList = rDao.searchRecipe(searchText);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}

	@Override
	public int countBoard() {
		try {
			return rDao.countBoard();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	@Override
	public int countPayBoard() {
		try {
			return rDao.countPayBoard();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}
