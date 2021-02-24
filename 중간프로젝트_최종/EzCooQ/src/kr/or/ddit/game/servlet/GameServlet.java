package kr.or.ddit.game.servlet;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/gamePoint")
public class GameServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doGet(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String memId = req.getParameter("gameMemId");
		String point = "100";
		String last = "GAME - 100P";
		
		
		MemberVO mv = new MemberVO();
		mv.setMemId(memId);
		mv.setPoint(point);
		mv.setMemLastPoint(last);
		IMemberService memberService = MemberServiceImpl.getInstance();
		boolean pointChk = memberService.getPoint(mv);
		
	
		  String redirectURL = req.getContextPath() + "/html/product-detail.jsp";
	         resp.sendRedirect(redirectURL);
	      
		
	}
}
