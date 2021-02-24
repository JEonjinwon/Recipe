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
@WebServlet("/search")
public class SearchRecipeServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String searchText= req.getParameter("searchText");
		
		IBoardService service = BoardServiceImpl.getInstance();
		
		List<BoardVO> boardList2 = service.searchRecipe(searchText);
		
		req.setAttribute("boardList3", boardList2);
		
		RequestDispatcher disp = req.getRequestDispatcher("/html/board/SearchBoardMain.jsp");
		disp.forward(req, resp);
		
	}
}
