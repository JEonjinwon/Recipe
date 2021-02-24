package kr.or.ddit.cart.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cart.service.CartServiceImp;
import kr.or.ddit.cart.service.ICartService;
import kr.or.ddit.cart.vo.CartVO;

@WebServlet("/BuyCartServlet")
public class BuyCartServlet extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		ICartService cartService = CartServiceImp.getInstance();
		CartVO cartVO = new CartVO();

		String action = req.getParameter("action");
	
		String boardNo = req.getParameter("chkPoint");
		String memId = req.getParameter("memId");
		cartVO.setBoardNo(boardNo);
		cartVO.setMemId(memId);
		
		if(action.equals("buy")) {
			int cnt = cartService.buyCartChk(cartVO);
			int payCharge = cartService.payCharge(cartVO);
		}
		if(action.equals("remove")) {
			int cnt = cartService.deleteCartChk(cartVO);
		}
		
		String redirectURL = req.getContextPath() + "/SearchCartServlet?memId="+memId;
		resp.sendRedirect(redirectURL);
	
	}
}
