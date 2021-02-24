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
import kr.or.ddit.board.vo.PagingVO;

@WebServlet("/SelectPayBoardServlet")
public class SelectPayBoardServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		// 1. 서비스 객체 생성하기
		IBoardService boardService = BoardServiceImpl.getInstance();
		
		int pageNo = req.getParameter("pageNo") == null ? 1 : Integer.parseInt(req.getParameter("pageNo"));
		PagingVO pagingVO = new PagingVO();
		
		
		// 2. 정보 조회
		int totlaCount =  boardService.countPayBoard();
		pagingVO.setTotalCount(totlaCount);
		pagingVO.setCurrentPageNo(pageNo);
		pagingVO.setCountPerPage(4);
		pagingVO.setPageCount(5);
		
		List<BoardVO> boardList = boardService.displayBoardByPaging(pagingVO);
		req.setAttribute("boardList", boardList);
		req.setAttribute("pagingVO", pagingVO);
		
		RequestDispatcher disp = req.getRequestDispatcher("/html/board/payBoardMain.jsp");
		disp.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
