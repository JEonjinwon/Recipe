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

@WebServlet("/createMember")
public class CreateMemberServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
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
		System.out.println(mv.toString());
		IMemberService memberService = MemberServiceImpl.getInstance();
		if(memberService.createMember(mv)) {
			String createDate = new SimpleDateFormat("yyyy년 MM월 dd일").format(new Date());
			String subject = memName + " 회원님 EzCooQ 가입을 축하드립니다.";
			String text = memId + " 님의 가입날짜 : " + createDate;
			try {
				EmailService.mailSend(memMail, subject, text);
			} catch (Exception e) {
				e.printStackTrace();
			}

			
			resp.sendRedirect(req.getContextPath() + "/html/createSuccess.html");
		}
	}
}
