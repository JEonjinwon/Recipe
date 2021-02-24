package kr.or.ddit.report.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.report.service.IReportService;
import kr.or.ddit.report.service.ReportServiceImpl;
import kr.or.ddit.report.vo.ReportVO;
@WebServlet("/Report")
public class ReportServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ReportVO rv = new ReportVO();
		
		String boardNo =req.getParameter("reportHid");
		String rportMemId =req.getParameter("rportMemId");
		String reportContent =req.getParameter("reportContent");
		
		IReportService reportService = ReportServiceImpl.getInstance();
		
		rv.setBoardNo(boardNo);
		rv.setMemId(rportMemId);
		rv.setReportContent(reportContent);
		
		reportService.report(rv);		
	
		 String redirectURL = req.getContextPath() + "/ViewBoardAll";
         resp.sendRedirect(redirectURL);
		
		
	}
	
	
	
}
