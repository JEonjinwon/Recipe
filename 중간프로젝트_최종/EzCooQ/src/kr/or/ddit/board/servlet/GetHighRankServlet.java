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

@WebServlet("/getHighRank")
public class GetHighRankServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		getHighRankRecipe(req, resp);
	}
	
	private void getHighRankRecipe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IBoardService service = BoardServiceImpl.getInstance();
		BoardVO boardVO = new BoardVO();
		
		List<BoardVO> boardList = (List<BoardVO>)service.getHighRankRecipe();
		req.setAttribute("getHighRankRecipe", boardList);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/html/board/getHighRankRecipe.jsp");
		dispatcher.forward(req, resp);
		
	}
}
