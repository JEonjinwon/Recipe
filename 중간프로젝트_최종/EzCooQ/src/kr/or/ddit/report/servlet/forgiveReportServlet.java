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
import kr.or.ddit.report.vo.ReportVO;
@WebServlet("/forgiveReport")
public class forgiveReportServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		String reportNo =req.getParameter("reportNo");
		
		IReportService reportService = ReportServiceImpl.getInstance();

		ReportVO rv = new ReportVO();
		rv.setReportNo(reportNo);
		
		reportService.forgiveReport(rv);
				
		RequestDispatcher disp = req.getRequestDispatcher("/html/manage/salesManage.jsp");
		disp.forward(req, resp);
		
		/* String redirectURL = req.getContextPath() + "/reportManage";
	        resp.sendRedirect(redirectURL);*/
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
		
	}
	
	
}
