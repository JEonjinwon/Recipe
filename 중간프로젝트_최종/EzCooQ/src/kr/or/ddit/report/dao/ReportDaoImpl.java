package kr.or.ddit.report.dao;

import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.report.vo.BlackListVO;
import kr.or.ddit.report.vo.ReportVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class ReportDaoImpl implements IReportDao{
	private static IReportDao rDao;
	private SqlMapClient smc;
	
	private ReportDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IReportDao getInstance() {
		if(rDao == null) {
			rDao = new ReportDaoImpl();
		}
		return rDao;
	}

	@Override
	public int report(ReportVO rv) throws Exception {
		int cnt =0;
		
		Object obj = smc.insert("report.insertreport",rv);
		
		if(obj!=null) {
			cnt=1;
		}
		
		return cnt;
	}

	@Override
	public List<ReportVO> selectReport() throws Exception {
		List<ReportVO> reportList = new ArrayList<ReportVO>();
		
		reportList = smc.queryForList("report.selectReport");
		
		return reportList;
	}

	@Override
	public int forgiveReport(ReportVO rv) throws Exception {
		int cnt =0;
		
		cnt = smc.delete("report.forgiveReport",rv);
		
		if(cnt>0) {
			cnt=1;
		}
		return cnt;
	}

	@Override
	public int black(String blackId) throws Exception {
		int cnt =0;
		
		cnt = smc.delete("report.black",blackId);
		
		if(cnt>0) {
			cnt=1;
		}
		return cnt;
	}

	@Override
	public int blackAdd(BlackListVO bv) throws Exception {
		int cnt =0;
		
		Object obj =  smc.insert("blackList.blackAdd",bv);
		
		if(obj!=null) {
			cnt=1;
		}
		return cnt;
	}

	@Override
	public List<BlackListVO> selectblackListVO() throws Exception {
		List<BlackListVO> blackList = new ArrayList<BlackListVO>();
		
		blackList = smc.queryForList("blackList.selectBlack");
		
		return blackList;
	}
}
