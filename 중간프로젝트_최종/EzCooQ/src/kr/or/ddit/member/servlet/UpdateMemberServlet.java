package kr.or.ddit.member.servlet;

import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.util.EmailService;

@WebServlet("/updateMember")
public class UpdateMemberServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memId = req.getParameter("memId");
		IMemberService memService = MemberServiceImpl.getInstance();
		MemberVO mv = memService.getMember(memId);
		req.setAttribute("memId", mv.getMemId());
		req.setAttribute("memPass", mv.getMemPass());
		req.setAttribute("memName", mv.getMemName());
		req.setAttribute("memBir", mv.getMemBir());
		req.setAttribute("memGender", mv.getMemGender());
		req.setAttribute("memTel", mv.getMemTel());
		req.setAttribute("memMail", mv.getMemMail());
		
		RequestDispatcher reqDispatcher = req.getRequestDispatcher("/html/myPage/updateMemberPage.jsp");
		reqDispatcher.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memId = req.getParameter("memId");
		String memName = req.getParameter("memName");
		String memPass = req.getParameter("memPass");
		String memBir = req.getParameter("memBir");
		String memTel = req.getParameter("memTel");
		String memMail = req.getParameter("memMail");
		String memGender = req.getParameter("memGender");
		MemberVO mv = new MemberVO();
		mv.setMemId(memId);
		mv.setMemName(memName);
		mv.setMemPass(memPass);
		mv.setMemBir(memBir);
		mv.setMemGender(memGender);
		mv.setMemTel(memTel);
		mv.setMemMail(memMail);
		IMemberService memberService = MemberServiceImpl.getInstance();
		if(memberService.updateMember(mv))
			resp.sendRedirect(req.getContextPath() + "/html/myPage/updateSuccess.html");
	}
}
