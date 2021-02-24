package kr.or.ddit.board.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;

@WebServlet("/BoardLikeServlet")
public class BoardLikeServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String boardLike = req.getParameter("boardLike");
		System.out.println(boardLike+"asdsadasds");
		
		IBoardService boardService = BoardServiceImpl.getInstance();
		
		int cnt =  boardService.updateLikeCnt(boardLike);
	
		req.setAttribute("cnt", cnt);
		
		RequestDispatcher disp = req.getRequestDispatcher("html/board/userBoardDetail.jsp");
		disp.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
