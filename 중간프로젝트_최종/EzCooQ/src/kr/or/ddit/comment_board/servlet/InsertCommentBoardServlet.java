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

@WebServlet("/InsertCommentBoard")
public class InsertCommentBoardServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher disp = req.getRequestDispatcher("/html/board/userBoardDetail.jsp");
		disp.forward(req, resp);
	}
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String boardNo = req.getParameter("boardNo");
		String comContent = req.getParameter("comContent");
		String memId = req.getParameter("memId");
		String comStar = req.getParameter("comStar");
		String comDate = req.getParameter("comDate");
		String comNo = req.getParameter("comNo");
		
		ICommentBoardService comService = CommentBoardServiceImpl.getInstance();
		
		CommentBoardVO comVO = new CommentBoardVO();
		
		comVO.setBoardNo(boardNo);
		comVO.setComContent(comContent);
		comVO.setMemId(memId);
		comVO.setComStar(comStar);
		comVO.setComDate(comDate);
		comVO.setComNo(comNo);
		
		int insert = comService.insertComment(comVO);
		
		String redirectURL = req.getContextPath() + "/SelectBoardAll?boardNo=" +boardNo;
//		String redirectURL = req.getContextPath() + "/SelectBoardAll";
		resp.sendRedirect(redirectURL);
	}
}
