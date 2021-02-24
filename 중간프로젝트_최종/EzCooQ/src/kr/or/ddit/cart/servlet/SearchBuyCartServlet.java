package kr.or.ddit.cart.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PagingVO;
import kr.or.ddit.cart.service.CartServiceImp;
import kr.or.ddit.cart.service.ICartService;
@WebServlet("/SearchBuyCartServlet")
public class SearchBuyCartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String memId = req.getParameter("memId2");
		
		// 서비스 객체 생성
		ICartService cartService = CartServiceImp.getInstance();
		// 2. 정보 조회
		List<BoardVO> boardList = cartService.displayBuyCartAll(memId);

		req.setAttribute("boardList", boardList);
		RequestDispatcher disp = req.getRequestDispatcher("/html/cart/addCartBoard.jsp");
		disp.forward(req, resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}