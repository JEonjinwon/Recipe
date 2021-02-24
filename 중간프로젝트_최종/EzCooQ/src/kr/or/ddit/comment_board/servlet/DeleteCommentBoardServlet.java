package kr.or.ddit.comment_board.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.comment_board.service.CommentBoardServiceImpl;
import kr.or.ddit.comment_board.service.ICommentBoardService;

@WebServlet("/DeleteCommentBoard")
public class DeleteCommentBoardServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String boardNo = req.getParameter("boardNo");
		String comNo = req.getParameter("comNo");
		ICommentBoardService comService = CommentBoardServiceImpl.getInstance();
		
		System.out.println(boardNo);
		System.out.println(comNo);
		int cnt = comService.DeleteCommentBoard(comNo);
		
		String redirectUrl = req.getContextPath() + "/SelectBoardAll?boardNo=" + boardNo;
		resp.sendRedirect(redirectUrl);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
