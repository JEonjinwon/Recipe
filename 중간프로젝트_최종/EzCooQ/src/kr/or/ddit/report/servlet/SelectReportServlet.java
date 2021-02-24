package kr.or.ddit.report.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.report.service.IReportService;
import kr.or.ddit.report.service.ReportServiceImpl;
import kr.or.ddit.report.vo.ReportVO;
@WebServlet("/reportManage")
public class SelectReportServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	IReportService reportService = ReportServiceImpl.getInstance();
	
	List<ReportVO> reportList = new ArrayList<ReportVO>();
	reportList = reportService.selectReport();
	
	req.setAttribute("reportList", reportList);
	

	RequestDispatcher disp = req.getRequestDispatcher("/html/manage/reportManage.jsp");
	disp.forward(req, resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
		
	}
}

