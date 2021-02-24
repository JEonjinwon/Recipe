package kr.or.ddit.report.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.report.service.IReportService;
import kr.or.ddit.report.service.ReportServiceImpl;
import kr.or.ddit.report.vo.BlackListVO;
@WebServlet("/black")
public class blackAddServlet extends HttpServlet {

	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String blackId = req.getParameter("blackId");
		String blackListContent = req.getParameter("blackListContent");
		
		IReportService reportService = ReportServiceImpl.getInstance();
		
		BlackListVO  bv = new BlackListVO();
		
		
		bv.setMemId(blackId);
		bv.setbReason(blackListContent);
		
		
		int cnt = reportService.black(blackId);
		
		int c = reportService.blackAdd(bv);
		
		
		RequestDispatcher disp = req.getRequestDispatcher("/html/manage/salesManage.jsp");
		disp.forward(req, resp);
		
		
		
		
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
		
	
	}
	
}
