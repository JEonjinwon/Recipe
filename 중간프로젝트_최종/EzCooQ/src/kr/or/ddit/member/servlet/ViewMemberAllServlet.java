package kr.or.ddit.member.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/viewMemberAll")
public class ViewMemberAllServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		displayAll(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		displayAll(req, resp);
	}
	
	private void displayAll(HttpServletRequest req, HttpServletResponse resp) {
		String memId = req.getParameter("memId");
		
		IMemberService service = MemberServiceImpl.getInstance();
		MemberVO memberVO = new MemberVO();
		memberVO.setMemId(memId);
		
		List<MemberVO> memberList = (List<MemberVO>)service.displayAll(memId);
		req.setAttribute("displayAll", memberList);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/html/manage/getResult.jsp");
		try {
			dispatcher.forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}
}
