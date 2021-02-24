package kr.or.ddit.board.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;

@WebServlet("/DeleteBoard")
public class DeleteBoardServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String boardNo = req.getParameter("boardNo");
		
		IBoardService boardService = BoardServiceImpl.getInstance();
		
		int cnt = boardService.DeleteBoard(boardNo);
		
		String redirectURL = req.getContextPath() + "/ViewBoardAll";
		resp.sendRedirect(redirectURL);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
