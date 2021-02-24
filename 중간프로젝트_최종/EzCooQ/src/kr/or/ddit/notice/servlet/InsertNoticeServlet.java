package kr.or.ddit.notice.servlet;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;
import kr.or.ddit.notice.vo.NoticeVO;

@WebServlet("/insertNotice")
public class InsertNoticeServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		RequestDispatcher dispatcher = req.getRequestDispatcher("/html/notice/insertNotice.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		int noticeNo = Integer.parseInt(req.getParameter("noticeNo"));
		String noticeDate = req.getParameter("noticeDate");
		String noticeContent= req.getParameter("noticeContent");
		String noticeTitle = req.getParameter("noticeTitle");
		
		INoticeService noticeService = NoticeServiceImpl.getInstance();
		
		NoticeVO noticeVO = new NoticeVO();
		noticeVO.setNoticeNo(noticeNo);
		noticeVO.setNoticeDate(noticeDate);
		noticeVO.setNoticeTitle(noticeTitle);
		noticeVO.setNoticeContent(noticeContent);
		
		int cnt= noticeService.insertNotice(noticeVO);
		
		String msg = "";
		
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		String redirectUrl = req.getContextPath() + "/noticeMain?msg= " +URLEncoder.encode(msg, "utf-8");
		
		resp.sendRedirect(redirectUrl);
	}
}

