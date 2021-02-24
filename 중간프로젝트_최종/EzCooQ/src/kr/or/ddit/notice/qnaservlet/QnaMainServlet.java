package kr.or.ddit.notice.qnaservlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;
import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.notice.vo.PagingVO;

@WebServlet("/qnaMain")
public class QnaMainServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		retrieveMainView(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		retrieveMainView(req, resp);
	}
	
	private void retrieveMainView(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		// null이면 1페이지를, 아니면 가져온 값을 int형으로 바꿔주는 작업
		int pageNo = req.getParameter("pageNo") == null ? 1 : Integer.parseInt(req.getParameter("pageNo"));

		// 서비스 객체 생성하기
		INoticeService noticeService = NoticeServiceImpl.getInstance();

		// 페이징 객체 생성하기
		PagingVO pvo = new PagingVO();
		int totalCount = noticeService.qnaSelectTotalCount();

		// 받아와서 값 세팅하기
		pvo.setTotalCount(totalCount);
		pvo.setCurrentPageNo(pageNo);
		pvo.setCountPerPage(10);
		pvo.setPageCount(10);
		// 사용할 수 있게 request에 넣는다.
		
		List<NoticeVO> qnaList = noticeService.qnaDisplayAll(pvo);
		
		req.setAttribute("qnaList",qnaList);
		req.setAttribute("pvo", pvo);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/html/qna/qnaMain.jsp");
		dispatcher.forward(req, resp);
	}
}
