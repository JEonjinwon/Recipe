package kr.or.ddit.notice.qnaservlet;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;

@WebServlet("/deleteQna")
public class DeleteQnaServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int noticeNo = Integer.parseInt(req.getParameter("noticeNo"));

		INoticeService noticeService = NoticeServiceImpl.getInstance();

		int cnt = noticeService.deleteQna(noticeNo);

		String msg = "";

		if (cnt > 0) {
			msg = "성공";
		} else {
			msg = "실패";
		}
		String redirecturl = req.getContextPath() + "/qnaMain?msg=" + URLEncoder.encode(msg, "utf-8");
		resp.sendRedirect(redirecturl);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}
