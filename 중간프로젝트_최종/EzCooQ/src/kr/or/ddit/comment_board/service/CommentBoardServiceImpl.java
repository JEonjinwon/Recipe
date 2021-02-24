package kr.or.ddit.comment_board.service;

import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.comment_board.dao.CommentBoardDaoImpl;
import kr.or.ddit.comment_board.dao.ICommentBoardDao;
import kr.or.ddit.comment_board.vo.CommentBoardVO;

public class CommentBoardServiceImpl implements ICommentBoardService{

	private ICommentBoardDao cDao;
	private static ICommentBoardService service;
	
	public CommentBoardServiceImpl() {
		try {
			cDao = CommentBoardDaoImpl.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static ICommentBoardService getInstance() {
		if(service == null) {
			service = new CommentBoardServiceImpl();
		}
		return service;
	}

	@Override
	public int insertComment(CommentBoardVO comVO) {

		int save = 0;
		
		try {
			save = cDao.insertComment(comVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return save;
	}

	@Override
	public List<CommentBoardVO> selectMyComment(String memId) {
		try {
			return cDao.selectMyComment(memId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ArrayList<>();
	}

	@Override
	public List<CommentBoardVO> displayCommentBoardAll(String boardNo) {

		try {
			return cDao.displayCommentBoardAll(boardNo);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return new ArrayList<>();
	}

	@Override
	public CommentBoardVO getComment(String boardNo) {
		
		CommentBoardVO comVO = new CommentBoardVO();
		
		try {
			comVO = cDao.getComment(boardNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return comVO;
	}

	@Override
	public int updateCommentBoard(CommentBoardVO comVO) {

		int update = 0;
		try {
			update = cDao.updateCommentBoard(comVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int DeleteCommentBoard(String comNo) {

		int delete = 0;
		
		try {
			delete = cDao.DeleteCommentBoard(comNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return delete;
	}

}

