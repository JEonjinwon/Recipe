package kr.or.ddit.board.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.comment_board.service.CommentBoardServiceImpl;
import kr.or.ddit.comment_board.service.ICommentBoardService;
import kr.or.ddit.comment_board.vo.CommentBoardVO;

@WebServlet("/SelectBoardAll")
public class SelectBoardServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String boardNo = req.getParameter("boardNo");
		String boardLike = req.getParameter("boardLike");
		
		// 1. 서비스 객체 생성하기
		IBoardService boardService = BoardServiceImpl.getInstance();
		ICommentBoardService comService = CommentBoardServiceImpl.getInstance();
		
		BoardVO bv = boardService.getBoard(boardNo);
		List<CommentBoardVO> comList = comService.displayCommentBoardAll(boardNo);
		
		int cnt = boardService.updateViewCnt(boardNo);
		
		req.setAttribute("bv", bv);
		req.setAttribute("cnt", cnt);
		req.setAttribute("comList", comList);
		RequestDispatcher disp = req.getRequestDispatcher("/html/board/userBoardDetail.jsp");
		disp.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
