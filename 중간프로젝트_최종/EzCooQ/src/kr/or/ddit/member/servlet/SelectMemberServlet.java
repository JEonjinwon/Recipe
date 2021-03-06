package kr.or.ddit.member.servlet;

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

@WebServlet("/selectMember")
public class SelectMemberServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String memId = req.getParameter("memId");
		IMemberService service = MemberServiceImpl.getInstance();
		MemberVO memberVO = new MemberVO();
		memberVO.setMemId(memId);
		
		MemberVO resultVO = service.getMember(memId);
		req.setAttribute("resultVO", resultVO);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/html/myPage/selectMember.jsp");
		dispatcher.forward(req, resp);
		

	}
}
