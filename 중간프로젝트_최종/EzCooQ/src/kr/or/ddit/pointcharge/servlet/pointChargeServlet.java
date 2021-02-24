package kr.or.ddit.pointcharge.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/pointChargeServlet")
public class pointChargeServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String memId = req.getParameter("memId");
		String point = req.getParameter("point");
		String memLastPoint = req.getParameter("memLastPoint");
		IMemberService service = MemberServiceImpl.getInstance();
		MemberVO memberVO = new MemberVO();
		memberVO.setMemId(memId);
		memberVO.setPoint(point);
		memberVO.setMemLastPoint(memLastPoint);
		System.out.println(memLastPoint);
		if(service.getPoint(memberVO))
			req.setAttribute("check", "true");
			
		RequestDispatcher dispatcher = req.getRequestDispatcher("/html/checkStr.jsp");
		dispatcher.forward(req, resp);
	}
}
