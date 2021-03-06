package kr.or.ddit.notice.qnaservlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;
import kr.or.ddit.notice.vo.NoticeVO;

@WebServlet("/qnaView")
public class QnaViewServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int noticeNo = Integer.parseInt(req.getParameter("noticeNo"));
		req.setCharacterEncoding("UTF-8");
		
		INoticeService noticeService = NoticeServiceImpl.getInstance();
		
		NoticeVO noticeVO = new NoticeVO();
		noticeVO.setNoticeNo(noticeNo);
		
		NoticeVO result = noticeService.getQna(noticeNo);
		req.setAttribute("result", result);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/html/qna/qnaView.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}
