package kr.or.ddit.board.servlet;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;

@WebServlet("/UpdateBoard")
public class UpdateBoardServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String boardNo = req.getParameter("boardNo");
		
		IBoardService boardService = BoardServiceImpl.getInstance();
		
		BoardVO boardVO = boardService.getBoard(boardNo);
		
		req.setAttribute("boardVO", boardVO);
//		req.setAttribute("boardNo", boardNo);
		
		
		RequestDispatcher disp = req.getRequestDispatcher("/html/board/UpdateUserForm.jsp");
		disp.forward(req, resp);

		
		
//		String msg ="";
//		
//		if(cnt > 0) {
//			msg = "성공";
//		} else {
//			msg = "실패";
//		}
		
//		String redirectURL = req.getContextPath() + "/ViewBoardAll?msg=" + URLEncoder.encode(msg, "UTF-8");
//		String redirectURL = req.getContextPath() + "/SelectBoardAll?boardNo=" + boardNo;
//		resp.sendRedirect(redirectURL);
		 

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String boardNo = req.getParameter("boardNo");
		String boardTitle = req.getParameter("boardTitle");
		String boardContent = req.getParameter("boardContent");
		String recipeId = req.getParameter("recipeId");
		String foodId = req.getParameter("foodId");
		String memId = req.getParameter("memId");
		String boardDate = req.getParameter("boardDate");
		String boardImg = req.getParameter("imgSrc");
		
		BoardVO boardVO = new BoardVO();
		
		IBoardService boardService = BoardServiceImpl.getInstance();
		
		boardVO.setBoardNo(boardNo);
		boardVO.setBoardTitle(boardTitle);
		boardVO.setBoardContent(boardContent);
		boardVO.setBoardDate(boardDate);
		boardVO.setRecipeId(recipeId);
		boardVO.setFoodId(foodId);
		boardVO.setMemId(memId);
		boardVO.setBoardImg(boardImg);
		
//         req.setAttribute("boardNo", boardNo);
//         req.setAttribute("boardVO", boardVO);
		
		int cnt = boardService.updateRecipe(boardVO);
		
		System.out.println("abcdefg"+boardVO.toString());
		
		String redirectURL = req.getContextPath() + "/SelectBoardAll?boardNo=" + boardNo;
//		String redirectURL = req.getContextPath() + "/SelectBoardAll";
		resp.sendRedirect(redirectURL);
	}
}
