package kr.or.ddit.member.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memId = req.getParameter("memId");
		String memPass = req.getParameter("memPass");
		String flag = req.getParameter("flag");
		MemberVO mv = new MemberVO();
		IMemberService memService = MemberServiceImpl.getInstance();
		
		mv.setMemId(memId);
		mv.setMemPass(memPass);
		
		if("logInCheck".equals(flag)) {
			boolean loginChk = memService.logIn(mv);
			//로그인이 됐으면
			if(loginChk) req.setAttribute("check", "true");
			else req.setAttribute("check", "false");
			
		}else if("createLoginSession".equals(flag)) {
			mv.setPoint("10");
			mv.setMemLastPoint("출석체크 - 10P");
			memService.getPoint(mv);
			HttpSession httpSession = req.getSession(true);
			httpSession.setAttribute("memId", memId);
			httpSession.setAttribute("memPass", memPass);
			req.setAttribute("check", "true");
		}else if("deleteLoginSession".equals(flag)) {
			HttpSession httpSession = req.getSession(true);
			httpSession.removeAttribute("memId");
			httpSession.removeAttribute("memPass");
			req.setAttribute("check", "true");
		}
		RequestDispatcher Dispatcher = req.getRequestDispatcher("/html/checkStr.jsp");
		Dispatcher.forward(req, resp);
	}
}
