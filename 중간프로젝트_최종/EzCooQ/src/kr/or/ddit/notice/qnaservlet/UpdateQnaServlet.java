package kr.or.ddit.notice.qnaservlet;

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

@WebServlet("/updateQna")
public class UpdateQnaServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		int noticeNo = Integer.parseInt(req.getParameter("noticeNo"));

		INoticeService noticeService = NoticeServiceImpl.getInstance();

		NoticeVO result = noticeService.getQna(noticeNo);

		req.setAttribute("updateQna", result);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/html/qna/updateQna.jsp");
		dispatcher.forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String noticeTitle = req.getParameter("updateTitle");
		String noticeContent = req.getParameter("updateContent");
		String noticeDate = req.getParameter("updateDate");
		int noticeNo = Integer.parseInt(req.getParameter("noticeNo"));
		
		NoticeVO noticeVO = new NoticeVO();
		noticeVO.setNoticeDate(noticeDate);
		noticeVO.setNoticeTitle(noticeTitle);
		noticeVO.setNoticeContent(noticeContent);
		noticeVO.setNoticeNo(noticeNo);
		INoticeService noticeService = NoticeServiceImpl.getInstance();

		int cnt = noticeService.updateQna(noticeVO);
		String msg = "";
		if (cnt > 0) {
			msg = "성공";
		} else {
			msg = "실패";
		}

		resp.sendRedirect(req.getContextPath() + "/qnaMain?msg=" + URLEncoder.encode(msg, "utf-8"));
	}

}
