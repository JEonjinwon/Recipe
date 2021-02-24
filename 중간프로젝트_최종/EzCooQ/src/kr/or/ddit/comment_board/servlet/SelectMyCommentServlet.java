package kr.or.ddit.comment_board.servlet;

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

@WebServlet("/selectMyComment")
public class SelectMyCommentServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memId = req.getParameter("memId");
		String comStar = req.getParameter("comStar");
		
		System.out.println(memId);
		ICommentBoardService commentService = CommentBoardServiceImpl.getInstance();
		
		// 2. 정보 조회
		List<CommentBoardVO> myCommentList = commentService.selectMyComment(memId);
		req.setAttribute("myCommentList", myCommentList);
		
		RequestDispatcher disp = req.getRequestDispatcher("/html/myPage/selectMyComment.jsp");
		disp.forward(req, resp);
		
	}
}
