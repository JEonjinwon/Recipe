package kr.or.ddit.report.service;

import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.report.dao.IReportDao;
import kr.or.ddit.report.dao.ReportDaoImpl;
import kr.or.ddit.report.vo.BlackListVO;
import kr.or.ddit.report.vo.ReportVO;

public class ReportServiceImpl implements IReportService{
	private IReportDao rDao;
	private static IReportService service;
	
	private ReportServiceImpl() {
		rDao = ReportDaoImpl.getInstance();
	}
	
	public static IReportService getInstance() {
		if(service == null) {
			service = new ReportServiceImpl();
		}
		return service;
	}

	@Override
	public int report(ReportVO rv) {
		int cnt =0;
		
		try {
			cnt = rDao.report(rv);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<ReportVO> selectReport() {
		List<ReportVO> reportList = new ArrayList<ReportVO>();
		try {
			reportList = rDao.selectReport();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return reportList;
	}

	@Override
	public int forgiveReport(ReportVO rv) {
		int cnt = 0;
		try {
			cnt = rDao.forgiveReport(rv);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int black(String blackId) {
		int cnt = 0;
		try {
			cnt = rDao.black(blackId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int blackAdd(BlackListVO bv) {
		int cnt = 0;
		try {
			cnt = rDao.blackAdd(bv);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public List<BlackListVO> selectblackListVO() {
		List<BlackListVO> blackList = new ArrayList<BlackListVO>();
		try {
			blackList = rDao.selectblackListVO();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return blackList;
	}
}
