package kr.or.ddit.comment_board.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.comment_board.service.CommentBoardServiceImpl;
import kr.or.ddit.comment_board.service.ICommentBoardService;
import kr.or.ddit.comment_board.vo.CommentBoardVO;

@WebServlet("/UpdateCommentBoard")
public class UpdateCommentBoardServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//		String boardNo = req.getParameter("boardNo");
		String comNo = req.getParameter("comNo");
		
		ICommentBoardService comService = CommentBoardServiceImpl.getInstance();
		
		CommentBoardVO comVO = comService.getComment(comNo);
		
		req.setAttribute("comVO", comVO);

		RequestDispatcher disp = req.getRequestDispatcher("/html/board/UpdateBoardDetail.jsp");
		disp.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
	
		String boardNo = req.getParameter("boardNo");
		String comStar = req.getParameter("comStar");
		String comContent = req.getParameter("comContent");
		String memId = req.getParameter("memId");
		String comNo = req.getParameter("comNo");
		String comDate = req.getParameter("comDate");
		
		ICommentBoardService comService = CommentBoardServiceImpl.getInstance();

		CommentBoardVO comVO = new CommentBoardVO();
		
		comVO.setBoardNo(boardNo);
		comVO.setComStar(comStar);
		comVO.setComContent(comContent);
		comVO.setMemId(memId);
		comVO.setComNo(comNo);
		comVO.setComDate(comDate);
		
		int com = comService.updateCommentBoard(comVO);
		
		String redirectURL = req.getContextPath() + "/SelectBoardAll?boardNo=" + boardNo;
//		String redirectURL = req.getContextPath() + "/SelectBoardAll" ;
		resp.sendRedirect(redirectURL);
	}
}
