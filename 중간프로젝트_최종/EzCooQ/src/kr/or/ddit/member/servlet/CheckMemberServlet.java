package kr.or.ddit.member.servlet;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;

@WebServlet("/checkMember")
public class CheckMemberServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memId = URLDecoder.decode(req.getParameter("memId"), "UTF-8");
		
		IMemberService memService = MemberServiceImpl.getInstance();
		boolean check = memService.checkMember(memId);
		
		req.setAttribute("check", check);
		RequestDispatcher reqdis = req.getRequestDispatcher("/html/checkMember.jsp");
		reqdis.forward(req, resp);
		
		
		
	}
}

