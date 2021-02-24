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
import kr.or.ddit.report.vo.BlackListVO;
import kr.or.ddit.report.vo.ReportVO;
@WebServlet("/SelectBlackList")
public class SelectBlackListServlet extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IReportService reportService = ReportServiceImpl.getInstance();
		
		List<BlackListVO> blackList = new ArrayList<BlackListVO>();
		blackList = reportService.selectblackListVO();
		
		req.setAttribute("blackList", blackList);
		

		RequestDispatcher disp = req.getRequestDispatcher("/html/manage/blacklist.jsp");
		disp.forward(req, resp);
		
		
		
		

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
		
	}
	
	
	
}
