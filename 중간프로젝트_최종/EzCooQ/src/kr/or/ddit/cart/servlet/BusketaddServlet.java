package kr.or.ddit.cart.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cart.service.CartServiceImp;
import kr.or.ddit.cart.service.ICartService;
import kr.or.ddit.cart.vo.CartVO;
@WebServlet("/BusketaddServlet")
public class BusketaddServlet  extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		ICartService cartService = CartServiceImp.getInstance();
		
		
		
		
		String boardNo = req.getParameter("boardNo");
		String memId = req.getParameter("memId");
		
		CartVO cartVO = new CartVO();
		
		cartVO.setBoardNo(boardNo);
		cartVO.setMemId(memId);
		
		int cnt = cartService.insertBusket(cartVO);
		
		 String redirectURL = req.getContextPath() + "/SelectPayBoardServlet";
         resp.sendRedirect(redirectURL);
		
		
		
	}
	
	
}
