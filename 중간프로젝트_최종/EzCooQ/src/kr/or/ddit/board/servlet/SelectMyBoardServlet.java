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

@WebServlet("/selectMyBoard")
public class SelectMyBoardServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memId = req.getParameter("memId");
		System.out.println(memId);
		IBoardService boardService = BoardServiceImpl.getInstance();
		
		
		// 2. 정보 조회
		List<BoardVO> myBoardList = boardService.selectMyBoard(memId);
		req.setAttribute("myBoardList", myBoardList);
		
		RequestDispatcher disp = req.getRequestDispatcher("/html/myPage/selectMyBoard.jsp");
		disp.forward(req, resp);
		
	}
}
