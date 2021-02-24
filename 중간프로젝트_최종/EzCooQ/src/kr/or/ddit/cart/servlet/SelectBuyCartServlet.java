package kr.or.ddit.cart.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.cart.service.CartServiceImp;
import kr.or.ddit.cart.service.ICartService;
@WebServlet("/SelectBuyCartServlet")
public class SelectBuyCartServlet extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String boardNo = req.getParameter("chkPoint");
		ICartService cartService = CartServiceImp.getInstance();
		
		
		BoardVO bv = cartService.getCart(boardNo);
		
		req.setAttribute("bv", bv);
		
		RequestDispatcher disp = req.getRequestDispatcher("/html/cart/CartBuyBoardDetail.jsp");
		disp.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	
	}
	
	
	
	
	
}
