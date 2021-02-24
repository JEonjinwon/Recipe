package kr.or.ddit.notice.servlet;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;

@WebServlet("/deleteNotice")
public class DeleteNoticeServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int noticeNo = Integer.parseInt(req.getParameter("noticeNo"));

		INoticeService noticeService = NoticeServiceImpl.getInstance();

		int cnt = noticeService.deleteNotice(noticeNo);

		String redirecturl = req.getContextPath() + "/noticeMain";
		resp.sendRedirect(redirecturl);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
